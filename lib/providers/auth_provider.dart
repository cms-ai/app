import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/data/respositories/repositories.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:app/domain/usecases/exports.dart';
import 'package:app/utils/enums/enums.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// auth screen page state provider
final authStateScreenProvider = StateProvider<AuthStateScreenEnum>(
  (ref) => AuthStateScreenEnum.initial,
);

final userProvider = StateProvider<UserModel?>(
  (ref) => null,
);

// auth repo provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

// sign in provider
final signInProvider = Provider<AuthenticateUser>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthenticateUser(repository);
});

// getuserProvider
final getUserProvider = Provider<GetUser>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return GetUser(repository);
});
// auth list notifier provider
final authListNotifierProvider =
    StateNotifierProvider<AuthListNotifier, UserModel?>((ref) {
  final authenticateUser = ref.read(signInProvider);
  final getUser = ref.read(getUserProvider);

  return AuthListNotifier(
    authenticateUser,
    getUser,
  );
});

// Main Auth List Notifier
class AuthListNotifier extends StateNotifier<UserModel?> {
  final AuthenticateUser _authenticateUser;
  final GetUser _getUser;

  AuthListNotifier(
    this._authenticateUser,
    this._getUser,
  ) : super(null);

  Future<void> signInWithGoogle(WidgetRef ref) async {
    final AppSharePreferences appSharePreferences = AppSharePreferences();
    // change state -> loading
    ref.read(authStateScreenProvider.notifier).state =
        AuthStateScreenEnum.loading;
    final Result<UserModel?, Exception> result = await _authenticateUser.call();
    switch (result) {
      case Success(value: UserModel? userData):
        if (userData != null && userData.isDeleted == false) {
          ref.read(userProvider.notifier).state = userData;
          // login sucessfully
          ref.read(authStateScreenProvider.notifier).state =
              AuthStateScreenEnum.success;

          // set local user id using for auto login
          appSharePreferences.setUserId(userData.userId ?? "");
        } else {
          // login failed (deleted user, other)
          ref.read(authStateScreenProvider.notifier).state =
              AuthStateScreenEnum.failure;
        }
        break;
      case Failure():
        // server error
        ref.read(authStateScreenProvider.notifier).state =
            AuthStateScreenEnum.failure;
        break;
    }
  }

  Future<void> getCurrentUser(
    WidgetRef ref,
    String userId, {
    Function? callBack,
  }) async {
    final result = await _getUser.call(userId);
    switch (result) {
      case Success(value: UserModel? userData):
        if (userData != null && userData.isDeleted == false) {
          ref.read(userProvider.notifier).state = userData;
        }
        break;
      case Failure():
        if (callBack != null) {
          callBack();
        }
        break;
    }
  }
}

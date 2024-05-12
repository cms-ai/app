import 'package:app/data/model/user_model.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';


class AuthRepositoryImpl extends AuthRepository {
  final userRef = FirebaseFirestore.instance.collection('users');
  final  _uuid = const Uuid();
  @override
  Future<void> signInWithDemoAccount() {
    throw UnimplementedError();
  }

  @override
  Future<bool?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final user =
            await userRef.where("email", isEqualTo: googleUser.email).get();
        if (user.docs.isEmpty) {
          final userData = UserModel(
            userId: _uuid.v1(),
            email: googleUser.email,
            displayName: googleUser.displayName,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            isDeleted: false,
          );
          // Create user if it don't exits account yet
          await userRef.doc(userData.userId).set(userData.toMap());
        }
        return false;
      }
      return null;
    } catch (e) {
      Logger().w(e);
      throw Exception(e);
    }
  }
  
  @override
  Future<void> deleteUser(String userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}

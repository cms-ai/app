import 'package:app/core/result.dart';
import 'package:app/data/model/user_model.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

class AuthRepositoryImpl extends AuthRepository {
  final userRef = FirebaseFirestore.instance.collection('users');
  final _uuid = const Uuid();
  @override
  Future<void> signInWithDemoAccount() {
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel?, Exception>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      UserModel? userOutput;
      if (googleUser != null) {
        final user =
            await userRef.where("email", isEqualTo: googleUser.email).get();
        if (user.docs.isEmpty) {
          userOutput = UserModel(
            userId: _uuid.v1(),
            email: googleUser.email,
            displayName: googleUser.displayName,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            isDeleted: false,
            isNewUser: true,
          );
          // Create user if it don't exits account yet
          await userRef.doc(userOutput.userId).set(userOutput.toMap());
          // return Success<UserModel>(userData);
        } else {
          userOutput = UserModel.fromMap(user.docs.first.data());
          // return Success<UserModel>(UserModel.fromMap(user.docs.first.data()));
        }
      }
      GoogleSignIn().signOut();
      return Success(userOutput);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<void> deleteUser(String userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
  
  @override
  Future<Result<UserModel?, Exception>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

}

abstract class AuthRepository {
  Future<void> signInWithGoogle();

  Future<void> signInWithDemoAccount();

  Future<void> deleteUser(String userId);
}

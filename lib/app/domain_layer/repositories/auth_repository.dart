import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> signInWithEmail(String email, String password);
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<User> createAccount(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> signOut();
  Future<User?> getCurrentUser();
}

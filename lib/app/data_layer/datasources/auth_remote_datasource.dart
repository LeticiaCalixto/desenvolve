import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmail(String email, String password);
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();
  Future<UserModel> createAccount(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> signInWithEmail(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Mock successful login
    return const UserModel(
      id: '1',
      email: 'user@example.com',
      name: 'Usuário Teste',
    );
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    // Simulate Google Sign In
    await Future.delayed(const Duration(seconds: 2));

    return const UserModel(
      id: '2',
      email: 'user@gmail.com',
      name: 'Usuário Google',
      photoUrl: 'https://example.com/photo.jpg',
    );
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    // Simulate Facebook Sign In
    await Future.delayed(const Duration(seconds: 2));

    return const UserModel(
      id: '3',
      email: 'user@facebook.com',
      name: 'Usuário Facebook',
      photoUrl: 'https://example.com/photo.jpg',
    );
  }

  @override
  Future<UserModel> createAccount(String email, String password) async {
    // Simulate account creation
    await Future.delayed(const Duration(seconds: 2));

    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: 'Novo Usuário',
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    // Simulate password reset
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> signOut() async {
    // Simulate sign out
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    // Simulate getting current user
    await Future.delayed(const Duration(milliseconds: 500));
    return null;
  }
}

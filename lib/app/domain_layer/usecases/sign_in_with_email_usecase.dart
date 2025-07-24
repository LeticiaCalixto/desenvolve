import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInWithEmailUseCase {
  final AuthRepository repository;

  SignInWithEmailUseCase(this.repository);

  Future<User> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email e senha são obrigatórios');
    }

    if (!_isValidEmail(email)) {
      throw Exception('Email inválido');
    }

    return await repository.signInWithEmail(email, password);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

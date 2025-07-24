import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<void> call(String email) async {
    if (email.isEmpty) {
      throw Exception('Email é obrigatório');
    }

    if (!_isValidEmail(email)) {
      throw Exception('Email inválido');
    }

    return await repository.resetPassword(email);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

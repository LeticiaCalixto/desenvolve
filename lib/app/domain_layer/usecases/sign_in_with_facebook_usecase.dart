import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInWithFacebookUseCase {
  final AuthRepository repository;

  SignInWithFacebookUseCase(this.repository);

  Future<User> call() async {
    return await repository.signInWithFacebook();
  }
}

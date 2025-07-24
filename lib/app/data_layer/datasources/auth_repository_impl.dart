import '../../domain_layer/entities/user.dart';
import '../../domain_layer/repositories/auth_repository.dart';
import 'auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> signInWithEmail(String email, String password) async {
    try {
      return await remoteDataSource.signInWithEmail(email, password);
    } catch (e) {
      throw Exception('Erro ao fazer login: ${e.toString()}');
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      return await remoteDataSource.signInWithGoogle();
    } catch (e) {
      throw Exception('Erro ao fazer login com Google: ${e.toString()}');
    }
  }

  @override
  Future<User> signInWithFacebook() async {
    try {
      return await remoteDataSource.signInWithFacebook();
    } catch (e) {
      throw Exception('Erro ao fazer login com Facebook: ${e.toString()}');
    }
  }

  @override
  Future<User> createAccount(String email, String password) async {
    try {
      return await remoteDataSource.createAccount(email, password);
    } catch (e) {
      throw Exception('Erro ao criar conta: ${e.toString()}');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await remoteDataSource.resetPassword(email);
    } catch (e) {
      throw Exception('Erro ao redefinir senha: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await remoteDataSource.signOut();
    } catch (e) {
      throw Exception('Erro ao fazer logout: ${e.toString()}');
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      return await remoteDataSource.getCurrentUser();
    } catch (e) {
      throw Exception('Erro ao obter usuário atual: ${e.toString()}');
    }
  }
}

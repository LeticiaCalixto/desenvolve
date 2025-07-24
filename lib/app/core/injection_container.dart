import 'package:desenvolve/app/data_layer/datasources/auth_remote_datasource.dart';
import 'package:desenvolve/app/data_layer/datasources/auth_repository_impl.dart';
import 'package:desenvolve/app/presentation_layer/controllers/login_controller.dart';
import 'package:provider/provider.dart';
import '../domain_layer/repositories/auth_repository.dart';
import '../domain_layer/usecases/sign_in_with_email_usecase.dart';
import '../domain_layer/usecases/sign_in_with_google_usecase.dart';
import '../domain_layer/usecases/sign_in_with_facebook_usecase.dart';
import '../domain_layer/usecases/reset_password_usecase.dart';
import 'package:provider/single_child_widget.dart';

class InjectionContainer {
  static List<SingleChildWidget> get providers => [
        // Data Sources
        Provider<AuthRemoteDataSource>(
          create: (_) => AuthRemoteDataSourceImpl(),
        ),

        // Repositories
        ProxyProvider<AuthRemoteDataSource, AuthRepository>(
          update: (_, dataSource, __) => AuthRepositoryImpl(
            remoteDataSource: dataSource,
          ),
        ),

        // Use Cases
        ProxyProvider<AuthRepository, SignInWithEmailUseCase>(
          update: (_, repository, __) => SignInWithEmailUseCase(repository),
        ),

        ProxyProvider<AuthRepository, SignInWithGoogleUseCase>(
          update: (_, repository, __) => SignInWithGoogleUseCase(repository),
        ),

        ProxyProvider<AuthRepository, SignInWithFacebookUseCase>(
          update: (_, repository, __) => SignInWithFacebookUseCase(repository),
        ),

        ProxyProvider<AuthRepository, ResetPasswordUseCase>(
          update: (_, repository, __) => ResetPasswordUseCase(repository),
        ),

        // Controllers
        ProxyProvider4<SignInWithEmailUseCase, SignInWithGoogleUseCase,
            SignInWithFacebookUseCase, ResetPasswordUseCase, LoginController>(
          update: (_, emailUseCase, googleUseCase, facebookUseCase,
                  resetUseCase, __) =>
              LoginController(
            signInWithEmailUseCase: emailUseCase,
            signInWithGoogleUseCase: googleUseCase,
            signInWithFacebookUseCase: facebookUseCase,
            resetPasswordUseCase: resetUseCase,
          ),
        ),
      ];
}

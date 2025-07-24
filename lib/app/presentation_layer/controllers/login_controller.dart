import 'package:flutter/material.dart';
import '../../domain_layer/entities/user.dart';
import '../../domain_layer/usecases/sign_in_with_email_usecase.dart';
import '../../domain_layer/usecases/sign_in_with_google_usecase.dart';
import '../../domain_layer/usecases/sign_in_with_facebook_usecase.dart';
import '../../domain_layer/usecases/reset_password_usecase.dart';

class LoginController extends ChangeNotifier {
  final SignInWithEmailUseCase signInWithEmailUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SignInWithFacebookUseCase signInWithFacebookUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  LoginController({
    required this.signInWithEmailUseCase,
    required this.signInWithGoogleUseCase,
    required this.signInWithFacebookUseCase,
    required this.resetPasswordUseCase,
  });

  bool _isLoading = false;
  String? _errorMessage;
  User? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get user => _user;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  Future<void> signInWithEmail(String email, String password) async {
    _setLoading(true);
    _setError(null);

    try {
      _user = await signInWithEmailUseCase(email, password);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signInWithGoogle() async {
    _setLoading(true);
    _setError(null);

    try {
      _user = await signInWithGoogleUseCase();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signInWithFacebook() async {
    _setLoading(true);
    _setError(null);

    try {
      _user = await signInWithFacebookUseCase();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> resetPassword(String email) async {
    _setLoading(true);
    _setError(null);

    try {
      await resetPasswordUseCase(email);
      // Show success message
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void clearError() {
    _setError(null);
  }
}

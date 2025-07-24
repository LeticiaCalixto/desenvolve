import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/social_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),

              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFF4ECDC4),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.eco,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              const SizedBox(height: 24),

              // App Name
              const Text(
                'Desenvolve+',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF6B6B),
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                'Desenvolvimento\ninfantil na palma\nda mão',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2C3E50),
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 48),

              // // Email Button
              // Consumer<LoginController>(
              //   builder: (context, controller, child) {
              //     return CustomButton(
              //       text: 'Entrar com E-mail',
              //       backgroundColor: const Color(0xFF4ECDC4),
              //       textColor: Colors.white,
              //       isLoading: controller.isLoading,
              //       onPressed: () => _showEmailDialog(context),
              //     );
              //   },
              // ),

              const SizedBox(height: 16),

              // Google Button
              // Consumer<LoginController>(
              //   builder: (context, controller, child) {
              //     return SocialButton(
              //       text: 'Entrar com o Google',
              //       icon: Icons.g_mobiledata,
              //       backgroundColor: Colors.white,
              //       textColor: const Color(0xFF2C3E50),
              //       borderColor: const Color(0xFFE0E0E0),
              //       isLoading: controller.isLoading,
              //       onPressed: () => controller.signInWithGoogle(),
              //     );
              //   },
              // ),

              const SizedBox(height: 16),

              // Facebook Button
              // Consumer<LoginController>(
              //   builder: (context, controller, child) {
              //     return SocialButton(
              //       text: 'Entrar com o Facebook',
              //       icon: Icons.facebook,
              //       backgroundColor: const Color(0xFF1877F2),
              //       textColor: Colors.white,
              //       isLoading: controller.isLoading,
              //       onPressed: () => controller.signInWithFacebook(),
              //     );
              //   },
              // ),

              const SizedBox(height: 16),

              // // Create Account Button
              // CustomButton(
              //   text: 'Criar nova conta',
              //   backgroundColor: const Color(0xFFFF9500),
              //   textColor: Colors.white,
              //   onPressed: () => _showCreateAccountDialog(context),
              // ),

              // const SizedBox(height: 24),

              // // Forgot Password
              // TextButton(
              //   onPressed: () => _showForgotPasswordDialog(context),
              //   child: const Text(
              //     'Esqueci minha senha',
              //     style: TextStyle(
              //       color: Color(0xFF2C3E50),
              //       fontSize: 14,
              //     ),
              //   ),
              // ),

              // // Error Message
              // Consumer<LoginController>(
              //   builder: (context, controller, child) {
              //     if (controller.errorMessage != null) {
              //       return Container(
              //         margin: const EdgeInsets.only(top: 16),
              //         padding: const EdgeInsets.all(12),
              //         decoration: BoxDecoration(
              //           color: Colors.red.shade50,
              //           borderRadius: BorderRadius.circular(8),
              //           border: Border.all(color: Colors.red.shade200),
              //         ),
              //         child: Text(
              //           controller.errorMessage!,
              //           style: TextStyle(
              //             color: Colors.red.shade700,
              //             fontSize: 14,
              //           ),
              //         ),
              //       );
              //     }
              //     return const SizedBox.shrink();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

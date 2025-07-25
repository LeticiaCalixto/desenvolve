import 'package:desenvolve/app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/social_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 229, 221),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Logo
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xFF4ECDC4),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.eco,
                  color: Colors.white,
                  size: 80,
                ),
              ),

              const SizedBox(height: 24),

              // App Name
              const Text(
                'Desenvolve+',
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFF6B6B),
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  'Desenvolvimento infantil na palma da mão',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2C3E50),
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Email Button
              CustomButton(
                text: 'Entrar com E-mail',
                backgroundColor: const Color(0xFF4ECDC4),
                textColor: Colors.white,
                isLoading: false,
                onPressed: () => _showEmailDialog(context),
              ),

              const SizedBox(height: 16),

              // Google Button
              SocialButton(
                text: 'Entrar com o Google',
                icon: Icons.g_mobiledata,
                backgroundColor: Colors.white,
                textColor: const Color(0xFF2C3E50),
                borderColor: const Color(0xFFE0E0E0),
                isLoading: false,
                onPressed: () =>
                    {Navigator.of(context).pushNamed(AppRoutes.home)},
              ),

              const SizedBox(height: 16),

              // Facebook Button
              SocialButton(
                text: 'Entrar com o Facebook',
                icon: Icons.facebook,
                backgroundColor: const Color(0xFF1877F2),
                textColor: Colors.white,
                isLoading: false,
                onPressed: () => {},
              ),

              const SizedBox(height: 16),

              // Create Account Button
              CustomButton(
                text: 'Criar nova conta',
                backgroundColor: const Color(0xFFFF9500),
                textColor: Colors.white,
                onPressed: () => _showCreateAccountDialog(context),
              ),

              const SizedBox(height: 24),

              // Forgot Password
              TextButton(
                onPressed: () => _showForgotPasswordDialog(context),
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    color: Color(0xFF2C3E50),
                    fontSize: 14,
                  ),
                ),
              ),

              // Error Message
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

  void _showEmailDialog(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Entrar com E-mail'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.home);
              // Navigator.pop(context);
              // context.read<LoginController>().signInWithEmail(
              //       emailController.text,
              //       passwordController.text,
              //     );
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }

  void _showCreateAccountDialog(BuildContext context) {
    // Similar dialog for account creation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Funcionalidade de criar conta em desenvolvimento')),
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Redefinir Senha'),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'E-mail',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context
                  .read<LoginController>()
                  .resetPassword(emailController.text);
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}

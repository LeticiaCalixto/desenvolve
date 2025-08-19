import 'package:desenvolve/app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/social_button.dart';
import '../../../core/services/user_profile_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE8F8F5),
              Color(0xFFBEE5DD),
              Color(0xFF4ECDC4),
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              children: [
                // Logo com sombra e animação
                Container(
                  width: 380,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Título principal
                const Text(
                  'Bem-vindo!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),

                // Subtitle com melhor formatação
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'Desenvolvimento infantil na palma da mão',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF34495E),
                      height: 1.5,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Container para os botões com melhor espaçamento
                Container(
                  constraints: const BoxConstraints(maxWidth: 350),
                  child: Column(
                    children: [
                      // Email Button com sombra e bordas arredondadas
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF4ECDC4).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: CustomButton(
                          text: 'Entrar com E-mail',
                          backgroundColor: const Color(0xFF4ECDC4),
                          textColor: Colors.white,
                          isLoading: false,
                          onPressed: () => _showEmailDialog(context),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Divisor "ou"
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFF2C3E50).withOpacity(0.2),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'ou',
                              style: TextStyle(
                                color: const Color(0xFF2C3E50).withOpacity(0.6),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFF2C3E50).withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Google Button com melhor design
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: SocialButton(
                          text: 'Entrar com o Google',
                          icon: Icons.g_mobiledata,
                          backgroundColor: Colors.white,
                          textColor: const Color(0xFF2C3E50),
                          borderColor: const Color(0xFFE0E0E0),
                          isLoading: false,
                          onPressed: () => {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.postLoginSplash)
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Facebook Button com melhor design
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF1877F2).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: SocialButton(
                          text: 'Entrar com o Facebook',
                          icon: Icons.facebook,
                          backgroundColor: const Color(0xFF1877F2),
                          textColor: Colors.white,
                          isLoading: false,
                          onPressed: () => {},
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Create Account Button como texto link
                      TextButton(
                        onPressed: () => _showCreateAccountDialog(context),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Não tem uma conta? ',
                            style: TextStyle(
                              color: Color(0xFF2C3E50),
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: 'Criar conta',
                                style: TextStyle(
                                  color: Color(0xFF4ECDC4),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Forgot Password com melhor design
                      TextButton(
                        onPressed: () => _showForgotPasswordDialog(context),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 8,
                          ),
                        ),
                        child: const Text(
                          'Esqueci minha senha',
                          style: TextStyle(
                            color: Color(0xFF2C3E50),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Error Message (mantido comentado como estava)
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
      ),
    );
  }

  void _showEmailDialog(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Entrar com E-mail',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(color: Color(0xFF2C3E50)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFF4ECDC4), width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: const TextStyle(color: Color(0xFF2C3E50)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFF4ECDC4), width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Cancelar',
              style: TextStyle(
                color: Color(0xFF2C3E50),
                fontSize: 16,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final email = emailController.text.trim();
              final password = passwordController.text;

              // Validar login com email e senha
              if (UserProfileService.validateLogin(email, password)) {
                // Definir o perfil do usuário baseado no email
                UserProfileService.setUserFromEmail(email);
                Navigator.pop(context); // Fechar o dialog
                Navigator.of(context).pushNamed(AppRoutes.postLoginSplash);
              } else {
                // Mostrar erro de credenciais inválidas
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Email ou senha incorretos. Verifique suas credenciais.',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color(0xFFE74C3C),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.all(16),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4ECDC4),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Entrar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Redefinir Senha',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Digite seu e-mail para receber instruções de redefinição de senha.',
              style: TextStyle(
                color: Color(0xFF2C3E50),
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(color: Color(0xFF2C3E50)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFF4ECDC4), width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Cancelar',
              style: TextStyle(
                color: Color(0xFF2C3E50),
                fontSize: 16,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context
                  .read<LoginController>()
                  .resetPassword(emailController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4ECDC4),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Enviar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

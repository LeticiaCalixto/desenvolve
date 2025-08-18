import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/routes/app_routes.dart';

class PostLoginSplashPage extends StatefulWidget {
  const PostLoginSplashPage({super.key});

  @override
  State<PostLoginSplashPage> createState() => _PostLoginSplashPageState();
}

class _PostLoginSplashPageState extends State<PostLoginSplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Aguarda 3 segundos antes de navegar para a home
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF093FB),
              Color(0xFFF5576C),
              Color(0xFFFFB347),
              Color(0xFF4ECDC4),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.03),
                _buildWelcomeCard(screenWidth),
                SizedBox(height: screenHeight * 0.02),
                _buildImportantNotice(screenWidth),
                SizedBox(height: screenHeight * 0.02),
                _buildImageContainer(screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(double screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.06),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF9A9E), Color(0xFFFFAD9E)],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF9A9E).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '👋',
            style: TextStyle(fontSize: screenWidth * 0.11),
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            'Olá, Maria!',
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.08,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenWidth * 0.03),
          Text(
            'Bem-vinda de volta! 🌟\nVamos ver como seu pequeno está crescendo hoje!',
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.045,
              color: Colors.white,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('👶', style: TextStyle(fontSize: screenWidth * 0.08)),
              SizedBox(width: screenWidth * 0.03),
              Text('💕', style: TextStyle(fontSize: screenWidth * 0.08)),
              SizedBox(width: screenWidth * 0.03),
              Text('🌈', style: TextStyle(fontSize: screenWidth * 0.08)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(double screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4ECDC4), Color(0xFF44A08D)],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4ECDC4).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/mother.png',
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Text(
            '🌸 Cuidando com amor 🌸',
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildImportantNotice(double screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF2196F3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2196F3).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Ícone de aviso
          Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2196F3).withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
              size: screenWidth * 0.07,
            ),
          ),
          SizedBox(height: screenWidth * 0.03),

          // Título do aviso
          Text(
            'AVISO GERAL',
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1976D2),
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenWidth * 0.03),

          // Texto do aviso
          Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFF2196F3).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              'As informações aqui apresentadas têm caráter educativo e não substituem avaliação, diagnóstico ou tratamento médico. Para qualquer dúvida ou suspeita, procure sempre um profissional de saúde.',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.038,
                color: const Color(0xFF37474F),
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.justify,
            ),
          ),

          SizedBox(height: screenWidth * 0.03),

          // Ícones médicos
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Text('🩺', style: TextStyle(fontSize: screenWidth * 0.06)),
              ),
              SizedBox(width: screenWidth * 0.03),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Text('⚕️', style: TextStyle(fontSize: screenWidth * 0.06)),
              ),
              SizedBox(width: screenWidth * 0.03),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Text('🏥', style: TextStyle(fontSize: screenWidth * 0.06)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator(double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.06),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFB74D), Color(0xFFFF8A65)],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFB74D).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '✨  ✨',
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenWidth * 0.04),
          SizedBox(
            width: screenWidth * 0.08,
            height: screenWidth * 0.08,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 3,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('🚀', style: TextStyle(fontSize: screenWidth * 0.06)),
              SizedBox(width: screenWidth * 0.02),
              Text('📱', style: TextStyle(fontSize: screenWidth * 0.06)),
              SizedBox(width: screenWidth * 0.02),
              Text('�', style: TextStyle(fontSize: screenWidth * 0.06)),
            ],
          ),
        ],
      ),
    );
  }
}

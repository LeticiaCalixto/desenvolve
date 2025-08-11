import 'package:desenvolve/app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              Color(0xFFF8F4FF),
              Color(0xFFE8F5E8),
              Color(0xFFFFF8E1),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(screenWidth),
                SizedBox(height: screenHeight * 0.03),
                _buildCategoriesGrid(context, screenWidth),
                SizedBox(height: screenHeight * 0.03),
                _buildQuickTips(context, screenWidth),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double screenWidth) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF9A9E), Color(0xFFFFAD9E)],
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF9A9E).withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.white,
                size: screenWidth * 0.08,
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '🌟 Biblioteca de',
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Saúde Infantil 🌈',
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.075,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.child_care,
                color: Colors.white,
                size: screenWidth * 0.08,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesGrid(BuildContext context, double screenWidth) {
    final crossAxisCount = screenWidth > 600 ? 3 : 2;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
          child: Text(
            '🏥 Categorias de Cuidados',
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF2C3E50),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: screenWidth * 0.03,
            mainAxisSpacing: screenWidth * 0.03,
            childAspectRatio: 0.9,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return _buildCategoryCard(context, index, screenWidth);
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, int index, double screenWidth) {
    final colors = _getGradientColorsForIndex(index);
    final isLargeScreen = screenWidth > 600;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colors[0].withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleCategoryTap(context, index),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    _getEmojiForIndex(index),
                    style: TextStyle(fontSize: screenWidth * 0.08),
                  ),
                ),
                SizedBox(height: screenWidth * 0.03),
                SizedBox(height: screenWidth * 0.02),
                Text(
                  _getLabelForIndex(index),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: screenWidth * 0.042,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickTips(BuildContext context, double screenWidth) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
          child: Text(
            '💡 Dicas Rápidas',
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF2C3E50),
            ),
          ),
        ),
        _buildTipCard(
          '🌡️ Dicas para aliviar a febre',
          'Mantenha a criança hidratada e confortável',
          const LinearGradient(colors: [Color(0xFFFFB6C1), Color(0xFFFFDAB9)]),
          () {},
          screenWidth,
        ),
        SizedBox(height: screenWidth * 0.03),
        _buildTipCard(
          '💉 Calendário vacinal',
          'Mantenha as vacinas sempre em dia',
          const LinearGradient(colors: [Color(0xFF98FB98), Color(0xFF90EE90)]),
          () {},
          screenWidth,
        ),
        SizedBox(height: screenWidth * 0.03),
        _buildTipCard(
          '📚 Biblioteca Completa',
          'Explore todos os artigos de saúde infantil',
          const LinearGradient(colors: [Color(0xFF87CEEB), Color(0xFFADD8E6)]),
          () {
            // Navegar para biblioteca
          },
          screenWidth,
        ),
      ],
    );
  }

  Widget _buildTipCard(String title, String subtitle, LinearGradient gradient,
      VoidCallback onTap, double screenWidth) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: gradient.colors[0].withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.nunito(
                          fontSize: screenWidth * 0.042,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.01),
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: screenWidth * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleCategoryTap(BuildContext context, int index) {
    print('Categoria ${index + 1} pressionada');
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(AppRoutes.disease);
        break;
      case 1:
        Navigator.of(context).pushNamed(AppRoutes.alertSymptoms);
        break;
      case 2:
        Navigator.of(context).pushNamed(AppRoutes.vaccination);
        break;
      case 3:
        Navigator.of(context).pushNamed(AppRoutes.nutrition);
        break;
      case 4:
        Navigator.of(context).pushNamed(AppRoutes.development);
        break;
      case 5:
        Navigator.of(context).pushNamed(AppRoutes.SleepCare);
        break;
    }
  }

  // Função para obter o texto baseado no índice
  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return 'Doenças Comuns';
      case 1:
        return 'Sintomas de Alerta';
      case 2:
        return 'Vacinas';
      case 3:
        return 'Alimentação Nutritiva';
      case 4:
        return 'Desenvolvimento e Comportamento';
      case 5:
        return 'Cuidados com o Sono';
      default:
        return '';
    }
  }

  // Função para obter cores gradiente baseado no índice
  List<Color> _getGradientColorsForIndex(int index) {
    switch (index) {
      case 0:
        return [
          const Color(0xFFFFB347),
          const Color(0xFFFF8C00)
        ]; // Laranja vibrante
      case 1:
        return [
          const Color(0xFFFF6B6B),
          const Color(0xFFEE5A52)
        ]; // Vermelho suave
      case 2:
        return [const Color(0xFF4ECDC4), const Color(0xFF44A08D)]; // Azul-verde
      case 3:
        return [
          const Color(0xFF98FB98),
          const Color(0xFF90EE90)
        ]; // Verde claro
      case 4:
        return [const Color(0xFF87CEEB), const Color(0xFF6495ED)]; // Azul céu
      case 5:
        return [const Color(0xFFDDA0DD), const Color(0xFFBA55D3)]; // Roxo suave
      default:
        return [const Color(0xFFBDBDBD), const Color(0xFF9E9E9E)];
    }
  }

  // Função para obter emoji baseado no índice
  String _getEmojiForIndex(int index) {
    switch (index) {
      case 0:
        return '🏥';
      case 1:
        return '⚠️';
      case 2:
        return '💉';
      case 3:
        return '🍎';
      case 4:
        return '👶';
      case 5:
        return '😴';
      default:
        return '❓';
    }
  }
}

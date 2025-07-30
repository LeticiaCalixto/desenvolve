import 'package:desenvolve/app/core/routes/app_routes.dart';
import 'package:desenvolve/app/presentation_layer/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Biblioteca de',
              style: GoogleFonts.nunito(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFFF6B6B),
              ),
            ),
            Text(
              'Saúde Infantil',
              style: GoogleFonts.nunito(
                fontSize: 42,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFFF6B6B),
              ),
            ),
            const SizedBox(height: 4),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
                childAspectRatio: 1,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  color: _getColorForIndex(index),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      print('Botão ${index + 1} pressionado');
                      if (index == 0) {
                        Navigator.of(context).pushNamed(AppRoutes.disease);
                      } else if (index == 1) {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.alertSymptoms);
                      } else if (index == 2) {
                        Navigator.of(context).pushNamed(AppRoutes.vaccination);
                      } else if (index == 3) {
                        // Navegar para a página de Alimentação Nutritiva
                      } else if (index == 4) {
                        // Navegar para a página de Desenvolvimento e Comportamento
                      } else if (index == 5) {
                        Navigator.of(context).pushNamed(AppRoutes.SleepCare);
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          _getIconForIndex(
                            index,
                          ), // Pega o ícone correspondente
                          size: 60,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _getLabelForIndex(
                              index,
                            ), // Pega o texto correspondente
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Dicas para aliviar a febre',
              backgroundColor: Color.fromARGB(255, 239, 229, 240),
              textColor: Colors.black,
              isLoading: false,
              onPressed: () => {},
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Calendário vacinal',
              backgroundColor: Color.fromARGB(255, 239, 229, 240),
              textColor: Colors.black,
              isLoading: false,
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
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

  Color _getColorForIndex(int index) {
    switch (index) {
      case 0:
        return const Color(0xFFFFDD6A);
      case 1:
        return const Color(0xFFFF6F6F);
      case 2:
        return const Color(0xFF72B7E2);
      case 3:
        return const Color(0xFFB8D8B8);
      case 4:
        return const Color(0xFF6FA1D0);
      case 5:
        return const Color(0xFFA1A6D9);
      default:
        return Colors.grey;
    }
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.local_hospital; // Ícone de Doenças Comuns
      case 1:
        return Icons.warning; // Ícone de Sintomas de Alerta
      case 2:
        return Icons.vaccines; // Ícone de Vacinas
      case 3:
        return Icons.fastfood; // Ícone de Alimentação e Nutrição
      case 4:
        return Icons.child_care; // Ícone de Desenvolvimento e Comportamento
      case 5:
        return Icons.nightlight_round; // Ícone de Cuidados com o Sono
      default:
        return Icons.help_outline; // Caso não encontre
    }
  }
}

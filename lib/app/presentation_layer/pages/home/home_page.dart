import 'package:desenvolve/app/presentation_layer/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Biblioteca de\nSaúde Infantil',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText:
                    'Digite aqui o que procura\n(ex. febre, vacinaçao, sono,...)',
                prefixIcon: const Icon(Icons.search),
                fillColor: Color.fromARGB(255, 238, 238, 234),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
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
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          _getIconForIndex(
                              index), // Pega o ícone correspondente
                          size: 40,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getLabelForIndex(
                              index), // Pega o texto correspondente
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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

  // Função para obter o ícone baseado no índice
  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.local_hospital; // Ícone de Doenças Comuns
      case 1:
        return Icons.warning; // Ícone de Sintomas de Alerta
      case 2:
        return Icons.vaccines; // Ícone de Vacinas
      case 3:
        return Icons.fastfood; // Ícone de Alimentação Nutritiva
      case 4:
        return Icons.child_care; // Ícone de Desenvolvimento e Comportamento
      case 5:
        return Icons.nightlight_round; // Ícone de Cuidados com o Sono
      default:
        return Icons.help_outline; // Caso não encontre
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

  Color _getColorForIndex(int index) {
    switch (index) {
      case 0:
        return Color.fromARGB(255, 225, 234, 149); // Cor para Doenças Comuns
      case 1:
        return Color.fromARGB(255, 232, 142, 86); // Cor para Sintomas de Alerta
      case 2:
        return Color.fromARGB(255, 131, 200, 203); // Cor para Vacinas
      case 3:
        return Color.fromARGB(
            255, 180, 148, 75); // Cor para Alimentação Nutritiva
      case 4:
        return Color.fromARGB(
            255, 84, 125, 238); // Cor para Desenvolvimento e Comportamento
      case 5:
        return Color.fromARGB(
            255, 135, 99, 196); // Cor para Cuidados com o Sono
      default:
        return Colors.grey; // Cor padrão
    }
  }
}

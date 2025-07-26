import 'package:flutter/material.dart';

class AlertSymptomsPage extends StatelessWidget {
  const AlertSymptomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final symptoms = [
      {
        'icon': Icons.thermostat,
        'title': 'Febre > 39°C',
        'desc': 'Febre persistente que não baixa com medicação.',
        'color': Colors.redAccent,
      },
      {
        'icon': Icons.air,
        'title': 'Dificuldade Respiratória',
        'desc': 'Respiração acelerada ou lábios roxos.',
        'color': Colors.blue,
      },
      {
        'icon': Icons.flash_on,
        'title': 'Convulsões',
        'desc': 'Movimentos descontrolados do corpo.',
        'color': Colors.deepOrange,
      },
      {
        'icon': Icons.blur_on,
        'title': 'Manchas na pele',
        'desc': 'Pontos vermelhos ou arroxeados.',
        'color': Colors.purple,
      },
      {
        'icon': Icons.sick,
        'title': 'Vômitos/diarreia',
        'desc': 'Intensos e frequentes.',
        'color': Colors.teal,
      },
      {
        'icon': Icons.water_drop,
        'title': 'Desidratação',
        'desc': 'Pouca urina, boca seca, moleira afundada.',
        'color': Colors.orange,
      },
      {
        'icon': Icons.bedtime,
        'title': 'Sonolência excessiva',
        'desc': 'Dorme demais, difícil de acordar.',
        'color': Colors.indigo,
      },
      {
        'icon': Icons.sentiment_dissatisfied,
        'title': 'Choro inconsolável',
        'desc': 'Nada acalma a criança.',
        'color': Colors.pink,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Ajuste o tamanho da barra de ferramentas
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, // Ícone do botão de voltar
            color: Colors.white, // Cor branca para o botão de voltar
          ),
          onPressed: () {
            Navigator.pop(context); // Ação do botão de voltar
          },
        ),
        title: const Row(
          children: [
            SizedBox(width: 16), // Espaço entre o botão e o texto
            Expanded(
              child: Text(
                'Sintomas de Alerta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow
                    .ellipsis, // Garante que o texto seja truncado se necessário
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ajudar pais e responsáveis a reconhecer sinais que indicam necessidade de avaliação médica urgente.',
              style: TextStyle(fontSize: 16, color: Colors.teal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 2.5,
                children: symptoms.map((item) {
                  return _SymptomCard(
                    icon: item['icon'] as IconData,
                    title: item['title'] as String,
                    description: item['desc'] as String,
                    color: item['color'] as Color,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SymptomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _SymptomCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

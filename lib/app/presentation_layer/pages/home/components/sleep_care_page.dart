import 'package:flutter/material.dart';

class SleepCarePage extends StatelessWidget {
  const SleepCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          children: [
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Cuidados com o Sono',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _InfoBlock(
              title: 'Importância do Sono',
              color: Color(0xFFFEF3C7),
              bullets: [
                'Essencial para o crescimento, desenvolvimento do cérebro, regulação emocional e imunidade.',
                'Bebês e crianças que dormem bem aprendem e se desenvolvem melhor.',
              ],
            ),
            SizedBox(height: 16),
            _InfoBlock(
              title: 'Dicas para uma Boa Rotina',
              color: Color(0xFFE0F2FE),
              bullets: [
                'Estabeleça horários regulares para dormir e acordar.',
                'Crie um ritual calmo antes de dormir (banho, história, música suave).',
                'Mantenha o quarto escuro, silencioso e fresco.',
                'Evite telas (TV, celular, tablet) pelo menos 1h antes de dormir.',
                'Respeite os sinais de sono (bocejo, esfregar os olhos).',
              ],
            ),
            SizedBox(height: 16),
            _InfoBlock(
              title: 'Como Lidar com Dificuldades',
              color: Color(0xFFFFE4E6),
              bullets: [
                'Despertares noturnos: mantenha o ambiente calmo e evite estímulos.',
                'Sonecas: observe a necessidade e ajuste os horários.',
              ],
            ),
            SizedBox(height: 16),
            _InfoBlock(
              title: 'Quando Procurar Ajuda',
              color: Color(0xFFEDE9FE),
              bullets: [
                'Despertares frequentes mesmo com boa rotina.',
                'Roncos, pausas na respiração ou agitação excessiva.',
                'Dificuldade crônica para dormir ou sinais de desconforto físico.',
              ],
              footer: 'Fontes: SBP, Ministério da Saúde, AAP',
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final List<String> bullets;
  final String? footer;
  final Color color;

  const _InfoBlock({
    required this.title,
    required this.bullets,
    required this.color,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          ...bullets.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• "),
                    Expanded(child: Text(item)),
                  ],
                ),
              )),
          if (footer != null) ...[
            const SizedBox(height: 12),
            Text(
              footer!,
              style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ]
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertSymptomsPage extends StatelessWidget {
  const AlertSymptomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 768;

    final symptoms = [
      {
        'emoji': '🌡️',
        'title': 'Febre > 39°C',
        'desc': 'Febre persistente que não baixa com medicação.',
        'color': const Color(0xFFFFEBEE),
      },
      {
        'emoji': '🫁',
        'title': 'Dificuldade Respiratória',
        'desc': 'Respiração acelerada ou lábios roxos.',
        'color': const Color(0xFFE3F2FD),
      },
      {
        'emoji': '⚡',
        'title': 'Convulsões',
        'desc': 'Movimentos descontrolados do corpo.',
        'color': const Color(0xFFFFF3E0),
      },
      {
        'emoji': '🔴',
        'title': 'Manchas na pele',
        'desc': 'Pontos vermelhos ou arroxeados.',
        'color': const Color(0xFFF3E5F5),
      },
      {
        'emoji': '🤮',
        'title': 'Vômitos/diarreia',
        'desc': 'Intensos e frequentes.',
        'color': const Color(0xFFE0F2F1),
      },
      {
        'emoji': '💧',
        'title': 'Desidratação',
        'desc': 'Pouca urina, boca seca, moleira afundada.',
        'color': const Color(0xFFFFF8E1),
      },
      {
        'emoji': '😴',
        'title': 'Sonolência excessiva',
        'desc': 'Dorme demais, difícil de acordar.',
        'color': const Color(0xFFE8EAF6),
      },
      {
        'emoji': '😭',
        'title': 'Choro inconsolável',
        'desc': 'Nada acalma a criança.',
        'color': const Color(0xFFFCE4EC),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF7043), Color(0xFFFF5722)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Row(
          children: [
            const Text('🚨 ', style: TextStyle(fontSize: 28)),
            Expanded(
              child: Text(
                'Sinais de Alerta',
                style: GoogleFonts.nunito(
                  fontSize: isTablet ? 28 : 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                '👨‍⚕️ Reconheça quando buscar ajuda médica urgente para sua criança',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isTablet ? 3 : 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: isTablet ? 1.1 : 0.9,
              children: symptoms.map((item) {
                return _SymptomCard(
                  emoji: item['emoji'] as String,
                  title: item['title'] as String,
                  description: item['desc'] as String,
                  color: item['color'] as Color,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFEBEE), Color(0xFFFFCDD2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: Colors.red.withOpacity(0.2), width: 2),
              ),
              child: Row(
                children: [
                  const Text('⚠️', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Em caso de qualquer sintoma, procure atendimento médico imediatamente!',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.red[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SymptomCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String description;
  final Color color;

  const _SymptomCard({
    required this.emoji,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey[600],
                height: 1.3,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

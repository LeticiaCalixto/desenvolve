import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleepCarePage extends StatelessWidget {
  const SleepCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 768;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5C6BC0), Color(0xFF3F51B5)],
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
            const Text('🌙 ', style: TextStyle(fontSize: 28)),
            Expanded(
              child: Text(
                'Cuidados com o Sono',
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
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('✨', style: TextStyle(fontSize: screenWidth * 0.08)),
                      SizedBox(width: screenWidth * 0.02),
                      Text('😴',
                          style: TextStyle(fontSize: screenWidth * 0.08)),
                      SizedBox(width: screenWidth * 0.02),
                      Text('💤',
                          style: TextStyle(fontSize: screenWidth * 0.08)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Um sono tranquilo é o segredo para um crescimento saudável e feliz!',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.indigo[800],
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const _SleepInfoCard(
              emoji: '🌟',
              title: 'Por que o sono é mágico?',
              color: Color(0xFFFFF8E1),
              accentColor: Color(0xFFFFB74D),
              bullets: [
                'Fortalece o corpinho enquanto a criança cresce',
                'Deixa o cérebro mais esperto e criativo',
                'Protege contra doencinhas e infecções',
                'Ajuda a regular as emoções e humor',
                'Melhora a memória e aprendizado',
              ],
            ),
            const SizedBox(height: 16),
            const _SleepInfoCard(
              emoji: '�',
              title: 'Criando a rotina perfeita',
              color: Color(0xFFE8F5E8),
              accentColor: Color(0xFF66BB6A),
              bullets: [
                'Mesmos horários todos os dias (fim de semana também!)',
                'Banho morninho para relaxar',
                'História ou música suave',
                'Quarto escurinho, silencioso e fresquinho',
                'Nada de telas 1 hora antes de dormir',
                'Ficar atento aos sinais de soninho',
              ],
            ),
            const SizedBox(height: 16),
            const _SleepInfoCard(
              emoji: '🤱',
              title: 'Enfrentando os desafios',
              color: Color(0xFFFFEBEE),
              accentColor: Color(0xFFEF5350),
              bullets: [
                'Acordar à noite é normal até os 6 meses',
                'Manter a calma e ambiente tranquilo',
                'Sonecas: ajustar conforme a idade',
                'Cada bebê tem seu próprio ritmo',
                'Paciência e persistência são essenciais',
              ],
            ),
            const SizedBox(height: 16),
            const _SleepInfoCard(
              emoji: '⏰',
              title: 'Quanto tempo de sono?',
              color: Color(0xFFF3E5F5),
              accentColor: Color(0xFFAB47BC),
              bullets: [
                'Recém-nascidos: 14-17 horas por dia',
                'Bebês (4-11 meses): 12-15 horas',
                'Crianças pequenas (1-2 anos): 11-14 horas',
                'Pré-escolares (3-5 anos): 10-13 horas',
                'Incluindo sonecas durante o dia',
              ],
            ),
            const SizedBox(height: 16),
            const _SleepInfoCard(
              emoji: '👨‍⚕️',
              title: 'Hora de procurar ajuda?',
              color: Color(0xFFE0F2F1),
              accentColor: Color(0xFF26A69A),
              bullets: [
                'Acordar muito frequente depois dos 6 meses',
                'Roncos ou pausas na respiração',
                'Agitação excessiva durante o sono',
                'Sonolência exagerada durante o dia',
                'Dificuldades crônicas para adormecer',
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: Colors.indigo.withOpacity(0.3), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('📚',
                          style: TextStyle(fontSize: screenWidth * 0.06)),
                      const SizedBox(width: 8),
                      Text('🩺',
                          style: TextStyle(fontSize: screenWidth * 0.06)),
                      const SizedBox(width: 8),
                      Text('❤️',
                          style: TextStyle(fontSize: screenWidth * 0.06)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Fontes científicas confiáveis',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.indigo[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sociedade Brasileira de Pediatria • Ministério da Saúde • Academia Americana de Pediatria',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.indigo[600],
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
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

class _SleepInfoCard extends StatelessWidget {
  final String emoji;
  final String title;
  final List<String> bullets;
  final Color color;
  final Color accentColor;

  const _SleepInfoCard({
    required this.emoji,
    required this.title,
    required this.bullets,
    required this.color,
    required this.accentColor,
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
            color: accentColor.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      accentColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 26),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ...bullets.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 7),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [accentColor, accentColor.withOpacity(0.7)],
                        ),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withOpacity(0.3),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

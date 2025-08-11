import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevelopmentPage extends StatelessWidget {
  const DevelopmentPage({super.key});

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
              colors: [Color(0xFFAB47BC), Color(0xFF8E24AA)],
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
            const Text('📈 ', style: TextStyle(fontSize: 28)),
            Expanded(
              child: Text(
                'Desenvolvimento',
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
                '🌟 Cada criança tem seu próprio ritmo de desenvolvimento. Celebrate cada conquista!',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const _DevelopmentCard(
              emoji: '👶',
              title: '0-3 meses',
              color: Color(0xFFE8F5E8),
              milestones: [
                'Sustenta a cabeça por alguns segundos',
                'Segue objetos com os olhos',
                'Sorri socialmente',
                'Reage a sons familiares',
              ],
              activities: [
                'Conversar e cantar para o bebê',
                'Mostrar objetos coloridos',
                'Massagens suaves',
                'Tempo de bruços supervisionado',
              ],
            ),
            const SizedBox(height: 16),
            const _DevelopmentCard(
              emoji: '🍼',
              title: '3-6 meses',
              color: Color(0xFFE3F2FD),
              milestones: [
                'Rola da barriga para as costas',
                'Senta com apoio',
                'Pega objetos com as mãos',
                'Balbucia e faz sons',
              ],
              activities: [
                'Brincadeiras com chocalhos',
                'Leitura de livrinhos',
                'Músicas e cantigas',
                'Estimular alcançar objetos',
              ],
            ),
            const SizedBox(height: 16),
            const _DevelopmentCard(
              emoji: '👼',
              title: '6-9 meses',
              color: Color(0xFFFFF3E0),
              milestones: [
                'Senta sem apoio',
                'Engatinha ou se arrasta',
                'Transfere objetos entre as mãos',
                'Responde ao próprio nome',
              ],
              activities: [
                'Brincadeiras no chão',
                'Objetos para explorar texturas',
                'Esconde-esconde simples',
                'Incentivar movimentos',
              ],
            ),
            const SizedBox(height: 16),
            const _DevelopmentCard(
              emoji: '🚶',
              title: '9-12 meses',
              color: Color(0xFFF3E5F5),
              milestones: [
                'Fica em pé com apoio',
                'Dá os primeiros passos',
                'Fala primeiras palavras',
                'Imita gestos simples',
              ],
              activities: [
                'Incentivar caminhada',
                'Jogos de imitação',
                'Livros com figuras',
                'Brincadeiras de encaixe',
              ],
            ),
            const SizedBox(height: 16),
            const _DevelopmentCard(
              emoji: '🧒',
              title: '12-18 meses',
              color: Color(0xFFFFE4E6),
              milestones: [
                'Caminha de forma independente',
                'Diz várias palavras',
                'Aponta para objetos desejados',
                'Brinca de faz de conta',
              ],
              activities: [
                'Brincadeiras de movimento',
                'Conversar sobre tudo',
                'Jogos de empilhar',
                'Atividades artísticas simples',
              ],
            ),
            const SizedBox(height: 16),
            const _DevelopmentCard(
              emoji: '🎨',
              title: '18-24 meses',
              color: Color(0xFFE0F2F1),
              milestones: [
                'Corre e pula',
                'Forma frases de 2 palavras',
                'Imita atividades dos adultos',
                'Mostra independência crescente',
              ],
              activities: [
                'Atividades físicas variadas',
                'Leitura interativa',
                'Brincadeiras criativas',
                'Rotinas de autonomia',
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF3E5F5), Color(0xFFE1BEE7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: Colors.purple.withOpacity(0.2), width: 2),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('⚠️', style: TextStyle(fontSize: 24)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Quando consultar o pediatra?',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.purple[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '• Atraso significativo nos marcos\n• Perda de habilidades já adquiridas\n• Preocupações com comunicação\n• Comportamentos incomuns',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.purple[700],
                      height: 1.4,
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

class _DevelopmentCard extends StatelessWidget {
  final String emoji;
  final String title;
  final List<String> milestones;
  final List<String> activities;
  final Color color;

  const _DevelopmentCard({
    required this.emoji,
    required this.title,
    required this.milestones,
    required this.activities,
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              const SizedBox(width: 12),
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
          const SizedBox(height: 16),
          Text(
            '🎯 Marcos do desenvolvimento:',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          ...milestones.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.purple[600],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[700],
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 12),
          Text(
            '🎪 Atividades estimulantes:',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          ...activities.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.orange[600],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[700],
                          height: 1.3,
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

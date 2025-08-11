import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

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
              colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
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
            const Text('🍎 ', style: TextStyle(fontSize: 28)),
            Expanded(
              child: Text(
                'Alimentação Nutritiva',
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
                '🌱 Uma alimentação saudável é a base para um crescimento forte e feliz!',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const _NutritionCard(
              emoji: '🍼',
              title: 'Aleitamento Materno (0-6 meses)',
              color: Color(0xFFE8F5E8),
              benefits: [
                'Alimento completo para os primeiros 6 meses',
                'Fortalece o sistema imunológico',
                'Favorece o vínculo entre mãe e bebê',
                'Protege contra alergias e infecções',
              ],
              tips: [
                'Amamentar em livre demanda',
                'Posição confortável para mãe e bebê',
                'Hidratação adequada da mãe',
              ],
            ),
            const SizedBox(height: 16),
            const _NutritionCard(
              emoji: '🥄',
              title: 'Introdução Alimentar (6+ meses)',
              color: Color(0xFFFFF3E0),
              benefits: [
                'Desenvolvimento do paladar',
                'Estímulo à mastigação',
                'Diversificação nutricional',
                'Autonomia alimentar',
              ],
              tips: [
                'Começar com frutas e legumes',
                'Introduzir um alimento por vez',
                'Respeitar sinais de saciedade',
                'Ambiente calmo para as refeições',
              ],
            ),
            const SizedBox(height: 16),
            const _NutritionCard(
              emoji: '🥗',
              title: 'Alimentação Familiar (12+ meses)',
              color: Color(0xFFE3F2FD),
              benefits: [
                'Participação nas refeições familiares',
                'Desenvolvimento social',
                'Variedade nutricional completa',
                'Formação de hábitos saudáveis',
              ],
              tips: [
                'Oferecer variedade de cores e texturas',
                'Evitar açúcar e sal em excesso',
                'Refeições regulares e estruturadas',
                'Ser exemplo de alimentação saudável',
              ],
            ),
            const SizedBox(height: 16),
            const _NutritionCard(
              emoji: '⚠️',
              title: 'Alimentos a Evitar',
              color: Color(0xFFFFEBEE),
              benefits: [
                'Mel (antes de 1 ano)',
                'Açúcar refinado e doces',
                'Alimentos ultraprocessados',
                'Refrigerantes e sucos industrializados',
              ],
              tips: [
                'Ler sempre os rótulos',
                'Preferir alimentos naturais',
                'Preparar comida caseira sempre que possível',
                'Consultar pediatra sobre dúvidas',
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8F5E8), Color(0xFFDCEDC8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: Colors.green.withOpacity(0.2), width: 2),
              ),
              child: Row(
                children: [
                  const Text('👩‍⚕️', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Sempre converse com o pediatra sobre a alimentação do seu bebê!',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[800],
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

class _NutritionCard extends StatelessWidget {
  final String emoji;
  final String title;
  final List<String> benefits;
  final List<String> tips;
  final Color color;

  const _NutritionCard({
    required this.emoji,
    required this.title,
    required this.benefits,
    required this.tips,
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
            '✨ Benefícios:',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          ...benefits.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.green[600],
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
            '💡 Dicas práticas:',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          ...tips.map((item) => Padding(
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

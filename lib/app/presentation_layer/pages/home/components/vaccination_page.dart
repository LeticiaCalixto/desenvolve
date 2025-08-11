import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VaccinationPage extends StatelessWidget {
  const VaccinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 768;

    final vaccineSchedule = [
      {
        'age': 'Ao nascer',
        'emoji': '👶',
        'vaccines': ['BCG', 'Hepatite B'],
        'color': const Color(0xFFE8F5E8),
      },
      {
        'age': '2 meses',
        'emoji': '🍼',
        'vaccines': [
          'Penta, VIP',
          'Pneumocócica',
          'Rotavírus',
          'Meningocócica C'
        ],
        'color': const Color(0xFFE3F2FD),
      },
      {
        'age': '3 meses',
        'emoji': '👼',
        'vaccines': ['Meningocócica'],
        'color': const Color(0xFFFFF3E0),
      },
      {
        'age': '4 meses',
        'emoji': '😊',
        'vaccines': [
          'Penta, VIP',
          'Pneumocócica',
          'Rotavírus',
          'Meningocócica C'
        ],
        'color': const Color(0xFFF3E5F5),
      },
      {
        'age': '6 meses',
        'emoji': '👨‍🍼',
        'vaccines': ['Penta, VIP'],
        'color': const Color(0xFFE0F2F1),
      },
      {
        'age': '9 meses',
        'emoji': '🧸',
        'vaccines': ['Febre amarela'],
        'color': const Color(0xFFFFF8E1),
      },
      {
        'age': '12 meses',
        'emoji': '🎂',
        'vaccines': ['Tríplice viral', 'Pneumocócica', 'Meningocócica C'],
        'color': const Color(0xFFFCE4EC),
      },
      {
        'age': '15 meses',
        'emoji': '🚶',
        'vaccines': ['DTP, VOP', 'Hepatite A', 'Tetraviral'],
        'color': const Color(0xFFE8EAF6),
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
              colors: [Color(0xFF42A5F5), Color(0xFF2196F3)],
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
            const Text('💉 ', style: TextStyle(fontSize: 28)),
            Expanded(
              child: Text(
                'Calendário Vacinal',
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
                '🎯 Mantenha as vacinas em dia! Cada idade tem suas proteções especiais',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ...vaccineSchedule.map((item) {
              return _AgeGroupCard(
                age: item['age'] as String,
                emoji: item['emoji'] as String,
                vaccines: (item['vaccines'] as List<dynamic>).cast<String>(),
                color: item['color'] as Color,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _AgeGroupCard extends StatelessWidget {
  final String age;
  final String emoji;
  final List<String> vaccines;
  final Color color;

  const _AgeGroupCard({
    required this.age,
    required this.emoji,
    required this.vaccines,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    age,
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...vaccines.map((vaccine) => _VaccineTile(vaccine: vaccine)),
          ],
        ),
      ),
    );
  }
}

class _VaccineTile extends StatefulWidget {
  final String vaccine;

  const _VaccineTile({required this.vaccine});

  @override
  State<_VaccineTile> createState() => _VaccineTileState();
}

class _VaccineTileState extends State<_VaccineTile> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              checked ? const Color(0xFF42A5F5) : Colors.grey.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: CheckboxListTile(
        value: checked,
        onChanged: (value) {
          setState(() {
            checked = value ?? false;
          });
        },
        title: Text(
          widget.vaccine,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
            decoration: checked ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: GestureDetector(
          onTap: () => _showVaccineInfo(context, widget.vaccine),
          child: Text(
            'Toque para saber mais 📖',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xFF42A5F5),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: const Color(0xFF42A5F5),
        checkColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showVaccineInfo(BuildContext context, String vaccine) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('💉 ', style: TextStyle(fontSize: 24)),
                    Expanded(
                      child: Text(
                        vaccine,
                        style: GoogleFonts.nunito(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        _getVaccineInfo(vaccine),
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF42A5F5),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Entendi! 😊',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getVaccineInfo(String vaccine) {
    switch (vaccine) {
      case 'BCG':
        return '🛡️ Protege contra formas graves de tuberculose.\n\n🎯 Aplicada no braço direito, logo após o nascimento.\n\n⚠️ Pode deixar uma pequena cicatriz, que é normal e esperada.';
      case 'Hepatite B':
        return '🛡️ Previne a infecção pelo vírus da hepatite B.\n\n🎯 Protege o fígado contra inflamações graves.\n\n💡 Muito importante para recém-nascidos.';
      case 'Penta, VIP':
        return '🛡️ Combina 5 vacinas em 1: difteria, tétano, coqueluche, hepatite B e Haemophilus influenzae tipo b.\n\n🎯 VIP previne a poliomielite.\n\n💪 Proteção múltipla com menos picadas!';
      case 'Meningocócica C':
        return '🛡️ Previne contra meningite causada pelo meningococo tipo C.\n\n⚠️ Doença grave que pode ser fatal.\n\n🎯 Proteção essencial para bebês e crianças.';
      case 'Rotavírus':
        return '🛡️ Previne diarreia grave causada por rotavírus.\n\n💧 Evita desidratação severa em bebês.\n\n👶 Especialmente importante nos primeiros meses de vida.';
      case 'Tríplice viral':
        return '🛡️ Protege contra sarampo, caxumba e rubéola.\n\n🎯 Três doenças em uma só vacina.\n\n✨ Proteção completa e duradoura.';
      case 'Tetraviral':
        return '🛡️ Tríplice viral + varicela (catapora).\n\n🎯 Quatro doenças em uma só vacina.\n\n💪 Proteção ampliada e eficaz.';
      case 'Febre amarela':
        return '🛡️ Previne a febre amarela, doença transmitida por mosquitos.\n\n🌿 Especialmente importante em áreas endêmicas.\n\n💡 Proteção por toda a vida com uma dose.';
      case 'DTP, VOP':
        return '🛡️ DTP: difteria, tétano e coqueluche.\n🛡️ VOP: poliomielite oral.\n\n💪 Reforça a proteção já iniciada.\n\n🎯 Mantém a imunidade em dia.';
      case 'Hepatite A':
        return '🛡️ Previne a hepatite A, infecção que afeta o fígado.\n\n🍎 Transmitida por alimentos e água contaminados.\n\n✨ Proteção duradoura com duas doses.';
      default:
        return '🛡️ Vacina importante para o desenvolvimento saudável da criança.\n\n💙 Conversa sempre com o pediatra sobre o calendário vacinal.\n\n📅 Manter as vacinas em dia é um ato de amor e cuidado.';
    }
  }
}

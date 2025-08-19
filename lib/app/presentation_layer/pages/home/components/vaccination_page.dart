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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFF9800), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('⚠️ ', style: TextStyle(fontSize: 20)),
                      Expanded(
                        child: Text(
                          'IMPORTANTE: Cuidados Após Vacinação',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFE65100),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Toque em cada vacina para conhecer os cuidados específicos, reações possíveis e quando procurar atendimento médico.',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFFBF360C),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
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
        return '''🛡️ PROTEÇÃO
Protege contra formas graves de tuberculose.
Aplicada no braço direito, logo após o nascimento.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Manter o local limpo e seco
• Não aplicar pomadas ou cremes no local
• Evitar espremer ou coçar
• Observar evolução normal da cicatrização

🔍 EVOLUÇÃO NORMAL
• 2-3 semanas: pequena elevação avermelhada
• 4-6 semanas: formação de pústula (normal)
• 8-12 semanas: cicatrização com pequena cicatriz

⚠️ REAÇÕES POSSÍVEIS
Comuns: Vermelhidão local, pequena cicatriz
Raras: Linfadenopatia (ínguas) regional
🚨 Procurar atendimento: febre alta persistente, secreção excessiva''';

      case 'Hepatite B':
        return '''🛡️ PROTEÇÃO
Previne a infecção pelo vírus da hepatite B.
Protege o fígado contra inflamações graves.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Compressas frias no local se houver dor
• Manter hidratação adequada
• Observar a criança nas primeiras 24h
• Manter calendário de doses em dia

⚠️ REAÇÕES POSSÍVEIS
Comuns: Dor e vermelhidão no local, febre baixa
Raras: Sonolência, irritabilidade leve
🚨 Procurar atendimento: febre alta (>38.5°C), reações alérgicas, vômitos persistentes''';

      case 'Penta, VIP':
        return '''🛡️ PROTEÇÃO
Combina 5 vacinas: difteria, tétano, coqueluche, hepatite B e Haemophilus influenzae tipo b.
VIP previne a poliomielite.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Oferecer líquidos com frequência
• Usar roupas leves se houver febre
• Dar banho morno se temperatura elevada
• Compressas frias no local da aplicação
• Antitérmico se prescrito pelo pediatra

⚠️ REAÇÕES POSSÍVEIS
Comuns: Febre, irritabilidade, sonolência, dor local
Raras: Choro inconsolável por mais de 3h, convulsões febris
🚨 Procurar atendimento: febre alta persistente (>39°C), convulsões, dificuldade respiratória''';

      case 'Meningocócica C':
        return '''🛡️ PROTEÇÃO
Previne meningite causada pelo meningococo tipo C.
Doença grave que pode ser fatal.

� CUIDADOS BÁSICOS APÓS A VACINA
• Observar sinais de febre nas primeiras 48h
• Manter ambiente ventilado
• Oferecer bastante líquido
• Repouso se a criança estiver sonolenta

⚠️ REAÇÕES POSSÍVEIS
Comuns: Febre baixa, irritabilidade, dor local
Raras: Sonolência excessiva, perda de apetite
🚨 Procurar atendimento: febre alta (>38.5°C), manchas na pele, rigidez de nuca''';

      case 'Rotavírus':
        return '''🛡️ PROTEÇÃO
Previne diarreia grave causada por rotavírus.
Evita desidratação severa em bebês.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Manter aleitamento materno normal
• Observar evacuações nas primeiras 24h
• Higiene rigorosa das mãos
• Hidratação adequada

⚠️ REAÇÕES POSSÍVEIS
Comuns: Irritabilidade leve, febre baixa
Raras: Diarreia leve e temporária
🚨 Procurar atendimento: vômitos persistentes, diarreia com sangue, sinais de desidratação''';

      case 'Pneumocócica':
        return '''�️ PROTEÇÃO
Previne pneumonia, meningite e outras infecções causadas pelo pneumococo.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Compressas frias se dor local
• Oferecer líquidos extra
• Observar respiração da criança
• Manter repouso se necessário

⚠️ REAÇÕES POSSÍVEIS
Comuns: Dor local, febre baixa, irritabilidade
Raras: Sonolência, perda temporária de apetite
🚨 Procurar atendimento: dificuldade respiratória, febre alta persistente, letargia''';

      case 'Meningocócica':
        return '''🛡️ PROTEÇÃO
Previne contra meningite meningocócica.
Proteção específica conforme tipo de meningococo.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Observar temperatura corporal
• Manter ambiente calmo
• Hidratação adequada
• Observar sinais neurológicos

⚠️ REAÇÕES POSSÍVEIS
Comuns: Febre, irritabilidade, sonolência
Raras: Dor de cabeça (em crianças maiores)
🚨 Procurar atendimento: febre alta, vômitos, manchas roxas na pele''';

      case 'Tríplice viral':
        return '''🛡️ PROTEÇÃO
Protege contra sarampo, caxumba e rubéola.
Três doenças em uma só vacina.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Evitar contato com pessoas doentes
• Proteger do sol se houver erupção
• Manter hidratação
• Observar temperatura entre 5°-12° dia

⚠️ REAÇÕES POSSÍVEIS
Comuns: Febre (5-12 dias após), manchas avermelhadas leves
Raras: Dor nas articulações, ínguas
🚨 Procurar atendimento: febre muito alta, dificuldade respiratória, convulsões''';

      case 'Tetraviral':
        return '''🛡️ PROTEÇÃO
Tríplice viral + varicela (catapora).
Quatro doenças em uma só vacina.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Cortar unhas curtas para evitar arranhões
• Banhos mornos se houver erupção
• Roupas de algodão, leves
• Evitar aspirina se houver febre

⚠️ REAÇÕES POSSÍVEIS
Comuns: Febre, erupção leve semelhante à catapora
Raras: Dor de cabeça, mal-estar geral
🚨 Procurar atendimento: erupção extensa, febre alta persistente, dificuldade respiratória''';

      case 'Febre amarela':
        return '''🛡️ PROTEÇÃO
Previne a febre amarela, doença transmitida por mosquitos.
Proteção por toda a vida com uma dose.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Evitar exercícios intensos por 3 dias
• Proteger-se de mosquitos
• Manter hidratação adequada
• Observar sintomas por 10 dias

⚠️ REAÇÕES POSSÍVEIS
Comuns: Dor local, febre baixa, mal-estar leve
Raras: Dor de cabeça, dores musculares
🚨 Procurar atendimento: febre alta com icterícia (amarelão), vômitos persistentes''';

      case 'DTP, VOP':
        return '''🛡️ PROTEÇÃO
DTP: difteria, tétano e coqueluche.
VOP: poliomielite oral (gotinha).

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Manter calendário de reforços
• Compressas frias no local da injeção
• Não oferecer alimentos 30min após VOP
• Higiene rigorosa das mãos

⚠️ REAÇÕES POSSÍVEIS
Comuns: Febre, irritabilidade, dor local
Raras: Sonolência excessiva, perda de apetite
🚨 Procurar atendimento: febre alta persistente, convulsões, paralisia''';

      case 'Hepatite A':
        return '''🛡️ PROTEÇÃO
Previne a hepatite A, infecção que afeta o fígado.
Transmitida por alimentos e água contaminados.

🏥 CUIDADOS BÁSICOS APÓS A VACINA
• Higiene alimentar rigorosa
• Lavar bem frutas e verduras
• Água tratada ou fervida
• Observar cor da urina e fezes

⚠️ REAÇÕES POSSÍVEIS
Comuns: Dor local, febre baixa, fadiga leve
Raras: Dor abdominal leve, perda de apetite
🚨 Procurar atendimento: icterícia (amarelão), urina escura, vômitos intensos''';

      default:
        return '''🛡️ PROTEÇÃO
Vacina importante para o desenvolvimento saudável da criança.

🏥 CUIDADOS GERAIS APÓS VACINAÇÃO
• Observar a criança nas primeiras 24-48h
• Oferecer líquidos com frequência
• Manter ambiente ventilado e calmo
• Anotar data e tipo de vacina

⚠️ SINAIS DE ALERTA
• Febre alta persistente (>39°C)
• Dificuldade respiratória
• Convulsões ou alterações neurológicas
• Reações alérgicas (inchaço, urticária)

💙 LEMBRE-SE
Conversar sempre com o pediatra sobre o calendário vacinal.
Manter as vacinas em dia é um ato de amor e cuidado.''';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiseasePage extends StatelessWidget {
  DiseasePage({super.key});

  // Lista de doenças e seus textos informativos
  final List<Map<String, dynamic>> diseases = [
    {
      'name': 'Resfriado',
      'emoji': '🤧',
      'info':
          'O resfriado é uma infecção viral comum que afeta o nariz e a garganta.',
      'color': const Color(0xFFE3F2FD)
    },
    {
      'name': 'Bronquiolite',
      'emoji': '🫁',
      'info':
          'A bronquiolite é uma infecção pulmonar que afeta principalmente crianças pequenas.',
      'color': const Color(0xFFF3E5F5)
    },
    {
      'name': 'Gripe',
      'emoji': '🤒',
      'info': 'A gripe é uma infecção viral que afeta o sistema respiratório.',
      'color': const Color(0xFFE8F5E8)
    },
    {
      'name': 'Otite média',
      'emoji': '👂',
      'info':
          'A otite média é uma infecção do ouvido médio, muito comum em crianças.',
      'color': const Color(0xFFFFF3E0)
    },
    {
      'name': 'Conjuntivite',
      'emoji': '👁️',
      'info':
          'A conjuntivite é uma inflamação da membrana que cobre o olho e a pálpebra.',
      'color': const Color(0xFFFCE4EC)
    },
    {
      'name': 'Estomatite',
      'emoji': '👄',
      'info':
          'A estomatite é uma inflamação da boca, frequentemente causada por vírus.',
      'color': const Color(0xFFE0F2F1)
    },
    {
      'name': 'Gastroenterite',
      'emoji': '🤮',
      'info':
          'A gastroenterite é uma infecção que afeta o sistema digestivo, provocando diarreia e vômitos.',
      'color': const Color(0xFFF1F8E9)
    },
    {
      'name': 'Doença mão-pé-boca',
      'emoji': '🤲',
      'info':
          'A doença mão-pé-boca é uma infecção viral que causa erupções na pele e úlceras na boca.',
      'color': const Color(0xFFEDE7F6)
    },
  ];

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
              colors: [Color(0xFF81C784), Color(0xFF66BB6A)],
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
            const Text('🏥 ', style: TextStyle(fontSize: 28)),
            Expanded(
              child: Text(
                'Doenças Comuns',
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '🔍 Procurar doença...',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                final disease = diseases[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: disease['color'],
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
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
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
                          disease['emoji'],
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    title: Text(
                      disease['name'],
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[600],
                      size: 16,
                    ),
                    onTap: () {
                      _showDiseaseInfo(context, disease);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDiseaseInfo(BuildContext context, Map<String, dynamic> disease) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Text(disease['emoji'], style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  disease['name'],
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
          content: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: disease['color'],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              disease['info'],
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF81C784),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                'Entendi! 😊',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

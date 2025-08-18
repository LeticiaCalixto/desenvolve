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
      'symptoms':
          'Coriza, espirros, tosse leve, congestão nasal, irritação na garganta.',
      'treatment':
          'Repouso, hidratação adequada, lavagem nasal com soro fisiológico.',
      'when_seek_help':
          'Procure atendimento se houver febre alta persistente (acima de 38.5°C por mais de 3 dias), dificuldade para respirar, sinais de desidratação, ou se os sintomas piorarem após 7-10 dias.',
      'color': const Color(0xFFE3F2FD)
    },
    {
      'name': 'Bronquiolite',
      'emoji': '🫁',
      'info':
          'A bronquiolite é uma infecção pulmonar que afeta principalmente crianças pequenas.',
      'symptoms':
          'Tosse persistente, chiado no peito, dificuldade para respirar, febre baixa.',
      'treatment': 'Hidratação, aspiração nasal, posição elevada para dormir.',
      'when_seek_help':
          'URGENTE: Procure atendimento imediatamente se houver dificuldade respiratória grave, respiração muito rápida, coloração azulada nos lábios ou unhas, recusa alimentar, ou sinais de desidratação.',
      'color': const Color(0xFFF3E5F5)
    },
    {
      'name': 'Gripe',
      'emoji': '🤒',
      'info': 'A gripe é uma infecção viral que afeta o sistema respiratório.',
      'symptoms':
          'Febre alta súbita, dores no corpo, tosse seca, dor de cabeça, mal-estar.',
      'treatment':
          'Repouso, hidratação, medicamentos para febre conforme orientação médica.',
      'when_seek_help':
          'Procure atendimento se houver febre muito alta (acima de 39°C), dificuldade respiratória, dor no peito, vômitos persistentes, ou sinais de desidratação.',
      'color': const Color(0xFFE8F5E8)
    },
    {
      'name': 'Otite média',
      'emoji': '👂',
      'info':
          'A otite média é uma infecção do ouvido médio, muito comum em crianças.',
      'symptoms':
          'Dor de ouvido intensa, febre, irritabilidade, dificuldade para dormir.',
      'treatment':
          'Analgésicos para dor, compressas mornas, consulta médica para avaliação.',
      'when_seek_help':
          'Procure atendimento se houver febre alta, secreção purulenta no ouvido, perda auditiva, ou se a criança estiver muito irritada e com dor intensa.',
      'color': const Color(0xFFFFF3E0)
    },
    {
      'name': 'Conjuntivite',
      'emoji': '👁️',
      'info':
          'A conjuntivite é uma inflamação da membrana que cobre o olho e a pálpebra.',
      'symptoms':
          'Olhos vermelhos, coceira, secreção, sensação de areia nos olhos.',
      'treatment':
          'Limpeza com soro fisiológico, compressas frias, evitar coçar os olhos.',
      'when_seek_help':
          'Procure atendimento se houver secreção purulenta intensa, dor ocular severa, alterações na visão, ou se os sintomas não melhorarem em 2-3 dias.',
      'color': const Color(0xFFFCE4EC)
    },
    {
      'name': 'Estomatite',
      'emoji': '👄',
      'info':
          'A estomatite é uma inflamação da boca, frequentemente causada por vírus.',
      'symptoms':
          'Úlceras dolorosas na boca, dificuldade para comer, febre, irritabilidade.',
      'treatment':
          'Alimentos frios e macios, analgésicos conforme orientação, higiene oral suave.',
      'when_seek_help':
          'Procure atendimento se houver recusa total de alimentos e líquidos, sinais de desidratação, febre alta persistente, ou úlceras muito extensas.',
      'color': const Color(0xFFE0F2F1)
    },
    {
      'name': 'Gastroenterite',
      'emoji': '🤮',
      'info':
          'A gastroenterite é uma infecção que afeta o sistema digestivo, provocando diarreia e vômitos.',
      'symptoms': 'Diarreia, vômitos, dor abdominal, febre baixa, mal-estar.',
      'treatment':
          'Hidratação frequente, dieta leve (BRAT), repouso, soro caseiro.',
      'when_seek_help':
          'Procure atendimento URGENTE se houver sinais de desidratação severa (boca seca, olhos fundos, choro sem lágrimas), sangue nas fezes, vômitos persistentes, febre alta, ou dor abdominal intensa.',
      'color': const Color(0xFFF1F8E9)
    },
    {
      'name': 'Doença mão-pé-boca',
      'emoji': '🤲',
      'info':
          'A doença mão-pé-boca é uma infecção viral que causa erupções na pele e úlceras na boca.',
      'symptoms':
          'Erupções nas mãos, pés e boca, febre, úlceras dolorosas, dificuldade para engolir.',
      'treatment':
          'Analgésicos para dor, alimentos frios, hidratação, repouso.',
      'when_seek_help':
          'Procure atendimento se houver recusa total de líquidos, sinais de desidratação, febre muito alta, ou se as lesões se tornarem muito extensas ou infectadas.',
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
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 600),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: disease['color'],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(disease['emoji'],
                          style: const TextStyle(fontSize: 32)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          disease['name'],
                          style: GoogleFonts.nunito(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Informação geral
                        _buildInfoSection(
                          '📋 Informação Geral',
                          disease['info'],
                          Colors.blue[100]!,
                        ),
                        const SizedBox(height: 16),

                        // Sintomas
                        _buildInfoSection(
                          '🩺 Sintomas Comuns',
                          disease['symptoms'],
                          Colors.orange[100]!,
                        ),
                        const SizedBox(height: 16),

                        // Tratamento
                        _buildInfoSection(
                          '💊 Cuidados e Tratamento',
                          disease['treatment'],
                          Colors.green[100]!,
                        ),
                        const SizedBox(height: 16),

                        // Quando procurar atendimento (DESTACADO)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.15),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.red[600],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.warning_amber_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      'QUANDO PROCURAR ATENDIMENTO',
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.red[700],
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  disease['when_seek_help'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.red[800],
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Aviso médico
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline,
                                  color: Colors.blue[600], size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Sempre consulte um pediatra para diagnóstico e tratamento adequados.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.blue[700],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Footer
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF81C784),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            'Entendi! 😊',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoSection(
      String title, String content, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

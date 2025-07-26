import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiseasePage extends StatelessWidget {
  DiseasePage({super.key});

  // Lista de doenças e seus textos informativos
  final List<Map<String, String>> diseases = [
    {
      'name': 'Resfriado',
      'info':
          'O resfriado é uma infecção viral comum que afeta o nariz e a garganta.'
    },
    {
      'name': 'Bronquiolite',
      'info':
          'A bronquiolite é uma infecção pulmonar que afeta principalmente crianças pequenas.'
    },
    {
      'name': 'Gripe',
      'info': 'A gripe é uma infecção viral que afeta o sistema respiratório.'
    },
    {
      'name': 'Otite média',
      'info':
          'A otite média é uma infecção do ouvido médio, muito comum em crianças.'
    },
    {
      'name': 'Conjuntivite',
      'info':
          'A conjuntivite é uma inflamação da membrana que cobre o olho e a pálpebra.'
    },
    {
      'name': 'Estomatite',
      'info':
          'A estomatite é uma inflamação da boca, frequentemente causada por vírus.'
    },
    {
      'name': 'Gastroenterite',
      'info':
          'A gastroenterite é uma infecção que afeta o sistema digestivo, provocando diarreia e vômitos.'
    },
    {
      'name': 'Doença mão-pé-boca',
      'info':
          'A doença mão-pé-boca é uma infecção viral que causa erupções na pele e úlceras na boca.'
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            SizedBox(width: 8), // Espaço entre o botão e o texto
            Expanded(
              child: Text(
                'Doenças Comuns na\nPrimeira Infância',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Digite aqui o que procura',
                prefixIcon: const Icon(Icons.search),
                fillColor: const Color.fromARGB(255, 228, 218, 205),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),

          // Lista de doenças
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showDiseaseInfo(context, diseases[index]['name']!,
                        diseases[index]['info']!);
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        diseases[index]['name']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: const Icon(
                        Icons.local_hospital,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Função para exibir o popup com o texto informativo da doença
  void _showDiseaseInfo(
      BuildContext context, String diseaseName, String diseaseInfo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(diseaseName),
          content: Text(diseaseInfo),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

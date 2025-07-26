import 'package:flutter/material.dart';

class VaccinationPage extends StatelessWidget {
  const VaccinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vaccineSchedule = [
      {
        'age': 'Ao nascer',
        'vaccines': ['BCG', 'Hepatite B'],
      },
      {
        'age': '2 meses',
        'vaccines': [
          'Penta, VIP',
          'Pneumocócica',
          'Rotavírus',
          'Meningocócica C'
        ],
      },
      {
        'age': '3 meses',
        'vaccines': ['Meningocócica'],
      },
      {
        'age': '4 meses',
        'vaccines': [
          'Penta, VIP',
          'Pneumocócica',
          'Rotavírus',
          'Meningocócica C'
        ],
      },
      {
        'age': '6 meses',
        'vaccines': ['Penta, VIP'],
      },
      {
        'age': '9 meses',
        'vaccines': ['Febre amarela'],
      },
      {
        'age': '12 meses',
        'vaccines': ['Tríplice viral', 'Pneumocócica', 'Meningocócica C'],
      },
      {
        'age': '15 meses',
        'vaccines': ['DTP, VOP', 'Hepatite A', 'Tetraviral'],
      },
    ];

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
                'Calendário Vacinal',
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Facilite o acompanhamento das vacinas da criança. Marque as vacinas tomadas e toque em cada uma para saber mais.',
            style: TextStyle(fontSize: 16, color: Colors.teal),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...vaccineSchedule.map((item) {
            return _AgeGroupCard(
              age: item['age'] as String,
              vaccines: (item['vaccines'] as List<dynamic>).cast<String>(),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class _AgeGroupCard extends StatelessWidget {
  final String age;
  final List<String> vaccines;

  const _AgeGroupCard({required this.age, required this.vaccines});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              age,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 12),
            ...vaccines
                .map((vaccine) => _VaccineTile(vaccine: vaccine))
                .toList(),
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
    return InkWell(
      onTap: () => _showVaccineInfo(context, widget.vaccine),
      child: CheckboxListTile(
        value: checked,
        onChanged: (value) {
          setState(() {
            checked = value ?? false;
          });
        },
        title: Text(widget.vaccine),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  void _showVaccineInfo(BuildContext context, String vaccine) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                vaccine,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _getVaccineDescription(vaccine),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getVaccineDescription(String vaccine) {
    switch (vaccine) {
      case 'BCG':
        return 'Protege contra formas graves de tuberculose.';
      case 'Hepatite B':
        return 'Previne a infecção pelo vírus da hepatite B.';
      case 'Penta, VIP':
        return 'Combina 5 vacinas em 1 e poliomielite inativada.';
      case 'Meningocócica C':
        return 'Previne contra meningite causada pelo meningococo tipo C.';
      case 'Rotavírus':
        return 'Previne diarreia grave causada por rotavírus.';
      case 'Tríplice viral':
        return 'Contra sarampo, caxumba e rubéola.';
      case 'Tetraviral':
        return 'Tríplice viral + varicela (catapora).';
      default:
        return 'Vacina importante para o desenvolvimento saudável da criança.';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain_layer/entities/child.dart';
import '../../widgets/custom_button.dart';

class AddChildPage extends StatefulWidget {
  final Function(Child) onChildAdded;

  const AddChildPage({
    super.key,
    required this.onChildAdded,
  });

  @override
  State<AddChildPage> createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _allergiesController = TextEditingController();
  final _emergencyContactController = TextEditingController();
  final _emergencyPhoneController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedBloodType;

  final List<String> _bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _allergiesController.dispose();
    _emergencyContactController.dispose();
    _emergencyPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        title: Text(
          'Adicionar Criança',
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF2C3E50),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFormSection(
                  'Informações Básicas',
                  [
                    _buildTextFormField(
                      controller: _nameController,
                      label: 'Nome da criança',
                      icon: Icons.child_friendly,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o nome da criança';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildDatePicker(),
                  ],
                ),
                const SizedBox(height: 24),
                _buildFormSection(
                  'Informações Físicas',
                  [
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextFormField(
                            controller: _weightController,
                            label: 'Peso (kg)',
                            icon: Icons.monitor_weight_outlined,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildTextFormField(
                            controller: _heightController,
                            label: 'Altura (cm)',
                            icon: Icons.height,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildBloodTypeDropdown(),
                  ],
                ),
                const SizedBox(height: 24),
                _buildFormSection(
                  'Informações de Saúde',
                  [
                    _buildTextFormField(
                      controller: _allergiesController,
                      label: 'Alergias (opcional)',
                      icon: Icons.warning_amber_outlined,
                      maxLines: 2,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildFormSection(
                  'Contato de Emergência',
                  [
                    _buildTextFormField(
                      controller: _emergencyContactController,
                      label: 'Nome do contato (opcional)',
                      icon: Icons.contact_emergency,
                    ),
                    const SizedBox(height: 16),
                    _buildTextFormField(
                      controller: _emergencyPhoneController,
                      label: 'Telefone (opcional)',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Adicionar Criança',
                  backgroundColor: const Color(0xFF4ECDC4),
                  textColor: Colors.white,
                  onPressed: _saveChild,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormSection(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: const Color(0xFF2C3E50),
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF4ECDC4)),
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFF7F8C8D),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE9ECEF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE9ECEF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF4ECDC4), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF6B6B)),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
      ),
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE9ECEF)),
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFF8F9FA),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today,
              color: Color(0xFF4ECDC4),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _selectedDate == null
                    ? 'Data de nascimento *'
                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: _selectedDate == null
                      ? const Color(0xFF7F8C8D)
                      : const Color(0xFF2C3E50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedBloodType,
      decoration: InputDecoration(
        labelText: 'Tipo sanguíneo (opcional)',
        prefixIcon: const Icon(Icons.bloodtype, color: Color(0xFF4ECDC4)),
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFF7F8C8D),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE9ECEF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE9ECEF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF4ECDC4), width: 2),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
      ),
      items: _bloodTypes.map((String bloodType) {
        return DropdownMenuItem<String>(
          value: bloodType,
          child: Text(
            bloodType,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF2C3E50),
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedBloodType = newValue;
        });
      },
    );
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365)),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 6)),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF4ECDC4),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF2C3E50),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveChild() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      final newChild = Child(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        birthDate: _selectedDate!,
        weight: _weightController.text.isNotEmpty
            ? double.tryParse(_weightController.text)
            : null,
        height: _heightController.text.isNotEmpty
            ? double.tryParse(_heightController.text)
            : null,
        allergies: _allergiesController.text.isNotEmpty
            ? _allergiesController.text.trim()
            : null,
        bloodType: _selectedBloodType,
        emergencyContact: _emergencyContactController.text.isNotEmpty
            ? _emergencyContactController.text.trim()
            : null,
        emergencyPhone: _emergencyPhoneController.text.isNotEmpty
            ? _emergencyPhoneController.text.trim()
            : null,
      );

      widget.onChildAdded(newChild);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${newChild.name} foi adicionado com sucesso!'),
          backgroundColor: const Color(0xFF4ECDC4),
        ),
      );
    } else if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, selecione a data de nascimento'),
          backgroundColor: Color(0xFFFF6B6B),
        ),
      );
    }
  }
}

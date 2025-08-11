import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain_layer/entities/child.dart';

class ChildDetailsPage extends StatefulWidget {
  final Child child;
  final Function(Child) onChildUpdated;
  final Function(String) onChildDeleted;

  const ChildDetailsPage({
    super.key,
    required this.child,
    required this.onChildUpdated,
    required this.onChildDeleted,
  });

  @override
  State<ChildDetailsPage> createState() => _ChildDetailsPageState();
}

class _ChildDetailsPageState extends State<ChildDetailsPage> {
  late Child _child;
  bool _isEditing = false;

  // Controllers para edição
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
  void initState() {
    super.initState();
    _child = widget.child;
    _initializeControllers();
  }

  void _initializeControllers() {
    _nameController.text = _child.name;
    _weightController.text = _child.weight?.toString() ?? '';
    _heightController.text = _child.height?.toString() ?? '';
    _allergiesController.text = _child.allergies ?? '';
    _emergencyContactController.text = _child.emergencyContact ?? '';
    _emergencyPhoneController.text = _child.emergencyPhone ?? '';
    _selectedDate = _child.birthDate;
    _selectedBloodType = _child.bloodType;
  }

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
          _child.name,
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
        actions: [
          if (!_isEditing) ...[
            IconButton(
              onPressed: _startEditing,
              icon: const Icon(
                Icons.edit_outlined,
                color: Color(0xFF4ECDC4),
              ),
            ),
            PopupMenuButton<String>(
              onSelected: _handleMenuAction,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline, color: Color(0xFFFF6B6B)),
                      SizedBox(width: 8),
                      Text('Excluir criança'),
                    ],
                  ),
                ),
              ],
            ),
          ] else ...[
            TextButton(
              onPressed: _cancelEditing,
              child: Text(
                'Cancelar',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF7F8C8D),
                ),
              ),
            ),
            TextButton(
              onPressed: _saveChanges,
              child: Text(
                'Salvar',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF4ECDC4),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildChildHeader(),
              const SizedBox(height: 24),
              if (_isEditing) _buildEditingForm() else _buildViewMode(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChildHeader() {
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: const Color(0xFFFF9500).withOpacity(0.1),
            child: Icon(
              Icons.child_friendly,
              color: const Color(0xFFFF9500),
              size: 40,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _child.name,
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _child.ageString,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF4ECDC4),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Nascimento: ${_child.birthDate.day}/${_child.birthDate.month}/${_child.birthDate.year}',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF7F8C8D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewMode() {
    return Column(
      children: [
        _buildInfoSection('Informações Físicas', [
          if (_child.weight != null)
            _buildInfoItem(
                Icons.monitor_weight_outlined, 'Peso', '${_child.weight} kg'),
          if (_child.height != null)
            _buildInfoItem(Icons.height, 'Altura', '${_child.height} cm'),
          if (_child.bloodType != null)
            _buildInfoItem(
                Icons.bloodtype, 'Tipo Sanguíneo', _child.bloodType!),
        ]),
        if (_child.allergies != null) ...[
          const SizedBox(height: 20),
          _buildInfoSection('Informações de Saúde', [
            _buildInfoItem(
                Icons.warning_amber_outlined, 'Alergias', _child.allergies!,
                isWarning: true),
          ]),
        ],
        if (_child.emergencyContact != null ||
            _child.emergencyPhone != null) ...[
          const SizedBox(height: 20),
          _buildInfoSection('Contato de Emergência', [
            if (_child.emergencyContact != null)
              _buildInfoItem(
                  Icons.contact_emergency, 'Nome', _child.emergencyContact!),
            if (_child.emergencyPhone != null)
              _buildInfoItem(Icons.phone, 'Telefone', _child.emergencyPhone!),
          ]),
        ],
      ],
    );
  }

  Widget _buildEditingForm() {
    return Column(
      children: [
        _buildFormSection('Informações Básicas', [
          _buildTextFormField(
            controller: _nameController,
            label: 'Nome da criança',
            icon: Icons.child_friendly,
          ),
          const SizedBox(height: 16),
          _buildDatePicker(),
        ]),
        const SizedBox(height: 20),
        _buildFormSection('Informações Físicas', [
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
        ]),
        const SizedBox(height: 20),
        _buildFormSection('Informações de Saúde', [
          _buildTextFormField(
            controller: _allergiesController,
            label: 'Alergias',
            icon: Icons.warning_amber_outlined,
            maxLines: 2,
          ),
        ]),
        const SizedBox(height: 20),
        _buildFormSection('Contato de Emergência', [
          _buildTextFormField(
            controller: _emergencyContactController,
            label: 'Nome do contato',
            icon: Icons.contact_emergency,
          ),
          const SizedBox(height: 16),
          _buildTextFormField(
            controller: _emergencyPhoneController,
            label: 'Telefone',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
        ]),
      ],
    );
  }

  Widget _buildInfoSection(String title, List<Widget> items) {
    if (items.isEmpty) return const SizedBox.shrink();

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
          ...items,
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value,
      {bool isWarning = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            color:
                isWarning ? const Color(0xFFFF6B6B) : const Color(0xFF4ECDC4),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF7F8C8D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: isWarning
                        ? const Color(0xFFFF6B6B)
                        : const Color(0xFF2C3E50),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
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
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
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
                    ? 'Data de nascimento'
                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF2C3E50),
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
        labelText: 'Tipo sanguíneo',
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
      initialDate:
          _selectedDate ?? DateTime.now().subtract(const Duration(days: 365)),
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

  void _startEditing() {
    setState(() {
      _isEditing = true;
    });
  }

  void _cancelEditing() {
    setState(() {
      _isEditing = false;
      _initializeControllers(); // Reset controllers to original values
    });
  }

  void _saveChanges() {
    final updatedChild = _child.copyWith(
      name: _nameController.text.trim(),
      birthDate: _selectedDate,
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

    setState(() {
      _child = updatedChild;
      _isEditing = false;
    });

    widget.onChildUpdated(updatedChild);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Informações de ${updatedChild.name} atualizadas!'),
        backgroundColor: const Color(0xFF4ECDC4),
      ),
    );
  }

  void _handleMenuAction(String action) {
    if (action == 'delete') {
      _showDeleteConfirmation();
    }
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Excluir criança',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        content: Text(
          'Tem certeza que deseja remover ${_child.name} da sua lista? Esta ação não pode ser desfeita.',
          style: GoogleFonts.poppins(
            color: const Color(0xFF7F8C8D),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: GoogleFonts.poppins(
                color: const Color(0xFF7F8C8D),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close details page
              widget.onChildDeleted(_child.id);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${_child.name} foi removido da sua lista'),
                  backgroundColor: const Color(0xFFFF6B6B),
                ),
              );
            },
            child: Text(
              'Excluir',
              style: GoogleFonts.poppins(
                color: const Color(0xFFFF6B6B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

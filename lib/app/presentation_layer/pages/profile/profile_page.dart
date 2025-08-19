import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain_layer/entities/caregiver.dart';
import '../../../domain_layer/entities/child.dart';
import '../../../core/services/user_profile_service.dart';
import 'add_child_page.dart';
import 'child_details_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Mock data - em um app real, isso viria de um provider/controller
  late Caregiver caregiver;
  late List<Child> children;

  @override
  void initState() {
    super.initState();
    // Dados mock para demonstração
    caregiver = Caregiver(
      id: '1',
      name: 'Maria Silva',
      email: 'maria.silva@email.com',
      phone: '(11) 99999-9999',
      relationship: 'Mãe',
      children: [],
    );

    children = [
      Child(
        id: '1',
        name: 'João Silva',
        birthDate: DateTime(2022, 5, 15),
        weight: 12.5,
        height: 85.0,
        bloodType: 'O+',
        allergies: 'Lactose',
      ),
      Child(
        id: '2',
        name: 'Ana Silva',
        birthDate: DateTime(2020, 8, 22),
        weight: 18.2,
        height: 105.0,
        bloodType: 'A+',
        allergies: null,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Verificar se é enfermeira e mostrar a tela apropriada
    if (UserProfileService.isNurse) {
      return _buildNurseProfile(context);
    }

    // Tela de perfil normal para pais
    return _buildParentProfile(context);
  }

  Widget _buildNurseProfile(BuildContext context) {
    final user = UserProfileService.currentUser!;
    final patients = UserProfileService.getNursePatients();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Header profissional
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.medical_services,
                      size: 50,
                      color: user.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.name,
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'COREN: 123456-SP',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  Text(
                    user.email,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Estatísticas rápidas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildNurseStatCard(
                      '${patients.length}',
                      'Pacientes\nAtivos',
                      Icons.people,
                      const Color(0xFF4CAF50),
                      screenWidth,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildNurseStatCard(
                      '3',
                      'Consultas\nHoje',
                      Icons.calendar_today,
                      const Color(0xFF2196F3),
                      screenWidth,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildNurseStatCard(
                      '1',
                      'Atenção\nEspecial',
                      Icons.warning,
                      const Color(0xFFFF9800),
                      screenWidth,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Lista de pacientes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meus Pacientes',
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...patients.map((patient) =>
                      _buildNursePatientCard(context, patient, screenWidth)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Ações rápidas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ações Rápidas',
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildNurseActionButton(
                      'Nova Avaliação', Icons.add_circle, () {}, screenWidth),
                  _buildNurseActionButton(
                      'Relatórios', Icons.assessment, () {}, screenWidth),
                  _buildNurseActionButton(
                      'Agendar Consulta', Icons.schedule, () {}, screenWidth),
                  _buildNurseActionButton(
                      'Configurações', Icons.settings, () {}, screenWidth),
                  _buildNurseActionButton(
                    'Sair',
                    Icons.logout,
                    () {
                      UserProfileService.clearUser();
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    screenWidth,
                    isDestructive: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: 20,
      ),
      child: Row(
        children: [
          Icon(
            Icons.person,
            size: MediaQuery.of(context).size.width * 0.07,
            color: const Color(0xFF2196F3),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Expanded(
            child: Text(
              'Perfil',
              style: GoogleFonts.nunito(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF2C3E50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParentProfile(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Perfil da Família',
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF2C3E50),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Caregiver Info
            _buildCaregiverInfo(),
            const SizedBox(height: 24),

            // Children Section
            _buildChildrenSection(),
          ],
        ),
      ),
    );
  }

  // Métodos auxiliares para o perfil da enfermeira
  Widget _buildNurseStatCard(String value, String label, IconData icon,
      Color color, double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: const Color(0xFF7F8C8D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNursePatientCard(
      BuildContext context, Map<String, dynamic> patient, double screenWidth) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: patient['status'] == 'urgente'
                ? const Color(0xFFE74C3C)
                : patient['status'] == 'atencao'
                    ? const Color(0xFFFF9800)
                    : const Color(0xFF4CAF50),
            child: Text(
              patient['avatar'] ??
                  patient['name'].substring(0, 1).toUpperCase(),
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  patient['name'],
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                Text(
                  patient['age'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF7F8C8D),
                  ),
                ),
                if (patient['status'] == 'urgente')
                  Text(
                    'Urgente - Requer atenção',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFFE74C3C),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                else if (patient['status'] == 'atencao')
                  Text(
                    'Atenção especial',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFFFF9800),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: const Color(0xFF7F8C8D),
          ),
        ],
      ),
    );
  }

  Widget _buildNurseActionButton(
      String title, IconData icon, VoidCallback onTap, double screenWidth,
      {bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isDestructive
                      ? const Color(0xFFE74C3C)
                      : const Color(0xFF2196F3),
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDestructive
                          ? const Color(0xFFE74C3C)
                          : const Color(0xFF2C3E50),
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: const Color(0xFF7F8C8D),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCaregiverInfo() {
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
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xFF4ECDC4),
                child: Text(
                  caregiver.name.substring(0, 1).toUpperCase(),
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      caregiver.name,
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      caregiver.relationship,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xFF7F8C8D),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO: Implementar edição do perfil
                  _showEditProfile();
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Color(0xFF4ECDC4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow(Icons.email_outlined, caregiver.email),
          if (caregiver.phone != null) ...[
            const SizedBox(height: 8),
            _buildInfoRow(Icons.phone_outlined, caregiver.phone!),
          ],
        ],
      ),
    );
  }

  Widget _buildChildrenSection() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Crianças',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddChildPage(
                        onChildAdded: (Child newChild) {
                          setState(() {
                            children.add(newChild);
                          });
                        },
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Adicionar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4ECDC4),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          children.isEmpty
              ? _buildEmptyChildrenState()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: children.length,
                  itemBuilder: (context, index) {
                    return _buildChildCard(children[index]);
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildChildCard(Child child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE9ECEF),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFF3498DB),
            child: Icon(
              Icons.child_care,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  child.name,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  child.ageString,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF7F8C8D),
                  ),
                ),
                Row(
                  children: [
                    if (child.weight != null)
                      Text(
                        '${child.weight} kg',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF95A5A6),
                        ),
                      ),
                    if (child.weight != null && child.height != null)
                      const SizedBox(width: 16),
                    if (child.height != null)
                      Text(
                        '${child.height} cm',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF95A5A6),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChildDetailsPage(
                    child: child,
                    onChildUpdated: (Child updatedChild) {
                      setState(() {
                        final index =
                            children.indexWhere((c) => c.id == updatedChild.id);
                        if (index != -1) {
                          children[index] = updatedChild;
                        }
                      });
                    },
                    onChildDeleted: (String childId) {
                      setState(() {
                        children.removeWhere((c) => c.id == childId);
                      });
                    },
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF4ECDC4),
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFF7F8C8D),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF7F8C8D),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyChildrenState() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE9ECEF),
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.child_care_outlined,
            size: 64,
            color: const Color(0xFFBDC3C7),
          ),
          const SizedBox(height: 16),
          Text(
            'Nenhuma criança cadastrada',
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF7F8C8D),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Adicione uma criança para começar a acompanhar seu desenvolvimento',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFFBDC3C7),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditProfile() {
    // TODO: Implementar tela de edição do perfil do cuidador
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edição de perfil em desenvolvimento'),
        backgroundColor: Color(0xFF4ECDC4),
      ),
    );
  }
}

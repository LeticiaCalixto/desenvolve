import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/services/user_profile_service.dart';

class NurseHomePage extends StatelessWidget {
  const NurseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final patients = UserProfileService.getNursePatients();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFF3E5F5),
              Color(0xFFE8F5E8),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNurseHeader(screenWidth),
                SizedBox(height: screenHeight * 0.03),
                _buildQuickStats(screenWidth),
                SizedBox(height: screenHeight * 0.03),
                _buildPatientsList(context, screenWidth, patients),
                SizedBox(height: screenHeight * 0.02),
                _buildQuickActions(context, screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNurseHeader(double screenWidth) {
    final userProfile = UserProfileService.currentUser!;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2196F3).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.15,
            height: screenWidth * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              userProfile.profileIcon,
              color: const Color(0xFF2196F3),
              size: screenWidth * 0.08,
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userProfile.greeting,
                  style: GoogleFonts.nunito(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Acompanhe e registre o desenvolvimento das crianças sob seus cuidados.',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.035,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            '12',
            'Pacientes\nAtivos',
            Icons.people,
            const Color(0xFF4CAF50),
            screenWidth,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: _buildStatCard(
            '3',
            'Consultas\nHoje',
            Icons.event,
            const Color(0xFFFF9800),
            screenWidth,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: _buildStatCard(
            '1',
            'Atenção\nEspecial',
            Icons.warning,
            const Color(0xFFFF5722),
            screenWidth,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String number, String label, IconData icon, Color color,
      double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: screenWidth * 0.08),
          SizedBox(height: screenWidth * 0.02),
          Text(
            number,
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.08,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.03,
              color: Colors.grey[600],
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientsList(BuildContext context, double screenWidth,
      List<Map<String, dynamic>> patients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lista de Pacientes',
              style: GoogleFonts.nunito(
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            Text(
              '${patients.length} pacientes',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.035,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        SizedBox(height: screenWidth * 0.04),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: patients.length,
          itemBuilder: (context, index) {
            final patient = patients[index];
            return _buildPatientCard(context, patient, screenWidth);
          },
        ),
      ],
    );
  }

  Widget _buildPatientCard(
      BuildContext context, Map<String, dynamic> patient, double screenWidth) {
    Color statusColor;
    IconData statusIcon;

    switch (patient['status']) {
      case 'urgente':
        statusColor = const Color(0xFFFF5722);
        statusIcon = Icons.priority_high;
        break;
      case 'atencao':
        statusColor = const Color(0xFFFF9800);
        statusIcon = Icons.warning;
        break;
      default:
        statusColor = const Color(0xFF4CAF50);
        statusIcon = Icons.check_circle;
    }

    return Container(
      margin: EdgeInsets.only(bottom: screenWidth * 0.03),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border(left: BorderSide(color: statusColor, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _showPatientDetails(context, patient),
        borderRadius: BorderRadius.circular(15),
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.12,
              height: screenWidth * 0.12,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  patient['avatar'],
                  style: TextStyle(fontSize: screenWidth * 0.06),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        patient['name'],
                        style: GoogleFonts.nunito(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                      Icon(statusIcon,
                          color: statusColor, size: screenWidth * 0.05),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    patient['age'],
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.035,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Próxima consulta: ${patient['nextAppointment']}',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.03,
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
              size: screenWidth * 0.04,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ações Rápidas',
          style: GoogleFonts.nunito(
            fontSize: screenWidth * 0.055,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: screenWidth * 0.04),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                'Nova\nAvaliação',
                Icons.add_circle,
                const Color(0xFF4CAF50),
                () {},
                screenWidth,
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: _buildActionButton(
                'Relatórios',
                Icons.assessment,
                const Color(0xFF2196F3),
                () {},
                screenWidth,
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: _buildActionButton(
                'Agendar\nConsulta',
                Icons.schedule,
                const Color(0xFFFF9800),
                () {},
                screenWidth,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(String title, IconData icon, Color color,
      VoidCallback onTap, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              Icon(icon, color: color, size: screenWidth * 0.08),
              SizedBox(height: screenWidth * 0.02),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.035,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPatientDetails(BuildContext context, Map<String, dynamic> patient) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Text(patient['avatar'], style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  patient['name'],
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Idade:', patient['age']),
              _buildDetailRow('Última consulta:', patient['lastVisit']),
              _buildDetailRow('Próxima consulta:', patient['nextAppointment']),
              const SizedBox(height: 12),
              Text(
                'Observações:',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                patient['notes'],
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF2196F3),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                'Fechar',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

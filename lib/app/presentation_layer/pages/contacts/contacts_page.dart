import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Principal
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF4B7BEC), Color(0xFF3867D6)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4B7BEC).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.medical_services_rounded,
                            size: 48,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'PSF 5 - Unidade de Saúde',
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Bairro Vila Nova, Garanhuns - PE',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Seção de Contatos
                    Text(
                      'Contatos Principais',
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
            
            const SizedBox(height: 16),
            
            // Botões de Contato
            Row(
              children: [
                Expanded(
                  child: _buildContactButton(
                    icon: Icons.phone,
                    label: 'Ligar',
                    color: const Color(0xFF27AE60),
                    onTap: () => _showContactInfo('Telefone: (87) 3762-1234'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildContactButton(
                    icon: Icons.chat,
                    label: 'WhatsApp',
                    color: const Color(0xFF25D366),
                    onTap: () => _showContactInfo('WhatsApp: (87) 99988-7766'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildContactButton(
                    icon: Icons.location_on,
                    label: 'Localização',
                    color: const Color(0xFF4B7BEC),
                    onTap: () => _showContactInfo('Endereço: PSF 5, Vila Nova, Garanhuns-PE'),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Informações de Funcionamento
            _buildInfoCard(
              title: 'Horário de Funcionamento',
              icon: Icons.access_time,
              children: [
                _buildInfoRow('Segunda a Sexta', '07:00 - 17:00'),
                _buildInfoRow('Sábado', '07:00 - 12:00'),
                _buildInfoRow('Domingo', 'Fechado'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Serviços Disponíveis
            _buildInfoCard(
              title: 'Serviços Disponíveis',
              icon: Icons.local_hospital,
              children: [
                _buildServiceItem('Vacinação Infantil'),
                _buildServiceItem('Consultas Pediátricas'),
                _buildServiceItem('Acompanhamento do Crescimento'),
                _buildServiceItem('Orientações de Saúde'),
                _buildServiceItem('Primeiros Socorros'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Emergências
            _buildInfoCard(
              title: 'Em Caso de Emergência',
              icon: Icons.emergency,
              iconColor: const Color(0xFFE74C3C),
              children: [
                _buildEmergencyItem('SAMU', '192'),
                _buildEmergencyItem('Bombeiros', '193'),
                _buildEmergencyItem('Hospital Regional', '(87) 3761-9000'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Equipe de Saúde
            _buildInfoCard(
              title: 'Nossa Equipe',
              icon: Icons.groups,
              children: [
                _buildTeamMember('Dra. Maria Silva', 'Pediatra', '(87) 99988-7766'),
                _buildTeamMember('Enf. João Santos', 'Enfermeiro', '(87) 99977-5544'),
                _buildTeamMember('Ana Costa', 'Agente de Saúde', '(87) 99966-3322'),
              ],
            ),
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
            Icons.contacts,
            size: MediaQuery.of(context).size.width * 0.07,
            color: const Color(0xFF4B7BEC),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Expanded(
            child: Text(
              'Contatos',
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
  
  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
    Color? iconColor,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: iconColor ?? const Color(0xFF4B7BEC),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF7F8C8D),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildServiceItem(String service) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF27AE60),
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            service,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildEmergencyItem(String service, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            service,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF2C3E50),
            ),
          ),
          GestureDetector(
            onTap: () => _showContactInfo('Telefone de emergência: $number'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE74C3C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                number,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTeamMember(String name, String role, String phone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF4B7BEC).withOpacity(0.1),
            child: Icon(
              Icons.person,
              color: const Color(0xFF4B7BEC),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                Text(
                  role,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF7F8C8D),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _showContactInfo('Telefone: $phone'),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF27AE60),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.phone,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  
  void _showContactInfo(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informação de Contato'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

enum UserType { parent, nurse }

class UserProfile {
  final String email;
  final UserType type;
  final String name;
  final String greeting;
  final IconData profileIcon;
  final Color primaryColor;

  UserProfile({
    required this.email,
    required this.type,
    required this.name,
    required this.greeting,
    required this.profileIcon,
    required this.primaryColor,
  });
}

class UserProfileService {
  static UserProfile? _currentUser;

  static UserProfile? get currentUser => _currentUser;
  static bool get isNurse => _currentUser?.type == UserType.nurse;
  static bool get isParent => _currentUser?.type == UserType.parent;

  // Lista de emails autorizados
  static const List<String> _authorizedEmails = [
    'enfermeira@gmail.com',
    'mae@gmail.com',
    'maria@gmail.com',
  ];

  // Senha padrão para todos os usuários
  static const String _defaultPassword = '1234';

  // Método para validar login
  static bool validateLogin(String email, String password) {
    final emailLower = email.toLowerCase();
    return _authorizedEmails.contains(emailLower) &&
        password == _defaultPassword;
  }

  static void setUserFromEmail(String email) {
    final emailLower = email.toLowerCase();

    if (emailLower == 'enfermeira@gmail.com') {
      _currentUser = UserProfile(
        email: email,
        type: UserType.nurse,
        name: 'Enfermeira Ana',
        greeting: 'Olá, Enfermeira!',
        profileIcon: Icons.medical_services,
        primaryColor: const Color(0xFF2196F3),
      );
    } else if (emailLower == 'mae@gmail.com' ||
        emailLower == 'maria@gmail.com') {
      _currentUser = UserProfile(
        email: email,
        type: UserType.parent,
        name: emailLower == 'maria@gmail.com' ? 'Maria' : 'Mãe',
        greeting: 'Olá, ${emailLower == 'maria@gmail.com' ? 'Maria' : 'Mãe'}!',
        profileIcon: Icons.person,
        primaryColor: const Color(0xFF4ECDC4),
      );
    } else {
      // Email não autorizado
      _currentUser = null;
    }
  }

  static void clearUser() {
    _currentUser = null;
  }

  static List<Map<String, dynamic>> getNursePatients() {
    return [
      {
        'name': 'João Silva',
        'age': '2 anos e 3 meses',
        'lastVisit': '10/08/2025',
        'nextAppointment': '25/08/2025',
        'status': 'regular',
        'avatar': '👦',
        'notes':
            'Desenvolvimento dentro do esperado. Próxima consulta de rotina.',
      },
      {
        'name': 'Ana Costa',
        'age': '1 ano e 8 meses',
        'lastVisit': '15/08/2025',
        'nextAppointment': '30/08/2025',
        'status': 'atencao',
        'avatar': '👧',
        'notes': 'Acompanhar desenvolvimento da fala. Orientações aos pais.',
      },
      {
        'name': 'Pedro Santos',
        'age': '3 anos e 1 mês',
        'lastVisit': '12/08/2025',
        'nextAppointment': '28/08/2025',
        'status': 'regular',
        'avatar': '👦',
        'notes': 'Vacinação em dia. Crescimento adequado.',
      },
      {
        'name': 'Laura Oliveira',
        'age': '6 meses',
        'lastVisit': '17/08/2025',
        'nextAppointment': '22/08/2025',
        'status': 'urgente',
        'avatar': '👶',
        'notes': 'Verificar peso e introdução alimentar. Retorno breve.',
      },
    ];
  }
}

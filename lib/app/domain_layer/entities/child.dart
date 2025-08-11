class Child {
  final String id;
  final String name;
  final DateTime birthDate;
  final double? weight; // em kg
  final double? height; // em cm
  final String? allergies;
  final String? bloodType;
  final String? emergencyContact;
  final String? emergencyPhone;
  final String? photoUrl;

  Child({
    required this.id,
    required this.name,
    required this.birthDate,
    this.weight,
    this.height,
    this.allergies,
    this.bloodType,
    this.emergencyContact,
    this.emergencyPhone,
    this.photoUrl,
  });

  int get ageInMonths {
    final now = DateTime.now();
    final months =
        (now.year - birthDate.year) * 12 + now.month - birthDate.month;
    return months;
  }

  String get ageString {
    final months = ageInMonths;
    if (months < 12) {
      return '$months ${months == 1 ? 'mês' : 'meses'}';
    } else {
      final years = months ~/ 12;
      final remainingMonths = months % 12;
      if (remainingMonths == 0) {
        return '$years ${years == 1 ? 'ano' : 'anos'}';
      } else {
        return '$years ${years == 1 ? 'ano' : 'anos'} e $remainingMonths ${remainingMonths == 1 ? 'mês' : 'meses'}';
      }
    }
  }

  Child copyWith({
    String? id,
    String? name,
    DateTime? birthDate,
    double? weight,
    double? height,
    String? allergies,
    String? bloodType,
    String? emergencyContact,
    String? emergencyPhone,
    String? photoUrl,
  }) {
    return Child(
      id: id ?? this.id,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      allergies: allergies ?? this.allergies,
      bloodType: bloodType ?? this.bloodType,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      emergencyPhone: emergencyPhone ?? this.emergencyPhone,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birthDate': birthDate.toIso8601String(),
      'weight': weight,
      'height': height,
      'allergies': allergies,
      'bloodType': bloodType,
      'emergencyContact': emergencyContact,
      'emergencyPhone': emergencyPhone,
      'photoUrl': photoUrl,
    };
  }

  factory Child.fromMap(Map<String, dynamic> map) {
    return Child(
      id: map['id'],
      name: map['name'],
      birthDate: DateTime.parse(map['birthDate']),
      weight: map['weight']?.toDouble(),
      height: map['height']?.toDouble(),
      allergies: map['allergies'],
      bloodType: map['bloodType'],
      emergencyContact: map['emergencyContact'],
      emergencyPhone: map['emergencyPhone'],
      photoUrl: map['photoUrl'],
    );
  }
}

import 'child.dart';

class Caregiver {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? photoUrl;
  final List<Child> children;
  final String relationship; // 'mãe', 'pai', 'cuidador', 'avó', 'avô', etc.

  Caregiver({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.photoUrl,
    required this.children,
    required this.relationship,
  });

  Caregiver copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? photoUrl,
    List<Child>? children,
    String? relationship,
  }) {
    return Caregiver(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      children: children ?? this.children,
      relationship: relationship ?? this.relationship,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'photoUrl': photoUrl,
      'children': children.map((child) => child.toMap()).toList(),
      'relationship': relationship,
    };
  }

  factory Caregiver.fromMap(Map<String, dynamic> map) {
    return Caregiver(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      photoUrl: map['photoUrl'],
      children: List<Child>.from(
        (map['children'] as List).map((childMap) => Child.fromMap(childMap)),
      ),
      relationship: map['relationship'],
    );
  }
}

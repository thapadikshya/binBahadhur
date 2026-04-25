import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ComplainModel {
  final String email;
  final String description;
  final String employee;
  final String? id;
  final String? userId;
  ComplainModel({
    required this.email,
    required this.description,
    required this.employee,
    this.id,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'description': description,
      'employee': employee,
      'id': id,
      'userId': userId,
    };
  }

  factory ComplainModel.fromMap(Map<String, dynamic> map) {
    return ComplainModel(
      email: map['email'] as String,
      description: map['description'] as String,
      employee: map['employee'] as String,
      id: map['_id'] != null ? map['_id'] as String : '',
      userId: map['userId'] != null ? map['userId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComplainModel.fromJson(String source) =>
      ComplainModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

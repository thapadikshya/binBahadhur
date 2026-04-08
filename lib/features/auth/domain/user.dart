// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;
  final String name;
  final String token;
  final String type;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.type,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      // MongoDB uses '_id', not 'id'. We check both just in case.
      id: (map['_id'] ?? map['id'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      type: (map['type'] ?? '') as String,
      token: (map['token'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

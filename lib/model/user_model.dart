import 'dart:convert';
import 'package:http/http.dart' as http;

class LandInspectorModel {
  final String baseUrl = 'http://localhost/block_backend/public'; // Replace with your API base URL

  Future<List<LandInspector>> getListOfLandInspectors() async {
    final response = await http.get(Uri.parse('$baseUrl/inspectors'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((json) => LandInspector.fromJson(json)).toList();
    } else {
      throw Exception('Failed to retrieve list of LandInspectors. Status code: ${response.statusCode}');
    }
  }
}

class LandInspector {
  final String fullname;
  final int age;
  final String email;
  final String password;
  final String id;
  final String phone;
  final String address;

  LandInspector({
    required this.fullname,
    required this.age,
    required this.email,
    required this.password,
    required this.id,
    required this.phone,
    required this.address,
  });

  factory LandInspector.fromJson(Map<String, dynamic> json) {
    return LandInspector(
      fullname: json['fullname'] as String,
      age: json['age'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      id: json['id'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
    );
  }
}
class User {
  final String fullName;
  final String address;
  final int age;
  final BigInt id;
  final String email;
  final String password;

  User({
    required this.fullName,
    required this.address,
    required this.age,
    required this.id,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'],
      address: json['address'],
      age: json['age'],
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}
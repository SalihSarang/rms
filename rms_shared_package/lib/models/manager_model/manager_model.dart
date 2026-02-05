class ManagerModel {
  final String name;
  final String email;
  final String password;

  ManagerModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory ManagerModel.fromJson(Map<String, dynamic> json) {
    return ManagerModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }
}

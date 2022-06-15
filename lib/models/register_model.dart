class Register {
  Register({
    required this.name,
    required this.email,
    required this.phone,
    this.registry,
    required this.password,
  });

  String? name;
  String? email;
  String? phone;
  String? registry;
  String? password;

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "registry": registry,
        "password": password,
      };
}

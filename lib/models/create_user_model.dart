class CreateUser {
  CreateUser({
    this.name,
    this.email,
    this.phone,
    this.registry,
    this.password,
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

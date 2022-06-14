class User {
  User({
    this.formattedPhone,
    this.haveCertificate,
    this.imageUrl,
    this.id,
    this.email,
    this.nickname,
    this.name,
    this.registry,
    this.ddd,
    this.number,
    this.lastNotificationRead,
    this.isManager,
    this.isSpecialist,
    this.isAdmin,
    this.isActive,
    this.imageId,
    this.documentId,
    this.passwordCertificate,
    this.createdAt,
    this.contractManagers,
    this.contractUsers,
    this.notifications,
  });

  dynamic formattedPhone;
  bool? haveCertificate;
  String? imageUrl;
  String? id;
  String? email;
  String? nickname;
  String? name;
  String? registry;
  dynamic ddd;
  dynamic number;
  dynamic lastNotificationRead;
  bool? isManager;
  bool? isSpecialist;
  bool? isAdmin;
  bool? isActive;
  dynamic imageId;
  dynamic documentId;
  dynamic passwordCertificate;
  DateTime? createdAt;
  List<dynamic>? contractManagers;
  List<dynamic>? contractUsers;
  List<dynamic>? notifications;

  factory User.fromJson(Map<String, dynamic> json) => User(
        formattedPhone: json["formattedPhone"],
        haveCertificate: json["haveCertificate"],
        imageUrl: json["imageURL"],
        id: json["id"],
        email: json["email"],
        nickname: json["nickname"],
        name: json["name"],
        registry: json["registry"],
        ddd: json["ddd"],
        number: json["number"],
        lastNotificationRead: json["lastNotificationRead"],
        isManager: json["isManager"],
        isSpecialist: json["isSpecialist"],
        isAdmin: json["isAdmin"],
        isActive: json["isActive"],
        imageId: json["ImageId"],
        documentId: json["DocumentId"],
        passwordCertificate: json["passwordCertificate"],
        createdAt: DateTime.parse(json["createdAt"]),
        contractManagers:
            List<dynamic>.from(json["ContractManagers"].map((x) => x)),
        contractUsers: List<dynamic>.from(json["ContractUsers"].map((x) => x)),
        notifications: List<dynamic>.from(json["notifications"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "formattedPhone": formattedPhone,
        "haveCertificate": haveCertificate,
        "imageURL": imageUrl,
        "id": id,
        "email": email,
        "nickname": nickname,
        "name": name,
        "registry": registry,
        "ddd": ddd,
        "number": number,
        "lastNotificationRead": lastNotificationRead,
        "isManager": isManager,
        "isSpecialist": isSpecialist,
        "isAdmin": isAdmin,
        "isActive": isActive,
        "ImageId": imageId,
        "DocumentId": documentId,
        "passwordCertificate": passwordCertificate,
        "createdAt": createdAt?.toIso8601String(),
        "ContractManagers":
            List<dynamic>.from(contractManagers?.map((x) => x) ?? []),
        "ContractUsers": List<dynamic>.from(contractUsers?.map((x) => x) ?? []),
        "notifications": List<dynamic>.from(notifications?.map((x) => x) ?? []),
      };
}

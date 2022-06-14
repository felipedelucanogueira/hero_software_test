class Diagnostic {
  Diagnostic({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.procedure,
  });

  String? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? procedure;

  factory Diagnostic.fromJson(Map<String, dynamic> json) => Diagnostic(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        procedure: json["procedure"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "procedure": procedure,
      };
}

class Param {
  Param({
    this.formattedPhone,
    this.whatsappPhone,
    this.id,
    this.strQrCodeWhatsapp,
    this.authWhatsapp,
    this.batteryLevel,
    this.ignoreHolidays,
    this.hourStart,
    this.hourEnd,
    this.ddd,
    this.number,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? formattedPhone;
  String? whatsappPhone;
  String? id;
  String? strQrCodeWhatsapp;
  dynamic authWhatsapp;
  dynamic batteryLevel;
  bool? ignoreHolidays;
  String? hourStart;
  String? hourEnd;
  String? ddd;
  String? number;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Param.fromJson(Map<String, dynamic> json) => Param(
        formattedPhone: json["formattedPhone"],
        whatsappPhone: json["whatsappPhone"],
        id: json["id"],
        strQrCodeWhatsapp: json["strQRCodeWhatsapp"],
        authWhatsapp: json["authWhatsapp"],
        batteryLevel: json["batteryLevel"],
        ignoreHolidays: json["ignoreHolidays"],
        hourStart: json["hourStart"],
        hourEnd: json["hourEnd"],
        ddd: json["ddd"],
        number: json["number"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "formattedPhone": formattedPhone,
        "whatsappPhone": whatsappPhone,
        "id": id,
        "strQRCodeWhatsapp": strQrCodeWhatsapp,
        "authWhatsapp": authWhatsapp,
        "batteryLevel": batteryLevel,
        "ignoreHolidays": ignoreHolidays,
        "hourStart": hourStart,
        "hourEnd": hourEnd,
        "ddd": ddd,
        "number": number,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

import 'diagnostic_model.dart';
import 'params_model.dart';
import 'user_model.dart';

class Profile {
  Profile({
    this.user,
    this.exams,
    this.treatments,
    this.diagnostics,
    this.param,
    this.token,
  });

  User? user;
  List<Diagnostic>? exams;
  List<Diagnostic>? treatments;
  List<Diagnostic>? diagnostics;
  Param? param;
  String? token;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        user: User.fromJson(json["user"]),
        exams: List<Diagnostic>.from(
            json["exams"].map((x) => Diagnostic.fromJson(x))),
        treatments: List<Diagnostic>.from(
            json["treatments"].map((x) => Diagnostic.fromJson(x))),
        diagnostics: List<Diagnostic>.from(
            json["diagnostics"].map((x) => Diagnostic.fromJson(x))),
        param: Param.fromJson(json["param"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "exams": List<dynamic>.from(exams?.map((x) => x.toJson()) ?? []),
        "treatments":
            List<dynamic>.from(treatments?.map((x) => x.toJson()) ?? []),
        "diagnostics":
            List<dynamic>.from(diagnostics?.map((x) => x.toJson()) ?? []),
        "param": param?.toJson(),
        "token": token,
      };
}

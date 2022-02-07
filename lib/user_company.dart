import 'employment.dart';
import 'geolocation.dart';

class UserCompany {
  final String? name;
  final String? url;
  final String? companyDescription;
  final Employment? employment;
  final Geolocation? geolocation;

  UserCompany(
      {required this.name,
      required this.url,
      required this.companyDescription,
      required this.employment,
      required this.geolocation});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "url": url,
      "companyDescription": companyDescription,
      "employment": employment?.toJson(),
      "geolocation": geolocation?.toJson()
    };
  }
}

class Geolocation {
  final String city;
  final String country;

  Geolocation({required this.city,required this.country});

  Map<String, dynamic> toJson() {
    return {"city": city, "country": country};
  }
}

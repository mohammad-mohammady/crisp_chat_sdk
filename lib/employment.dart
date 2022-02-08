class Employment {
  final String title;
  final String role;

  Employment({required this.title, required this.role});

  Map<String, dynamic> toJson() {
    return {"title": title, "role": role};
  }
}

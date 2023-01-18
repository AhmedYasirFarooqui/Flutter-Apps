class User {
  final String? name;
  final String? city;
  final String? country;
  final String? salary;
  final int? sno;

  const User({
    this.name,
    this.city,
    this.country,
    this.salary,
    this.sno,
  });

  User copy(
    String? name,
    String? city,
    String? country,
    String? salary,
    int? sno,
  ) =>
      User(
        name: name ?? this.name,
        city: city ?? this.city,
        country: country ?? this.country,
        salary: salary ?? this.salary,
        sno: sno ?? this.sno,
      );
}

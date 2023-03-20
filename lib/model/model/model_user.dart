class AppUser {
  final String name;
  final String email;
  final String mobile;
  final String image;
  final String userType;
  const AppUser({
    required this.name,
    required this.email,
    required this.mobile,
    required this.image,
    required this.userType,
  });

  AppUser copy({
    String? name,
    String? email,
    String? mobile,
    String? image,
  }) =>
      AppUser(
        name: name ?? this.name,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        image: image ?? this.image,
        userType: userType ?? this.userType,
      );

  static AppUser fromJson(Map<String, dynamic> json) => AppUser(
    name: json['name'],
    email: json['email'],
    mobile: json['mobile'],
    image: json['image'],
    userType: json['userType'],

  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'mobile': mobile,
    'image': image,
    'userType': userType,
  };
}
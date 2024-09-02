class UserEntity {
  final String name;
  final String email;
  final String phone;
  final DateTime? birthday;

  UserEntity({
    required this.name,
    required this.email,
    required this.phone,
    this.birthday,
  });
}

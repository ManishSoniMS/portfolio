class UserDTO {
  const UserDTO({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  @override
  String toString() => 'UserDTO{ name: $name, email: $email,}';
}

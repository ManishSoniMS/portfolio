class QueryDTO {
  const QueryDTO({
    required this.title,
    required this.message,
    required this.email,
    required this.name,
    this.userId,
  });

  final String title;
  final String message;
  final String email;
  final String name;
  final String? userId;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
      'email': email,
      'name': name,
      'user_id': userId,
    };
  }

  QueryDTO copyWith({
    String? title,
    String? message,
    String? email,
    String? name,
    String? userId,
  }) {
    return QueryDTO(
      title: title ?? this.title,
      message: message ?? this.message,
      email: email ?? this.email,
      name: name ?? this.name,
      userId: userId ?? this.userId,
    );
  }

  @override
  String toString() => 'QueryDTO{ title: $title, '
      'message: $message, email: $email, userId: $userId,}';
}

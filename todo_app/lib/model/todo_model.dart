// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String message;
  final DateTime createdAt;
  Todo({
    required this.message,
    required this.createdAt,
  });

  @override
  String toString() => 'Todo( message: $message, createdAt: $createdAt)';
}

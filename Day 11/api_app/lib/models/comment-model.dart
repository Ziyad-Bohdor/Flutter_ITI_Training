class CommentModel {
  final int id;
  final String name;
  final String email;
  final String body;

  CommentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
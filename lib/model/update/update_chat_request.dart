class UpdateChatRequest {
  final String id;
  final String userName;
  final String text;

  UpdateChatRequest(this.id, this.userName, this.text);

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_name": userName,
    "text": text,
  };
}
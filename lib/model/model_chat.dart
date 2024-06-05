import 'dart:convert';

class ModelChat {
  String name;
  String image;
  String message;
  num unread_message_count;
  String date;
  ModelChat({
    required this.name,
    required this.image,
    required this.message,
    required this.unread_message_count,
    required this.date,
  });

  ModelChat copyWith({
    String? name,
    String? image,
    String? message,
    num? unread_message_count,
    String? date,
  }) {
    return ModelChat(
      name: name ?? this.name,
      image: image ?? this.image,
      message: message ?? this.message,
      unread_message_count: unread_message_count ?? this.unread_message_count,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'message': message});
    result.addAll({'unread_message_count': unread_message_count});
    result.addAll({'date': date});

    return result;
  }

  factory ModelChat.fromMap(Map<String, dynamic> map) {
    return ModelChat(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      message: map['message'] ?? '',
      unread_message_count: map['unread_message_count'] ?? 0,
      date: map['date'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelChat.fromJson(String source) =>
      ModelChat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelChat(name: $name, image: $image, message: $message, unread_message_count: $unread_message_count, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelChat &&
        other.name == name &&
        other.image == image &&
        other.message == message &&
        other.unread_message_count == unread_message_count &&
        other.date == date;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        message.hashCode ^
        unread_message_count.hashCode ^
        date.hashCode;
  }
}

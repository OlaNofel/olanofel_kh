import 'dart:convert';

class ModelChat {
  String name;
  String image;
  String message;
  num unread_message_coun;
  num date;
  ModelChat({
    required this.name,
    required this.image,
    required this.message,
    required this.unread_message_coun,
    required this.date,
  });

  ModelChat copyWith({
    String? name,
    String? image,
    String? message,
    num? unread_message_coun,
    num? date,
  }) {
    return ModelChat(
      name: name ?? this.name,
      image: image ?? this.image,
      message: message ?? this.message,
      unread_message_coun: unread_message_coun ?? this.unread_message_coun,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'message': message});
    result.addAll({'unread_message_coun': unread_message_coun});
    result.addAll({'date': date});

    return result;
  }

  factory ModelChat.fromMap(Map<String, dynamic> map) {
    return ModelChat(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      message: map['message'] ?? '',
      unread_message_coun: map['unread_message_coun'] ?? 0,
      date: map['date'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelChat.fromJson(String source) =>
      ModelChat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelChat(name: $name, image: $image, message: $message, unread_message_coun: $unread_message_coun, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelChat &&
        other.name == name &&
        other.image == image &&
        other.message == message &&
        other.unread_message_coun == unread_message_coun &&
        other.date == date;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        message.hashCode ^
        unread_message_coun.hashCode ^
        date.hashCode;
  }
}

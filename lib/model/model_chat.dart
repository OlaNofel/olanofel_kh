import 'dart:convert';

class ModelChat {
  String name;
  String image;
  String message;
  num message_count;
  num date;
  ModelChat({
    required this.name,
    required this.image,
    required this.message,
    required this.message_count,
    required this.date,
  });

  ModelChat copyWith({
    String? name,
    String? image,
    String? message,
    num? message_count,
    num? date,
  }) {
    return ModelChat(
      name: name ?? this.name,
      image: image ?? this.image,
      message: message ?? this.message,
      message_count: message_count ?? this.message_count,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'message': message});
    result.addAll({'message_count': message_count});
    result.addAll({'date': date});

    return result;
  }

  factory ModelChat.fromMap(Map<String, dynamic> map) {
    return ModelChat(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      message: map['message'] ?? '',
      message_count: map['message_count'] ?? 0,
      date: map['date'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelChat.fromJson(String source) =>
      ModelChat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelChat(name: $name, image: $image, message: $message, message_count: $message_count, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelChat &&
        other.name == name &&
        other.image == image &&
        other.message == message &&
        other.message_count == message_count &&
        other.date == date;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        message.hashCode ^
        message_count.hashCode ^
        date.hashCode;
  }
}

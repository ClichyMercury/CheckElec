import 'dart:convert';

class User {
    final String firstName;
    final String lastName;
    final String email;
    final String id;
    final DateTime updatedAt;
    final DateTime createdAt;

    User({
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.id,
        required this.updatedAt,
        required this.createdAt,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
    };
}

class User {
  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        email = json["email"] as String,
        firstName = json["first_name"] as String,
        lastName = json["last_name"] as String,
        avatar = json["avatar"] as String;

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };

  User copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        avatar: avatar ?? this.avatar,
      );

  @override
  String toString() => "User{id: $id, email: $email, firstName: $firstName, "
      "lastName: $lastName, avatar: $avatar}";
}

class User {
  final int? id;
  final String name;
  final String email;
  final String password;

  User({this.id, required this.name, required this.email, required this.password});

  User clone({int? id, String? name, String? email, String? password}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.name: name,
        UserFields.email: email,
        UserFields.password: password,
      };

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int,
        name: json[UserFields.name] as String,
        email: json[UserFields.email] as String,
        password: json[UserFields.password] as String,
      );
}

class UserFields {
  static const all = [id, name, email, password];

  static const id = 'id';
  static const name = 'name';
  static const email = 'email';
  static const password = 'password';
}

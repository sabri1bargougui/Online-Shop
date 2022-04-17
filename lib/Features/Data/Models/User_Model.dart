class UserModel {
  final String? uid;
  final String? name;
  final String? lastname;
  final String? email;
  final String? avatarurl;
  final int? phonenumber;
  final String? createdAT;

  const UserModel({
    this.uid,
    this.name,
    this.lastname,
    this.email,
    this.avatarurl,
    this.phonenumber,
    this.createdAT,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? lastname,
    String? email,
    String? avatarurl,
    int? phonenumber,
    String? createdAt,
  }) =>
      UserModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        avatarurl: avatarurl ?? this.avatarurl,
        phonenumber: phonenumber ?? this.phonenumber,
        createdAT: createdAt ?? this.createdAT,
      );

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        lastname: json['lastname'],
        email: json['email'],
        avatarurl: json['avatarurl'],
        phonenumber: json['phonenumber'],
        createdAT: json['createdAT'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'lastname': lastname,
        'email': email,
        'avatarurl': avatarurl,
        'phonenumber': phonenumber,
        'createdAT': createdAT,
      };
}

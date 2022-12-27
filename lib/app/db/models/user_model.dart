class UserModel {
  String? name;
  String? id;
  String? phone_number;

  UserModel({this.name, this.id, this.phone_number});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phone_number: json['phone_number'],
    );
  }
  Map<String, dynamic> get toJosn =>
      <String, dynamic>{'id': id, 'name': name, 'phone_number': phone_number};

  UserModel copyWith({
    String? name,
    String? id,
    String? phone_number,
  }) =>
      UserModel(
          id: id ?? this.id,
          name: name ?? this.name,
          phone_number: phone_number ?? this.phone_number);
}

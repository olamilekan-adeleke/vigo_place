class LoginUserDataModel {
  LoginUserDataModel({
    required this.token,
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
    required this.status,
    required this.isVerified,
    required this.dateOfBirth,
    required this.photo,
    required this.coverPhoto,
    required this.gender,
    required this.address,
    required this.lastLogin,
    required this.createdAt,
    required this.placeId,
    required this.email,
  });

  final String token;
  final int id;
  final String name;
  final String username;
  final dynamic bio;
  final String status;
  final int isVerified;
  final DateTime dateOfBirth;
  final dynamic photo;
  final dynamic coverPhoto;
  final String gender;
  final dynamic address;
  final DateTime lastLogin;
  final DateTime createdAt;
  final int placeId;
  final String email;

  factory LoginUserDataModel.fromMap(Map<String, dynamic> json) {
    return LoginUserDataModel(
      token: json["token"],
      id: json["id"],
      name: json["name"],
      username: json["username"],
      bio: json["bio"],
      status: json["status"],
      isVerified: json["isVerified"],
      dateOfBirth: DateTime.parse(json["dateofbirth"]),
      photo: json["photo"],
      coverPhoto: json["coverphoto"],
      gender: json["gender"],
      address: json["address"],
      lastLogin: DateTime.parse(json["lastlogin"]),
      createdAt: DateTime.parse(json["createdat"]),
      placeId: json["placeId"],
      email: json["email"],
    );
  }
}

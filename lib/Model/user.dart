class UserModel {
  String? image;
  String? uId;
  String? name;
  String? phone;
  String? email;
  String? about;
  String? cover;

  UserModel.empty();
  UserModel({
    required this.image,
    required this.uId,
    required this.name,
    required this.phone,
    required this.email,
    required this.about,
    required this.cover,
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      print('null');
    } else {
      uId = json['uId'];
      name = json['name'];
      email = json['email'];
      phone = json['phone'];
      about = json['about'];
      cover = json['cover'];
      image = json['image'];
    }
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'about': about,
      'image': image,
      'cover': cover
    };
  }
}

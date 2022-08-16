import 'dart:io';

class UserModel {
  String? uid;
  String? email;
  String? name;
  String? about;
  File? image;

  UserModel({this.uid, this.email, this.name, this.about, this.image});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        name: map['name'],
        image: map['image']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'image': image,
    };
  }
}

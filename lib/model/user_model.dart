import 'dart:io';

class UserModel {
  String? uid;
  String? email;
  String? name;
  String? location;
  String? telefone;
  String? about;
  File? image;

  UserModel(
      {this.uid,
      this.email,
      this.name,
      this.location,
      this.telefone,
      this.about,
      this.image});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        name: map['name'],
        location: map['location'],
        telefone: map['telefone'],
        image: map['image']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'location': location,
      'telefone': telefone,
      'image': image,
    };
  }
}

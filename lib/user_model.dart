import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<UserModel>> fetchUser() async {
  try {
    http.Response response = await http.get('http://10.255.55.26:5000/');
    var responseJson = json.decode(response.body);
    return responseJson['users'].map<UserModel>((json) => UserModel.fromJson(json)).toList();
  } catch (e) {
    print("error fetchuser : $e");
    return null;
  }
}

class UserModel {
  String idUser;
  String nameUser;
  int age;
  String address;

  UserModel({
    this.idUser,
    this.nameUser,
    this.age,
    this.address
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
    idUser: json['id_user'] == null ? null : json['id_user'],
    nameUser: json['name_user'] == null ? null : json['name_user'],
    age: json['age'] == null ? null : json['age'],
    address: json['address'] == null ? null : json['address'],
  );

  Map<String, dynamic> toJson() => {
    "id_user" : idUser == null ? null : idUser,
    "name_user" : nameUser == null ? null : nameUser,
    "age" : age == null ? null : age,
    "address" : address == null ? null : address
  };
}
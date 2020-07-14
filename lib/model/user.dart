// import 'dart:convert';
// import 'package:json_annotation/json_annotation.dart';
// // import 'package:flutter/material.dart';

// part '../user.g.dart';

// @JsonSerializable()
// class User {
//   User(this.name, this.email);

//   String name;
//   String email;
//   //不同的类使用不同的mixin即可
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }

// // void main() {
// //   String json = '{"name":"Jack", "age": 14}';

// //   var userMap = jsonDecode(json);
// //   var user = new User.fromJson(userMap);
// //   print('Howdy, ${user.name}!');
// //   print('We sent the verification link to ${user.age}.');
// // }
// // Map userMap = json.decode(json);
// // var user = new User.fromJson(userMap);

// // print('Howdy, ${user.name}!');
// // print('We sent the verification link to ${user.email}.');

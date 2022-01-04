// To parse this JSON data, do
//
//     final contactList = contactListFromJson(jsonString);

import 'dart:convert';

ContactList contactListFromJson(String str) =>
    ContactList.fromJson(json.decode(str));

String contactListToJson(ContactList data) => json.encode(data.toJson());

class ContactList {
  ContactList({
    required this.name,
    required this.phone,
    required this.email,
    required this.country,
    required this.region,
    required this.photo,
  });

  String name;
  String phone;
  String email;
  String country;
  String region;
  String photo;

  factory ContactList.fromJson(Map<String, dynamic> json) => ContactList(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        country: json["country"],
        region: json["region"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "country": country,
        "region": region,
        "photo": photo,
      };
}

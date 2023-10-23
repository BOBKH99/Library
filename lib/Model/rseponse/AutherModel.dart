// To parse this JSON data, do
//
//     final autherRequest = autherRequestFromJson(jsonString);

import 'dart:convert';

AutherModel autherRequestFromJson(String str) => AutherModel.fromJson(json.decode(str));

String autherRequestToJson(AutherModel data) => json.encode(data.toJson());

class AutherModel {
  List<AuData>? data;

  AutherModel({
    this.data,
  });

  factory AutherModel.fromJson(Map<String, dynamic> json) => AutherModel(
    data: json["data"] == null ? [] : List<AuData>.from(json["data"]!.map((x) => AuData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AuData {
  int? id;
  Attributes? attributes;

  AuData({
    this.id,
    this.attributes,
  });

  factory AuData.fromJson(Map<String, dynamic> json) => AuData(
    id: json["id"],
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class Attributes {
  String? name;
  String? shortBiography;
  DateTime? createdAt;
  DateTime? updatedAt;

  Attributes({
    this.name,
    this.shortBiography,
    this.createdAt,
    this.updatedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    name: json["name"],
    shortBiography: json["short_biography"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "short_biography": shortBiography,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

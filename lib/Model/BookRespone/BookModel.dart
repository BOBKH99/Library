// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookResponse bookModelFromJson(String str) => BookResponse.fromJson(json.decode(str));

String bookModelToJson(BookResponse data) => json.encode(data.toJson());

class BookResponse {
  List<Datum> data;

  BookResponse({
    required this.data,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  Attributes attributes;

  Datum({
    required this.id,
    required this.attributes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  String code;
  String title;
  String description;
  int price;
  int starReview;
  dynamic originallyPublished;
  dynamic pdfLink;
  bool isEnabled;

  Attributes({
    required this.code,
    required this.title,
    required this.description,
    required this.price,
    required this.starReview,
    required this.originallyPublished,
    required this.pdfLink,
    required this.isEnabled,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    code: json["code"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    starReview: json["star_review"],
    originallyPublished: json["originally_published"],
    pdfLink: json["pdf_link"],
    isEnabled: json["isEnabled"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "title": title,
    "description": description,
    "price": price,
    "star_review": starReview,
    "originally_published": originallyPublished,
    "pdf_link": pdfLink,
    "isEnabled": isEnabled,
  };
}

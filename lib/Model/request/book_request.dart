// To parse this JSON data, do
//
//     final bookRequest = bookRequestFromJson(jsonString);

import 'dart:convert';

BookRequest bookRequestFromJson(String str) => BookRequest.fromJson(json.decode(str));

String bookRequestToJson(BookRequest data) => json.encode(data.toJson());

class BookRequest {
  Datarequest? data;

  BookRequest({
    this.data,
  });

  factory BookRequest.fromJson(Map<String, dynamic> json) => BookRequest(
    data: json["data"] == null ? null : Datarequest.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Datarequest {
  String? code;
  String? title;
  String? description;
  int? price;
  int? starReview;
  DateTime? originallyPublished;
  String? ibAuthor;
  String? pdfLink;
  bool? isEnabled;
  String? thumbnail;

  Datarequest({
    this.code,
    this.title,
    this.description,
    this.price,
    this.starReview,
    this.originallyPublished,
    this.ibAuthor,
    this.pdfLink,
    this.isEnabled,
    this.thumbnail,
  });

  factory Datarequest.fromJson(Map<String, dynamic> json) => Datarequest(
    code: json["code"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    starReview: json["star_review"],
    originallyPublished: json["originally_published"] == null ? null : DateTime.parse(json["originally_published"]),
    ibAuthor: json["ib_author"],
    pdfLink: json["pdf_link"],
    isEnabled: json["isEnabled"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "title": title,
    "description": description,
    "price": price,
    "star_review": starReview,
    "originally_published": "${originallyPublished!.year.toString().padLeft(4, '0')}-${originallyPublished!.month.toString().padLeft(2, '0')}-${originallyPublished!.day.toString().padLeft(2, '0')}",
    "ib_author": ibAuthor,
    "pdf_link": pdfLink,
    "isEnabled": isEnabled,
    "thumbnail": thumbnail,
  };
}

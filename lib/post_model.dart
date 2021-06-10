// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'post_model.g.dart';

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId : 0)
class PostModel {
  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  @HiveField(0)
  int userId;

  @HiveField(1)
  int id;

  @HiveField(2)
  String title;

  @HiveField(3)
  String body;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
  };
}

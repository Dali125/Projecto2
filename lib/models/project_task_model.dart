// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.clientId,
    required this.description,
    required this.duration,
    required this.budget,
    required this.projectId,
  });

  String clientId;
  String description;
  String duration;
  int budget;
  String projectId;

  static Post fromJson(Map<String, dynamic> json) => Post(
    clientId: json["Client_id"],
    description: json["Description"],
    duration: json["Duration"],
    budget: json["Budget"],
    projectId: json["Project_id"],
  );

  Map<String, dynamic> toJson() => {
    "Client_id": clientId,
    "Description": description,
    "Duration": duration,
    "Budget": budget,
    "Project_id": projectId,
  };
}

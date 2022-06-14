//Packages
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Meme extends ChangeNotifier {
  Meme({
    required this.id,
    required this.name,
    required this.url,
    required this.width,
    required this.height,
    required this.boxCount,
  });

  final String id;
  final String name;
  final String url;
  final int width;
  final int height;
  final int boxCount;

  factory Meme.fromJson(String str) => Meme.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meme.fromMap(Map<String, dynamic> json) => Meme(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        boxCount: json["box_count"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "url": url,
        "width": width,
        "height": height,
        "box_count": boxCount,
      };
}

import 'dart:convert';

List<CatModel> CatModelFromJson(String str) =>
    List<CatModel>.from(json.decode(str).map((x) => CatModel.fromJson(x)));

String CatModelToJson(List<CatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatModel {
  String? id;
  String? url;
  int? width;
  int? height;

  CatModel({this.id, this.url, this.width, this.height});

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
    id: json["id"],
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "width": width,
    "height": height,
  };
}

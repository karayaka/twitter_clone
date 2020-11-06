import 'dart:convert';

class PostCreateModel{
  String PostTitle;
  String PostContent;
  String PostImageUrl;

  PostCreateModel({this.PostTitle, this.PostContent, this.PostImageUrl});

  //Jsondan Objeye Dönüş
  factory PostCreateModel.fromJson(String str)=>PostCreateModel.fromMap(json.decode(str));

  //Mapten Objeye Dönüş
  factory PostCreateModel.fromMap(Map<String,dynamic> map)=>PostCreateModel(
    PostTitle: map["PostTitle"],
    PostContent: map["PostContent"],
    PostImageUrl: map["PostImageUrl"],
  );

  String toJson()=>json.encode(toMap());

  Map<String, dynamic> toMap()=>{
    "PostTitle":PostTitle,
    "PostContent":PostContent,
    "PostImageUrl":PostImageUrl,
  };

}
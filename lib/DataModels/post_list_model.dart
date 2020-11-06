import 'dart:convert';

class PostListModel{
  int ID;
  String Title;
  String Context;
  String UserImage;
  String UserName;
  String UserSurName;
  String PostImage;
  int CommnetCount;
  int LikeCount;
  int DisLikeCount;

  PostListModel({this.ID, this.Title, this.Context, this.UserImage,
      this.UserName, this.UserSurName, this.PostImage, this.CommnetCount,
      this.LikeCount, this.DisLikeCount});

  factory PostListModel.fromJson(String str)=>PostListModel.fromMap(json.decode(str));

  factory PostListModel.fromMap(Map<String,dynamic> map)=>PostListModel(
    ID:map["ID"],
    Title: map["Title"],
    Context:map["Context"],
    UserImage: map["UserImage"],
    UserName: map["UserName"],
    UserSurName: map["UserSurName"],
    CommnetCount: map["CommnetCount"],
    DisLikeCount: map["DisLikeCount"],
    LikeCount: map["LikeCount"],
    PostImage: map["PostImage"],
  );

  String toJson()=>json.encode(toMap());

  Map<String, dynamic> toMap()=>{
    "ID":ID,
    "Title":Title,
    "Context":Context,
    "UserImage":UserImage,
    "UserName":UserName,
    "UserSurName":UserSurName,
    "CommnetCount":CommnetCount,
    "DisLikeCount":DisLikeCount,
    "LikeCount":LikeCount,
    "PostImage":PostImage
  };

}
import 'dart:convert';
class LoginDataModel{
  String UserName;
  String Password;
  LoginDataModel({this.UserName, this.Password});
  //jsonmdan onjeye çevriliyor!!
  factory LoginDataModel.fromJson(String str)=>LoginDataModel.fromMap(json.decode(str));

  //mapten objeye çevriliyor!!!
  factory LoginDataModel.fromMap(Map<String,dynamic> map)=>LoginDataModel(
    UserName:map["UserName"],
    Password:map["Password"]
  );

  //objeden json a çevriliyor!!!
  String toJson()=>json.encode(toMap());
  //objeden map e çevriliyor!!
  Map<String, dynamic> toMap()=>{
    "UserName":UserName,
    "Password":Password
  };

}
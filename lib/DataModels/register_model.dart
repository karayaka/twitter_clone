import 'dart:convert';

class RegisterModel{
  String UserName;
  String Password;
  String Name;
  String Surname;
  String Email;
  String ImagePath;
  String ImageName;

  RegisterModel({this.UserName, this.Password, this.Name, this.Surname, this.Email,this.ImagePath,this.ImageName});
  //jsondan objeye
  factory RegisterModel.fromJson(String str)=>RegisterModel.fromMap(json.decode(str));
  //Mapten Objeye
  factory RegisterModel.fromMap(Map<String,dynamic> map)=>RegisterModel(
    UserName:map["UserName"],
    Password:map["Password"],
    Name:map["Name"],
    Surname:map["Surname"],
    Email:map["Email"],
    ImagePath:map["ImagePath"],
    ImageName:map["ImageName"],
  );

  //objeden json a çevriliyor!!!
  String toJson()=>json.encode(toMap());
  //Mapten objeye çevriliyor!!
  Map<String, dynamic> toMap()=>{
    "UserName":UserName,
    "Password":Password,
    "Name":Name,
    "Surname":Surname,
    "Email":Email,
    "ImagePath":ImagePath,
    "ImageName":ImageName,
  };
}
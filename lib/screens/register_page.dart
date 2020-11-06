import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/DataModels/register_model.dart';
import 'package:twitter_clone/validations/form_validation.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File _image=null;
  var _registerKey=GlobalKey<FormState>();
  var registerModel=RegisterModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıt Formu"),
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context,orientation){
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: SingleChildScrollView(
                    child: Card(
                      child: Form(
                        key: _registerKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.purpleAccent, Colors.blueAccent]
                                  )
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 170.0,
                                child: buildCircleAvatar(),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            RaisedButton(
                              onPressed: (){
                                PickImage();
                              },
                              child: Text("Resim Yükle"),
                              color: Colors.blue,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              onChanged: (val){
                                registerModel.UserName=val;
                              },
                              validator: (val){
                                return FormValidation.UserNameValidation(val);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.account_circle),
                                hintText: "Kullanıcı Adı Giriniz",
                                labelText: "Kullanıcı Adı",
                              ),
                            ),

                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              onChanged: (val){
                                registerModel.Password=val;
                              },
                              validator: (val){
                                return FormValidation.PassworValidation(val);
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Şifre Giriniz",
                                labelText: "Şifre",
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              onChanged: (val){
                                registerModel.Name=val;
                              },
                              validator: (val){
                                return FormValidation.NameValidation(val);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.perm_identity_outlined),
                                hintText: "İsim Giriniz",
                                labelText: "İsim",
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              onChanged: (val){
                                registerModel.Surname=val;
                              },
                              validator: (val){
                                return FormValidation.SurnameValidation(val);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.perm_identity_outlined),
                                hintText: "Soyisim Giriniz",
                                labelText: "Soyisim",
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              onChanged: (val){
                                registerModel.Email=val;
                              },
                              validator: (val){
                                return FormValidation.EmailValidation(val);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email_outlined),
                                hintText: "Email Giriniz",
                                labelText: "Email",
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: (orientation==Orientation.portrait)?1:2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: RaisedButton(

                            onPressed: (){
                              if(_registerKey.currentState.validate()){
                                _registerKey.currentState.save();
                                debugPrint(registerModel.toJson());
                              }
                            },
                            child: Text("Kaydet"),
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            onPressed: (){
                              if(_registerKey.currentState.validate()){
                                _registerKey.currentState.save();
                                debugPrint(registerModel.toJson());
                              }
                            },
                            child: Text("İptal"),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }


      ),
    );

  }

  CircleAvatar buildCircleAvatar() {
    if(_image!=null){
      return CircleAvatar(
        backgroundImage: FileImage(_image),
        radius: 50.0,
      );
    }else{
      return CircleAvatar(
        child: Text("Resim Seç"),
        radius: 50.0,
      );
    }

  }

  Future<File> PickImage() async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);
    if(_image!=null){
      setState(() {
        registerModel.ImagePath=_image.path;
        //registerModel.ImageName=
        debugPrint(_image.path);
      });
    }
    //var file= await MultipartFile.fromFile("./text.txt",filename: "upload.txt"); http post işlemi için kod

  }
}





import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter_clone/DataModels/login_model.dart';
import 'package:twitter_clone/validations/form_validation.dart';


class SingInPage extends StatelessWidget {
  var _formKey=GlobalKey<FormState>();
  var LoginModel=LoginDataModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş"),
        elevation: 0,
      ),
      //backgroundColor: Colors.green.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Oturum Açın",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (val){
                    LoginModel.UserName=val;
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
                    LoginModel.Password=val;
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
                RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        debugPrint(LoginModel.toJson());
                        _formKey.currentState.save();
                      }
                    },
                  child: Text("Giriş"),
                  color: Colors.blue,
                ),
                RaisedButton(
                  onPressed: (){
                  },
                  child: Text("Kayıt Ol"),
                  color: Colors.redAccent,
                ),

              ],
            ),
          ),
        ),
      )
    );

  }
}

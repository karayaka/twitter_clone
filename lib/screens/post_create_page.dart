import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/DataModels/post_create_model.dart';
import 'package:twitter_clone/components/nav_draw_menu.dart';
import 'package:twitter_clone/validations/form_validation.dart';

class PostCreatePage extends StatefulWidget {
  @override
  _PostCreatePageState createState() => _PostCreatePageState();
}

class _PostCreatePageState extends State<PostCreatePage> {
  File _image=null;
  var _postCreateKey=GlobalKey<FormState>();
  var postCreateModel=PostCreateModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Oluştur"),
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
                      key: _postCreateKey,
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
                              child: Center(child: buildCircleAvatar()),
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
                              postCreateModel.PostTitle=val;
                            },
                            validator: (val){
                              return FormValidation.PostTitleValidation(val);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.title),
                              hintText: "Başlık Giriniz",
                              labelText: "Başlık",
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            maxLines: 8,
                            onChanged: (val){
                              postCreateModel.PostContent=val;
                            },
                            validator: (val){
                              return FormValidation.PostContetntValidation(val);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.content_paste),
                              hintText: "İçrek Giriniz",
                              labelText: "İçerik",
                            ),
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
                            if(_postCreateKey.currentState.validate()){
                              _postCreateKey.currentState.save();
                              debugPrint(postCreateModel.toJson());
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
                            //geri dönüş kodu
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
      ) ;
      }
      )
    );
  }

  Widget buildCircleAvatar() {
    if(_image!=null){
      return Image.file(_image);
    }else{
      return Text("Post Resmi Seçiniz");
    }

  }

  void PickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);
    if(_image!=null){
      setState(() {
        postCreateModel.PostImageUrl=_image.path;
        //registerModel.ImageName=
        debugPrint(_image.path);
      });
    }
    //var file= await MultipartFile.fromFile("./text.txt",filename: "upload.txt"); http post işlemi için kod

  }
}

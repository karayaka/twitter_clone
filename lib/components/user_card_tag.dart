import 'package:flutter/material.dart';

class UserPostTag extends StatelessWidget {
  String UserName;
  String UserSurName;
  String UserImage;
  UserPostTag({this.UserName, this.UserSurName, this.UserImage});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.all(2),child: GetUserImage()),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(UserName),
            Text(UserSurName),
          ],
        )

      ],
    );
  }

  Widget GetUserImage() {
    if(UserImage!=null&&UserImage!=""){
      return CircleAvatar(
        backgroundImage: NetworkImage(UserImage),
        child: Text("TW"),
      );
    }else{
      return CircleAvatar(
        child: Text("TW"),
      );
    }

  }



}

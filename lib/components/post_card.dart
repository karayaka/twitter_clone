import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/DataModels/post_list_model.dart';
import 'package:twitter_clone/components/user_card_tag.dart';

class PostCardWidget extends StatelessWidget {
  PostListModel post;
  PostCardWidget({this.post});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: InkWell(
        onTap: (){
          debugPrint(post.ID.toString());//Detay Yönlendirme
        },
        child: Card(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child:CreateCardTitle(post),
              ),
              Expanded(
                flex: 5,
                child: GetPosImage(post.PostImage),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.Title,style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(post.Context)
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child:  Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.auto_fix_high),
                            onPressed: (){
                              debugPrint("hop");
                            },
                          ),
                          Text(post.DisLikeCount.toString())
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.auto_fix_off),
                            onPressed: (){
                              debugPrint("hop");
                            },
                          ),
                          Text(post.DisLikeCount.toString())
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: (){
                              debugPrint("hop");
                            },
                          ),
                          Text(post.CommnetCount.toString()),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget CreateCardTitle(PostListModel post) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.start,
      children: [
        UserPostTag(UserImage: post.UserImage,UserName: post.UserName,UserSurName: post.UserSurName,)
      ],
    );    
  }

  Widget GetPosImage(String postImage) {
    if(postImage!=null&&postImage!=""){
      return Image.network(postImage);
    }else{
      return Text("");
    }

  }

}

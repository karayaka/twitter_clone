import 'package:flutter/material.dart';
import 'package:twitter_clone/TestData/PostData.dart';
import 'package:twitter_clone/components/nav_draw_menu.dart';
import 'package:twitter_clone/components/post_card.dart';

class PostListPage extends StatelessWidget {
  var posts = PostData.getDumyPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postlar"),
        elevation: 0,
      ),
      drawer: NavigationDrawer(),
      body: Container(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, i){
              return Padding(
                padding: EdgeInsets.all(5.0),
                child: PostCardWidget(post: posts[i]),
              );
            }
          )
      ),
    );
  }


}
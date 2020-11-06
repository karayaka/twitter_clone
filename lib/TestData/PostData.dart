import 'package:twitter_clone/DataModels/post_list_model.dart';

class PostData{

  static List<PostListModel> getDumyPost(){
    var postList=new List<PostListModel>();
    for(var i = 0 ; i <= 10; i++){
          var postModel=PostListModel(
            Title:"Başlık ${i}",
            Context: "İçerik birazdaha uzun olur tabi ${i}",
            PostImage:"https://scontent.fist4-1.fna.fbcdn.net/v/t31.0-8/10845834_885226024861144_7956604358714329985_o.jpg?_nc_cat=107&ccb=2&_nc_sid=e3f864&_nc_ohc=wPjPG7VujJUAX_p0T97&_nc_ht=scontent.fist4-1.fna&oh=59e3fade21e1eabf856a1195947a8ed1&oe=5FC78202",
            //PostImage:"",
            LikeCount: i+3,
            DisLikeCount: i,
            CommnetCount: i+2,
            UserSurName: "Karayaka",
            UserName: "Çağrı",
            UserImage: "",
            ID: i
          );
          postList.add(postModel);
    }
      return postList;
  }

}
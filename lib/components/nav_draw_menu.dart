import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text("Email@emailk.com"),
              accountName: Text("İsim"),
              arrowColor: Colors.white,

              currentAccountPicture: CircleAvatar(
                child: Text("Na"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  child: Text("İ"),
                )
              ],

            ),
            Expanded(
              flex: 12,
              child: SingleChildScrollView(
                child: Column(
                  //padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      title: Text("Home"),
                      onTap: (){

                      },
                      leading: Icon(Icons.home_outlined),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Postlarım"),
                      onTap: (){

                      },
                      leading: Icon(Icons.markunread_mailbox),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.supervised_user_circle_rounded),
                      title: Text("Takipçiler"),
                      onTap: (){

                      },
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.supervised_user_circle_rounded),
                      title: Text("Takip Etiklerim"),
                      onTap: (){

                      },
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(),



                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child:Center(
                child: GestureDetector(
                  excludeFromSemantics: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.power_settings_new_sharp),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Çıkış")
                    ],
                  ),
                  onTap: (){
                      //Çıkış İşlemleri Yapılacak!!
                  },
                )

              )
            )
          ],
        )
    );
  }
}
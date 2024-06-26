import 'package:clint_store/common_widget/make_button.dart';
import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';
import '../../client_Screens/creat_drawer_cl/creat_drawer.dart';
import '../../common_widget/make_appbar.dart';
import '../../services/shared_preference.dart';
import '../../utilities/text_style.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();


  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool enableUserName = false;
  bool enableEmail = false;
  bool enablePassword = false;
  bool enableConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CreatDrawerClient(),
      appBar: CreatAppBar(
        hasTitle: true,
        hasCart: true,
        hasBackButton: true,
        title: 'Profile Screen',
        onDrawerPressed: () {
          _key.currentState!.openDrawer();
        },
        hasDrawer: true,
      ),
      backgroundColor: Color(0xffF0F1F3),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundImage: AssetImage("assets/images/men.png"),
                      ),
                      Icon(
                        Icons.camera_alt,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${SharedPreference.getData(key: "userName")}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BlackTitle.display5(context)
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          "${SharedPreference.getData(key: "email")}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BlackTitle.display5(context)
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            creatDetails(
                controller: userName,
                obscureText: true,
                hintText: "${SharedPreference.getData(key: "userName")}",
                title: "name",
                subTitle: "Already have 10 orders",
                context: context,
                onTap: () {}),
            creatDetails(
                controller: email,
                hintText: "${SharedPreference.getData(key: "email")}",
                obscureText: true,
                title: "email",
                subTitle: "03 Address",
                context: context,
                onTap: () {}),
            creatDetails(
                controller: password,
                hintText: "123456",
                obscureText: false,
                title: "password",
                subTitle: "you have 3 cards",
                context: context,
                onTap: () {}),
            creatDetails(
                controller: confirmPassword,
                obscureText: true,
                title: "confirm password",
                hintText: "123456",
                subTitle: "Review for 5 items",
                context: context,
                onTap: () {}),
            Center(
              child: MakeButton(
                  topMargin: 30,
                  width: getSize(context: context).width * 0.5,
                  title: "حفظ",
                  onTap: () {
                    print("user name ${userName.text}");
                    print(" email ${email.text}");
                    print("password ${password.text}");
                    print("confirm password ${confirmPassword.text}");
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget creatDetails(
      {required String title,
      required String subTitle,
      required BuildContext context,
      required void Function() onTap,
      required TextEditingController controller,
      required bool obscureText,
      required String hintText}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BlackTitle.display5(context),
                  ),
                ),
                TextField(
                  obscureText: obscureText,
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    hintText: hintText,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.edit,
            color: Color(0xff242424),
            size: 18,
          )
        ],
      ),
    );
  }
}

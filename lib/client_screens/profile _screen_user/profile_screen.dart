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

  @override
  void initState() {
    userName.text = "${SharedPreference.getData(key: "userName")}";
    email.text = "${SharedPreference.getData(key: "userName")}";
    password.text = "123456";
    confirmPassword.text = "123456";
    super.initState();
  }

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
              obscureText: false,
              title: "name",
              context: context,
            ),
            creatDetails(
              controller: email,
              obscureText: false,
              title: "email",
              context: context,
            ),
            creatDetails(
              controller: password,
              obscureText: true,
              title: "password",
              context: context,
            ),
            creatDetails(
              controller: confirmPassword,
              obscureText: true,
              title: "confirm password",
              context: context,
            ),
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

  Widget creatDetails({
    required String title,
    required BuildContext context,
    required TextEditingController controller,
    required bool obscureText,
  }) {
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
                      // labelText: hintText,
                      // hintText: hintText,
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

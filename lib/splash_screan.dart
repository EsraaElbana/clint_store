import 'package:clint_store/services/shared_preference.dart';
import 'package:clint_store/utilities/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'client/home_screen_cl/home.dart';
import 'engineer/home_screen_en/home_screen_en.dart';
import 'interduce_pages/choose_login_or_register.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  // void initState() {
  //   Future.delayed(Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => ChooseLoginOrRegister()));
  //   });
  //   super.initState();
  // }
  //

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    Future.delayed(Duration(seconds: 3), () {
      print(
          "userId in  splash screen : ${SharedPreference.getData(key: "userId")}");

      if (SharedPreference.getData(key: "userId") == null) {
        SharedPreference.clear();
        RoutesManager.navigatorAndRemove(context, ChooseLoginOrRegister());
      } else {
        if (SharedPreference.getData(key: "userType") == "client") {
          RoutesManager.navigatorAndRemove(context, HomeScreenClient());
        } else {
          RoutesManager.navigatorAndRemove(context, HomeScreenEngineer());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070F2B),
      // color:  Color(0xFF0C134D),
      body: Container(
        child: Center(
            child: Image.asset(
          "assets/images/logo.png",
          height: double.infinity,
          width: double.infinity,
        )),
      ),
    );
  }
}

import 'package:clint_store/frist_pages/start%20page.dart';
import 'package:flutter/material.dart';


class splash_screan extends StatefulWidget {
  const splash_screan({Key? key}) : super(key: key);

  @override
  State<splash_screan> createState() => _splash_screanState();
}

class _splash_screanState extends State<splash_screan> {
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => start_page()));
    });
    super.initState();
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

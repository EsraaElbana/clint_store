import 'package:flutter/material.dart';

import '../signup_client/signup_client.dart';


class signAll extends StatefulWidget {
  const signAll({Key? key}) : super(key: key);

  @override
  State<signAll> createState() => _signAllState();
}

@override
class _signAllState extends State<signAll> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070F2B),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              //height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color:  Color(0xff070F2B),
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.scaleDown)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 5, 2, 2),
              width: double.infinity,
              //height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 28, 45, 10),
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signupClient()));
                        });
                      },
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color(0xff070F2B),),
                          borderRadius: BorderRadius.circular(20)),
                      textColor:  Color(0xff070F2B),
                      minWidth: double.infinity,
                      height: 55,
                      color: Colors.white70,
                      elevation: 0.5,
                      child: const Text(
                        "Clint",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 2.5, 45, 10),
                    child: MaterialButton(
                      onPressed: () {
                        // setState(() {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => SignUpEngineer()));
                        // });
                      },
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff070F2B),),
                          borderRadius: BorderRadius.circular(20)),
                      textColor: Color(0xff070F2B),
                      minWidth: double.infinity,
                      height: 55,
                      color: Colors.white70,
                      elevation: 0.5,
                      child: const Text("Engineer",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal)),
                    ),
                  ),

                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_client.dart';

class signupClient extends StatefulWidget {
  @override
  State<signupClient> createState() => _signupClientState();
}

class _signupClientState extends State<signupClient> {
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final repassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff070F2B),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              //height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff070F2B),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    //fit: BoxFit.scaleDown
                  )),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: double.infinity,

              //height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffc58a00),
                  // border: 3px solid rgba(210, 171, 69, 1)// Change border color here
                  width: 2, // Set border width
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),

              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (usernameController.text.isEmpty) {
                          return 'please enter Your Name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_sharp,
                            color:   Color(0xff070F2B), size: 25),
                        isDense: true,
                        hintText: "User Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color:  Color(0xFF181A4D),)),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (emailController.text.isEmpty) {
                          return 'please enter Your email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.email_outlined,
                            color:  Color(0xff070F2B), size: 25),
                        hintText: "e_mail",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (repassController.text.isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.lock_outline,
                            color:  Color(0xff070F2B), size: 25),
                        hintText: "password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: repassController,
                      validator: (value) {
                        if (repassController.text.isEmpty) {
                          return 'please confirm the password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_sharp,
                            color:  Color(0xff070F2B), size: 25),
                        isDense: true,
                        hintText: " confirm password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       decoration: BoxDecoration(),
                    //       child: null,
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 2.5, 55, 10),
                      child: MaterialButton(
                        onPressed: ()  {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginClient()));
                          });
                        },
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(color:  Color(0xff070F2B),),
                            borderRadius: BorderRadius.circular(40)),
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        height: 55,
                        color:  Color(0xff070F2B),
                        elevation: 0.5,
                        child: Text("Sign up",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("i have an account "),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return loginClient();
                            }));
                          },
                          child: const Center(
                              child: Text("sign in.",
                                  style: TextStyle(color:  Color(0xff070F2B),))),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

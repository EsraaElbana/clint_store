
import 'package:clint_store/client/sign_up_client/signup_client.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();

  final password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // final AuthCubitClient authCubit = BlocProvider.of<AuthCubitClient>(context);
    return Scaffold(
      backgroundColor:  Color(0xff070F2B),
      body: Column(
        children: [
          Expanded(
            child: Container(
              //height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color:  Color(0xff070F2B),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    // fit: BoxFit.scaleDown
                  )),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 5, 2, 0),
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(children: [
                    const Text(
                      "Log in ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (email.text.isNotEmpty) {
                          return null;
                        } else {
                          return "email must not be empty";
                        }
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.email_outlined,
                            color:  Color(0xff070F2B), size: 25),
                        hintText: "e_mail",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (password.text.isNotEmpty) {
                          return null;
                        } else {
                          return "password must not be empty";
                        }
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.lock_outline_sharp,
                            color:  Color(0xff070F2B), size: 25),
                        hintText: "password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 30, 50, 0.25),
                      child: MaterialButton(
                        onPressed: () {
                          // setState(() {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => Home2Screen()));
                          // });
                        },
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35)),
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        height: 55,
                        color:  Color(0xff070F2B),
                        elevation: 0.5,
                        child: const Text(
                          "Login ",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("i don't have an Account "),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return signupClient();
                            }));
                          },
                          child: const Center(
                              child: Text("sign up.",
                                  style: TextStyle(
                                    color:  Color(0xff070F2B),
                                  ))),
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


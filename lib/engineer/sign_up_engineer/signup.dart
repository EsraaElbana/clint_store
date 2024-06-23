import 'package:flutter/material.dart';
import 'dart:io';



import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:image_picker/image_picker.dart';

class SignUpEngineer extends StatefulWidget {
  SignUpEngineer({Key? key}) : super(key: key);

  @override
  State<SignUpEngineer> createState() => _SignUpEngineerState();
}

class _SignUpEngineerState extends State<SignUpEngineer> {
  final phoneController = TextEditingController();

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  final cityController = TextEditingController();

  File? img;

  Future<void> getImageFromGalleryLicencePic() async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic != null) {
      img = File(pic.path);
    }

    //emit(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070F2B),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              //height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff070F2B),
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
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
                            color: Color(0xff070F2B), size: 25),
                        isDense: true,
                        hintText: "User Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Color(0xff070F2B),
                            )),
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
                            color: Color(0xff070F2B), size: 25),
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
                      controller: phoneController,
                      validator: (value) {
                        if (phoneController.text.isEmpty) {
                          return 'please enter Your Phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.phone,
                            color: Color(0xff070F2B), size: 25),
                        hintText: "Phone number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Color(0xff070F2B),
                            width: 15.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: cityController,
                      validator: (value) {
                        if (cityController.text.isEmpty) {
                          return 'please enter Your City';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.location_on_outlined,
                            color: Color(0xff070F2B), size: 25),
                        hintText: "City",
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
                        if (confirmController.text.isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.lock_outline,
                            color: Color(0xff070F2B), size: 25),
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
                      controller: confirmController,
                      validator: (value) {
                        if (confirmController.text.isEmpty) {
                          return 'please confirm the password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_sharp,
                            color: Color(0xff070F2B), size: 25),
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
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  getImageFromGalleryLicencePic();
                                });
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Color(0xff070F2B),
                              )),
                        ),
                        Expanded(
                          flex: 5,
                          child: img != null
                              ? Image.file(
                                  img!,
                                  width: 200,
                                  height: 170,
                                  fit: BoxFit.fitWidth,
                                )
                              : Text("no image")
                          // Display the picked image
                          ,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: null,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 2.5, 55, 10),
                      child: MaterialButton(
                        onPressed: () async {
                          // if (formKey.currentState!.validate()) {
                          //   BlocProvider.of<AuthCubit>(context).postData(
                          //        userName:
                          //       usernameController.text,
                          //        email:
                          //       emailController.text,
                          //        phoneNumber:phoneController.text,
                          //       address:
                          //       cityController.text,
                          //        password:
                          //       passwordController.text,
                          //
                          //       img :
                          //       BlocProvider.of<AuthCubit>(context).img!);
                          // }
                        },
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff070F2B),
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        height: 55,
                        color: Color(0xff070F2B),
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
                              return SignUpEngineer();
                            }));
                          },
                          child: const Center(
                              child: Text("sign in.",
                                  style: TextStyle(
                                    color: Color(0xff070F2B),
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

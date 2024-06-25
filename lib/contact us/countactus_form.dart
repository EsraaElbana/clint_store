import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();

  final subjectController = TextEditingController();
  final messegeController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: Image.asset("assets/images/logo.png"),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Contact Us For Help",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  )),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        //isDense: true,
                        // prefixIcon: Icon(Icons.home_outlined,
                        //     color: Color(0xff070F2B), size: 25),
                        //hintText: "your address",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      controller: usernameController,
                      validator: (value) {
                        if (usernameController.text.isEmpty) {
                          return 'please enter Your Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (emailController.text.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      controller: subjectController,
                      validator: (value) {
                        if (subjectController.text.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Message',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      maxLines: 4,
                      controller: messegeController,
                      validator: (value) {
                        if (messegeController.text.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 2.5, 55, 10),
                      child: MaterialButton(
                        onPressed: () {
                          // setState(() {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => ()));
                          // });
                        },
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff070F2B),
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        height: 55,
                        color: Color(0xff070F2B),
                        elevation: 0.20,
                        child: Text("Send Message",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

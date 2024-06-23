
import 'package:clint_store/utilities/routes_manager.dart';
import 'package:clint_store/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common_widget/create_toast.dart';
import '../../cubit/application_state/register_states.dart';
import '../../cubit/cubits/register_cubit.dart';
import '../../login/login_Screen.dart';

class signupClient extends StatefulWidget {
  @override
  State<signupClient> createState() => _signupClientState();
}

class _signupClientState extends State<signupClient> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repassController = TextEditingController();

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
                     Text(
                      "Sign Up",
                      style:
                   BlackTitle.display5(context).copyWith(fontSize: 20)
                    ),
                    const SizedBox(
                      height: 17,
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
                      height: 14,
                    ),







                    BlocProvider(
                      create: (BuildContext context) {
                        return RegisterCubit();
                      },
                      child: BlocConsumer<RegisterCubit, RegisterStates>(
                        builder: (BuildContext context, state) {
                          RegisterCubit registerCubit = RegisterCubit.get(context);
                          return     Padding(
                            padding: const EdgeInsets.fromLTRB(55, 2.5, 55, 10),
                            child: MaterialButton(
                              onPressed: ()  {
                                // setState(() {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => LoginScreen()));
                                // });


                                print("usernameController : ${usernameController.text}") ;

                                print("emailController : ${emailController.text}") ;
                                print("passwordController : ${passwordController.text}") ;
                                print("repassController : ${repassController.text}") ;

                                if(passwordController.text!=repassController.text){
                                  CreatToast().showToast(errorMessage: "كلمه المرور غير متطابقه", context: context);
                                }
                                else{


                                }







                              },
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide(color:  Color(0xff070F2B),),
                                  borderRadius: BorderRadius.circular(40)),
                              textColor: Colors.white,
                              minWidth: double.infinity,
                              height: 50,
                              color:  Color(0xff070F2B),
                              elevation: 0.5,
                              child: Text("Sign up",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.normal)),
                            ),
                          );
                        },
                        listener: (BuildContext context, Object? state) {
                          if (state is RegisterDone) {
                            CreatToast().showToast(
                                // errorMessage: languageProvider!.getTexts("editDone"),
                                context: context, errorMessage: '');
                            RoutesManager.navigatorAndRemove(context, LoginScreen());
                          }

                          else if(state is ServerErrorRegister){
                            // CreatToast().showToast(errorMessage:languageProvider!.getTexts("text400") , context: context,duration:5);
                          }
                        },
                      ),
                    ),






















                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("i have an account "),
                        TextButton(
                          onPressed: () {

                            RoutesManager.navigatorAndRemove(context, LoginScreen());
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

import 'package:clint_store/cubit/application_state/engineer_states.dart';
import 'package:clint_store/cubit/cubits/engineer_cubit.dart';
import 'package:clint_store/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/create_toast.dart';
import '../../services/shared_preference.dart';

class HomeScreenEngineer extends StatefulWidget {
  const HomeScreenEngineer({super.key});

  @override
  State<HomeScreenEngineer> createState() => _HomeScreenEngineerState();
}

class _HomeScreenEngineerState extends State<HomeScreenEngineer> {
  @override
  void initState() {
    print("user address  : ${SharedPreference.getData(key: "userAddress")}");
    print("user phone  : ${SharedPreference.getData(key: "userNumber")}");
    print("user email  : ${SharedPreference.getData(key: "email")}");

    print("user Id : ${SharedPreference.getData(key: "userId")}");
    print("user token : ${SharedPreference.getData(key: "token")}");
    print("user Name  : ${SharedPreference.getData(key: "userName")}");

    print("user Type  : ${SharedPreference.getData(key: "userType")}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(),
        body: BlocConsumer<EngineerCubit, EngineerStates>(
          builder: (BuildContext context, state) {
            EngineerCubit engineerCubit = EngineerCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Center(child: Text("home screen Engineer",style: WhiteTitle.display5(context).copyWith(fontSize: 20),))],
            );
          },
          listener: (BuildContext context, Object? state) {
            if (state is ServerErrorEngineer) {
              CreatToast().showToast(
                  errorMessage: serverError, context: context, duration: 5);
            }
          },
        ));
  }
}






import 'dart:convert';
import 'dart:io';


import 'package:flutter_bloc/flutter_bloc.dart';
import '../application_state/login_states.dart';
import '../../services/shared_preference.dart';
import '../../app_manager/local_data.dart';

import 'package:dio/dio.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  Dio dio = Dio();





  Future<bool> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    Map<String, dynamic> params = {
      "username": username.trim(),
      "password": password.trim(),

    };
    // print(params);
    try {
      var response = await dio.post(baseUrl + "users/login", data: params);

      if (response.statusCode == 200) {
        // user = User.fromJson(response.data);
        // print("Success login");
        //
        //
        // SharedPreference.setData(key: "userId", value: user.id);
        // SharedPreference.setData(key: "token", value: user.token);
        // SharedPreference.setData(key: "firstname", value: "${user.fullName!.firstname}");
        // SharedPreference.setData(key: "middleName", value: "${user.fullName!.middleName}");
        // SharedPreference.setData(key: "lastname", value: "${user.fullName!.lastname}");
        // SharedPreference.setData(key: "surname", value: "${user.fullName!.surname}");
        // SharedPreference.setData(key: "userLogo", value: "${user.logo}");
        // SharedPreference.setData(key: "firebaseToken", value: "${user.firebaseToken}");
        //


        emit(LoginSuccess());
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorLogin());
      } else {
        emit(LoginError());
      }
      return false;
    }

    return false;
  }

////////////////////////////////////////////////////////////////////////////////
//   Future<bool> saveDataPreference() async {
//
//     SharedPreference.setData(key: "userToken", value: user.token!);
//     SharedPreference.setData(key: "userId",value:  user.id!);
//     SharedPreference.setData(key: "mobile", value: user.mobile!);
//     SharedPreference.setData(key: "fullName",value:  user.fullName!);
//     SharedPreference.setData(key: "countryId", value: user.country!);
//     SharedPreference.setData(key: "email",value:  user.email!);
//     SharedPreference.setData(key: "activationCode",value:  user.activationCode!);
//     SharedPreference.setData(key: "countryCode",value:  user.countryCode!);
//
//
//     return true;
//   }

////////////////////////////////////////////////////////////////////////////////
//   String? userId, fullName, email, userToken, countryID;
//   int? mobile;
//
//   Future<void> getDataPreference() async {
//     userToken = SharedPreference.getData(key: 'userToken');
//     userId = SharedPreference.getData(key: 'userId');
//     mobile = SharedPreference.getData(key: 'mobile');
//     fullName = SharedPreference.getData(key: 'fullName');
//     countryID = SharedPreference.getData(key: 'countryId');
//     email = SharedPreference.getData(key: 'email');
//
//     var array = {
//       "userToken": userToken,
//       "userId": userId,
//       "mobile": mobile,
//       "email": email,
//       "full Name": fullName,
//       "countryID": countryID,
//     };
//
//     print("data is Coming and Id is $userId ");
//   }

///////////////////////////////////////////////////////////////////////////////
//   Future<void> clearDataPreference() async {
//     await SharedPreference.clear();
//     await SharedPreference.remove("userId");
//     userId = null;
//     print("Login id now after clear preference ${userId.toString()}");
//   }

///////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
//   List getAllCountries;
//   List countryNameAr, countryNameEN, countryIdList=[];
//   Future<bool> getCountries() async {
//   try {
//   var response = await dio.get(
//   baseUrl + "countries",
//   );
//   if (response.statusCode == 200) {
//   countryNameAr = (response.data as List)
//       .map((x) => CountriesModel.fromJson(x).nameAr)
//       .toList();
//
//   countryNameEN = (response.data as List)
//       .map((x) => CountriesModel.fromJson(x).nameEn)
//       .toList();
//
//   countryIdList = (response.data as List)
//       .map((x) => CountriesModel.fromJson(x).id)
//       .toList();
//
//   getAllCountries = response.data;
//
//   // print("alllllllll ccccccountries:$getAllCountries");
//   notifyListeners();
//   return (true);
//   }
//   } on DioError catch (error) {
//   print(error.toString());
//   }
//   return false;
//   }
}

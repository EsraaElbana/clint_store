


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_manager/local_data.dart';

import '../application_state/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Dio dio = Dio();
  int? confirmationCode;

  ////////////// اول حاجه بعمل  ريجيستر منهنا وبعدها بعمل ايديت علشان  ابعتله الاسم والباسورد والاب

  Future<bool> register(
      {required String mobile, required String countryCode}) async {
    emit(RegisterLoading());
    Map<String, dynamic> params = {
      "mobile": mobile.trim(),
      "countryCode": countryCode.trim(),

    };
     print("$params");
    try {
      var response = await dio.post(baseUrl + "users/register", data: params);
      if (response.statusCode == 200) {
        // confirmationCode = response.data["code"];
        // user = User.fromJson(response.data["userId"]);
        //
        // print("confirmation Code ${response.data["code"]}");
        // print("user id ${user!.id!}");
        // emit(RegisterSuccess());

        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorRegister());
      } else {
        emit(RegisterError());
      }
      return false;
    }

    return false;
  }

////////////////////////////////////////////////////////////////////////////////////////
//// edit user
//   Future<bool> completeUserDataToRegister(
//       {required String userId,
//       required String userName,
//
//
//       required String gender,
//       required String password,
//
//         required String userFireBaseToken
//
//       }) async {
//     Map<String, dynamic> params = {
//       // "fullname":  jsonEncode(fullname),
//       "password": password.trim(),
//       "username": userName.trim(),
//       // "fatherId": fatherId.trim(),
//       "gender": gender.trim(),
//     };
// // print(params);
//
//     emit(RegisterLoad());
//
//     try {
//       var response = await dio.put(
//         baseUrl + "users/$userId",
//         data: params,
//         options: Options(
//           method: 'PUT',
//           // headers: {
//           //   HttpHeaders.authorizationHeader: 'Bearer $userToken',
//           //   'content-Type': 'application/json'
//           // },
//             headers: {
//               "Content-Type": "application/json",
//               // "Authorization":
//               // "Bearer ${userToken}", ايمن قالي وقفها علشان مش عارف يرجعها في register response
//               "fbToken":"${userFireBaseToken}",
//               "admin":true /// علشان نوقف الفاير بيز توكن
//
//             }
//         ),
//       );
//       if (response.statusCode == 200) {
//         emit(RegisterDone());
//         return true;
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorRegister());
//       }
//       else if (error.response!.statusCode == 401) {
//         emit(RegisterLoginError2());
//       }
//       return false;
//     }
//     return false;
//   }

///////////////////////////////////////////////////////////////////////
}

// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:dio/dio.dart';

import '../application_state/engineer_states.dart';


class EngineerCubit extends Cubit<EngineerStates> {
  EngineerCubit() : super(InitialState());

  static EngineerCubit get(context) => BlocProvider.of(context);

  Dio dio = Dio();

/////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//   List<AllAlbums> allAlbums2 = [];
//   List<List<AllAlbums>> sortedAlbums2 = [];
//   List<AllAlbums> sortedAlbumsDetails2 = [];
//   List<AllAlbums> sortedAlbumsFilter2 = [];
//
//   ///
//   Future getAllAlbumsToAddImageInIt() async {
//     allAlbums2.clear();
//     sortedAlbums2.clear();
//     sortedAlbumsDetails2.clear();
//     sortedAlbumsFilter2.clear();
//
//     ///    بجيب كل الالبومات اللي عاملها الادمن علششان اضيف فيها الصور
//
//     emit(GetAlbumsLoading());
//
//     try {
//       var response = await dio.get(
//         baseUrl + "galleries?statusIsShareIsLiveNoActive=isShare",
//         options: Options(method: 'GET', headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer ${SharedPreference.getData(key: "token")}",
//           "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//           "admin":
//               SharedPreference.getData(key: "userId") == null ? true : false,
//         }
//             // headers: {
//             //   HttpHeaders.authorizationHeader:
//             //       'Bearer ${SharedPreference.getData(key: "token")}',
//             //   'content-Type': 'application/json'
//             // },
//             ),
//       );
//
//       if (response.statusCode == 200) {
//         (response.data as List).forEach((element) {
//           allAlbums2.add(AllAlbums.fromJson(element));
//         });
//
//         allAlbums2.sort((a, b) => DateTime.parse(b.eventDate!)
//             .compareTo(DateTime.parse(a.eventDate!)));
//
//         int currentYear = 0;
//         List<AllAlbums> currentYearObjects = [];
//
//         for (var obj in allAlbums2) {
//           int year = DateTime.parse(obj.eventDate!).year;
//           if (year != currentYear) {
//             if (currentYearObjects.isNotEmpty) {
//               sortedAlbums2.add(currentYearObjects);
//             }
//             currentYearObjects = [];
//             currentYear = year;
//           }
//           currentYearObjects.add(obj);
//         }
//
//         if (currentYearObjects.isNotEmpty) {
//           sortedAlbums2.add(currentYearObjects);
//         }
//
//         sortedAlbums2.forEach((element) {
//           element.forEach((element1) {
//             sortedAlbumsDetails2.add(element1);
//           });
//         });
//
//         emit(GetAlbumsSuccess());
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorMain());
//       } else if (error.response!.statusCode == 401) {
//         emit(MainLoginError2());
//       } else {
//         emit(GetAlbumsError());
//       }
//     }
//   }
//
// ////////////////////////////////////////////////////////////////////////////////
//   List<ImagesOfSpecificAlbum> allImagesOfSpecificAlbum = [];
//
//   Future getImageByAlbumId({required albumId}) async {
//     allImagesOfSpecificAlbum.clear();
//     emit(getImagesByIdLoading());
//     try {
//       var response = await dio.get(
//         baseUrl + "galleryDetails/gallery/$albumId",
//         options: Options(
//             method: 'GET',
//             // headers: {
//             //   HttpHeaders.authorizationHeader:
//             //       'Bearer ${SharedPreference.getData(key: "token")}',
//             //   'content-Type': 'application/json'
//             // },
//             headers: {
//               "Content-Type": "application/json",
//               "Authorization":
//                   "Bearer ${SharedPreference.getData(key: "token")}",
//               "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//               "admin": SharedPreference.getData(key: "userId") == null
//                   ? true
//                   : false,
//             }),
//       );
//
//       if (response.statusCode == 200) {
//         (response.data as List).forEach((element) {
//           allImagesOfSpecificAlbum.add(ImagesOfSpecificAlbum.fromJson(element));
//         });
//         emit(getImagesByIdSuccess());
//         // print("get QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ AAAAAAAAAAAAAAAAAAA");
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorMain());
//       } else if (error.response!.statusCode == 401) {
//         emit(MainLoginError2());
//       } else {
//         emit(getImagesByIdSError());
//       }
//     }
//   }
//
// //////////////////////////////////////////////////////////////////////////////
//   //http://tree.megastore-app.com:5000/api/v1/galleryDetails
//   // List<ImagesInAllAlbums>allImagesInAllAlbums=[];
//   List<String> allImagesInAllAlbums = [];
//
//   Future getAllImagesInAllAlbums() async {
//     allImagesInAllAlbums.clear();
//     emit(GetImageLoading());
//     try {
//       var response = await dio.get(
//         baseUrl + "galleryDetails",
//         options: Options(method: 'GET', headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer ${SharedPreference.getData(key: "token")}",
//           "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//           "admin":
//               SharedPreference.getData(key: "userId") == null ? true : false,
//         }
//             // headers: {
//             //   HttpHeaders.authorizationHeader:
//             //       'Bearer ${SharedPreference.getData(key: "token")}',
//             //   'content-Type': 'application/json'
//             // },
//             ),
//       );
//
//       if (response.statusCode == 200) {
//         (response.data as List).forEach((element) {
//           allImagesInAllAlbums.add(ImagesInAllAlbums.fromJson(element).image!);
//         });
//         emit(GetImageSuccess());
//         // print("get ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZzz AAAAAAAAAAAAAAAAAAA");
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorMain());
//       } else if (error.response!.statusCode == 401) {
//         emit(MainLoginError2());
//       } else {
//         emit(GetImageError());
//       }
//     }
//   }

///////////////////////////////////////////////////////////////////////////////


}

// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_manager/local_data.dart';
import '../../models/designer_model.dart';
import '../../models/home_client_category_model.dart';
import '../../models/product_model_client.dart';
import '../../services/shared_preference.dart';
import '../application_state/client_states.dart';

import 'package:dio/dio.dart';

class ClientCubit extends Cubit<ClientStates> {
  ClientCubit() : super(InitialState());

  static ClientCubit get(context) => BlocProvider.of(context);

  Dio dio = Dio();


// ////////////////////////////////////////////////////////////////////////////////
  List<Product> allProducts = [];

  Future<void> getAllProducts() async {
    allProducts.clear();
    emit(GetAllProductLoading());
    try {
      var response = await dio.get(baseUrl + "user/getallproduct",
          options: Options(
            method: 'GET',
            headers: {
              HttpHeaders.authorizationHeader:
                  '${SharedPreference.getData(key: "token")}',
              'content-Type': 'application/json'
            },
          ));

      if (response.statusCode == 200) {
        (response.data["Products"] as List).forEach((element) {
          allProducts.add(Product.fromJson(element));
        });
        emit(GetAllProductSuccess());
        print("get AAAAAAAAAAAAAAAAlllllllllll Products ${allProducts.length}");
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(GetAllProductError());
      }
    }
  }

// //////////////////////////////////////////////////////////////////////////////
  List<Product> productsOfSpecialCategory = [];
  Future<void> getProductsByCategoryName({required String categoryName}) async {
    productsOfSpecialCategory.clear();
    emit(GetSpecialProductLoading());
    try {
      var response = await dio.get(
          baseUrl + "user/productbycategory?searchKey=$categoryName",
          options: Options(
            method: 'GET',
            headers: {
              HttpHeaders.authorizationHeader:
                  '${SharedPreference.getData(key: "token")}',
              'content-Type': 'application/json'
            },
          ));

      if (response.statusCode == 200) {
        (response.data as List).forEach((element) {
          productsOfSpecialCategory.add(Product.fromJson(element));
        });
        emit(GetSpecialProductSuccess());
        print("get QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ AAAAAAAAAAAAAAAAAAA");
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(GetSpecialProductError());
      }
    }
  }

///////////////////////////////////////////////////////////////////////////////
//   List<Product> searchedProducts = [];
//   Future<void> getProductsBySearch({required String searchWord}) async {
//     searchedProducts.clear();
//     emit(SearchedProductLoading());
//     try {
//       var response = await dio.get(
//           baseUrl + "user/productbycategory?searchKey=$searchWord",
//           options: Options(
//             method: 'GET',
//             headers: {
//               HttpHeaders.authorizationHeader:
//                   '${SharedPreference.getData(key: "token")}',
//               'content-Type': 'application/json'
//             },
//           ));
//
//       if (response.statusCode == 200) {
//         (response.data as List).forEach((element) {
//           productsOfSpecialCategory.add(Product.fromJson(element));
//         });
//         emit(SearchedProductSuccess());
//         print("get QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ AAAAAAAAAAAAAAAAAAA");
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorClient());
//       } else {
//         emit(SearchedProductError());
//       }
//     }
//   }
/////////////////////////////////////////////////////////////////////////////////////////////////////

  List<Category> categories = [];
  Future<void> getClientHomeCategories() async {
    categories.clear();
    emit(getCategoryLoading());
    try {
      var response =
          await dio.get(baseUrl + "user/getallcategory",
              options: Options(
                method: 'GET',
                headers: {
                  HttpHeaders.authorizationHeader:
                      '${SharedPreference.getData(key: "token")}',
                  'content-Type': 'application/json'
                },
              ));

      if (response.statusCode == 200) {
        (response.data ["Categories"]as List).forEach((element) {
          categories.add(Category.fromJson(element));
        });
        emit(getCategorySuccess());
        print("get All Categories ${categories.length}");
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(getCategoryError());
      }
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////

  List<Designer> designers = [];
  Future<void> getClientHomeDesigners() async {
    designers.clear();
    emit(getDesignerLoading());
    try {
      var response =
          await dio.get(baseUrl + "user/productbycategory?searchKey=",
              options: Options(
                method: 'GET',
                headers: {
                  HttpHeaders.authorizationHeader:
                      '${SharedPreference.getData(key: "token")}',
                  'content-Type': 'application/json'
                },
              ));

      if (response.statusCode == 200) {
        (response.data as List).forEach((element) {
          designers.add(Designer.fromJson(element));
        });
        emit(getDesignerSuccess());
        print("get QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ AAAAAAAAAAAAAAAAAAA");
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(getDesignerError());
      }
    }
  }

/////////////////////////////////////////////// Cart   //////////////////////////////////////////////////////

  Future<bool> addToCart({
    required String productId,
    required int Quantity,
  }) async {
    var params = {"productId": productId, "quantity": Quantity};

    emit(AddToCartLoading());

    try {
      var response = await dio.post(
        baseUrl + "user/addcart",
        data: params,
        options: Options(
          method: 'POST',
          headers: {
            HttpHeaders.authorizationHeader:
                '${SharedPreference.getData(key: "token")}',
            'content-Type': 'application/json'
          },
        ),
      );

      if (response.statusCode == 201) {
        emit(AddToCartSuccess());
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(AddToCartError());
      }
    }

    return false;
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////
  List<Product> allCartProducts = [];

  Future<bool> getAllCartProducts() async {
    allCartProducts.clear();

    emit(GetAllCartLoading());

    try {
      var response = await dio.get(
        baseUrl + "cart/website/${SharedPreference.getData(key: "userId")}",
        options: Options(
          method: 'GET',
          headers: {
            HttpHeaders.authorizationHeader:
                '${SharedPreference.getData(key: "token")}',
            'content-Type': 'application/json'
          },
        ),
      );

      if (response.statusCode == 200) {


        (response.data as List).forEach((element) {
          allCartProducts.add(Product.fromJson(element));
        });



        emit(GetAllCartSuccess());
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(GetAllCartError());
      }
    }
    return false;
  }
//////////////////////////////////////////////////////////////////////////////////////////////////////
//   Future<bool> deleteCart(
//
//   ) async {
//     // var params = {"productId": productId, "quantity": Quantity};
//
//     emit(AddToCartLoading());
//
//     try {
//       var response = await dio.post(
//         baseUrl + "user/addcart",
//         data: params,
//         options: Options(
//           method: 'POST',
//           headers: {
//             HttpHeaders.authorizationHeader:
//             '${SharedPreference.getData(key: "token")}',
//             'content-Type': 'application/json'
//           },
//         ),
//       );
//
//       if (response.statusCode == 201) {
//         emit(AddToCartSuccess());
//         return true;
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorClient());
//       } else {
//         emit(AddToCartError());
//       }
//     }
//
//     return false;
//   }

}

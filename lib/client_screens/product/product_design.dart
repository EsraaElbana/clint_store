

import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';



import '../../models/product_model_client.dart';
import '../../utilities/text_style.dart';


class CreatProduct extends StatelessWidget {

  final Product product;
  CreatProduct({super.key, required this.product

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
      child:Column(
        children: [
          InkWell(
            onTap: () {
              // RoutesManager.navigatorPush(
              //     context, ProductDetailsScreen2(product: product));
            },
            child: Column(
              children: [
 ///////////////////////////////////////////////////////////////////////////////////// image product
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: getSize(context: context).height * 0.16,
                    margin: EdgeInsets.only(bottom: 8),
                    width: getSize(context: context).width,
                    child: Image.network(
                      product.images![0].imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
///////////////////////////////////////////////////////////////////////////////////////// product name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BlackTitle.display5(context)
                            .copyWith(color: Color(0xff78798E)),
                      ),

////////////////////////////////////////////////////////////////////////////////////////////// prduct color
//                       Container(
//                         margin: EdgeInsets.only(top: 3,bottom: 5),
//                         child: Row(
//                           children: List.generate(
//                               product.productColors.length,
//                                   (index) =>
//                                   Container(
//                                     margin: EdgeInsets.symmetric(horizontal: 2,vertical: 5),
//                                     height: 10,
//                                     width: 10,
//                                     decoration: BoxDecoration(
//                                         color: product.productColors[index],
//                                         borderRadius: BorderRadius.circular(10)),
//                                   )
//
//
//                           ),
//                         ),
//                       ),

//////////////////////////////////////////////////////////////////////////////////////// product Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(

                               "${num.parse(product.price.toString()).toStringAsFixed(2)} \$",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: BlackTitle.display5(context)
                                  .copyWith(color: Color(0xff000000)),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              // height: 30,
                              width: 60,
                              padding: EdgeInsets.symmetric(vertical:2),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xffD4DCFB),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Add To",
                                style: BlackTitle.display5(context),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// class Product {
//   String productPrice, productImage, productName;
//   List<Color> productColors;
//   Product(
//       {required this.productName,
//         required this.productPrice,
//         required this.productColors,
//         required this.productImage});
// }


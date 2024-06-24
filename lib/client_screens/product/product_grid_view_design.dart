import 'package:clint_store/client_screens/product/product_details.dart';
import 'package:clint_store/utilities/routes_manager.dart';
import '../../client_Screens/product/product_design.dart';
import '../../models/product_model_client.dart';
import 'package:flutter/material.dart';




class CreatProductView extends StatelessWidget {
  final List<Product> productList;
  final ScrollPhysics? physics;
  final int? crossAxisCount;
  final double? mainAxisSpacing, crossAxisSpacing, childAspectRatio;
  final Axis? scrollDirection;
  CreatProductView(
      {super.key,
        required this.productList,
        this.physics,
        this.crossAxisCount,
        this.mainAxisSpacing,
        this.crossAxisSpacing,
        this.childAspectRatio,
        this.scrollDirection});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

        physics: physics ?? NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: scrollDirection ?? Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 240,
          crossAxisCount: crossAxisCount ?? 2,
          mainAxisSpacing: mainAxisSpacing ?? 8.0,
          crossAxisSpacing: crossAxisSpacing ?? 8.0,
          // childAspectRatio: childAspectRatio ?? 0.75
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            print("NNNNNNNNNNNNNNNNNNN");
           RoutesManager.navigatorPush(context,  ProductDetailsScreen(
             product: productList[index],
           ));
          },
          child: CreatProduct(
            product: productList[index],
          ),
        ));
  }
}
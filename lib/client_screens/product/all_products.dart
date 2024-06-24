import 'package:clint_store/client_Screens/product/product_design.dart';
import 'package:clint_store/client_screens/product/product_details.dart';
import 'package:clint_store/client_screens/product/product_grid_view_design.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';

import '../../common_widget/make_filter.dart';

import '../../models/product_model_client.dart';
import '../../utilities/routes_manager.dart';
import '../../utilities/text_style.dart';

class AllProducts extends StatelessWidget {
  final List<Product> productList;

  AllProducts({super.key, required this.productList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
/////////////////////////////////////////////////////////////////////////////////////////// filter
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Home",
                        style: BlackLabel.display5(context)
                            .copyWith(fontSize: 10),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 15,
                      ),
                      Text(
                        " List of Products",
                        style: BlackLabel.display5(context),
                      )
                    ],
                  ),

                  InkWell(
                    onTap: () {
                      BottomSheetContent().show(context);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xffDFE7F4),
                      child: SvgPicture.asset(
                        "assets/images/filer.svg",
                        color: Colors.black,
                        height: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
/////////////////////////////////////////////////////////////////////////////////////////// all Items

            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: CreatProductView(
                  physics: AlwaysScrollableScrollPhysics(),
                  productList: productList,
                ),
              ),
            ),
/////////////////////////////////////////////////////////////////////////////////////////// Similar Items
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Similar Items",
                      style: BlackTitle.display5(context),
                    )),
                Container(
                  height: getSize(context: context).height * 0.35,
                  // color: Colors.amber,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: productList.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {

                              RoutesManager.navigatorPush(
                                  context,
                                  ProductDetailsScreen(
                                    product: productList[index],
                                  ));
                            },
                            child: Container(
                              width: getSize(context: context).width * 0.4,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: CreatProduct(
                                product: productList[index],
                              ),
                            ),
                          )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

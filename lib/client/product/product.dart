import 'package:clint_store/client/product/product_details.dart';

import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';

import '../../common_widget/make_filter.dart';
import '../../utilities/routes_manager.dart';
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
              RoutesManager.navigatorPush(
                  context, ProductDetailsScreen2(product: product));
            },
            child: Column(
              children: [
                ///////////////////////////////////////////////////////////////////////////////////// image product
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    // height: getSize(context: context).height * 0.16,
                    margin: EdgeInsets.only(bottom: 8),
                    width: getSize(context: context).width,
                    child: Image.asset(
                      product.productImage,
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
                        product.productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BlackTitle.display5(context)
                            .copyWith(color: Color(0xff78798E)),
                      ),

                      ////////////////////////////////////////////////////////////////////////////////////////////// prduct color
                      Container(
                        margin: EdgeInsets.only(top: 3,bottom: 5),
                        child: Row(
                          children: List.generate(
                              product.productColors.length,
                                  (index) =>
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2,vertical: 5),
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: product.productColors[index],
                                        borderRadius: BorderRadius.circular(10)),
                                  )


                          ),
                        ),
                      ),

                      //////////////////////////////////////////////////////////////////////////////////////// product Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${product.productPrice}\$",
                            style: BlackTitle.display5(context)
                                .copyWith(color: Color(0xff000000)),
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
        itemBuilder: (context, index) => Container(
          // color: Colors.amber,
          child: CreatProduct(
            product: productList[index],
          ),
        ));
  }
}

class Product {
  String productPrice, productImage, productName;
  List<Color> productColors;
  Product(
      {required this.productName,
        required this.productPrice,
        required this.productColors,
        required this.productImage});
}

class AllProducts extends StatelessWidget {
  AllProducts({super.key});
  List<Product> productList = [
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '1220',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '1220',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '1220',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '1220',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '1220',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '1220',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '1220',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '1220',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '1220',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '20',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '30',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
    Product(
        productName: 'Stylish Soft Chair',
        productPrice: '420',
        productColors: [
          Color(0xffE7C4AB),
          Color(0xffABD1E7),
          Color(0xffCCABE7),
          Color(0xffAFABE7),
        ],
        productImage: 'assets/images/decore.png'),
  ];
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
                            .copyWith(fontSize: 10, color: Colors.grey),
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
                    onTap: (){
                      BottomSheetContent().show(context);},
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
                              ProductDetailsScreen2(
                                product: productList[index],
                              ));
                        },
                        child: Container(
                          width:getSize(context:context).width*0.4,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child:
                          CreatProduct(
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

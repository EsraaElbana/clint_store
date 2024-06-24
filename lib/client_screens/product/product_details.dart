
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_manager/local_data.dart';
import '../../client_Screens/product/product_design.dart';
import '../../common_widget/make_button.dart';

import '../../common_widget/make_rate.dart';
import '../../models/product_model_client.dart';
import '../../utilities/text_style.dart';
import '../cart_screen/cart.dart';


class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> productColor = [
    Color(0xffE7C4AB),
    Color(0xffABD1E7),
    Color(0xffCCABE7),
    Color(0xffAFABE7),
  ];

  List deliveryIcons = ["free1", "free2", "free3"];

  List deliveryNames = [
    "Free\nDelivery",
    "Free\nDelivery",
    "Secure\nTransaction"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
////////////////////////////////////////////////////////////////////////////////////////////// product image
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: getSize(context: context).height * 0.2,
            width: getSize(context: context).width,

            child:    ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/decore.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
///////////////////////////////////////////////////////////////////////////////////////// title
          Text(
            "Stylish Soft Chair",
            style: BlackTitle.display5(context),
          ),
///////////////////////////////////////////////////////////////////////////////////////// description
          Text(
            "The Modern Soft Chair boasts a harmonious blend of modern design and plush comfort. With its sleek lines, ",
            style: BlackLabel.display5(context),
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
///////////////////////////////////////////////////////////////////////////////////////// price

              Row(
                children: [
                  Text(
                    "210 \$ ",
                    style: BlackTitle.display5(context).copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "203 \$ ",
                    style: BlackLabel.display5(context).copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  ),
                ],
              ),

///////////////////////////////////////////////////////////////////////////////////////// add to cart

              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: getSize(context: context).width * 0.07,
                    width: getSize(context: context).width * 0.07,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: getSize(context: context).width * 0.07,
                    width: getSize(context: context).width * 0.07,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    child: Text(
                      "2",
                      style: BlackTitle.display5(context),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: getSize(context: context).width * 0.07,
                    width: getSize(context: context).width * 0.07,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    child: Icon(
                      FontAwesomeIcons.minus,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),

///////////////////////////////////////////////////////////////////////////////////////////// product color
          SizedBox(
            height: 10,
          ),
          Row(
            children: List.generate(
                productColor.length,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: productColor[index],
                      borderRadius: BorderRadius.circular(10)),
                )),
          ),
//////////////////////////////////////////////////////////////////////////////////////////// rate
          Container(margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(children: [
              Row(children: [ CreatRate2(),Text("159 Reviews",style: BlackLabel.display5(context),)],),
              // Row(children: ),
            ],),
          ),
////////////////////////////////////////////////////////////////////////////////////////// Delivery

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  3,
                      (index) => Card(
                    elevation: 5,
                    child: Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/${deliveryIcons[index]}.svg",
                            height: 40,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            deliveryNames[index],
                            style: BlackLabel.display5(context),
                          ),
                        ],
                      ),
                    ),
                  ))),
////////////////////////////////////////////////////////////////////////////////////////////////// Add To Cart buttons
          Center(
            child:   MakeButton(
              topMargin: 30,
              width: getSize(context: context).width*0.6,
              title: "Add To Cart",
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartScreen()));
                });
              },),
          ),

//////////////////////////////////////////////////////////////////////////////////////////// Frequently Bought Together
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Frequently Bought Together",
                    style: BlackTitle.display5(context),
                  )),
              Container(
                height: getSize(context: context).height * 0.40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: Container(
                        width: getSize(context:context).width*0.4,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: CreatProduct(

                          product: widget.product,
                        ),
                      ),
                    )),
              )
            ],
          ),
//////////////////////////////////////////////////////////////////////////////////////////// Similar itmes
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
                height: getSize(context: context).height * 0.40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: Container(
                        width: getSize(context:context).width*0.4,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: CreatProduct(
                          product: widget.product,
                        ),
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
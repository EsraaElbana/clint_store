import 'package:clint_store/contact%20us/countactus_form.dart';
import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';

import '../../common_widget/make_appbar.dart';
import '../../utilities/routes_manager.dart';
import '../../utilities/text_style.dart';
import '../product/product.dart';
import 'designer.dart';


class HomeScreenClient extends StatefulWidget {
  const HomeScreenClient({super.key});

  @override
  State<HomeScreenClient> createState() => _HomeScreenClientState();
}

class _HomeScreenClientState extends State<HomeScreenClient> {
  int selectedCategory = 0;
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
  List tabNames = ["Stores", "Designers"];
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreatAppBar(
        hasTitle: true,
        hasBackButton: true,
        title: 'jkjkjkjjjk',
        onDrawerPressed: () {},
        hasDrawer: false,),
      body: SafeArea(
        child: ListView(
          children: [
///////////////////////////////////////////////////////////////////////////// home screen main image
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: getSize(context: context).height * 0.33,
                      width: getSize(context: context).width,
                      color: Colors.lightGreen,
                      child: Image.asset(
                        "assets/images/homeImage.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        height: 30,

                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // CircleAvatar(
                            //   radius: 25,
                            //   backgroundColor: (Color(0xffF3CD6A)),
                            // ),
                            Expanded(
                             // flex: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                // MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Text("Home",
                                  //     style: BlackLabel.display5(context)
                                  //         .copyWith(color: Color(0xffF3CD6A))),
                                  // Text(
                                  //   "About Us",
                                  //   style: BlackLabel.display5(context)
                                  //       .copyWith(color: Color(0xffF3CD6A)),
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ContactUsForm(),));

                                    },
                                    child: Text(
                                      "Contact Us",
                                      style: BlackLabel.display5(context)
                                          .copyWith(color: Color(0xffF3CD6A)),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                            Spacer(),
                            Expanded(
                              //flex: 4,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,

                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xffF3CD6A),
                                      ),
                                    ),
                                    child: Text(
                                      "login",
                                      style: BlackLabel.display5(context)
                                          .copyWith(color: Color(0xffF3CD6A)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),

                                    child: Text(
                                      "sign up",
                                      style: BlackLabel.display5(context)
                                          .copyWith(color: Color(0xffF3CD6A)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bring Your Dream",
                      style:
                      WhiteTitle.display5(context).copyWith(fontSize: 16),
                    ),
                    Text(
                      "To Life",
                      style:
                      WhiteTitle.display5(context).copyWith(fontSize: 16),
                    ),
                    Text(
                      "Turn your room with A2Z into a lot more minimalist",
                      style:
                      WhiteLabel.display5(context).copyWith(fontSize: 10),
                    ),
                    Text(
                      "and modern with ease and speed",
                      style:
                      WhiteLabel.display5(context).copyWith(fontSize: 10),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                )
              ],
            ),

/////////////////////////////////////////////////////////////////////////////// two Buttons
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  tabNames.length,
                      (index) =>
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedTab = index;
                          });
                        },
                        child: Container(
                            width: getSize(context: context).width * 0.25,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: selectedTab == index
                                    ? Color(0xff070F2B)
                                    : Color(0xffD9D9D9)),
                            child: Text(
                              tabNames[index],
                              style: selectedTab == index
                                  ? WhiteTitle.display5(context)
                                  : BlackTitle.display5(context),
                            )),
                      ),
                ),
              ),
            ),
            selectedTab == 1
                ? DesignersScreen()
                : Column(
              children: [
////////////////////////////////////////////////////////////////////////////////////// title
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        "Discover the Latest ",
                        style: BlackTitle.display5(context)
                            .copyWith(fontSize: 30),
                      ),
                      Text(
                        "Furniture Trends",
                        style: BlackTitle.display5(context)
                            .copyWith(fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Shop the Latest Fashion Items and",
                        style: BlackTitle.display5(context)
                            .copyWith(fontSize: 12),
                      ),
                      Text(
                        " Stay ahead of the style game",
                        style: BlackTitle.display5(context)
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),

///////////////////////////////////////////////////////////////////////////////////////// upper ads
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: getSize(context: context).width *
                                    0.35,
                                child: Image.asset(
                                  "assets/images/decore.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: getSize(context: context).width *
                                    0.35,
                                child: Image.asset(
                                  "assets/images/decore.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: getSize(context: context).width * 0.35,
                          width: getSize(context: context).width,
                          child: Image.asset(
                            "assets/images/decore.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
////////////////////////////////////////////////////////////////////////////////////////////    Explore Button
                creatExploreButton(onTap: () {
                  RoutesManager.navigatorPush(context, AllProducts());
                }),
///////////////////////////////////////////////////////////////////////////////////////////////////////// taps
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) =>
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedCategory = index;
                              });
                            },
                            child: Container(
                                width:
                                getSize(context: context).width * 0.25,

                                padding:
                                EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                alignment: Alignment.center,
                                margin:
                                EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(15),
                                    color: Color(selectedCategory == index
                                        ? 0xff070F2B
                                        : 0xffD9D9D9)),
                                child: Text(
                                  "living room",
                                  maxLines: 1,
                                  style: selectedCategory == index
                                      ? WhiteLabel.display5(context)
                                      : BlackLabel.display5(context),
                                )),
                          )),
                ),
///////////////////////////////////////////////////////////////////////////////////////////////////////// productList
                Container(

                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CreatProductView(
                    productList: productList,

                  ),
                ),

////////////////////////////////////////////////////////////////////////////////////////////    Explore Button
                SizedBox(
                  height: 10,
                ),
                creatExploreButton(onTap: () {
                  RoutesManager.navigatorPush(context, AllProducts());
                }),
                SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  creatExploreButton({required void Function() onTap}) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          height: 40,
          width: getSize(context: context).width * 0.4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xff070F2B),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Explore More",
                style: WhiteTitle.display5(context),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}


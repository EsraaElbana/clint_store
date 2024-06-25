
import 'package:clint_store/cubit/cubits/client_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_manager/local_data.dart';

import '../client_Screens/cart_screen/cart.dart';
import '../services/shared_preference.dart';
import '../utilities/text_style.dart';
class CreatAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Size preferredSize;
  final bool hasBackButton;
  final bool hasDrawer;

  final void Function() onDrawerPressed;
  final bool hasTitle;

  CreatAppBar({
    Key? key,
    required this.hasTitle,
    required this.hasBackButton,
    required this.title,
    required this.onDrawerPressed,
    required this.hasDrawer,

  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  State<CreatAppBar> createState() => _CreatAppBarState();
}

class _CreatAppBarState extends State<CreatAppBar> {


  @override
  Widget build(BuildContext context) {

    return AppBar(
        title: Text(
          widget.hasTitle == true ? widget.title : "",
          style: GreyTitle.display5(context)

              .copyWith(color:   Color(0xff000000),),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        primary: true,
        automaticallyImplyLeading: true,
        leading:
        widget.hasDrawer == true
            ? Row(
          children: [
            Container(
              width: 50,
              child: creatIcon(
                  onTap: widget.onDrawerPressed,
                  child:
                  Icon(Icons.menu,
                    color: Color(0xff000000),
                  )),
            ),
          ],
        )
            : SizedBox(),

        actions: [
    Row(
    children: [
    widget.hasBackButton == true
      ? Container(
      width: 50,
      child: creatIcon(
          onTap: () {

          },
          child: Icon(Icons.arrow_back_ios_new_sharp,    color: Color(0xff000000),)),
    )
        : SizedBox(),



      Stack(
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart,color: Colors.black,),
            onPressed: () {



              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreen()));
            },
          ),
          BlocProvider.of<ClientCubit>(context).allCartProducts.isEmpty?SizedBox():

          Positioned(
            top: -8,
            left: 12,
            child: Container(
              // color: Colors.red,
              // height: 30,
              alignment: Alignment.center,
              child: Text(
                SharedPreference.getData(key: "userId") ==
                    null
                    ? "0"
                    : "${BlocProvider.of<ClientCubit>(context).allCartProducts.length}",
                style: BlackTitle.display5(context),
              ),
            ),
          )
        ],
      )





    ],
    ),
        ]);
  }

  Widget creatIcon({required void Function() onTap, required Widget child}) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal:5),
          width: getSize(context: context).width * 0.05,
          // color: Colors.blue,
          child: child,
        ));
  }
}
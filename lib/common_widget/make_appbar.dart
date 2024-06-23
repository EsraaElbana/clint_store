
import 'package:flutter/material.dart';

import '../app_manager/local_data.dart';

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
        leading: Row(
          children: [
            widget.hasBackButton == true
                ? Container(
              width: 50,
              child: creatIcon(
                  onTap: () {

                  },
                  child: Icon(Icons.arrow_back_ios_new_sharp,    color: Color(0xff000000),)),
            )
                : SizedBox()
          ],
        ),
        actions: [
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
              : SizedBox()
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
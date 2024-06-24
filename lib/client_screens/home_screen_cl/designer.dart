
import 'package:clint_store/models/designer_model.dart';
import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';
import '../../utilities/text_style.dart';




class DesignersScreen extends StatelessWidget {
  final List<Designer>designerList;


   DesignersScreen({super.key, required this.designerList});
  List<String> designersExperience = ["business", "podcast", "startup"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      itemCount: designerList.length,
      itemBuilder: (context, index) => Container(
        width: getSize(context: context).width,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: creatDesignerDetails(
          context: context,
          designerIdentity: designerList[index].licencePicture!.designerImage!,
          designerName: designerList[index].userName!,
          email: designerList[index].email!,
          address: designerList[index].address![0],
          gender: designerList[index].gender!,
          phone: designerList[index].phoneNumber!,

        ),
      ),
    );
  }

  Widget creatDesignerDetails({
    required BuildContext context,
    required String designerIdentity,
    required String designerName,
    required String email,


    required String address,
    required String gender,
    required String phone,








  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                color: Color(0xffD4D4D4),
                width: 1.0,
              ),
              top: BorderSide(
                color: Color(0xffD4D4D4),
                width: 1.0,
              ),
              right: BorderSide(
                color: Color(0xff070F2B),
                width: 10.0,
              ),
              bottom: BorderSide(
                color: Color(0xff070F2B),
                width: 10.0,
              )),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getSize(context: context).height * 0.2,
                child: Image.asset("assets/images/decore.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Designer",
                style: BlackTitle.display5(context)
                    .copyWith(color: Color(0xff4D4D4D), fontSize: 16),
              ),
              Text(
                designerName,
                style: BlackTitle.display5(context)
                    .copyWith(color: Colors.red, fontSize: 25),
              ),
              Text(
                email,
                style:
                BlackLabel.display5(context).copyWith(color: Colors.black),
              ),
              Text(
                address,
                style:
                BlackLabel.display5(context).copyWith(color: Colors.black),
              ),

      Row(
 children: [
   Text(
     gender,
     style:
     BlackLabel.display5(context).copyWith(color: Colors.black),
   ),
   Text(
     phone,
     style:
     BlackLabel.display5(context).copyWith(color: Colors.black),
   ),
 ],
      )
,













              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: getSize(context: context).width,
                height: 0.3,
                color: Colors.blueGrey,
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: designersExperience.length,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.7, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          designersExperience[index],
                          style: BlackLabel.display5(context)
                              .copyWith(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
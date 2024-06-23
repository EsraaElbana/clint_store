import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////
//////////////////////   شجره المقرن ///////////////
const String baseUrl = "http://206.189.19.24/api/v1/";

/// Almgrun app
const String logo = "assets/images/splash.png";

/// Almgrun logo
const String welcomeMessage1 = "اهلا بك في شجرة عائله المقرن";
const Color mainColor3 = Color(0xff297A7A);
const Color mainColor2 = Color(0xff154C61);
const Color mainColor = Color(0xff339999);
const Color thirdColor = Color(0xff585858);
const String applicationName = "شجرة المقرن";
const String applicationId = "Almgrun";

const String apiKey = "AIzaSyAPvwiqKevmzCJ-Ek0cmp5e47deeLcftNM";

const String appId = "1:507174839739:android:c287a0a4e2d41b3d8f909e";
const String messagingSenderId = "507174839739";

const String projectId = "almugren-tree";

////////////////////////////////////////////////////////////////////////////////
////////////////////   شجره العيله ///////////////
// const String baseUrl ="http://tree.megastore-app.com:5000/api/v1/"; /// family app
// const String logo = "assets/images/familyLogo.png"; /// family logo
// const String welcomeMessage1="اهلا بك في تطبيق العائلة";
// const Color mainColor3 = Color(0xff297A7A);
// const Color mainColor = Color(0xff1B7D88);
// const Color mainColor2 = Color(0xff154C61);
//const String applicationName="شجرة العيله";
// const Color thirdColor = Color(0xff585858);
// const String applicationId= "Family";

//// لازم تعملهم ضروري

// const String apiKey= "AIzaSyBoI9GnDVQtiGYj84hqPQcvy5jriAefpCk";/////
// const String appId= "1:1035950758734:android:707ea187c4e95c375c1c1f";
// const String messagingSenderId= "1035950758734	";
// const String projectId= "family-application-95e29";
////////////////////////////////////////////////////////////////////////////////

////////////////////////   شجره السدحان ///////////////
// const String baseUrl ="http://104.248.162.83/api/v1/"; /// sadhan app
// const String logo = "assets/images/sadhanlogo.png"; /// sadhan logo
// const String welcomeMessage1="اهلا بك في شجرة عائلة السدحان";
// const String apiKey= "AIzaSyCL-W_NbiFlISkaC9JyQc7ffUUgKUI_vac";
// const String appId= "1:683944300886:android:712d4f3485b459e70b86f7";
// const String messagingSenderId= "683944300886";
// const String projectId= "sadhan-7341c";
// const String applicationName="شجرة السدحان";
// const Color mainColor2 = Color(0xff4E563E);
// const Color mainColor = Color(0xff5F694C);
//  const Color mainColor3 = Color(0xff297A7A);
// const Color thirdColor = Color(0xff695A4D);
// const String applicationId= "Sadhan";
////////////////////////////////////////////////////////////////////////////////////////

// هنمسح الصورتين وهنبدل local data و هنرجع لينك السدحان مكانه  و الجيت هاب

const Color whiteColor = Color(0xffFFFFFF);
const Color greyColor = Color(0xffCBCBCB);
const String mensImage =
    "https://i.insider.com/54cbd53b69bedd033ad09526?width=1100&format=jpeg&auto=webp";
const String noImage =
    "https://media.istockphoto.com/id/513472966/photo/young-arabian-man-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=r7ifk4l2pZWjjWEq09V1RmFFRdpudyATmCYhfOxFGxs=";
const String pdf = "https://www.africau.edu/images/default/sample.pdf";
List<String> dayNames = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];
Map<String, String> daysConvert = {
  'Sunday': 'الأحد',
  'Monday': 'الاثنين',
  'Tuesday': 'الثلاثاء',
  'Wednesday': 'الأربعاء',
  'Thursday': 'الخميس',
  'Friday': 'الجمعة',
  'Saturday': 'السبت'
};

Size getSize({
  context,
}) {
  Size size = MediaQuery.of(context).size;
  return size;
}
//// const String noImage = "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg";

//////////////////////////////////////////////////////////////////////////////////////////

// class LocalData {
//   static String applicationVersion = "1.0.4.422";
//   static String uploadingVersion = "1.0.0.2";
// }
//
// String article = " نبنبنميس سيتنتنس ستنيتيسسم يسنيسنيسم "
//     "سيمننمسي سيمنيسيسم يسيستني سيتنتيسن ستييستيس تسيتيسيتنس نتسيتيس يسيستيست س"
//     "سيمننمسي سيمنيسيسم يسيستني سيتنتيسن ستييستيس تسيتيسيتنس نتسيتيس يسيستيست س";

/////// vvvip increase heaight of text field
// Container(
// margin: EdgeInsets.all(12),
// height: 7 * 24.0,
// child: TextField(
// maxLines: 7,
// decoration: InputDecoration(
// hintText: "اكتب تفاصيل المنتج",
// hintStyle: TextStyle(color: Colors.white, fontSize: 18),
// fillColor: secColor,
// filled: true,
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: mainColor, width: 5.0),
// borderRadius: BorderRadius.all(Radius.circular(13.0))),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: mainColor, width: 5.0),
// borderRadius: BorderRadius.all(Radius.circular(13.0))),
// ),
// ),
// ),
///////////////////////////////////////////
// ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// padding: EdgeInsets.symmetric(horizontal:3),
// physics:  NeverScrollableScrollPhysics(),
// itemCount: 5,
// itemBuilder: (context,index)=>

// crossAxisCount: 3,
// crossAxisSpacing: 2.0,
// mainAxisSpacing: 7.0,
// childAspectRatio: 0.40,

// FaIcon(FontAwesomeIcons.gamepad),
//

// bottom: false, in safe areae
//extendBody: true, in scafo

// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// MembershipTypeScreen()));

//static const route="MyAccountScreen";

import 'package:elanbatkingdom/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArabicScreen extends StatelessWidget {
  List model;
  String ArabicList = "";
  ArabicScreen({this.model});

  @override
  Widget build(BuildContext context) {
    listImageResult.forEach((element) {
      ArabicList += " " + element["arabic"];
    });

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffE1D9D0),
      ),
      height: 450.h,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.extent(
          physics: PageScrollPhysics(),
          maxCrossAxisExtent: 130.h,
          children: new List<Widget>.generate(listImageResult.length, (index) {
            return Center(
              child: Text(
                listImageResult[index]["arabic"],
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ArabicScreen2 extends StatelessWidget {
  List model;
  ArabicScreen2({this.model});
  String ArabicTranns = "";
  @override
  Widget build(BuildContext context) {
    model.forEach((element) {
      ArabicTranns += element["arabicTranslate"];
    });
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color(0xffE1D9D0),
      ),
      height: 330.h,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        // child: GridView.extent(
        //   physics: PageScrollPhysics(),
        //   maxCrossAxisExtent: 130.h,
        //   children: new List<Widget>.generate(listImageResult.length, (index) {
        //     return Center(
        //       child: Text(
        //         listImageResult[index]["arabic"],
        //         style: TextStyle(fontSize: 30),
        //       ),
        //     );
        //   }),
        // ),
        child: Text(
          ArabicTranns,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

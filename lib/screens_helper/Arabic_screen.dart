import 'package:elanbatkingdom/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArabicScreen extends StatelessWidget {
  List model;
  String ArabicList = "";
  ArabicScreen({required this.model});

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
      height: .180.sh,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.extent(
          physics: PageScrollPhysics(),
          maxCrossAxisExtent: 40.sp,
          children: new List<Widget>.generate(listImageResult.length, (index) {
            return Center(
              child: Text(
                listImageResult[index]["arabic"],
                style: TextStyle(
                  fontSize: 27.sp,
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
  ArabicScreen2({required this.model});
  String ArabicTranns = "  ";
  @override
  Widget build(BuildContext context) {
    model.forEach((element) {
      ArabicTranns += element["arabicTranslate"];
    });
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffE1D9D0),
      ),
      height: .180.sh,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          ArabicTranns,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 27.sp),
        ),
      ),
    );
  }
}

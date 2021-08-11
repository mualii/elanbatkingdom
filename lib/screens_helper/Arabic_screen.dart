import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArabicScreen extends StatelessWidget {
  List model;
  ArabicScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffE1D9D0),
      ),
      height: 500.h,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.extent(
          physics: PageScrollPhysics(),
          maxCrossAxisExtent: 130.h,
          children: new List<Widget>.generate(model.length, (index) {
            return new GridTile(
                child: Center(child: Text(model[index]["arabic"]))
                // new Text(anbatChak[index]),
                );
          }),
        ),
      ),
    );
  }
}

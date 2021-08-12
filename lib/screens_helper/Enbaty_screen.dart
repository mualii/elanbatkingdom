import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnbatyScreen extends StatelessWidget {
  List model;
  EnbatyScreen({this.model});
  // final controller = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color(0xffE1D9D0),
      ),
      height: 380.h,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.extent(
          physics: PageScrollPhysics(),
          // physics: NeverScrollableScrollPhysics(),
          maxCrossAxisExtent: 130.h,
          children: new List<Widget>.generate(model.length, (index) {
            return new GridTile(
              child: Container(
                  color: Color(0xffE1D9D0),
                  width: 20,
                  height: 20,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Color(0xffFFFFFF),
                    child: Center(
                      child: Image.asset(
                        model[index]["anbatySimple"],
                      ),
                      // new Text(anbatChak[index]),
                    ),
                  )),
            );
          }),
        ),
      ),
    );
  }
}
// Container(
//   height: 30,
//   child: Row(
//     children: [
//       IconButton(onPressed: () {}, icon: FaIcon(Icons.copy))
//     ],
//   ),
// )

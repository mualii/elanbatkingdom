import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

class EnbatyScreen extends StatefulWidget {
  List model;
  ScreenshotController controller = ScreenshotController();

  EnbatyScreen({required this.model, required this.controller});

  @override
  _EnbatyScreenState createState() => _EnbatyScreenState();
}

class _EnbatyScreenState extends State<EnbatyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Screenshot(
          controller: widget.controller,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.sp),
                  topRight: Radius.circular(20.sp)),
              color: Color(0xffE1D9D0),
            ),
            height: .160.sh,
            width: double.infinity,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.extent(
                physics: PageScrollPhysics(),
                // physics: NeverScrollableScrollPhysics(),
                maxCrossAxisExtent: 40.sp,
                children:
                    new List<Widget>.generate(widget.model.length, (index) {
                  return new GridTile(
                    child: Container(
                        // color: Color(0xffE1D9D0),
                        width: 10.w,
                        height: 10.h,
                        child: Center(
                          child: Image.asset(
                            widget.model[index]["anbatySimple"],
                          ),
                          // new Text(anbatChak[index]),
                        )),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

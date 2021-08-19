import 'dart:io';
import 'dart:typed_data';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:elanbatkingdom/conest.dart';
import 'package:elanbatkingdom/screens_helper/Arabic_screen.dart';
import 'package:elanbatkingdom/screens_helper/Enbaty_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

List listImageResult = [];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isArabic = false;

  List<Map> SpaceList = [
    {
      "anbaty": "assets/images/keyboard/المسافة.png",
      "arabic": " ",
      "arabicTranslate": " ",
      "anbatySimple": "assets/images/keyboard/المسافة.png"
    }
  ];
  onTaap(int i) {
    // anbatyList[0]["anbaty"];
    setState(() {
      listImageResult.add(anbatyList[i]);
      print(listImageResult.toString());
    });
  }

  final controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height.toString() + "        Height");
    // print(MediaQuery.of(context).size.width.toString() + "       width");
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "الترجمة",
            style: TextStyle(fontSize: 35.sp, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffF8F2ED),
          elevation: 0,
        ),
        backgroundColor: Color(0xffF8F2ED),
        body: SingleChildScrollView(
          child: ConditionalBuilder(
            condition: isArabic == false,
            builder: (context) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Container(
                      height: 70.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "العربية",
                            style:
                                TextStyle(fontSize: 35.sp, color: Colors.black),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isArabic = true;
                              });
                            },
                            child: SizedBox(
                              child: Image.asset('assets/images/Group 2.png'),
                              width: 120.w,
                              height: 120.h,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "الانباطي",
                            style:
                                TextStyle(fontSize: 35.sp, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
                    child: Column(
                      children: [
                        EnbatyScreen(
                          model: listImageResult,
                          controller: controller,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: Color(0xffE1D9D0),
                          ),
                          height: 50.h,
                          width: double.infinity,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Spacer(),
                              IconButton(
                                  onPressed: () async {
                                    print("screen shot");
                                    final image = await controller.capture();
                                    if (image == null) return;
                                    await saveImage(image);
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.camera,
                                    size: 30.sp,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    print("screen shot");
                                    final image = await controller.capture();
                                    if (image == null) return;
                                    await saveImage(image);
                                    saveAndShare(image);
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.shareAltSquare,
                                    size: 30.sp,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
                    child: ArabicScreen(
                      model: listImageResult,
                    ),
                  ),
                  SizedBox(height: 13.4.h),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      height: .28.sh,
                      color: Color(0xffE1D9D0),
                      child: GridView.extent(
                        shrinkWrap: true,
                        physics: PageScrollPhysics(),
                        // physics: NeverScrollableScrollPhysics(),
                        maxCrossAxisExtent: 50.w,
                        children: new List<Widget>.generate(anbatyList.length,
                            (index) {
                          return new GridTile(
                            child: InkWell(
                              onTap: () => onTaap(index),
                              child: KeyBoardBottum(index),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xffE1D9D0),
                    width: double.infinity,
                    height: 35.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              listImageResult.clear();
                              print("close");
                              print(listImageResult.length);
                            });
                          },
                          child: Container(
                            height: 34.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.times,
                                size: 30.sp,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              listImageResult.add(SpaceList[0]);
                              print(listImageResult.toString());
                            });
                          },
                          child: Container(
                            height: 70.h,
                            width: .59.sw,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Image(
                                    image:
                                        AssetImage('assets/images/Path.png'))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              listImageResult.removeLast();
                              print("delete");
                              print(listImageResult.length);
                            });
                          },
                          child: Container(
                            height: 34.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.backspace,
                                size: 30.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: .02.sh,
                  )
                ],
              );
            },
            fallback: (context) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Container(
                      height: 70.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "الانباطي",
                            style:
                                TextStyle(fontSize: 35.sp, color: Colors.black),
                          ),
                          SizedBox(width: 20.w),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isArabic = false;
                              });
                            },
                            child: SizedBox(
                              child: Image.asset('assets/images/Group 2.png'),
                              width: 120.w,
                              height: 120.h,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "العربية",
                            style:
                                TextStyle(fontSize: 35.sp, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
                    child: Column(
                      children: [
                        ArabicScreen2(
                          model: listImageResult,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
                    child: Column(
                      children: [
                        EnbatyScreen(
                          model: listImageResult,
                          controller: controller,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: Color(0xffE1D9D0),
                          ),
                          height: 50.h,
                          width: double.infinity,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Spacer(),
                              IconButton(
                                  onPressed: () async {
                                    print("screen shot");
                                    final image = await controller.capture();
                                    if (image == null) return;
                                    await saveImage(image);
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.camera,
                                    size: 30.sp,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    print("screen shot");
                                    final image = await controller.capture();
                                    if (image == null) return;
                                    await saveImage(image);
                                    saveAndShare(image);
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.shareAltSquare,
                                    size: 30.sp,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 23.4.h),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      height: .28.sh,
                      color: Color(0xffE1D9D0),
                      child: GridView.extent(
                        shrinkWrap: true,
                        physics: PageScrollPhysics(),
                        // physics: NeverScrollableScrollPhysics(),
                        maxCrossAxisExtent: 50.w,
                        children: new List<Widget>.generate(anbatyList.length,
                            (index) {
                          return new GridTile(
                            child: InkWell(
                              onTap: () => onTaap(index),
                              child: KeyBoardBottum(index),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xffE1D9D0),
                    width: double.infinity,
                    height: 35.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              listImageResult.clear();
                              print("close");
                              print(listImageResult.length);
                            });
                          },
                          child: Container(
                            height: 34.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.times,
                                size: 30.sp,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              listImageResult.add(SpaceList[0]);
                              print(listImageResult.toString());
                            });
                          },
                          child: Container(
                            height: 70.h,
                            width: .59.sw,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Image(
                                    image:
                                        AssetImage('assets/images/Path.png'))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              listImageResult.removeLast();
                              print("delete");
                              print(listImageResult.length);
                            });
                          },
                          child: Container(
                            height: 34.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.backspace,
                                size: 30.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: .02.sh,
                  )
                ],
              );
            },
          ),
        ));
  }

  Widget KeyBoardBottum(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Color(0xffFFFFFF),
      child: Center(
        child: Image.asset(
          anbatyList[index]["anbaty"],
        ),
        // new Text(anbatChak[index]),
      ),
    );
  }
}

Future saveAndShare(Uint8List bytes) async {
  final directory = await getApplicationDocumentsDirectory();
  final image = File('${directory.path}/screenShare.png');
  image.writeAsBytesSync(bytes);

  await Share.shareFiles([image.path]);
}

Future<String> saveImage(Uint8List bytess) async {
  await [Permission.storage].request();
  final time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '_')
      .replaceAll(':', '_');
  final name = "screenshot_$time";
  final result = await ImageGallerySaver.saveImage(bytess, name: name);
  return result["filePath"];
}

import 'dart:io';
import 'dart:typed_data';

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
    return Screenshot(
      controller: controller,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "الترجمة",
            style: TextStyle(fontSize: 35, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffF8F2ED),
          elevation: 0,
        ),
        backgroundColor: Color(0xffF8F2ED),
        body: Column(
          children: [
            if (isArabic == false)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الانباطي",
                      style: TextStyle(fontSize: 35, color: Colors.black),
                    ),
                    SizedBox(width: 100.w),
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
                    SizedBox(width: 100.w),
                    Text(
                      "العربية",
                      style: TextStyle(fontSize: 35, color: Colors.black),
                    ),
                  ],
                ),
              ),
            if (isArabic == true)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "العربية",
                      style: TextStyle(fontSize: 35, color: Colors.black),
                    ),
                    SizedBox(width: 100.w),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isArabic = false;
                        });
                      },
                      child: SizedBox(
                        child: Image.asset('assets/images/Group 2.png'),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 100.w),
                    Text(
                      "الانباطي",
                      style: TextStyle(fontSize: 35, color: Colors.black),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: Column(
                children: [
                  EnbatyScreen(
                    model: listImageResult,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: Color(0xffE1D9D0),
                    ),
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              listImageResult.clear();
                              print("close");
                              print(listImageResult.length);
                            });
                          },
                          icon: FaIcon(FontAwesomeIcons.times),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                listImageResult.removeLast();
                                print("delete");
                                print(listImageResult.length);
                              });
                            },
                            icon: FaIcon(FontAwesomeIcons.backspace)),
                        Spacer(),
                        IconButton(
                            onPressed: () async {
                              print("screen shot");
                              final image = await controller
                                  .captureFromWidget(EnbatyScreen(
                                model: listImageResult,
                              ));
                              if (image == null) return;
                              await saveImage(image);
                            },
                            icon: FaIcon(FontAwesomeIcons.camera)),
                        IconButton(
                            onPressed: () async {
                              print("screen shot");
                              final image = await controller
                                  .captureFromWidget(EnbatyScreen(
                                model: listImageResult,
                              ));
                              if (image == null) return;
                              await saveImage(image);
                              saveAndShare(image);
                            },
                            icon: FaIcon(FontAwesomeIcons.shareAltSquare)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: ArabicScreen(
                model: listImageResult,
              ),
            ),
            SizedBox(height: 30.h),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: 650.h,
                color: Color(0xffE1D9D0),
                child: GridView.extent(
                  physics: PageScrollPhysics(),
                  // physics: NeverScrollableScrollPhysics(),
                  maxCrossAxisExtent: 130.h,
                  children:
                      new List<Widget>.generate(anbatyList.length, (index) {
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
          ],
        ),
      ),
    );
  }

  Widget KeyBoardBottum(int index) {
    return Container(
        width: 20,
        height: 20,
        color: Color(0xffE1D9D0),
        child: Card(
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
        ));
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

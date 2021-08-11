import 'package:elanbatkingdom/conest.dart';
import 'package:elanbatkingdom/screens_helper/Arabic_screen.dart';
import 'package:elanbatkingdom/screens_helper/Enbaty_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      width: 40,
                      height: 40,
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
            padding: const EdgeInsets.all(17.0),
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
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              listImageResult.removeLast();
                              print("delete");
                              print(listImageResult.length);
                            });
                          },
                          icon: FaIcon(FontAwesomeIcons.backspace)),
                      IconButton(
                          onPressed: () {
                            print("screen shot");
                          },
                          icon: FaIcon(FontAwesomeIcons.copy)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: ArabicScreen(
              model: listImageResult,
            ),
          ),
          SizedBox(height: 70.h),
          Container(
            height: 650.h,
            color: Color(0xffE1D9D0),
            child: GridView.extent(
              physics: PageScrollPhysics(),
              // physics: NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 130.h,
              children: new List<Widget>.generate(anbatyList.length, (index) {
                return new GridTile(
                  child: InkWell(
                    onTap: () => onTaap(index),
                    child: KeyBoardBottum(index),
                  ),
                );
              }),
            ),
          ),
        ],
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

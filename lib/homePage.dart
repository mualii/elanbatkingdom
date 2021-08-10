import 'package:elanbatkingdom/conest.dart';
import 'package:elanbatkingdom/screens_helper/Arabic_screen.dart';
import 'package:elanbatkingdom/screens_helper/Enbaty_screen.dart';
import 'package:flutter/material.dart';

List listImageResult = [];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "العربية",
                  style: TextStyle(fontSize: 35, color: Colors.black),
                ),
                SizedBox(
                  child: Image.asset('assets/images/Group 2.png'),
                  width: 40,
                  height: 40,
                ),
                Text(
                  "الانباطي",
                  style: TextStyle(fontSize: 35, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: EnbatyScreen(
              model: listImageResult,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: ArabicScreen(
              model: listImageResult,
            ),
          ),
          Spacer(),
          Container(
            height: 235,
            color: Color(0xffE1D9D0),
            child: GridView.extent(
              physics: PageScrollPhysics(),
              // physics: NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 45,
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

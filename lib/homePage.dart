import 'package:flutter/material.dart';

List listImageResult = [];
const List anbatChak = [
  "assets/images/حرف (أ).png",
  "assets/images/حرف (ب).png",
  "assets/images/حرف (ت).png",
  "assets/images/حرف (ث).png",
  "assets/images/حرف (ج).png",
  "assets/images/حرف (ح).png",
  "assets/images/حرف (خ).png",
  "assets/images/حرف (د).png",
  "assets/images/حرف (ذ).png",
  "assets/images/حرف (ر).png",
  "assets/images/حرف (ز).png",
  "assets/images/حرف (س).png",
  "assets/images/حرف (ش).png",
  "assets/images/حرف (ص).png",
  "assets/images/حرف (ض).png",
  "assets/images/حرف (ط).png",
  "assets/images/حرف (ظ).png",
  "assets/images/حرف (ع).png",
  "assets/images/حرف (غ).png",
  "assets/images/حرف (ف).png",
  "assets/images/حرف (ق).png",
  "assets/images/حرف (ك).png",
  "assets/images/حرف (ل).png",
  "assets/images/حرف (م).png",
  "assets/images/حرف (ن).png",
  "assets/images/حرف (هـ).png",
  "assets/images/حرف (و).png",
  "assets/images/حرف (ي).png",
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int result;
  int cleck = 0;

  ontap(int i) {
    setState(() {
      // cleck++;
      // result = i;
      // print(i);
      listImageResult.add(anbatChak[i]);
      print(listImageResult.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (listImageResult.isEmpty)
            Container()
          else
            Container(
              height: 40,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buldCard1(index),
                separatorBuilder: (context, index) => SizedBox(width: 5),
                itemCount: listImageResult.length,
              ),
            ),
          Spacer(),
          Container(
            height: 240,
            color: Colors.blueGrey,
            child: GridView.extent(
              physics: PageScrollPhysics(),
              // physics: NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 60,
              children: new List<Widget>.generate(anbatChak.length, (index) {
                return new GridTile(
                  child: InkWell(
                    onTap: () => ontap(index),
                    child: new Container(
                        width: 20,
                        height: 20,
                        color: Colors.blue.shade200,
                        child: Card(
                          child: Center(
                            child: Image.asset(
                              anbatChak[index],
                            ),
                            // new Text(anbatChak[index]),
                          ),
                        )),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buldCard1(int i) {
    return Container(
      width: 50,
      height: 20,
      child: Card(
        child: Image.asset(
          listImageResult[i],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

List listImageResult = [];

List<Map> anbatyList = [
  {"anbaty": "assets/images/حرف أ.png", "arabic": "أ"},
  {"anbaty": "assets/images/حرف ال.png", "arabic": "ال"},
  {"anbaty": "assets/images/حرف لا.png", "arabic": "لا"},
  {"anbaty": "assets/images/حرف ب.png", "arabic": "ب"},
  {"anbaty": "assets/images/حرف ب2.png", "arabic": "ب"},
  {"anbaty": "assets/images/حرف ت.png", "arabic": "ت"},
  {"anbaty": "assets/images/حرف ت2.png", "arabic": "ت"},
  {"anbaty": "assets/images/حرف ث.png", "arabic": "ث"},
  {"anbaty": "assets/images/حرف ث2.png", "arabic": "ث"},
  {"anbaty": "assets/images/حرف ج.png", "arabic": "ج"},
  {"anbaty": "assets/images/حرف ح.png", "arabic": "ح"},
  {"anbaty": "assets/images/حرف ح2.png", "arabic": "ح"},
  {"anbaty": "assets/images/حرف خ.png", "arabic": "خ"},
  {"anbaty": "assets/images/حرف خ2.png", "arabic": "خ"},
  {"anbaty": "assets/images/حرف د.png", "arabic": "د"},
  {"anbaty": "assets/images/حرف ذ.png", "arabic": "ذ"},
  {"anbaty": "assets/images/حرف ر.png", "arabic": "ر"},
  {"anbaty": "assets/images/حرف ز.png", "arabic": "ز"},
  {"anbaty": "assets/images/حرف س.png", "arabic": "س"},
  {"anbaty": "assets/images/حرف ش.png", "arabic": "ش"},
  {"anbaty": "assets/images/حرف ص.png", "arabic": "ص"},
  {"anbaty": "assets/images/حرف ص2.png", "arabic": "ص"},
  {"anbaty": "assets/images/حرف ض.png", "arabic": "ض"},
  {"anbaty": "assets/images/حرف ض2.png", "arabic": "ض"},
  {"anbaty": "assets/images/حرف ط.png", "arabic": "ط"},
  {"anbaty": "assets/images/حرف ظ.png", "arabic": "ظ"},
  {"anbaty": "assets/images/حرف ع.png", "arabic": "ع"},
  {"anbaty": "assets/images/حرف ع2.png", "arabic": "غ"},
  {"anbaty": "assets/images/حرف ف.png", "arabic": "ف"},
  {"anbaty": "assets/images/حرف ف2.png", "arabic": "ف"},
  {"anbaty": "assets/images/حرف ق.png", "arabic": "ق"},
  {"anbaty": "assets/images/حرف ك.png", "arabic": "ك"},
  {"anbaty": "assets/images/حرف ك2.png", "arabic": "ك"},
  {"anbaty": "assets/images/حرف ل.png", "arabic": "ل"},
  {"anbaty": "assets/images/حرف ل2.png", "arabic": "ل"},
  {"anbaty": "assets/images/حرف م.png", "arabic": "م"},
  {"anbaty": "assets/images/حرف م2.png", "arabic": "م"},
  {"anbaty": "assets/images/حرف ن.png", "arabic": "ن"},
  {"anbaty": "assets/images/حرف ن2.png", "arabic": "ن"},
  {"anbaty": "assets/images/حرف ه.png", "arabic": "ه"},
  {"anbaty": "assets/images/حرف ه2.png", "arabic": "ه"},
  {"anbaty": "assets/images/حرف و.png", "arabic": "و"},
  {"anbaty": "assets/images/حرف و2.png", "arabic": "و"},
  {"anbaty": "assets/images/حرف ي.png", "arabic": "ي"},
];

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
      appBar: AppBar(),
      body: Column(
        children: [
          if (listImageResult.isEmpty)
            Container()
          else
            Container(
              color: Colors.orangeAccent,
              height: 200,
              width: double.infinity,
              child: GridView.extent(
                physics: PageScrollPhysics(),
                // physics: NeverScrollableScrollPhysics(),
                maxCrossAxisExtent: 60,
                children:
                    new List<Widget>.generate(listImageResult.length, (index) {
                  return new GridTile(
                    child: Container(
                        width: 20,
                        height: 20,
                        child: Card(
                          child: Center(
                            child: Image.asset(
                              listImageResult[index]["anbaty"],
                            ),
                            // new Text(anbatChak[index]),
                          ),
                        )),
                  );
                }),
              ),
            ),
          SizedBox(height: 10),
          Container(
            color: Colors.grey,
            height: 200,
            width: double.infinity,
            child: ListView(),
          ),
          Spacer(),
          Container(
            height: 240,
            color: Colors.blueGrey,
            child: GridView.extent(
              physics: PageScrollPhysics(),
              // physics: NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 60,
              children: new List<Widget>.generate(anbatyList.length, (index) {
                return new GridTile(
                  child: InkWell(
                    onTap: () => onTaap(index),
                    child: new Container(
                        width: 20,
                        height: 20,
                        color: Colors.blue.shade200,
                        child: Card(
                          child: Center(
                            child: Image.asset(
                              anbatyList[index]["anbaty"],
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
          listImageResult[i]["anbaty"],
        ),
      ),
    );
  }

  Widget buldCard2(int i) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) => Card(
        child: Image.asset(
          listImageResult[index]["anbaty"],
        ),
      ),
      itemCount: listImageResult.length,
    );
  }
}

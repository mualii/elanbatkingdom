import 'package:flutter/material.dart';

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
      height: 170,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.extent(
          physics: PageScrollPhysics(),
          // physics: NeverScrollableScrollPhysics(),
          maxCrossAxisExtent: 60,
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
                    child: Center(child: Text(model[index]["arabic"])
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

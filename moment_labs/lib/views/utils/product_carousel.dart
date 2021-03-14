/*
 * para hacer el carousel en la pagina de productos
*/

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  final List<String> imgList;
  CarouselWithIndicatorDemo({Key key, this.imgList}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState(imgList);
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final List<String> imgList;
  _CarouselWithIndicatorState(this.imgList);

  @override
  Widget build(BuildContext context) {
    final imgList = this.imgList;
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(0.0),
                child: ClipRRect(
                    //borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.contain, width: 1000.0),
                  ],
                )),
              ),
            ))
        .toList();

    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 1,
            aspectRatio: 3 / 3,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int index = imgList.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Color.fromRGBO(0, 0, 0, 1.0)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

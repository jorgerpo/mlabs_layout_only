import 'package:MomentLabs/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:MomentLabs/views/utils/product_carousel.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarouselPrincipal(),
    );
  }
}

class CarouselPrincipal extends StatelessWidget {
  final List<String> imgList = [
    'assets/products/baby-album_1.jpg',
    'assets/products/baby-album_2.jpg',
    'assets/products/baby-album_3.jpg',
  ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //appBar: AppBar(title: Text('Carousel with indicator demo')),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CarouselWithIndicatorDemo(imgList: imgList),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Album Bebé',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24.0,
                      )),
                  SizedBox(height: 12.0),
                  Text(
                    '\$ 12.500',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    "Un album de tapa blanda y brillante. Podrás elegir entre 3 colores Azul, Rosa y Amarillo",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.local_shipping,
                        size: 46.0,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Entrega estándar',
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '7-10 días',
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '\$ 7.600',
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.airplanemode_active,
                        size: 46.0,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Entrega inmediata'),
                          Text('\$ 11.900'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(child: ExpansionTile(title: Text('Detalles del producto')))
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {},
          color: Colors.pink[300],
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text('Crear'),
        ),
      ),
    );
  }
}

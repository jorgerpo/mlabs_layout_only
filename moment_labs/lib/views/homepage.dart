import '../utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/category_data.dart';
import '../models/product_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final datos = categoryData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moments Labs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Moments Lab', datos: datos),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.datos}) : super(key: key);

  final String title;
  final datos;

  @override
  _MyHomePageState createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  _MyHomePageState(this.categoryData);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: KLilaColor,
          title: Center(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'AmaticSC',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: categoryList(),
              ),
              productListView(),
              Text(
                '',
              ),
              Text(
                '$_counter',
                //style: Theme.of(context).textTheme.headline4,
                style: TextStyle(fontSize: 2),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen[400],
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  final List<String> _items = [
    'hola',
    'care',
    'pingüino',
    'bien',
    'o qué?',
    'jeje',
    'calidoso',
    'parcerísimo',
    'llavería',
    'pareceriwafer',
    'como vas?'
  ];

  productListView() {
    //debugPrint(productList.toString());

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,

            //width: MediaQuery.of(context).size.width,
            width: 240,
            padding: EdgeInsets.only(left: 30.0),
            child: Card(
              elevation: 2,
              color: Colors.white,
              child: Expanded(
                child: Column(
                  children: [
                    Text(
                      productList[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        fontFamily: 'AmaticSC',
                        letterSpacing: 4,
                        color: Colors.deepPurple[700],
                      ),
                    ),
                    Image.asset(
                      productList[index].imageLocation,
                      height: 150,
                      width: 240,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      width: 240,
                      child: Text(
                        productList[index].description,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  final categoryData;

  categoryList() {
    return SizedBox(
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            //itemCount: _items.length,
            itemCount: widget.datos.length,
            itemBuilder: (context, index) {
              return Card(
                color: KLilaColor,
                //  child: Text(_items[index]),
                child: SizedBox(
                    width: 120,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        widget.datos[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    )),
              );
            }));
  }
}

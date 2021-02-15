import 'package:MomentLabs/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/category_data.dart';

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
              Text(
                'Número total de clics :',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
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

  final categoryData;

  categoryList() {
    print(widget.datos[1].name);
    print(widget.datos[1].description);

    return SizedBox(
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Card(
                color: KLilaColor,
                child: Text(_items[index]),
              );
            }));
  }
}

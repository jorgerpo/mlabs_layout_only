import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPicture extends StatefulWidget {
  UploadPicture({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UploadPictureState createState() => new _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  @override
  Widget build(BuildContext context) {
    const double _appBarHeight = 256.0;
    return Scaffold(
        body: Center(
            child: RaisedButton(
      child: Text('Tap'),
      onPressed: () {
        _showOptions(context);
      },
    )));
  }

  Future<void> _showOptions(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  RaisedButton(
                    child: new Text('Escoge tu foto'),
                    onPressed: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<File> openCamera() async {
    File _image;
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    //print('PickedFile: ${pickedFile.toString()}');
    //print('PickedFile path: ${pickedFile.path.toString()}');

    setState(() {
      _image = File(pickedFile.path);
    });
    if (_image != null) {
      return _image;
    }
    return null;
  }
}

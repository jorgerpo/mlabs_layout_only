import 'package:flutter/material.dart';

class UploadPicture extends StatefulWidget {
  UploadPicture({Key key}) : super(key: key);

  @override
  _UploadPictureState createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (Text('aca se sube la foto')),
      ),
    );
  }
}

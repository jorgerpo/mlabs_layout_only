import 'package:MomentLabs/views/upload.dart';
import 'package:flutter/material.dart';

class PreUploadInfo extends StatelessWidget {
  const PreUploadInfo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[600],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(50),
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Sube Tu Foto!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Colors.teal),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.add_photo_alternate,
                  size: 48,
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  '1.Selecciona tus fotos \n a continuación',
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.photo_library_outlined,
                  size: 48,
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  '2.Tus fotos se ubicarán \n automáticamente',
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                )
              ],
            )
          ]),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadPicture()),
              );
            },
            color: Colors.teal,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Seleccionar Foto',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}

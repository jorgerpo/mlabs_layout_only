import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginWithFacebook extends StatefulWidget {
  @override
  _LoginWithFacebookState createState() => _LoginWithFacebookState();
}

class _LoginWithFacebookState extends State<LoginWithFacebook> {
  bool isSignIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  String photoUrl;
  FacebookLogin facebookLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mlabs"),
      ),
      body: isSignIn
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    //backgroundImage: NetworkImage(photoUrl),
                    backgroundImage: NetworkImage(_user.photoURL),
                  ),
                  Text(
                    _user.displayName ?? 'nombre',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    _user.email ?? _user.providerData.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      gooleSignout();
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: OutlinedButton(
                onPressed: () async {
                  await handleLogin();
                },
                child: Text(
                  "Login with facebook",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
    );
  }

  Future<void> handleLogin() async {
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          await loginWithfacebook(result);
        } catch (e) {
          print(e);
        }
        break;
    }
  }

  Future loginWithfacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    setState(() {
      isSignIn = true;
      _user = a.user;
// debug:
      String photoUrl =
          _user.photoURL + "?height=500&access_token=" + accessToken.token;

      print('usuario :');
      debugPrint(_user.toString());
      print(_user.runtimeType);
    });
  }

  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      setState(() {
        facebookLogin.logOut();
        isSignIn = false;
      });
    });
  }
}
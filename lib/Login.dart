import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'Home.dart';

class Login extends StatelessWidget {
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment(-.4, 0),
              image: NetworkImage(
                  'https://image.freepik.com/free-photo/rusty-metallic-wall-background-yellow-old-paint_23-2148742531.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Popcorn",
                style: TextStyle(
                    fontSize: 55.0,
                    color: Colors.white,
                    height: 5,
                    fontStyle: FontStyle.italic),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://image.freepik.com/free-vector/realistic-popcorn-bucket_98292-1416.jpg"),
                radius: 60.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              FlatButton(child: Text("login",style: TextStyle(color: Colors.white),),onPressed: () async {
                             final FacebookLoginResult result =
                             await facebookSignIn.logIn(['email']);
                             switch (result.status) {
                             case FacebookLoginStatus.loggedIn:
                             final FacebookAccessToken accessToken = result.accessToken;
             print('''
               Logged in!

                Token: ${accessToken.token}
                User id: ${accessToken.userId}
                Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
    break;
    case FacebookLoginStatus.cancelledByUser:
    print('Login cancelled by the user.');
    break;
    case FacebookLoginStatus.error:
    print('Something went wrong with the login process.\n'
    'Here\'s the error Facebook gave us: ${result.errorMessage}');
    break;

    }
              },
              )
                ],
                )
              ),
          ),
    );
  }
}



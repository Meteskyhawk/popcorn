import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'Home.dart';

class Login extends StatelessWidget {
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
              SignInButton(
                Buttons.Facebook,
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



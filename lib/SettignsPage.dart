import 'package:flutter/material.dart';
import 'package:popcorn/Home.dart';



class SettingsPage extends StatelessWidget {
   final TextStyle whiteText = TextStyle(
    color: Colors.black,
  );
  final TextStyle greyTExt = TextStyle(
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade400,
      body: Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.light,
          primaryColor: Colors.purple,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),

                Row(
                  children: <Widget>[
                  IconButton(
                  icon: new Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () { Navigator.push (context,
                  MaterialPageRoute(builder: (context) => Home()));
                  },
              ),
                    Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                        image: NetworkImage('https://i.ibb.co/vcs5cwQ/2843832.jpg'),
                        fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Popcorn",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            "Uk",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  title: Text(
                    "Languages",
                  ),
                  subtitle: Text(
                    "English UK",
                    style: greyTExt,
                  ),  
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Profile Settings",
                  ),
                  subtitle: Text(
                    "Popcorn  ",
                    style: greyTExt,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
                SwitchListTile(
                  title: Text(
                    "Email Notifications",

                  ),
                  subtitle: Text(
                    "On",
                    style: greyTExt,
                  ),
                  value: true,
                  onChanged: (val) {},
                ),
                SwitchListTile(
                  title: Text(
                    "Push Notifications",

                  ),
                  subtitle: Text(
                    "Off",
                    style: greyTExt,
                  ),
                  value: false,
                  onChanged: (val) {},
                ),
                ListTile(
                  title: Text(
                    "Logout",
                  ),
                  onTap: () => {

                  },
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
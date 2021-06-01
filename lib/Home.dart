import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:http/http.dart' as http;
import 'package:popcorn/Profile.dart';
import 'package:popcorn/SettignsPage.dart';
import 'package:popcorn/loadData.dart';
import 'package:popcorn/loadDataV2.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:popcorn/main.dart';

int sayac = 0;
Future<LoadDataV2> apiCall() async {
  int rand;
  print('x1: ${sayac}');
  if (sayac % 3 == 0) {
    print('x: ${sayac}');
    var rng = new Random();
    rand = rng.nextInt(9999);
    print('random: ${rand}');
    final response = await http.get(
        "https://api.themoviedb.org/3/movie/${rand}?api_key=df3c4f9f765b525413d4a0ff4705b9b1");
    if (response.statusCode == 200) {
      sayac++;
      return LoadDataV2.fromJson(json.decode(response.body));
    } else {}
  } else {
    sayac++;
  }
}

/*
class ImdbPage extends StatefulWidget{
  ImdbPage({Key key, this.title}):super(key: key);
  final String title;

 _ImdbPageState createState() =>_ImdbPageState();
}
class _ImdbPageState extends State<ImdbPage>{
  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder<LoadData>(
        future: apiCall(),
        builder: (context,snapshot){
          if(snapshot.hasData){
          return Container(child: Center(
            child: Text(
              snapshot.data.title
            ),
          ),
          );
          }else{
            return Center(child:CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
*/
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Popcorn",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber.shade400,
      ),
      home: Flutter_Swiper(),
    );
  }
}
<<<<<<< Updated upstream
class Flutter_Swiper extends StatefulWidget {
=======
class Tinderswiper extends StatefulWidget {
>>>>>>> Stashed changes
  @override
  _Flutter_SwiperState createState() => _Flutter_SwiperState();
}
class _Flutter_SwiperState extends State<Flutter_Swiper>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popcorn"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.black87,
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SettingsPage())),
          ),
          SizedBox(height: 6.0),
          IconButton(
            icon: new Icon(Icons.account_box_sharp),
            color: Colors.black,
            onPressed: () { Navigator.push (context,
                MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
        ],
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.not_interested, size: 55),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_sharp, size: 55),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(55.0),
            child: Swiper(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Card(
                child: FutureBuilder<LoadDataV2>(
                  future: apiCall(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(children: <Widget>[
                        Center(
                          child: Text(
                         '\n${snapshot.data.title}'
                         '\nPopularity: ${snapshot.data.popularity}'
                         '\nGenres: ${snapshot.data.genres}',
                          style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${snapshot.data.poster_path}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

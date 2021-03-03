import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:http/http.dart' as http;
import 'package:popcorn/loadData.dart';


Future<LoadData> apiCall() async{
  final response = await http.get("https://www.omdbapi.com/?apikey=9f2b5808&t=as");
  if (response.statusCode==200){
    return LoadData.fromJson(json.decode(response.body));
  }else{
    throw Exception('Bir Hata Meydan Geldi');
  }
}

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


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Popcorn",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: ImdbPage(),
    );
  }
}

class Tinderswiper extends StatefulWidget {
  @override
  _TinderswiperState createState() => _TinderswiperState();
}

class _TinderswiperState extends State<Tinderswiper>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> tinderimages = [
    "assets/images/1.jpeg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popcorn"),
        actions: <Widget>[
          Icon(
            Icons.account_circle,
            size: 55.0,
          ),
          Icon(
            Icons.menu,
            size: 55.0,
          ),
        ],
        backgroundColor: Colors.yellow,
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
          height: MediaQuery.of(context).size.height * 0.6,
          child: TinderSwapCard(
            orientation: AmassOrientation.TOP,
            totalNum: 4,
            stackNum: 3,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) => Card(
              child: Padding(
                padding: EdgeInsets.all(55.0),
                child: Image.asset(
                  '${tinderimages[index]}',
                  fit: BoxFit.fill,
                ),
              ),
              elevation: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}

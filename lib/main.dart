import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class News {
  String id;
  String url;
  String publisher;
  String author;
  String title;
  String text;
  String image;
  String date;

  News(this.id, this.url, this.publisher, this.author, this.title, this.text, this.image, this.date);

  News.fromJson(Map<String, dynamic> json){
    id = json['id'];
    url = json['url'];
    publisher = json['publisher'];
    author = json['author'];
    title = json['title'];
    text = json['text'];
    image = json['image'];
    date = json['date'];
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(97),
          child: Column(
            children: <Widget>[
              Container(
                child: AppBar(
                  title: Text(
                    'News',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

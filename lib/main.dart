import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  News(this.id, this.url, this.publisher, this.author, this.title, this.text,
      this.image, this.date);

  News.fromJson(Map<String, dynamic> json) {
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
  static List<News> _news = List<News>();
  static List<News> _newsInApp = List<News>();

  Future<List<News>> incomingNews() async {
    var url = 'http://www.mocky.io/v2/5ecfddf13200006600e3d6d0';
    var responce = await http.get(url);
    var news = List<News>();

    if (responce.statusCode == 200) {
      var notesJson = json.decode(responce.body);
      for (var noteJson in notesJson) {
        news.add(News.fromJson(noteJson));
      }
    }
    return news;
  }

  @override
  void initState() {
    incomingNews().then((value) {
      setState(() {
        _news.addAll(value);
        _newsInApp = _news;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(97),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                      width: 0.5,
                      color: Colors.white,
                    ))),
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _listItem(index);
        },
        itemCount: _newsInApp.length,
      ),
    );
  }

  _listItem(index) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 15, top: 1, bottom: 1, right: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  _newsInApp[index].title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
              Container(
                height: 50,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    iconSize: 16,
                    color: Colors.black26,
                    alignment: Alignment.bottomCenter,
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) {})),
                  ),
                ),
              )
            ],
          ),
          Text(
            _newsInApp[index].publisher,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 17,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0, bottom: 0),
            child: Divider(
              color: Colors.black12,
            ),
          )
        ],
      ),
    )
        // child: Column(children: <Widget>[]),
        );
  }
}

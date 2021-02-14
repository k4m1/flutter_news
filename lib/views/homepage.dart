import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text("Flutter"),
             Text("News", style: TextStyle(
               color: Colors.blue
             ),)
           ],
         ),
         centerTitle: true,
         elevation: 0.0,
       ),
       body: Container(
         child: ,
       ),
    );
  }
}

class CategoryTile extends StatelessWidget {

  final imageURL, categoryName;
  CategoryTile({this.imageURL, this.categoryName})
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget[
          Image.network(imageURL, width: 120, height: 60,),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/models/category_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = new List<CategoryModel>();
  @override
  //implement init state TODO
  void initState() { 
    super.initState();
    categories = getCategories();
  }
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
         child: Column(
           children: <Widget>[
             Container(
               child: ListView.builder(
                 itemCount: categories.length,
                 itemBuilder: (context, index){
                   return CategoryTile(
                     imageURL: categories[index].imageUrl,
                     categoryName: categories[index].categoryName,
                   )
                 },
               ),
             )
           ],
         ),
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
        children: <Widget>[
          Image.network(imageURL, width: 120, height: 60,),
        ],
      ),
    );
  }
}
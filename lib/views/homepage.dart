import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/views/article_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
    bool _loading = true;
  @override
  //implement init state TODO
  void initState() { 
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
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
       body: _loading ? Center(
         child: Container(
           child: CircularProgressIndicator(),
         ),
       ) : Container(
         child: Column(
           children: <Widget>[

             // *categories*
             Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
               height: 70,
               child: ListView.builder(
                 itemCount: categories.length,
                 scrollDirection: Axis.horizontal,
                 shrinkWrap: true,
                 itemBuilder: (context, index){
                   return CategoryTile(
                     imageURL: categories[index].imageUrl,
                     categoryName: categories[index].categoryName,
                   );
                   }),
             ),

            //  *news tiles*
            Container(
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return NewsTile(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description);
                }),
            ),
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
    return GestureDetector(
      onTap: (){

      },
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageURL, width: 120, height: 60, fit: BoxFit.cover,)),
          Container(
            alignment: Alignment.center,
            width: 120, height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            color: Colors.black26,
            ),
            child: Text(categoryName, style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
          )
        ],
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imageUrl, title, desc;
  NewsTile({@required this.imageUrl, @required this.title, @required this.desc})

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Text(title),
          Text(desc),
        ],),
    );
  }
}
import 'dart:convert';

import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3bc9ab9251da4938a0a29ded1fe8a9f0";

    var responce = await http.get(url);

    var jsonData = jsonDecode(responce);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              publishedAt: element["publishedAt"],
              content: element["content"]);

          news.add(articleModel);
          
        }
      });
    }
  }
}

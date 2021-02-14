import 'package:flutter_news/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  // bussiness
  categoryModel.categoryName = Bussiness;
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1519748174344-16e5d53bda7a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
}

import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(CategoryModel(
      name: 'Salad',
      iconPath: 'assets/icons/salad.svg',
      boxColor: Color(0xff92a3fd),
    ));

    categories.add(CategoryModel(
      name: 'Cake',
      iconPath: 'assets/icons/cake.svg',
      boxColor: Color(0xffed92fd),
    ));

    categories.add(CategoryModel(
      name: 'Pie',
      iconPath: 'assets/icons/pie.svg',
      boxColor: Color(0xff92a3fd),
    ));

    categories.add(CategoryModel(
      name: 'Smoothies',
      iconPath: 'assets/icons/smoothies.svg',
      boxColor: Color(0xffed92fd),
    ));

    return categories;
  }
}

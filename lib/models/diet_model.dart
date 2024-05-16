import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.viewIsSelected,
      required this.boxColor});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];
    diets.add(DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/salad.svg',
        level: 'Easy',
        duration: '30mins',
        calorie: '100kcal',
        boxColor: Color(0xFFD3B830),
        viewIsSelected: true));
    diets.add(DietModel(
        name: 'Cupcake',
        iconPath: 'assets/icons/cake.svg',
        level: 'Easy',
        duration: '30mins',
        boxColor: Color(0xFFD33030),
        calorie: '100kcal',
        viewIsSelected: true));
    diets.add(DietModel(
        name: 'juices',
        iconPath: 'assets/icons/smoothies.svg',
        level: 'Easy',
        duration: '30mins',
        calorie: '100kcal',
        boxColor: Color(0x44444444),
        viewIsSelected: true));

    return diets;
  }
}

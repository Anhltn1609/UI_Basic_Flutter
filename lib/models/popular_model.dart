class PopularModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxSelected;

  PopularModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxSelected});

  static List<PopularModel> getpopularDiets() {
    List<PopularModel> popularDiets = [];
    popularDiets.add(PopularModel(
        name: 'blueberry pancake',
        iconPath: 'assets/icons/cake.svg',
        level: 'easy',
        duration: '3 months',
        calorie: '300calories',
        boxSelected: false));

    popularDiets.add(PopularModel(
        name: 'smoothies',
        iconPath: 'assets/icons/smoothies.svg',
        level: 'easy',
        duration: '3 months',
        calorie: '300calories',
        boxSelected: false));
    return popularDiets;
  }
}

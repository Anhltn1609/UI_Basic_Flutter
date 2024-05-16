// stateless widget : widget
// statefull widget : widget + state

import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularModel> popularModel = [];

  void _getInitialInfor() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularModel = PopularModel.getpopularDiets();
  }

  @override
  void initState() {
    _getInitialInfor();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfor();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          SizedBox(height: 40),
          _categoriesSection(),
          SizedBox(height: 40),
          _dietSection(),
          _popularSection(),
        ],
      ),
    );
  }

  Column _popularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),
        ),
        SizedBox(height: 15),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      popularModel[index].iconPath,
                      width: 65,
                      height: 65,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularModel[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          popularModel[index].level +
                              '|' +
                              popularModel[index].duration +
                              '|' +
                              popularModel[index].calorie,
                          style: TextStyle(
                            color: Color(0x04040404),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          popularModel[index].boxSelected =
                              !popularModel[index].boxSelected;
                        });
                        print(
                            '${popularModel[index].boxSelected} : ${popularModel[index].name}');
                      },
                      child: SvgPicture.asset(
                        'assets/icons/vector.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: popularModel[index].boxSelected
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: popularModel[index].boxSelected
                        ? [
                            BoxShadow(
                                color: Color(0xffd1617).withOpacity(0.07),
                                offset: Offset(0, 10),
                                blurRadius: 40,
                                spreadRadius: 0)
                          ]
                        : []),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 25,
                ),
            itemCount: popularModel.length)
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].boxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: SvgPicture.asset(diets[index].iconPath),
                      ),
                      Text(
                        diets[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        diets[index].level +
                            '|' +
                            diets[index].duration +
                            '|' +
                            diets[index].calorie,
                        style: TextStyle(
                            color: Color(0xff786F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xff9dceff),
                            Color(0xff92A3Fd),
                          ]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      )
                    ],
                  ));
            },
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath)),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff1d1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search Pancake',
            hintStyle: TextStyle(
              color: Color(0xffdddada),
              fontSize: 14,
            ),
            prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/search.svg')),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                            'assets/icons/adjustments-horizontal.svg')),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Breakfast',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/chevron-left.svg',
              height: 20, width: 20),
          decoration: BoxDecoration(
              color: Color(0xffF7f8f8),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset('assets/icons/line-dashed.svg',
                height: 20, width: 20),
            decoration: BoxDecoration(
                color: Color(0xffF7f8f8),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
// scaffold : appbar, drawer, snack bar, float act
}

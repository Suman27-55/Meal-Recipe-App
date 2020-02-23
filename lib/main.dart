import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:point_4/screen/meal_detail_screen.dart';
import 'package:point_4/screen/tabs_screen.dart';
import './screen/category_meals_screen.dart';
import './screen/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.cyan,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
            title: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24),),
      ),
      home:TabsScreen(),
      routes: {CategoryMealsScreen.namedRoute:(ctx){
        return CategoryMealsScreen();
      },MealDetailScreen.namedRoute: (ctx)=> MealDetailScreen()}
    );
  }
}

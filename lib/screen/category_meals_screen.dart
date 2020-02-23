import 'package:flutter/material.dart';
import 'package:point_4/dummy-data.dart';
import '../items/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const namedRoute = 'category-meals';
  //final String categoryId;
  //final String categoryTitle;

  //CategoryMealsScreen(this.categoryId,this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration,
                imageUrl: categoryMeals[index].imageUrl,
                title: categoryMeals[index].title,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}

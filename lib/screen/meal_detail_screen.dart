import 'package:flutter/material.dart';
import '../dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const namedRoute = '/meal-detail-screen';

  Widget buildSectionTitle(BuildContext context, title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildBodyContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meals) => meals.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildBodyContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildBodyContainer(ListView.builder(
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${(index + 1)}'),
                ),
                title: Text(selectedMeal.steps[index]),
              ),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/IMeal.dart';

class MealDetail extends StatelessWidget {
  final IMeal meal;
  final Function toggleFavoriteMeal;
  final Function isMealFavorited;

  const MealDetail(this.meal, this.toggleFavoriteMeal, this.isMealFavorited,
      {super.key});

  Widget sectionTitleBuilder(BuildContext ctx, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(ctx).primaryTextTheme.titleSmall,
      ),
    );
  }

  Widget sectionListBuilder(Widget listViewBuilder) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: 300,
      height: 200,
      child: listViewBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          sectionTitleBuilder(context, 'Ingredients'),
          sectionListBuilder(ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    meal.ingredients[index],
                  ),
                ),
              );
            },
            itemCount: meal.ingredients.length,
          )),
          sectionTitleBuilder(context, 'Steps'),
          sectionListBuilder(ListView.builder(
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '#${index + 1}',
                  ),
                ),
                title: Text(meal.steps[index]),
              );
            },
            itemCount: meal.steps.length,
          ))
        ],
      ),
    );
  }
}

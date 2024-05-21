import 'package:flutter/material.dart';


class recipeProducts extends StatelessWidget {
  final List<Map<String, dynamic>> recipes;

  recipeProducts({required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Label: ${recipes[index]['label']}'),
                  Text('Ingredients: ${recipes[index]['ingredientLines'].join(', ')}'),
                  Text('Calories: ${recipes[index]['calories']}'),
                  Text('Yield: ${recipes[index]['yield']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

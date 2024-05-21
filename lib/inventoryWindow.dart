import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'recipeProducts.dart';

Future<List<Map<String, dynamic>>> getProductList() async {
  final prefs = await SharedPreferences.getInstance();
  String productsString = prefs.getString('products') ?? '[]';
  List<dynamic> productsJson = jsonDecode(productsString);
  return List<Map<String, dynamic>>.from(productsJson);
}

Future<List<Map<String, dynamic>>> fetchRecipes(List<String> productTitles) async {
  String query = productTitles.join(',');
  var url = Uri.parse('https://api.edamam.com/search?q=$query&app_id=c495d092&app_key=e2e44591203a2bda59dcd33d8df357c2');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    return jsonResponse['hits'].map((hit) => hit['recipe']).toList();
  } else {
    throw Exception('Failed to load recipes');
  }
}

Future<void> deleteProduct(String title) async {
  final prefs = await SharedPreferences.getInstance();
  List<Map<String, dynamic>> products = await getProductList();
  products.removeWhere((product) => product['title'] == title);
  prefs.setString('products', jsonEncode(products));
}


class inventoryWindow extends StatelessWidget {
  Future<List<Map<String, dynamic>>> productFuture = getProductList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: productFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Column(
                            children: snapshot.data?.map((product) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Text('Title: ${product['title']}\nDescription: ${product['description']}'),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      deleteProduct(product['title']);
                                    },
                                  ),
                                ],
                              );
                            }).toList() ?? [],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 90.0,  // Cambia esto a la altura que desees
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTap: () async {
                  // Obtén los títulos de tus productos
                  List<Map<String, dynamic>> products = await getProductList();
                  List<String> productTitles = products.map((product) => product['title'] as String).toList();
                  print(productTitles);
                  // Haz la solicitud a la API con los títulos de los productos
                  String query = productTitles.join(',');
                  var url = Uri.parse('https://api.edamam.com/search?q=$query&app_id=c495d092&app_key=e2e44591203a2bda59dcd33d8df357c2');
                  var response = await http.get(url);
                  if (response.statusCode == 200) {
                    var jsonResponse = jsonDecode(response.body);
                    List<Map<String, dynamic>> recipes = jsonResponse['hits'].map<Map<String, dynamic>>((hit) => hit['recipe'] as Map<String, dynamic>).toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => recipeProducts(recipes: recipes)),
                    );
                  } else {
                    throw Exception('Failed to load recipes');
                  }
                },
                child: Container(
                  width: constraints.maxWidth,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6996),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: Offset(-3, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text('Buscar recetas',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 27,
                            fontFamily: 'Lemonr',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'pattern_detail_page.dart'; // Asegúrate de que este archivo existe en lib/pages/
import './widget/category_tile.dart';
 // Asegúrate de que este archivo existe en lib/widgets/

class CategoriesPage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Flores', 'image': 'https://example.com/flores.png'},
    {'name': 'Animales', 'image': 'https://example.com/animales.png'},
    {'name': 'Geométricos', 'image': 'https://example.com/geometricos.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías de Bordados'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryTile(
            name: category['name']!,
            imageUrl: category['image']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatternDetailPage(categoryName: category['name']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

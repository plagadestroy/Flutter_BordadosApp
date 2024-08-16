import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PatternDetailPage extends StatelessWidget {
  final String categoryName;

  PatternDetailPage({required this.categoryName, Key? key}) : super(key: key);

  final List<Map<String, String>> patterns = [
    {'name': 'Patrón A', 'url': 'https://example.com/patron_a.zip'},
    {'name': 'Patrón B', 'url': 'https://example.com/patron_b.zip'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrones de $categoryName'),
      ),
      body: ListView.builder(
        itemCount: patterns.length,
        itemBuilder: (context, index) {
          final pattern = patterns[index];
          return ListTile(
            title: Text(pattern['name']!),
            trailing: IconButton(
              icon: Icon(Icons.download),
              onPressed: () async {
                if (await canLaunch(pattern['url']!)) {
                  await launch(pattern['url']!);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('No se pudo descargar el archivo')),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  CategoryTile({
    required this.name,
    required this.imageUrl,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(name),
      onTap: onTap,
    );
  }
}

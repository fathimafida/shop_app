import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/home/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });
  final CategoryItem category;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 70,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: DecorationImage(
                  image: AssetImage(category.image), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(category.title)
      ],
    );
  }
}

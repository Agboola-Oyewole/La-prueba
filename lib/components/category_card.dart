import 'package:flutter/material.dart';
import 'package:la_prueba/components/properties_dropdown.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.imageSrc, required this.name});

  final String name;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: const Color(0xff40534C),
              context: context,
              builder: (BuildContext context) =>
                  PropertiesDropdown(categoryName: name));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 130,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.network(
                  imageSrc,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              textAlign: TextAlign.center, // Ensure text is centered
              style: const TextStyle(
                color: Color(0xffD6BD98),
                fontWeight: FontWeight.w900,
                fontSize: 18.0,
              ),
            )
          ],
        ));
  }
}

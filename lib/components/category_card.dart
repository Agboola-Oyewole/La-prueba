import 'package:flutter/material.dart';
import 'package:la_prueba/components/properties_dropdown.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.icon, required this.name});

  final String name;
  final IconData icon;

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
        child: Container(
          height: 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              color: Color(0xffD8D2C2)),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    color: Color(0xffD6BD98)),
                padding: const EdgeInsets.all(13.0),
                child: Icon(
                  icon,
                  color: Colors.black,
                  size: 25.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w900, fontSize: 20.0),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

import '../components/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, int> triviaCategories = {
      'General Knowledge': 9,
      'Books': 10,
      'Film': 11,
      'Music': 12,
      'Musicals & Theatres': 13,
      'Television': 14,
      'Video Games': 15,
      'Board Games': 16,
      'Science & Nature': 17,
      'Science: Computers': 18,
      'Science: Mathematics': 19,
      'Mythology': 20,
      'Sports': 21,
      'Geography': 22,
      'History': 23,
      'Politics': 24,
      'Art': 25,
      'Celebrities': 26,
      'Animals': 27,
      'Vehicles': 28,
      'Comics': 29,
      'Science: Gadgets': 30,
      'Japanese Anime & Manga': 31,
      'Cartoon & Animations': 32,
    };

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff1A3636),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 23.0),
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      color: Color(0xffD6BD98)),
                  padding: const EdgeInsets.all(10.0),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Let's start your quiz",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0),
            ),
            const SizedBox(height: 25),
            const Text(
              "Explore Categories",
              style: TextStyle(
                  color: Color(0xffD6BD98),
                  fontWeight: FontWeight.w900,
                  fontSize: 23.0),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 50.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio:
                      3 / 4, // Adjust this to change card size ratio
                ),
                itemCount: triviaCategories.length,
                itemBuilder: (context, index) {
                  String categoryName = triviaCategories.keys.elementAt(index);
                  return CategoryCard(
                    imageSrc:
                        "https://i.pinimg.com/564x/21/8a/24/218a24c8599306dc86e0855b644eb358.jpg",
                    // Use real image URLs for each category
                    name: categoryName,
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

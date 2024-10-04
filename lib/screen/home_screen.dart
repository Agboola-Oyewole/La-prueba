import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> triviaCategories = {
      'General Knowledge': FontAwesomeIcons.book,
      'Books': FontAwesomeIcons.bookOpen,
      'Film': FontAwesomeIcons.film,
      'Music': FontAwesomeIcons.music,
      'Musicals & Theatres': FontAwesomeIcons.masksTheater,
      'Television': FontAwesomeIcons.tv,
      'Video Games': FontAwesomeIcons.gamepad,
      'Board Games': FontAwesomeIcons.chessBoard,
      'Science & Nature': FontAwesomeIcons.tree,
      'Science: Computers': FontAwesomeIcons.computer,
      'Science: Mathematics': FontAwesomeIcons.divide,
      'Mythology': FontAwesomeIcons.timeline,
      'Sports': FontAwesomeIcons.football,
      'Geography': FontAwesomeIcons.mapLocation,
      'History': FontAwesomeIcons.clockRotateLeft,
      'Politics': FontAwesomeIcons.houseFlag,
      'Art': FontAwesomeIcons.artstation,
      'Celebrities': FontAwesomeIcons.moneyBill,
      'Animals': FontAwesomeIcons.dog,
      'Vehicles': FontAwesomeIcons.car,
      'Comics': FontAwesomeIcons.bookSkull,
      'Science: Gadgets': FontAwesomeIcons.fan,
      'Anime & Manga': FontAwesomeIcons.bookSkull,
      'Cartoon & Animations': FontAwesomeIcons.tv,
    };

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff1A3636),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
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
                      'TriviaRush',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 25.0),
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
              height: 15.0,
            ),
            const Text(
              "Let's start your quiz!",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0),
            ),
            const SizedBox(height: 20),
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
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio:
                      4 / 4, // Adjust this to change card size ratio
                ),
                itemCount: triviaCategories.length,
                itemBuilder: (context, index) {
                  String categoryName = triviaCategories.keys.elementAt(index);
                  IconData icons = triviaCategories.values.elementAt(index);
                  return CategoryCard(
                    icon: icons,
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

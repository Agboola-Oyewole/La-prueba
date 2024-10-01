import 'package:flutter/material.dart';

import '../components/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      'Oyewole Agboola',
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

            // TextField(
            //   cursorColor: Colors.black,
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: Colors.white,
            //     // Background color for the text field
            //     hintText: 'Search by quiz categories',
            //     // Placeholder text
            //     prefixIcon: const Padding(
            //       padding: EdgeInsets.only(left: 10.0),
            //       child: Icon(
            //         Icons.search, // The search icon
            //         color: Colors.black,
            //       ),
            //     ),
            //     contentPadding: const EdgeInsets.symmetric(vertical: 20),
            //     // Adjust padding inside the text field
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(30.0),
            //       // Rounded corners
            //       borderSide: BorderSide.none, // No visible border
            //     ),
            //     hintStyle: const TextStyle(
            //       color: Colors.black, // Color for the hint text
            //     ),
            //   ),
            //   style: const TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.w900,
            //       fontSize: 18.0),
            // ),
            const SizedBox(height: 30),
            const Text(
              "Explore Categories",
              style: TextStyle(
                  color: Color(0xffD6BD98),
                  fontWeight: FontWeight.w900,
                  fontSize: 23.0),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryCard(
                  imageSrc:
                      'https://i.pinimg.com/474x/e5/bc/7b/e5bc7b7b387f4a7d833633248b190939.jpg',
                  name: 'Film',
                ),
                SizedBox(
                  width: 20.0,
                ),
                CategoryCard(
                  imageSrc:
                      "https://i.pinimg.com/originals/9b/ed/56/9bed5665dfd4762a32788d40379eb019.gif",
                  name: "Music",
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryCard(
                  imageSrc:
                      "https://i.pinimg.com/474x/56/27/ea/5627ea13f97055cd12d555339c4dd726.jpg",
                  name: "Nature",
                ),
                SizedBox(
                  width: 20.0,
                ),
                CategoryCard(
                  imageSrc:
                      "https://i.pinimg.com/474x/2f/47/62/2f4762d4be0f5f6ac21359046fe6d424.jpg",
                  name: "Sports",
                )
              ],
            ),
            const SizedBox(height: 40.0),
            const Center(
              child: Text(
                "View All",
                style: TextStyle(
                    color: Color(0xffD6BD98),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

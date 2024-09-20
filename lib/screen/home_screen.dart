import 'package:flutter/material.dart';

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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      color: Color(0xffD6BD98)),
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Let's start your quiz",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD6BD98),
                // Background color for the text field
                hintText: 'Search by quiz categories',
                // Placeholder text
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.search, // The search icon
                    color: Colors.black,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                // Adjust padding inside the text field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  // Rounded corners
                  borderSide: BorderSide.none, // No visible border
                ),
                hintStyle: TextStyle(
                  color: Colors.black, // Color for the hint text
                ),
              ),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18.0),
            ),
            SizedBox(height: 30),
            Text(
              "Explore Categories",
              style: TextStyle(
                  color: Color(0xffD6BD98),
                  fontWeight: FontWeight.w900,
                  fontSize: 23.0),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: ClipRRect(
                          // To make sure the image respects the border radius
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'https://i.pinimg.com/474x/e5/bc/7b/e5bc7b7b387f4a7d833633248b190939.jpg',
                            fit: BoxFit.cover,
                            // Ensures the image covers the container
                            alignment: Alignment.center, // Centers the image
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Film",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: ClipRRect(
                          // To make sure the image respects the border radius
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'https://i.pinimg.com/originals/9b/ed/56/9bed5665dfd4762a32788d40379eb019.gif',
                            fit: BoxFit.cover,
                            // Ensures the image covers the container
                            alignment: Alignment.center, // Centers the image
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Music",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: ClipRRect(
                          // To make sure the image respects the border radius
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'https://i.pinimg.com/474x/56/27/ea/5627ea13f97055cd12d555339c4dd726.jpg',
                            fit: BoxFit.cover,
                            // Ensures the image covers the container
                            alignment: Alignment.center, // Centers the image
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Nature",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: ClipRRect(
                          // To make sure the image respects the border radius
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            'https://i.pinimg.com/474x/2f/47/62/2f4762d4be0f5f6ac21359046fe6d424.jpg',
                            fit: BoxFit.cover,
                            // Ensures the image covers the container
                            alignment: Alignment.center, // Centers the image
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Sports",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Center(
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

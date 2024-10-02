import 'package:flutter/material.dart';
import 'package:la_prueba/screen/home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.answers,
      required this.correctAnswers,
      required this.incorrectAnswers});

  final List<Map<int, String>> answers; // Corrected declaration
  final Map<int, String> incorrectAnswers;
  final Map<int, String> correctAnswers;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1A3636),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      'RESULTS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900),
                    ))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'images/trophy-removebg-preview.png',
                          fit: BoxFit.cover,
                          height: 300,
                          // Ensures the image covers the container
                          alignment: Alignment.center, // Centers the image
                        ),
                        Text(
                          'GOOD JOB!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                          elevation: 5.0,
                          child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25.0, horizontal: 20.0),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'GET CORRECT ANSWERS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              )),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                              color: Color(0xffECDFCC)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "CORRECT ANSWERS",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15.0),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${correctAnswers.length} Questions",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        "TOTAL QUESTIONS",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15.0),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${answers.length} Questions",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20.0),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "COMPLETION",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15.0),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${((correctAnswers.length / answers.length) * 100).toStringAsFixed(1)}%",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        "INCORRECT ANSWERS",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15.0),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${incorrectAnswers.length} Questions",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20.0),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()));
                                },
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black,
                                  elevation: 5.0,
                                  child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 25.0, horizontal: 20.0),
                                      child: Center(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          'DONE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: Material(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black,
                                elevation: 5.0,
                                child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 25.0, horizontal: 20.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Center(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: answers,
// ),
// ),
// )

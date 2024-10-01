import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.answers});

  final List<Widget> answers;

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
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Color(0xffD6BD98)),
                        padding: const EdgeInsets.all(10.0),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Expanded(
                        child: Center(
                            child: Padding(
                      padding: EdgeInsets.only(right: 50.0),
                      child: Text(
                        'RESULTS',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900),
                      ),
                    )))
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
                              color: Colors.grey),
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
                                        "7 Questions",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        "SKIPPED",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15.0),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "2",
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
                                        "80%",
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
                                        "1",
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

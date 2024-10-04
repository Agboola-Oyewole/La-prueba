import 'package:flutter/material.dart';
import 'package:la_prueba/components/correction_card.dart';

import 'home_screen.dart';

class CorrectionScreen extends StatelessWidget {
  const CorrectionScreen(
      {super.key,
      required this.questions,
      required this.answers,
      required this.questionOptions});

  final List<dynamic> questions;
  final List<Map<int, String>> answers;
  final List questionOptions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1A3636),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    'CORRECTION',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900),
                  ))
                ],
              ),
              const SizedBox(height: 30.0),
              // Wrap ListView.builder with Expanded or Flexible
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return CorrectionCard(
                      question: questions[index]['question'],
                      questionAnswer: questions[index]['correct_answer'],
                      questionNumber: index,
                      userAnswer: answers[index].entries.first.value,
                      questionOptions: questionOptions[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

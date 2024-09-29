import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'package:la_prueba/components/options_container.dart';
import 'package:la_prueba/screen/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key,
      required this.categoryName,
      required this.difficulty,
      required this.questionNumber,
      required this.questionType});

  final int categoryName;
  final int questionNumber;
  final String difficulty;
  final String questionType;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<dynamic> questions = []; // Store the trivia questions
  List<dynamic> questionOptions = [];
  int questionNumber = 0;
  HtmlUnescape unescape = HtmlUnescape();
  bool isDone = false;
  List<Widget> answers = [];

  @override
  void initState() {
    super.initState();
    print(widget.categoryName);
    print(widget.difficulty);
    print(widget.questionNumber);
    print(widget.questionType);
    fetchQuestions(); // Fetch questions when the widget is initialized
  }

  Future<void> fetchQuestions() async {
    // Fetch the trivia questions
    List<dynamic> fetchedQuestions = await loadTriviaQuestions();

    if (fetchedQuestions.isNotEmpty) {
      questions = fetchedQuestions;
      setState(() {
        updateOptions();
      });
    } else {
      print('No questions were fetched from the API.');
    }
  }

  void updateOptions() {
    setState(() {
      questionOptions.clear();

      // Add the correct answer
      questionOptions.add(questions[questionNumber]['correct_answer']);

      // Add the incorrect answers
      for (int i = 0;
          i < questions[questionNumber]['incorrect_answers'].length;
          i++) {
        questionOptions.add(questions[questionNumber]['incorrect_answers'][i]);
      }

      // Shuffle the options to randomize the order
      questionOptions.shuffle();
    });
  }

  // Check if the selected answer is correct
  void checkAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[questionNumber]['correct_answer']) {
      setState(() {
        if (questions.length - 1 >= questionNumber) {
          answers.add(Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.green)),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                (questionNumber + 1).toString(),
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0),
              ),
            ),
          ));
        }
        if (questionNumber >= questions.length - 1) {
          setState(() {
            isDone = true;
          });
        } else {
          questionNumber += 1; // Move to the next question
          updateOptions();
        }
      });
    } else {
      setState(() {
        if (questions.length - 1 >= questionNumber) {
          answers.add(Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.red)),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                (questionNumber + 1).toString(),
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0),
              ),
            ),
          ));
        }
        if (questionNumber >= questions.length - 1) {
          setState(() {
            isDone = true;
          });
        } else {
          questionNumber += 1; // Move to the next question
          updateOptions();
        }
      });
    }
  }

  // Function to load trivia questions
  Future<List<dynamic>> loadTriviaQuestions() async {
    final int category = widget.categoryName;
    final String difficulty = widget.difficulty; // Default difficulty
    final String type = widget.questionType;
    final int number = widget.questionNumber;

    // API endpoint with parameters
    final Uri url = Uri.parse(
      'https://opentdb.com/api.php?amount=$number&category=$category&difficulty=$difficulty&type=$type',
    );

    try {
      // Send GET request to the API
      final response = await http.get(url);
      print('API Response: ${response.body}');

      // Check if the response is successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Access the questions from the API response
        print('Trivia Questions: ${data['results']}');

        // Return the list of questions
        return data['results'];
      } else {
        print('Failed to load questions. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error loading trivia questions: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1A3636),
        body: questions.isEmpty
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child:
                          CircularProgressIndicator(color: Color(0xffD6BD98))),
                  SizedBox(height: 20.0),
                  Text(
                    'Loading Questions...',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0),
                  )
                ],
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Text(
                            'Question ${questionNumber + 1} of ${questions.length}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20.0),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Color(0xffD6BD98)),
                            padding: const EdgeInsets.all(10.0),
                            child: const Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "Category:  ${questions[questionNumber]['category']}",
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xffD6BD98),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        unescape.convert(questions[questionNumber]['question']),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 25.0),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          checkAnswer(questionOptions[0]);
                        },
                        child: OptionsContainer(
                          option: "A",
                          value: unescape.convert(questionOptions[0]),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          checkAnswer(questionOptions[1]);
                        },
                        child: OptionsContainer(
                          option: "B",
                          value: unescape.convert(questionOptions[1]),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          checkAnswer(questionOptions[2]);
                        },
                        child: OptionsContainer(
                          option: "C",
                          value: unescape.convert(questionOptions[2]),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          checkAnswer(questionOptions[3]);
                        },
                        child: OptionsContainer(
                          option: "D",
                          value: unescape.convert(questionOptions[3]),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      isDone
                          ? GestureDetector(
                              onTap: () {
                                List<Widget> savedAnswers =
                                    answers.sublist(0, questions.length);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultScreen(
                                            answers: savedAnswers)));
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
                                        'Get Results',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

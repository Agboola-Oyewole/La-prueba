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
  List<String> questionOptions = [];
  List<List<String>> totalOptions = [];
  int questionNumber = 0;
  HtmlUnescape unescape = HtmlUnescape();
  bool isDone = false;
  bool isSelected = false;
  Map<int, String> correctAnswers = {};
  Map<int, String> incorrectAnswers = {};
  List<Map<int, String>> answers = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions(); // Fetch questions when the widget is initialized
  }

  Future<void> fetchQuestions() async {
    // Fetch the trivia questions
    List<dynamic> fetchedQuestions = await loadTriviaQuestions();

    if (fetchedQuestions.isNotEmpty) {
      questions = fetchedQuestions;
      setState(() {
        updateOptions(true);
        print(questionOptions);
      });
    } else {
      print('No questions were fetched from the API.');
    }
  }

  void updateOptions(bool isNotPrevious) {
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

      if (!isNotPrevious) {
        setState(() {
          isSelected = true;
        });
      }
    });
    if (isNotPrevious) {
      questionOptions.shuffle();
      if (questionNumber + 1 <= questions.length) {
        setState(() {
          // Check if the current questionOptions list is already in totalOptions
          bool alreadyExists = totalOptions.any((list) =>
                  list.toString() ==
                  questionOptions.toString() // Comparing the list contents
              );

          if (!alreadyExists) {
            // Add a copy of questionOptions if it's not already present
            totalOptions.add(List<String>.from(questionOptions));
            print("Added to totalOptions");
          } else {
            print("This list is already in totalOptions");
          }

          // Remove duplicate lists from totalOptions (just in case)
          totalOptions = totalOptions.toSet().toList();
          print("Duplicates removed from totalOptions");
        });
      }
    }
  }

  // Check if the selected answer is correct
  void checkAnswer(String answer) {
    if (answer == questions[questionNumber]['correct_answer']) {
      setState(() {
        if (questions.length - 1 >= questionNumber) {
          if (incorrectAnswers.containsKey(questionNumber)) {
            incorrectAnswers.remove(questionNumber);
          }
          if (correctAnswers.containsKey(questionNumber)) {
            // Update the value if the key exists
            correctAnswers[questionNumber] =
                answer; // Update the existing answer
          } else {
            // If the key does not exist, add a new entry
            correctAnswers[questionNumber] = answer; // Add new entry
            isSelected = false;
          }
        }
        if (questionNumber >= questions.length - 1) {
          setState(() {
            isDone = true;
          });
        } else {
          questionNumber += 1; // Move to the next question
          updateOptions(true);
        }
      });
    } else {
      setState(() {
        if (questions.length - 1 >= questionNumber) {
          if (correctAnswers.containsKey(questionNumber)) {
            correctAnswers.remove(questionNumber);
          }
          if (incorrectAnswers.containsKey(questionNumber)) {
            // Update the value if the key exists
            incorrectAnswers[questionNumber] =
                answer; // Update the existing answer
          } else {
            // If the key does not exist, add a new entry
            incorrectAnswers[questionNumber] = answer; // Add new entry
            isSelected = false;
          }
        }
        if (questionNumber >= questions.length - 1) {
          setState(() {
            isDone = true;
          });
        } else {
          questionNumber += 1; // Move to the next question
          updateOptions(true);
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
                        unescape.convert(
                            "Category:  ${questions[questionNumber]['category']}"),
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
                      widget.questionType == 'boolean'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = true;
                                      bool exists = false;
                                      answers.removeWhere(
                                          (map) => map.values.contains(''));

                                      // Loop through the list to check if the answer already exists
                                      for (var map in answers) {
                                        if (map.containsKey(questionNumber)) {
                                          // Check if the value is different, if so, update it
                                          if (map[questionNumber] !=
                                              totalOptions[questionNumber][0]) {
                                            map[questionNumber] = totalOptions[
                                                    questionNumber]
                                                [0]; // Update existing answer
                                            // String oldValue = map.remove(questionNumber)!;
                                            //
                                            // // Add a new key-value pair with the updated key (2)
                                            // map[2] = oldValue;
                                          }
                                          exists = true;
                                          break; // Exit loop as the questionNumber is found
                                        }
                                      }

                                      // If the answer doesn't exist, add it
                                      if (!exists) {
                                        answers.add({
                                          questionNumber:
                                              totalOptions[questionNumber][0]
                                        });
                                      }

                                      print(answers);
                                    });
                                  },
                                  child: OptionsContainer(
                                      option: "A",
                                      value: unescape.convert(
                                          totalOptions[questionNumber][0]),
                                      border: answers.isEmpty
                                          ? false
                                          : answers[questionNumber]
                                                      .entries
                                                      .first
                                                      .value ==
                                                  totalOptions[questionNumber]
                                                      [0]
                                              ? true
                                              : false),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = true;
                                      bool exists = false;
                                      answers.removeWhere(
                                          (map) => map.values.contains(''));

                                      // Loop through the list to check if the answer already exists
                                      for (var map in answers) {
                                        if (map.containsKey(questionNumber)) {
                                          // Check if the value is different, if so, update it
                                          if (map[questionNumber] !=
                                              totalOptions[questionNumber][1]) {
                                            map[questionNumber] = totalOptions[
                                                    questionNumber]
                                                [1]; // Update existing answer
                                          }
                                          exists = true;
                                          break; // Exit loop as the questionNumber is found
                                        }
                                      }

                                      // If the answer doesn't exist, add it
                                      if (!exists) {
                                        answers.add({
                                          questionNumber:
                                              totalOptions[questionNumber][1]
                                        });
                                      }
                                      print(answers);
                                    });
                                  },
                                  child: OptionsContainer(
                                    option: "B",
                                    value: unescape.convert(
                                        totalOptions[questionNumber][1]),
                                    border: answers.isEmpty
                                        ? false
                                        : answers[questionNumber]
                                                    .entries
                                                    .first
                                                    .value ==
                                                totalOptions[questionNumber][1]
                                            ? true
                                            : false,
                                  ),
                                )
                              ],
                            )
                          : Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = true;
                                      bool exists = false;
                                      answers.removeWhere(
                                          (map) => map.values.contains(''));

                                      // Loop through the list to check if the answer already exists
                                      for (var map in answers) {
                                        if (map.containsKey(questionNumber)) {
                                          // Check if the value is different, if so, update it
                                          if (map[questionNumber] !=
                                              totalOptions[questionNumber][0]) {
                                            map[questionNumber] = totalOptions[
                                                    questionNumber]
                                                [0]; // Update existing answer
                                            // String oldValue = map.remove(questionNumber)!;
                                            //
                                            // // Add a new key-value pair with the updated key (2)
                                            // map[2] = oldValue;
                                          }
                                          exists = true;
                                          break; // Exit loop as the questionNumber is found
                                        }
                                      }

                                      // If the answer doesn't exist, add it
                                      if (!exists) {
                                        answers.add({
                                          questionNumber:
                                              totalOptions[questionNumber][0]
                                        });
                                      }

                                      print(answers);
                                    });
                                  },
                                  child: OptionsContainer(
                                      option: "A",
                                      value: unescape.convert(
                                          totalOptions[questionNumber][0]),
                                      border: answers.isEmpty
                                          ? false
                                          : answers[questionNumber]
                                                      .entries
                                                      .first
                                                      .value ==
                                                  totalOptions[questionNumber]
                                                      [0]
                                              ? true
                                              : false),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = true;
                                      bool exists = false;
                                      answers.removeWhere(
                                          (map) => map.values.contains(''));

                                      // Loop through the list to check if the answer already exists
                                      for (var map in answers) {
                                        if (map.containsKey(questionNumber)) {
                                          // Check if the value is different, if so, update it
                                          if (map[questionNumber] !=
                                              totalOptions[questionNumber][1]) {
                                            map[questionNumber] = totalOptions[
                                                    questionNumber]
                                                [1]; // Update existing answer
                                          }
                                          exists = true;
                                          break; // Exit loop as the questionNumber is found
                                        }
                                      }

                                      // If the answer doesn't exist, add it
                                      if (!exists) {
                                        answers.add({
                                          questionNumber:
                                              totalOptions[questionNumber][1]
                                        });
                                      }
                                      print(answers);
                                    });
                                  },
                                  child: OptionsContainer(
                                    option: "B",
                                    value: unescape.convert(
                                        totalOptions[questionNumber][1]),
                                    border: answers.isEmpty
                                        ? false
                                        : answers[questionNumber]
                                                    .entries
                                                    .first
                                                    .value ==
                                                totalOptions[questionNumber][1]
                                            ? true
                                            : false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = true;
                                      bool exists = false;
                                      answers.removeWhere(
                                          (map) => map.values.contains(''));

                                      // Loop through the list to check if the answer already exists
                                      for (var map in answers) {
                                        if (map.containsKey(questionNumber)) {
                                          // Check if the value is different, if so, update it
                                          if (map[questionNumber] !=
                                              totalOptions[questionNumber][2]) {
                                            map[questionNumber] = totalOptions[
                                                    questionNumber]
                                                [2]; // Update existing answer
                                          }
                                          exists = true;
                                          break; // Exit loop as the questionNumber is found
                                        }
                                      }

                                      // If the answer doesn't exist, add it
                                      if (!exists) {
                                        answers.add({
                                          questionNumber:
                                              totalOptions[questionNumber][2]
                                        });
                                      }
                                      print(answers);
                                    });
                                  },
                                  child: OptionsContainer(
                                    option: "C",
                                    value: unescape.convert(
                                        totalOptions[questionNumber][2]),
                                    border: answers.isEmpty
                                        ? false
                                        : answers[questionNumber]
                                                    .entries
                                                    .first
                                                    .value ==
                                                totalOptions[questionNumber][2]
                                            ? true
                                            : false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = true;
                                      bool exists = false;
                                      answers.removeWhere(
                                          (map) => map.values.contains(''));

                                      // Loop through the list to check if the answer already exists
                                      for (var map in answers) {
                                        if (map.containsKey(questionNumber)) {
                                          // Check if the value is different, if so, update it
                                          if (map[questionNumber] !=
                                              totalOptions[questionNumber][3]) {
                                            map[questionNumber] = totalOptions[
                                                    questionNumber]
                                                [3]; // Update existing answer
                                          }
                                          exists = true;
                                          break; // Exit loop as the questionNumber is found
                                        }
                                      }

                                      // If the answer doesn't exist, add it
                                      if (!exists) {
                                        answers.add({
                                          questionNumber:
                                              totalOptions[questionNumber][3]
                                        });
                                      }
                                      print(answers);
                                    });
                                  },
                                  child: OptionsContainer(
                                      option: "D",
                                      value: unescape.convert(
                                          totalOptions[questionNumber][3]),
                                      border: answers.isEmpty
                                          ? false
                                          : answers[questionNumber]
                                                      .entries
                                                      .first
                                                      .value ==
                                                  totalOptions[questionNumber]
                                                      [3]
                                              ? true
                                              : false),
                                ),
                              ],
                            ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          if (questionNumber >= 1)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    questionNumber -= 1;
                                    updateOptions(false);
                                    isDone = false;
                                    print(answers);
                                    print(questionOptions);
                                  });
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
                                          'PREVIOUS',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          if (questionNumber >= 1) const SizedBox(width: 10.0),
                          if (answers.isNotEmpty && !isDone)
                            isSelected &&
                                    answers[questionNumber]
                                        .entries
                                        .first
                                        .value
                                        .isNotEmpty
                                ? Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (answers.isNotEmpty) {
                                          // Access the first key
                                          String firstKey =
                                              answers[questionNumber]
                                                  .entries
                                                  .first
                                                  .value;

                                          // You can now pass the first key to the checkAnswer function
                                          checkAnswer(firstKey);
                                          answers.add({questionNumber: ''});
                                          print(answers);
                                          print("Total Options: $totalOptions");
                                          print(
                                              'Incorrect Answers: $incorrectAnswers');
                                          print(
                                              "Correct Answers: $correctAnswers");
                                        } else {
                                          print('The map is empty');
                                        }
                                      },
                                      child: Material(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.black,
                                        elevation: 5.0,
                                        child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 25.0,
                                                horizontal: 20.0),
                                            child: Center(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                'NEXT',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            )),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Material(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey,
                                      elevation: 5.0,
                                      child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25.0, horizontal: 20.0),
                                          child: Center(
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              'NEXT',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          )),
                                    ),
                                  ),
                          isDone ? const SizedBox(width: 10.0) : Container(),
                          isDone
                              ? Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      answers.removeWhere(
                                          (map) => map.values.contains(''));
                                      setState(() {
                                        totalOptions =
                                            totalOptions.toSet().toList();
                                      });
                                      print(totalOptions);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ResultScreen(
                                                    questionOptions:
                                                        totalOptions,
                                                    questions: questions,
                                                    answers: answers,
                                                    correctAnswers:
                                                        correctAnswers,
                                                    incorrectAnswers:
                                                        incorrectAnswers,
                                                  )));
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
                                              'END QUIZ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          )),
                                    ),
                                  ),
                                )
                              : Container()
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

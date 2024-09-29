import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_prueba/screen/quiz_screen.dart';

class PropertiesDropdown extends StatefulWidget {
  const PropertiesDropdown({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<PropertiesDropdown> createState() => _PropertiesDropdownState();
}

class _PropertiesDropdownState extends State<PropertiesDropdown> {
  String? selectedDifficulty;

  String? selectedQuestionType;
  int? selectedNumber;

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

  final List<String> difficulty = [
    'Easy',
    'Medium',
    'Hard',
  ];

  final Map<String, String> questionTypeMap = {
    'True / False': 'boolean',
    'Multiple Choice': 'multiple',
  };

  String? selectedQuestionTypeDisplay;

  CupertinoPicker iosPicker(list) {
    return CupertinoPicker(
      itemExtent: 45.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedDifficulty = list[selectedIndex];
      },
      children: [
        for (String currency in list)
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              currency,
              style: const TextStyle(
                  color: Color(0xFF001B2E),
                  fontWeight: FontWeight.w900,
                  fontSize: 23.0),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Category: ${widget.categoryName}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 30.0),
            // Number Dropdown (unchanged)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  child: DropdownButton<int>(
                    isExpanded: true,
                    value: selectedNumber,
                    hint: const Text(
                      'Select a number',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                    icon: const Icon(Icons.arrow_drop_down, size: 30.0),
                    underline: const SizedBox(),
                    // Removes the default underline
                    onChanged: (newValue) {
                      setState(() {
                        selectedNumber = newValue;
                      });
                    },
                    items: List.generate(50, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Difficulty Dropdown
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  child: DropdownButton<String?>(
                    isExpanded: true,
                    value: selectedDifficulty,
                    hint: const Text(
                      'Difficulty',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 16.0),
                    ),
                    icon: const Icon(Icons.arrow_drop_down, size: 30.0),
                    underline: const SizedBox(),
                    // Removes the default underline
                    onChanged: (newValue) {
                      setState(() {
                        selectedDifficulty = newValue;
                      });
                    },
                    items: difficulty
                        .map<DropdownMenuItem<String?>>((String value) {
                      return DropdownMenuItem<String?>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Question Type Dropdown
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  child: DropdownButton<String?>(
                    isExpanded: true,
                    value: selectedQuestionTypeDisplay,
                    hint: const Text(
                      'Question Type',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 16.0),
                    ),
                    icon: const Icon(Icons.arrow_drop_down, size: 30.0),
                    underline: const SizedBox(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedQuestionTypeDisplay = newValue;
                        selectedQuestionType = questionTypeMap[newValue!];
                      });
                    },
                    items: questionTypeMap.keys
                        .map<DropdownMenuItem<String?>>((String value) {
                      return DropdownMenuItem<String?>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            // Confirm button (unchanged)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizScreen(
                                categoryName:
                                    triviaCategories[widget.categoryName] ?? 9,
                                difficulty:
                                    selectedDifficulty?.toLowerCase() ?? 'easy',
                                // Default to 'Easy' if null
                                questionNumber: selectedNumber ?? 10,
                                questionType: selectedQuestionType ??
                                    'multiple', // Default
                              )));
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                  elevation: 5.0,
                  child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Confirm',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20.0,
                          )
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

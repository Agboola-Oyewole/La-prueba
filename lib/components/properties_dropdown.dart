import 'dart:io';

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
  String? selectedColor;
  String? selectedSize;
  int? selectedNumber;
  final List<String> difficulty = [
    'Easy',
    'Medium',
    'Hard',
  ];

  final List<String> questionType = [
    'True / False',
    'Multiple Choice',
  ];

  CupertinoPicker iosPicker(list) {
    return CupertinoPicker(
      itemExtent: 45.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedColor = list[selectedIndex];
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
                    onChanged: (int? newValue) {
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
            const SizedBox(
              height: 20.0,
            ),
            Platform.isIOS
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Scroll to select a feature.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
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
                    child: Platform.isIOS
                        ? CupertinoPicker(
                            itemExtent: 45.0,
                            onSelectedItemChanged: (selectedIndex) {
                              selectedColor = difficulty[selectedIndex];
                            },
                            children: [
                              for (String currency in difficulty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    currency,
                                    style: const TextStyle(
                                        color: Color(0xFF001B2E),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16.0),
                                  ),
                                )
                            ],
                          )
                        : DropdownButton<String>(
                            isExpanded: true,
                            value: selectedColor,
                            hint: const Text(
                              'Difficulty',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16.0),
                            ),
                            icon: const Icon(Icons.arrow_drop_down, size: 30.0),
                            underline: const SizedBox(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedColor = newValue;
                              });
                            },
                            items: difficulty
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              );
                            }).toList(),
                          )),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
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
                    child: Platform.isIOS
                        ? CupertinoPicker(
                            itemExtent: 45.0,
                            onSelectedItemChanged: (selectedIndex) {
                              selectedSize = questionType[selectedIndex];
                            },
                            children: [
                              for (String currency in questionType)
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    currency,
                                    style: const TextStyle(
                                        color: Color(0xFF001B2E),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16.0),
                                  ),
                                )
                            ],
                          )
                        : DropdownButton<String>(
                            isExpanded: true,
                            value: selectedSize,
                            hint: const Text(
                              'Question Type',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16.0),
                            ),
                            icon: const Icon(Icons.arrow_drop_down, size: 30.0),
                            underline: const SizedBox(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedSize = newValue;
                              });
                            },
                            items: questionType
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              );
                            }).toList(),
                          )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizScreen()));
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

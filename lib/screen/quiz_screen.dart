import 'package:flutter/material.dart';
import 'package:la_prueba/components/options_container.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color(0xffD6BD98)),
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  'Question 6 of 10',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.0),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
            const Text(
              "Category:  Accessibility",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color(0xffD6BD98),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Which of these color contrast ratio defines the minimum WCAG'
              ' 2.1 Level AA requirement for normal text?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 25.0),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                        color: Color(0xffD6BD98),
                      ),
                      height: 10.0,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                        color: Color(0xff40534C),
                      ),
                      height: 10.0,
                    ))
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            const OptionsContainer(option: "A", value: "Vanessa"),
            const SizedBox(
              height: 20.0,
            ),
            const OptionsContainer(option: "B", value: "Erik"),
            const SizedBox(
              height: 20.0,
            ),
            const OptionsContainer(option: "C", value: "Don Octavio"),
            const SizedBox(
              height: 20.0,
            ),
            const OptionsContainer(option: "D", value: "Agboola")
          ],
        ),
      ),
    ));
  }
}

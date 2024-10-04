import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class CorrectionCard extends StatefulWidget {
  const CorrectionCard(
      {super.key,
      required this.question,
      required this.questionOptions,
      required this.userAnswer,
      required this.questionNumber,
      required this.questionAnswer});

  final String question;
  final String questionAnswer;
  final List questionOptions;
  final String userAnswer;
  final int questionNumber;

  @override
  State<CorrectionCard> createState() => _CorrectionCardState();
}

class _CorrectionCardState extends State<CorrectionCard> {
  HtmlUnescape unescape = HtmlUnescape();
  List option = ['A', 'B', 'C', 'D'];
  int optionNumber = 0;

  @override
  void initState() {
    super.initState();
    // Fetch questions when the widget is initialized
    setState(() {
      optionNumber = widget.questionOptions
          .indexWhere((option) => option == widget.questionAnswer);

      if (optionNumber != -1) {
        print("Answer found at index: $optionNumber");
      } else {
        print("Answer not found in options");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            color: Color(0xffECDFCC)),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${widget.questionNumber + 1}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              unescape.convert(widget.question),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 18.0),
            ),
            const SizedBox(height: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(4, (index) {
                String optionText =
                    unescape.convert(widget.questionOptions[index]);

                // Determine the text color based on the conditions
                Color textColor;
                if (optionText == widget.questionAnswer) {
                  textColor = Colors.green; // Red for user's incorrect answer
                } else if (optionText == widget.userAnswer) {
                  textColor = Colors.red; // Green for the correct answer
                } else {
                  textColor = Colors.black; // Black for other options
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    '${String.fromCharCode(65 + index)}. $optionText',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 17.0),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Correct Answer: ${option[optionNumber]}. ${unescape.convert(widget.questionAnswer)}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 17.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// unescape.convert(widget.userAnswer) ==
// unescape.convert(widget.questionAnswer)
// ? Colors.green
//     : Colors.black,

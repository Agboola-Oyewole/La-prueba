import 'package:flutter/material.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer(
      {super.key,
      required this.option,
      required this.value,
      required this.border});

  final String option;
  final String value;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: border ? Border.all(color: Colors.white, width: 5) : null,
          color: const Color(0xff677D6A)),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                color: Color(0xffD6BD98)),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Text(
              option,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0),
            ),
          ),
          const SizedBox(width: 25.0),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }
}

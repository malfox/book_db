import 'package:flutter/material.dart';

class BookDetailRow extends StatelessWidget {
  final String? title;
  final String? value;

  const BookDetailRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: '$title: ',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        TextSpan(
          text: value,
          style: const TextStyle(color: Colors.black),
        ),
      ]),
    );
  }
}

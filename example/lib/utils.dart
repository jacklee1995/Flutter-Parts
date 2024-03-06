import 'package:flutter/widgets.dart';

Widget h(String text, double size) {
  return Padding(
    padding: const EdgeInsets.all(9),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}

Widget h1(text) => h(text, 30.0);

Widget h2(text) => h(text, 25.0);

Widget h3(text) => h(text, 20.0);

Widget row(List<Widget> l) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: l,
    ));

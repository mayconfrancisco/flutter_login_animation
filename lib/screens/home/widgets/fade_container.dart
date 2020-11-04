import 'package:flutter/material.dart';

class FadeContainer extends StatelessWidget {
  final Animation<Color> fadeColorAnimation;

  FadeContainer(this.fadeColorAnimation);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'fade',
        child: Container(
          decoration: BoxDecoration(color: fadeColorAnimation.value),
        ));
  }
}

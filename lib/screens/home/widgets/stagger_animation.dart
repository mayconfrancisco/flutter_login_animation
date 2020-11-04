import 'package:flutter/material.dart';
import 'package:flutter_login_animation/screens/home/widgets/animated_listview.dart';
import 'package:flutter_login_animation/screens/home/widgets/fade_container.dart';
import 'package:flutter_login_animation/screens/home/widgets/home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController animationController;

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color> fadeColorAnimation;

  StaggerAnimation(this.animationController)
      : containerGrow =
            CurvedAnimation(parent: animationController, curve: Curves.ease),
        listSlidePosition = EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 0),
                end: EdgeInsets.only(bottom: 80))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: Interval(0.325, 0.8, curve: Curves.ease))),
        fadeColorAnimation = ColorTween(
                begin: Color.fromRGBO(247, 64, 106, 1.0),
                end: Color.fromRGBO(247, 64, 106, 0.1))
            .animate(CurvedAnimation(
                parent: animationController, curve: Curves.decelerate));

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            HomeTop(containerGrow),
            AnimatedListView(listSlidePosition),
          ],
        ),
        IgnorePointer(child: FadeContainer(fadeColorAnimation)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
            animation: animationController, builder: _buildAnimation),
      ),
    );
  }
}

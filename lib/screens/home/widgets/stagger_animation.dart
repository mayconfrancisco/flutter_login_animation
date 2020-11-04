import 'package:flutter/material.dart';
import 'package:flutter_login_animation/screens/home/widgets/animated_listview.dart';
import 'package:flutter_login_animation/screens/home/widgets/home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController animationController;

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;

  StaggerAnimation(this.animationController)
      : containerGrow =
            CurvedAnimation(parent: animationController, curve: Curves.ease),
        listSlidePosition = EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 0),
                end: EdgeInsets.only(bottom: 80))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: Interval(0.325, 0.8, curve: Curves.ease)));

  Widget _buildAnimation(BuildContext context, Widget child) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        HomeTop(containerGrow),
        AnimatedListView(listSlidePosition),
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

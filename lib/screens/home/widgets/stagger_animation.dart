import 'package:flutter/material.dart';
import 'package:flutter_login_animation/screens/home/widgets/home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController animationController;

  final Animation<double> containerGrow;

  StaggerAnimation(this.animationController)
      : containerGrow =
            CurvedAnimation(parent: animationController, curve: Curves.ease);

  Widget _buildAnimation(BuildContext context, Widget child) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        HomeTop(containerGrow),
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

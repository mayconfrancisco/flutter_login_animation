import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class StaggerAnimation extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  StaggerAnimation(this.animationController)
      : buttonSqueeze = Tween<double>(begin: 320, end: 60).animate(
            CurvedAnimation(
                parent: animationController, curve: Interval(0.0, 0.15))),
        buttonZoomOut = Tween(begin: 60.0, end: 1000.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.5, 1, curve: Curves.bounceOut)));

  Widget _buildAnimation(BuildContext context, Widget child) {
    timeDilation = 1;

    return Padding(
      padding: EdgeInsets.only(bottom: 80),
      child: InkWell(
          onTap: () {
            animationController.forward();
          },
          child: Hero(
              tag: 'fade',
              child: buttonZoomOut.value <= 60
                  ? Container(
                      width: buttonSqueeze.value,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(247, 64, 106, 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: _buildInside(context),
                    )
                  : Container(
                      width: buttonZoomOut.value,
                      height: buttonZoomOut.value,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(247, 64, 106, 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ))),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 75) {
      return Text(
        'Entrar',
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3),
      );
    }
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.white,
      ),
      strokeWidth: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController, builder: _buildAnimation);
  }
}

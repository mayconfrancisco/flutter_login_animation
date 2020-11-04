import 'package:flutter/material.dart';
import 'package:flutter_login_animation/screens/home/widgets/category_view.dart';

class HomeTop extends StatelessWidget {
  final Animation<double> containerGrow;

  HomeTop(this.containerGrow);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.40,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Bem vindo, Maycon!',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300),
          ),
          Container(
            width: containerGrow.value * 120,
            height: containerGrow.value * 120,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('images/perfil.jpg'), fit: BoxFit.cover)),
            child: Container(
              width: containerGrow.value * 35,
              height: containerGrow.value * 35,
              margin: EdgeInsets.only(left: 80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(80, 210, 194, 1.0)),
              child: Text(
                "2",
                style: TextStyle(
                    fontSize: containerGrow.value * 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          CategoryView(),
        ],
      )),
    );
  }
}

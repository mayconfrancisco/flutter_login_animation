import 'package:flutter/material.dart';
import 'package:flutter_login_animation/screens/home/widgets/list_data.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listViewSlidePosition;

  AnimatedListView(this.listViewSlidePosition);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListData("Estudar Flutter", "Curso de Flutter online com animações",
            AssetImage('images/perfil.jpg'), listViewSlidePosition.value * 5),
        ListData("Estudar Flutter 2", "Curso de Flutter online com animações 2",
            AssetImage('images/perfil.jpg'), listViewSlidePosition.value * 4),
        ListData("Estudar Flutter", "Curso de Flutter online com animações",
            AssetImage('images/perfil.jpg'), listViewSlidePosition.value * 3),
        ListData("Estudar Flutter 2", "Curso de Flutter online com animações 2",
            AssetImage('images/perfil.jpg'), listViewSlidePosition.value * 2),
        ListData("Estudar Flutter", "Curso de Flutter online com animações",
            AssetImage('images/perfil.jpg'), listViewSlidePosition.value * 1),
        ListData("Estudar Flutter 2", "Curso de Flutter online com animações 2",
            AssetImage('images/perfil.jpg'), listViewSlidePosition.value * 0),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final List<String> _categories = ["Trabalho", "Estudos", "Casa"];
  int _selectedCategory = 0;

  _setForwardCategory() {
    setState(() {
      _selectedCategory++;
    });
  }

  _setBackCategory() {
    setState(() {
      _selectedCategory--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
              disabledColor: Colors.white30,
              onPressed: _selectedCategory > 0 ? _setBackCategory : null),
          Text(
            _categories[_selectedCategory].toUpperCase(),
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.2),
          ),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.white,
              ),
              disabledColor: Colors.white30,
              onPressed: _selectedCategory < _categories.length - 1
                  ? _setForwardCategory
                  : null),
        ],
      ),
    );
  }
}

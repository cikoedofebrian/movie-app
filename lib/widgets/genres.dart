import 'package:flutter/material.dart';

class Genres extends StatelessWidget {
  const Genres({super.key, required this.name});
  final List<String> name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: 10,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.red),
          child: Text(
            name[index],
            style: TextStyle(color: Colors.white),
          ),
        ),
        itemCount: name.length,
      ),
    );
  }
}

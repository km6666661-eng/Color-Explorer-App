import 'package:flutter/material.dart';
import 'package:karim_navigator_task/detailsScreen.dart';

class Cardcolors extends StatelessWidget {
  final Color color;
  Cardcolors({required this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: color,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detailsscreen(color: color),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:karim_navigator_task/widgets/cardColors.dart';

class Gallerycolors extends StatefulWidget {
  @override
  State<Gallerycolors> createState() => _galleryColors();
}

class _galleryColors extends State<Gallerycolors> {
  //اهي صارف ومكلف الوان اي خدمة 
final List<Map<String, dynamic>> allColors = [
  {'name': 'Red', 'color': Colors.red},
  {'name': 'Blue', 'color': Colors.blue},
  {'name': 'Green', 'color': Colors.green},
  {'name': 'Yellow', 'color': Colors.yellow},
  {'name': 'Orange', 'color': Colors.orange},
  {'name': 'Purple', 'color': Colors.purple},
  {'name': 'Pink', 'color': Colors.pink},
  {'name': 'Teal', 'color': Colors.teal},
  {'name': 'Cyan', 'color': Colors.cyan},
  {'name': 'Amber', 'color': Colors.amber},
  {'name': 'Indigo', 'color': Colors.indigo},
  {'name': 'Lime', 'color': Colors.lime},
  {'name': 'Brown', 'color': Colors.brown},
  {'name': 'Grey', 'color': Colors.grey},
  {'name': 'Blue Grey', 'color': Colors.blueGrey},
  {'name': 'Black', 'color': Colors.black},
  {'name': 'Deep Orange', 'color': Colors.deepOrange},
  {'name': 'Deep Purple', 'color': Colors.deepPurple},
  {'name': 'Light Blue', 'color': Colors.lightBlue},
  {'name': 'Light Green', 'color': Colors.lightGreen},
  {'name': 'Crimson', 'color': const Color(0xFFDC143C)},
  {'name': 'Gold', 'color': const Color(0xFFFFD700)},
  {'name': 'Violet', 'color': const Color(0xFFEE82EE)},
  {'name': 'Olive', 'color': const Color(0xFF808000)},
];

  List<Map<String, dynamic>> filteredColors = [];

  @override
  void initState() {
    super.initState();
    filteredColors = allColors;
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = allColors; 
    } else {
      results = allColors
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredColors = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => _runFilter(value), 
          decoration: InputDecoration(
            hintText: 'Search color name...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: filteredColors.length,
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Cardcolors(color: filteredColors[index]['color']);
              },
            ),
          ),
        ],
      ),
    );
  }
}
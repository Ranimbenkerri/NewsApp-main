import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Screen',
        style: TextStyle(
          fontSize: 20,
         fontWeight: FontWeight.bold
         ),
      ),
    );
  }
}

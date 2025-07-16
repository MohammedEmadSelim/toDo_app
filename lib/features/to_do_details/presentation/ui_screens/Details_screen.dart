import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new), 
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body:Padding(padding: EdgeInsets.all(2)) ,
    );
  }
}
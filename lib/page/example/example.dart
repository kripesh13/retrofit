import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 200
            ,
          ),

           Container(
            color: Colors.blue,
            height: 200
            ,

          ),


           Container(
            color: Colors.red,
            height: 200
            ,
          )
        ],
      ),
    );

  }
}
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        backgroundColor:Colors.blue,
        title: Center(
          child: const Text("Data collection App",
          style: TextStyle(
            fontSize: 12,
          ),
          )),
      ),
      body:const Column(children: [
        Text("welcome to programming")

      ],)

       
    );
  }
}
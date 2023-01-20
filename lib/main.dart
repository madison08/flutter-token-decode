// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController myController = TextEditingController();
  Map<String, dynamic>? payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter your token here",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                filled: true,
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              payload = Jwt.parseJwt(myController.value.text);
              setState(() {});
            },
            child: Text("Submit token"),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            height: 50.0,
            child: Text(payload.toString() != "null" ? payload.toString() : ""),
          ),
        ],
      ),
    );
  }
}

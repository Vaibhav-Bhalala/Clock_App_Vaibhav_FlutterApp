
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int h = 0;
  int m = 0;
  int s = 0;
  int d = 0;
  int n = 0;
  int y = 0;

  MyWatch() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        h = DateTime.now().hour;
        m = DateTime.now().minute;
        s = DateTime.now().second;
        d = DateTime.now().day;
        n = DateTime.now().month;
        y = DateTime.now().year;

      });
      MyWatch();
    });
  }

  @override
  void initState() {
    super.initState();
    MyWatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200,
      appBar: AppBar(backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text("Digital Watch",style: TextStyle(color: Colors.white),),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('AnalogWatch');
          },
          child: Icon(Icons.navigate_next)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.cyanAccent,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                           "https://plus.unsplash.com/premium_photo-1668447598676-30bbd44792c7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"),
                      ),),
                  alignment: Alignment.center,
                  width: 250,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${d} / ${n} / ${y} ",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 25),
                          Text(
                            "${h} : ${m} : ${s} ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),

                        ],

                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class AnalogWatch extends StatefulWidget {
  const AnalogWatch({super.key});

  @override
  State<AnalogWatch> createState() => _AnalogWatchState();
}

class _AnalogWatchState extends State<AnalogWatch> {
  int h = 0;
  int m = 0;
  int s = 0;

  MyWatch() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        h = DateTime.now().hour % 12;
        m = DateTime.now().minute;
        s = DateTime.now().second;
      });
      MyWatch();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyWatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analog Watch"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blueGrey),
            ),
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellowAccent,
                  image: DecorationImage(fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1610250009833-51efb664dcdd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80"))),
            ),
            ...List.generate(
                60,
                (index) => Transform.rotate(
                    angle: (pi * 2) * (index / 60),
                    child: Divider(
                      color:
                          (index % 5 == 0) ? Colors.greenAccent : Colors.black,
                      thickness: (index % 5 == 0) ? 7 : 2,
                      endIndent: MediaQuery.of(context).size.width * 0.95,
                    ))),
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: (pi * 2) * (s / 60),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                  endIndent: MediaQuery.of(context).size.width * 0.5,
                  indent: MediaQuery.of(context).size.width * 0.06,
                ),
              ),
            ),
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: (pi * 2) * (m / 60),
                child: Divider(
                  color: Colors.black,
                  thickness: 3,
                  endIndent: MediaQuery.of(context).size.width * 0.5,
                  indent: MediaQuery.of(context).size.width * 0.10,
                ),
              ),
            ),
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: (pi * 2) * (h / 12),
                child: Divider(
                  color: Colors.black,
                  thickness: 4,
                  endIndent: MediaQuery.of(context).size.width * 0.5,
                  indent: MediaQuery.of(context).size.width * 0.20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

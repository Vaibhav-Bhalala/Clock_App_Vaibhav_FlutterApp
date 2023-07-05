import 'dart:math';

import 'package:flutter/material.dart';

class StrapWatch extends StatefulWidget {
  const StrapWatch({super.key});

  @override
  State<StrapWatch> createState() => _StrapWatchState();
}

class _StrapWatchState extends State<StrapWatch> {
  @override
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
    super.initState();
    MyWatch();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Trio_color Watch"), centerTitle: true),
      body: Center(
        child: Stack(alignment: Alignment.center,
          children: [
            ...List.generate(60, (index) => Transform.rotate(angle: (pi*2) * (index/60),
            child: Divider(color: Colors.blue,indent: 200,endIndent: 145
              ,),)),
            Transform.scale(
                scale: 8,
                child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                  strokeWidth: 3,
                  value: s.toDouble() / 60,
                ),),
            Transform.scale(
                scale: 6,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                  value: m.toDouble() / 60,
                ),),
            Transform.scale(
                scale: 4,
                child: CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 6,
                  value: h.toDouble() / 12,
                ),),
          ],
        ),
      ),
    );
  }
}

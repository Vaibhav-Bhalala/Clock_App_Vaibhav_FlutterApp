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
        backgroundColor: Colors.grey,
        title: Text("Analog Watch"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/8230825/pexels-photo-8230825.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  fit: BoxFit.fill)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              ),
              Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellowAccent,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.pexels.com/photos/11877748/pexels-photo-11877748.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))),
                child: Align(
                  alignment: Alignment(0,0.5),
                  child: Text("${h} :${m} :${s}",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 30), ) ,
                ),
              ),
              ...List.generate(
                  60,
                  (index) => Transform.rotate(
                      angle: (pi * 2) * (index / 60),
                      child: Divider(
                        color: (index % 5 == 0) ? Colors.red : Colors.white,
                        thickness: (index % 5 == 0) ? 5 : 2,
                        endIndent: MediaQuery.of(context).size.width * 0.95,
                      ))),
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (pi * 2) * (s / 60),
                  child: Divider(
                    color: Colors.black,
                    thickness: 3,
                    endIndent: MediaQuery.of(context).size.width * 0.4,
                    indent: MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (pi * 2) * (m / 60),
                  child: Divider(
                    color: Colors.blueAccent,
                    thickness: 4,
                    endIndent: MediaQuery.of(context).size.width * 0.5,
                    indent: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 2,
                child: Transform.rotate(
                  angle: (pi * 2) * (h / 12),
                  child: Divider(
                    color: Colors.red,
                    thickness: 6,
                    endIndent: MediaQuery.of(context).size.width * 0.5,
                    indent: MediaQuery.of(context).size.width * 0.16,
                  ),
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

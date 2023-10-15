import 'dart:async';

import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  //bussiness logic of the app
  int seconds = 0, minutes = 0, hours = 0;
  String digitseconds = "00", digitminutes = "00", digithours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  //stop timer function
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //Reseet Function
  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitseconds = "00";
      digitminutes = "00";
      digithours = "00";

      started = false;
    });
  }

  void addlaps() {
    String lap = "$digithours:$digitminutes:$digitseconds";
    setState(() {
      laps.add(lap);
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localseconds = seconds + 1;
      int localminutes = minutes;
      int localhours = hours;
      if (localseconds > 59) {
        if (localminutes > 59) {
          localhours++;
          localminutes = 0;
        } else {
          localminutes++;
          localseconds = 0;
        }
      }
      setState(() {
        seconds = localseconds;
        minutes = localminutes;
        hours = localhours;
        digitseconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digithours = (hours >= 10) ? "$hours" : "0$hours";
        digitminutes = (minutes >= 10) ? "$minutes" : "0$minutes";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "STOP WATCH",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "$digithours:$digitminutes:$digitseconds",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 400.0,
              decoration: BoxDecoration(
                  color: Color(0xFF323F68),
                  borderRadius: BorderRadius.circular(8.0)),
              child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(children: [
                        Text(
                          "Lap ${index + 1}",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        Text(
                          "${laps[index]}",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ]),
                    );
                  }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: RawMaterialButton(
                  onPressed: () {
                    (!started) ? start() : stop();
                  },
                  shape:
                      const StadiumBorder(side: BorderSide(color: Colors.blue)),
                  child: Text(
                    (!started) ? "Start" : "Pause",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
                SizedBox(
                  width: 8.0,
                ),
                IconButton(
                    onPressed: () {
                      addlaps();
                    },
                    color: Colors.white,
                    icon: Icon(Icons.flag)),
                Expanded(
                    child: RawMaterialButton(
                  onPressed: () {
                    reset();
                  },
                  fillColor: Colors.blue,
                  shape:
                      const StadiumBorder(side: BorderSide(color: Colors.blue)),
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
              ],
            )
          ],
        ),
      )),
    );
  }
}

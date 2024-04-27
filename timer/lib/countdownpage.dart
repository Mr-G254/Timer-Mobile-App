import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timer/progressindicator.dart';
import 'package:timer/timer.dart';
import 'package:vibration/vibration.dart';

class Countdownpage extends StatefulWidget{
  final String label;
  final int hours;
  final int minutes;
  final int seconds;
  const Countdownpage({super.key,required this.label,required this.hours,required this.minutes,required this.seconds});


  String formatTime(int seconds){
    int hr = seconds~/3600;
    int rem = seconds%3600;
    int min = rem~/60;
    rem = rem%60;
    int sec = rem;
    
    return "${hr.toString().padLeft(2,"0")}:${min.toString().padLeft(2,"0")}:${sec.toString().padLeft(2,"0")}";
  }

  int getHours(){
    return hours;
  }

  int getMinutes(){
    return minutes;
  }

  int getSeconds(){
    return seconds;
  }

  int getTotalTimeInSeconds(){
    return (hours*3600) + (minutes*60) + seconds;
  }

  @override
  State<Countdownpage> createState() => _Countdownpage();
}

class _Countdownpage extends State<Countdownpage>{
  late int totalSeconds;
  late int remSeconds;
  late int progressVal;
  late Timer timer;
  late StreamSubscription<int> stream;
  AssetImage icon = const AssetImage("Icons\\pause.png");
  bool isDone = false;
  bool ringIsChecked = true;
  bool vibrateIsChecked = false;
  final player  = AudioPlayer();

  void playSound()async{
    try{
      AudioPlayer player = AudioPlayer();
      await player.play(AssetSource("Audio/nasty_c_sma_vol._1_ft._rowlene_mp3_70646.mp3"));
    }catch(e){
      print(e.toString());
    }
    

  }

  void vibrate()async{
    if(await Vibration.hasVibrator() != null){
      Vibration.vibrate(pattern: [0,200,200,200]);
      
    }
  }

  @override
  void initState(){
    super.initState();
    totalSeconds = widget.getTotalTimeInSeconds();
    remSeconds = widget.getTotalTimeInSeconds();
    progressVal = 1;

    timer = Timer(timeInSeconds: widget.getTotalTimeInSeconds());
    stream = timer.tick().listen((value) { 
      setState(() {
        remSeconds = value;
      });
    });

    stream.onDone(() {
      setState(() {
        isDone = true;
        icon = const AssetImage("Icons\\triangle.png");

        if(ringIsChecked){
          playSound();
        }else if(vibrateIsChecked){
          vibrate();
        }
        
      });
    });
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context){
    String topLabel;

    if(widget.label.length>1){
      topLabel = widget.label;
    }else{
      topLabel = "Countdown";
    }

    Row controls = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: const Color.fromARGB(255, 3, 76, 118),
              shape: const CircleBorder()
            ),
            onPressed: (){
              icon = const AssetImage("Icons\\pause.png");
              stream.cancel();
              stream = timer.tick().listen((value) { 
                setState(() {
                  remSeconds = value;
                });
              });
              stream.onDone(() {
                setState(() {
                  isDone = true;
                  icon = const AssetImage("Icons\\triangle.png");
                });

                if(ringIsChecked){
                  playSound();
                }else if(vibrateIsChecked){
                  vibrate();
                }
              });
            }, 
            child: const Image(
              image: AssetImage("Icons\\square.png"),
              height: 15,
              width: 15,
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: const Color.fromARGB(255, 3, 76, 118),
              shape: const CircleBorder()
            ),
            onPressed: (){
              setState(() {
                if(stream.isPaused){
                  icon = const AssetImage("Icons\\pause.png");
                  stream.resume();
                }else if(stream.isPaused == false && isDone == false) {
                  icon = const AssetImage("Icons\\triangle.png");
                  stream.pause();
                }
              });
            }, 
            child: Image(
              image: icon,
              height: 18,
              width: 18,
            )
          ),
        )
      ],
    );

    Card bottomCard = Card(
      color: const Color.fromARGB(255, 3, 76, 118),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(top: 3,right: 6,left: 6),
                  height: 23,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 39, 62, 1),
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  child: const Text(
                    "On Completion",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'KyivTypeTitling',
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 39, 62, 1),
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  child: const Image(
                    image: AssetImage("Icons\\bell.png"),
                    height: 15,
                    width: 15,
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(

                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          activeColor: const Color.fromRGBO(0, 39, 62, 1),
                          side: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          ),
                          value: ringIsChecked, 
                          onChanged: (val){
                            setState(() {
                              if(val != null){
                                ringIsChecked = val;
                              }

                              if(val ==true){
                                vibrateIsChecked = false;
                              }else{
                                vibrateIsChecked = true;
                              }
                            });
                          }
                        ),
                      )
                    ),
                    const Text(
                      "Ring",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'KyivTypeTitling',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: const Color.fromRGBO(0, 39, 62, 1),
                        side: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        value: vibrateIsChecked, 
                        onChanged: (val){
                          setState(() {
                            if(val != null){
                              vibrateIsChecked = val;
                            }

                            if(val ==true){
                              ringIsChecked = false;
                            }else{
                              ringIsChecked = true;
                            }
                          });
                        }
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Text(
                        "Vibrate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'KyivTypeTitling',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
                
              ],
            )
          ],
        )
      )
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 39, 62, 1),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Text(
                topLabel,
                style: const TextStyle(
                  fontFamily: 'KyivTypeTitling',
                  fontSize: 40,
                  color: Colors.white
                ),
              )
            ),
            Column(
              children: [
                Progress(
                  totalTime: totalSeconds, 
                  remTime: remSeconds, 
                  remTimeText: widget.formatTime(remSeconds),
                  progressValue: remSeconds/totalSeconds,
                ),
                controls,
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 130,
              child: bottomCard,
            )
          ],
        ),
      )
    );
  }
}
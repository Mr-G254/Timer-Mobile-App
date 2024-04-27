

import 'package:flutter/material.dart';

class Presets extends StatelessWidget{
  final int seconds;
  const Presets({super.key, required this.seconds});
  
  String formatTime(int seconds){
    int hr = seconds~/3600;
    int rem = seconds%3600;
    int min = rem~/60;
    rem = rem%60;
    int sec = rem;
    String result;

    if (hr > 0){
      result = "${hr.toString().padLeft(2,"0")}:${min.toString().padLeft(2,"0")}:${sec.toString().padLeft(2,"0")}";
    }else{
      result = "${min.toString().padLeft(2,"0")}:${sec.toString().padLeft(2,"0")}";
    }
      
    return result;
  }

  

  @override
  Widget build(BuildContext context){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: const Color.fromARGB(255, 3, 76, 118),
      elevation: 5,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: const ImageIcon(
              size: 35,
              color: Colors.white,
              AssetImage('Icons/stopwatch.png')
            ),
          ),
          const SizedBox(width: 20),
          Text(
            formatTime(seconds),
            style: const TextStyle(
              fontFamily: 'KyivTypeTitling',
              fontSize: 25,
              color: Colors.white
            ),
          ),
          const SizedBox(width: 20),
          const Text(
            "Mins",
            style: TextStyle(
              fontFamily: 'KyivTypeTitling',
              fontSize: 20,
              color: Colors.white30
            ),
          ),
        ],
      ),
    );
  }
}
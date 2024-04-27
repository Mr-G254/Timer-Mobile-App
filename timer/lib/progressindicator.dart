import 'package:flutter/material.dart';

class Progress extends StatelessWidget{
  final int totalTime;
  final int remTime;
  final String remTimeText;
  final double progressValue;
  const Progress({super.key,required this.totalTime,required this.remTime,required this.remTimeText,required this.progressValue});

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: CircularProgressIndicator(
              backgroundColor: const Color.fromARGB(255, 3, 76, 118),
              color: Colors.white,
              value: progressValue,
              strokeWidth: 30,
              strokeCap: StrokeCap.round,
              
            ),
          )
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: Center(
              child: Text(
                remTimeText,
                style: const TextStyle(
                  fontFamily: 'KyivTypeTitling',
                  fontSize: 40,
                  color: Colors.white
                ),
              ),
            )
            
          )
        )
      ],
    );
  }
}
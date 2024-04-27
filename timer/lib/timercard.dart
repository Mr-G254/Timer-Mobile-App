import 'package:flutter/material.dart';

class Timercard extends StatefulWidget{
  final Settimer time;
  const Timercard({super.key,required this.time});

  @override
  State<Timercard> createState() => _TimercardState();
}

class _TimercardState extends State<Timercard>{
  static int _hr = 0;
  static int _min = 0;
  static int _sec = 0;
  static Color _hrColor =const Color.fromRGBO(0, 39, 62, 1);
  static Color _minColor =const Color.fromARGB(255, 3, 76, 118);
  static Color _secColor =const Color.fromARGB(255, 3, 76, 118);
  static String currentSelection = 'hr';


  @override
  Widget build(BuildContext context){
    var hourColumn = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Center(
          child: Text(
            "H",
            style: TextStyle(
              fontFamily: 'KyivTypeTitling',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        Center(
          child: Text(
            _hr.toString().padLeft(2,"0"),
            style: const TextStyle(
              fontFamily: 'KyivTypeTitling',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ],
    );

    var hourcard = Card(
      elevation: 0,
      color: _hrColor,
      margin: const EdgeInsets.only(top: 20,bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: hourColumn,
      ),
    );

    var minutesColumn = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Center(
          child: Text(
            "M",
            style: TextStyle(
              fontFamily: 'KyivTypeTitling',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        Center(
          child: Text(
            _min.toString().padLeft(2,"0"),
            style: const TextStyle(
              fontFamily: 'KyivTypeTitling',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ],
    );

    var minscard = Card(
      elevation: 0,
      color: _minColor,
      margin: const EdgeInsets.only(top: 20,bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: minutesColumn,
      ),
    );

    var secondsColumn = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Center(
          child: Text(
            "S",
            style: TextStyle(
              fontFamily: 'KyivTypeTitling',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        Center(
          child: Text(
            _sec.toString().padLeft(2,"0"),
            style: const TextStyle(
              fontFamily: 'KyivTypeTitling',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ],
    );

    var seccard = Card(
      elevation: 0,
      color: _secColor,
      margin: const EdgeInsets.only(top: 20,bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: secondsColumn,
      ),
    );


    Card setTime = Card(
      elevation: 5,
      color: const Color.fromARGB(255, 3, 76, 118),
      margin: const EdgeInsets.only(top: 5,bottom: 5,right: 13,left: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          GestureDetector(
            child: hourcard,
            onTap: () => {
              setState(() {
                _hrColor = widget.time.update_color(1);
                _minColor = widget.time.update_color(0);
                _secColor = widget.time.update_color(0);
                currentSelection = 'hr';
              })
            },
          ),
          const Center(
            child: Text(
              ":",
              style: TextStyle(
                fontFamily: 'KyivTypeTitling',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          GestureDetector(
            child: minscard,
            onTap: () => {
              setState(() {
                _hrColor = widget.time.update_color(0);
                _minColor = widget.time.update_color(1);
                _secColor = widget.time.update_color(0);
                currentSelection = 'min';
              })
            },
          ),
          const Center(
            child: Text(
              ":",
              style: TextStyle(
                fontFamily: 'KyivTypeTitling',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          GestureDetector(
            child: seccard,
            onTap: () => {
              setState(() {
                _hrColor = widget.time.update_color(0);
                _minColor = widget.time.update_color(0);
                _secColor = widget.time.update_color(1);
                currentSelection = 'sec';
              })
            },
          ),
          
        ],
      ),
    );
    
    Row buttonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                if(currentSelection == 'hr'){
                  _hr = widget.time.minus_time(_hr,currentSelection);
                }else if(currentSelection == 'min'){
                  _min = widget.time.minus_time(_min,currentSelection);
                }else if(currentSelection == 'sec'){
                  _sec = widget.time.minus_time(_sec,currentSelection);
                }
                
              });
              
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 3, 76, 118),
              shape: const CircleBorder(),
              elevation: 5
            ),
            child: const SizedBox(
              height: 20,
              width: 20,
              child: Image(image: AssetImage('Icons/minus.png')),
            )
          )
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                if(currentSelection == 'hr'){
                  _hr = widget.time.add_time(_hr,currentSelection);
                }else if(currentSelection == 'min'){
                  _min = widget.time.add_time(_min,currentSelection);
                }else if(currentSelection == 'sec'){
                  _sec = widget.time.add_time(_sec,currentSelection);
                }
                
              });
              
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 3, 76, 118),
              shape: const CircleBorder(),
              elevation: 5
            ),
            child: const SizedBox(
              height: 20,
              width: 20,
              child: Image(image: AssetImage('Icons/plus.png')),
            )
          )
        )
      ],
    );

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          setTime,
          buttonRow
        ],
      ),
    );
  }

}

class Settimer{
  final hours = 12;
  final minutes = 60;
  final seconds = 60;

  int currenthours = 0;
  int currentminutes = 0;
  int currentseconds = 0;

  // int currentselection = 0;

  int add_time(int currentTime,String unit){
    if(unit == 'hr' && currentTime == 11){
      currenthours = 0;
      return 0;
    }else if(unit == 'min' && currentTime == 59){
      currentminutes = 0;
      return 0;
    }else if(unit == 'sec' && currentTime == 59){
      currentseconds = 0;
      return 0;
    }

    if(unit == 'hr' ){
      currenthours = ++currentTime;
    }else if(unit == 'min'){
      currentminutes = ++currentTime;
    }else if(unit == 'sec'){
      currentseconds = ++currentTime;
    }

    return currentTime;
  }

  int minus_time(int currentTime,String unit){
    if(unit == 'hr' && currentTime == 0){
      currenthours = 11;
      return 11;
    }else if(unit == 'min' && currentTime == 0){
      currentminutes = 59;
      return 59;
    }else if(unit == 'sec' && currentTime == 0){
      currentseconds =59;
      return 59;
    }

    if(unit == 'hr' ){
      currenthours = --currentTime;
    }else if(unit == 'min'){
      currentminutes = --currentTime;
    }else if(unit == 'sec'){
      currentseconds = --currentTime;
    }
    
    return currentTime;
  }

  Color update_color(int value){
    if(value == 1){
      return const Color.fromRGBO(0, 39, 62, 1);
    }else{
      return const Color.fromARGB(255, 3, 76, 118);
    }
  }

  bool isNull(){
    if(currenthours == 0 && currentminutes == 0 && currentseconds == 0){
      return true;
    }else{
      return false;
    }
  }

  int getHours(){
    return currenthours;
  }

  int getMinutes(){
    return currentminutes;
  }

  int getSeconds(){
    return currentseconds;
  }

}
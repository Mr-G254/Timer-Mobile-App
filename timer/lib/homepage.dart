import 'package:flutter/material.dart';
import 'package:timer/countdownpage.dart';
import 'package:timer/presets.dart';
import 'package:timer/timercard.dart';

class Homepage extends StatelessWidget{
  Homepage({super.key});

  void _goToNextpage(BuildContext context,int hr,int min,int sec,String txtlabel){
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context)=> Countdownpage(label: txtlabel,hours: hr,minutes: min,seconds: sec),
      )
    );
  }

  final timer = Settimer();
  final txtController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SafeArea(
            child: Text(
              "Timer",
              style: TextStyle(
                fontFamily: 'KyivTypeTitling',
                fontSize: 40,
                color: Colors.white
              ),
            )
          ),

          Container(
            padding: const EdgeInsets.only(left: 13),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Set the timer",
              style: TextStyle(
                fontFamily: 'KyivTypeTitling',
                fontSize: 18,
                color: Colors.white
              ),
            ),
          ),

          Timercard(time: timer),

          Container(
            padding: const EdgeInsets.only(left: 13),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Set the label(Optional)",
              style: TextStyle(
                fontFamily: 'KyivTypeTitling',
                fontSize: 18,
                color: Colors.white
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: MediaQuery.of(context).size.width*1/4),
            child: TextField(
              controller: txtController,
              cursorColor: Colors.white,
              style: const TextStyle(
                fontFamily: 'KyivTypeTitling',
                fontSize: 20,
                color: Colors.white,
                // height: 0.7
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                isDense: true,
                filled: true,
                fillColor: Color.fromARGB(255, 3, 76, 118),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 3, 76, 118),
                    width: 2
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          
          Container(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: Center(
              child: SizedBox(
                height: 50,
                width: 110,
                child: ElevatedButton(
                  onPressed: (){
                    if(timer.isNull()){
                      const snackbar = SnackBar(content: Text("Ensure that you have set the time"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }else{
                      _goToNextpage(context, timer.getHours(), timer.getMinutes(), timer.getSeconds(),txtController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 3, 76, 118),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ), 
                  child:  const Text(
                    'start',
                    style: TextStyle(
                      fontFamily: 'KyivTypeTitling',
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                  
                ),
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: 13),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Presets",
              style: TextStyle(
                fontFamily: 'KyivTypeTitling',
                fontSize: 18,
                color: Colors.white
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: const SizedBox(
                    height: 80,
                    child: Presets(seconds: 300),
                  ),
                  onTap: (){
                    _goToNextpage(context, 0, 5, 0, "Countdown");
                  },
                ),
                GestureDetector(
                  child: const SizedBox(
                  height: 80,
                  child: Presets(seconds: 600),
                ),
                  onTap: (){
                    _goToNextpage(context, 0, 10, 0, "Countdown");
                  },
                ),
                GestureDetector(
                  child: const SizedBox(
                    height: 80,
                    child: Presets(seconds: 900),
                  ),
                  onTap: (){
                    _goToNextpage(context, 0, 15, 0, "Countdown");
                  },
                ),
                
                
              ],
            )
            
          ),
         
        ],
      ),
    ); 
  }
}
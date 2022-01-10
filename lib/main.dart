import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'game.dart'; //เอาไว้ import StatelessWidget

void main() {
  runApp(const MyApp());
}

//class MyApp เป็น ส่วนของ flutter
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess the number',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(), //พารามิเตอร์ home สำคัญสุด
    );
  }
}

//stateful Widget = หน้า UI ที่react ตามผู้ใช้งาน
//stateless Widget หน้า UI ที่ไม่ได้ react ตามผู้ใช้งาน(หน้า ui นิ่งๆ)
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _controller =
      TextEditingController(); //ตั้งตัวแปรระดับคลาส
  var game = Game();
  var isCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ใช้เค้าโครงแอพ 1 หน้า
      //AppBar : แถบบาร์ข้างบน
      appBar: AppBar(
        title: const Text(
          'GUESS THE NUMBER',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          //เทียบกับ <div> ใน html
          decoration: BoxDecoration(
              color: Colors.amberAccent.shade100,
              borderRadius: BorderRadius.circular(10.0),
              //border: Border.all(width: 5.0, color: Colors.blue),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(2.0, 5.0), //ทิศทางของเงา,
                    blurRadius: 5.0,
                    spreadRadius: 2.0)
              ]),
          //alignment: Alignment.topCenter,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //จัดวางในแนวตั้ง เพราะอยู่ใน column
              //crossAxisAlignment: CrossAxisAlignment.center, //จัดวางในแนวขวาง
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/image/guess_logo.png', width: 150),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'GUESS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 44.0,
                              color: Colors.amber.shade800,
                            ),
                          ),
                          Text(
                            'THE NUMBER',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.amber.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //tip :Alt+Enter=to wrap
                /*SizedBox(
                  height: 20,
                ),*/

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if(isCorrect){
                        game = Game();
                        isCorrect = false;
                      }
                      //โค้ดที่จะทำงานเมื่อกดปุ่ม
                      var input = _controller.text;
                      var guess = int.tryParse(input);
                      var txt = '';

                      if (guess != null) {
                        var result = game.doGuess(guess);
                        if (result == 1) {
                          txt = '$guess TOO HIGH 🔼 Try again. ';
                        }else if(result == -1) {
                          txt = '$guess TOO LOW 🔽 Try again. ';
                        }else if (result == 0) {
                          txt = 'Very good 👏 👏 \n $guess is CORRECT  ❤ , total guesses: ' +
                      (game.guessCount).toString();
                          isCorrect = true;
                        }
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('RESULT'),
                            content:Text(txt),
                          );
                        });
                      }else{
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('❌ ERROR ❌'),
                            content:Text('Please enter only numbers between 1 and 100'),
                          );
                        });
                      }

                    },
                    child: Text(
                      'GUESS',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*trick
กด Ctrl+space bar ==> all method in that class*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; //เอาไว้ import StatelessWidget

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
      home: const HomePage(), //พารามิเตอร์ home สำคัญสุด
    );
  }
}

//stateful Widget = หน้า UI ที่react ตามผู้ใช้งาน
//stateless Widget หน้า UI ที่ไม่ได้ react ตามผู้ใช้งาน(หน้า ui นิ่งๆ)
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              mainAxisSize: MainAxisSize.min,
              //จัดวางในแนวตั้ง เพราะอยู่ใน column
              //crossAxisAlignment: CrossAxisAlignment.center, //จัดวางในแนวขวาง
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/guess_logo.png', width: 150),
                    SizedBox(width: 8,),
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
                //tip :Alt+Enter=to wrap
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: TextField(),
                ),
                ElevatedButton(
                  onPressed: () {
                    //โค้ดที่จะทำงานเมื่อกดปุ่ม
                  },
                  child: Text(
                    'GUESS',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
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

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// class AboutPage extends StatelessWidget{
//   const AboutPage({super.key});
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.yellow,
//         title: SafeArea(child: Text("Finger⚡Blitz",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.deepOrangeAccent),)),
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(20),
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             color: Colors.limeAccent,
//           ),
//           child:Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                 },
//                 child: Container(
//                   width: 150,
//                   height: 50,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.amberAccent,
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Text("Click here to Play!",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.redAccent),),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(15),
//                 margin: EdgeInsets.all(30),
//                 decoration: BoxDecoration(
//                   color: Colors.amberAccent,
//                   borderRadius: BorderRadius.circular(30)
//                 ),
//                 child: Text("Get ready for a thrilling two-player color battle! Player 1 is Blue, and Player 2 is Red. Tap your color as fast as you can to fill the screen. The first to cover the entire page wins!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400))),
//               Container(
//                 padding: EdgeInsets.all(15),
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.amberAccent,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Column(
//                   children: [
//                     Text("How to Play",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//                     Text("1.Both players tap Start to begin.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
//                     Text("2.Tap your color area quickly to spread it.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
//                     Text("3.The fastest tapper fills the screen and wins!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
//                   ],
//                 ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color button_color1 = Colors.white70;
  Color button_color2 = Colors.white70;
  bool p1_start = false;
  bool p2_start = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: SafeArea(child: Text("Finger⚡Blitz",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.limeAccent),)),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2-57,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  p1_start = true;
                  setState(() {
                    button_color1 = const Color.fromARGB(255, 236, 249, 118);;
                  });
                  if(p1_start && p2_start)
                  {
                    p1_start = false;
                    p2_start = false;
                    setState(() {
                      button_color1 = Colors.white70;
                      button_color2 = Colors.white70;
                    });
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimerPage()),
                    );
                  }
                },
                child: const Text("Start",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                color: button_color1,
                shape: const CircleBorder(),
                height: 150,
                minWidth: 150,
              ),
            ),
          ),
          Container(
            color: Colors.red,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  p2_start  = true;
                  setState(() {
                    button_color2 = const Color.fromARGB(255, 236, 249, 118);;
                  });
                  if(p1_start && p2_start)
                  {
                    p1_start = false;
                    p2_start = false;
                    setState(() {
                      button_color1 = Colors.white70;
                      button_color2 = Colors.white70;
                    });
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimerPage()),
                    );
                  }
                },
                child: const Text("Start",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                color: button_color2,
                shape: const CircleBorder(),
                height: 150,
                minWidth: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool flag = false;
  double p1_height = 0;
  double p2_height = 0;
  int p1_score = 0;
  int p2_score = 0;

  @override
  Widget build(BuildContext context) {
    if(flag == false)
    {
      p1_height = MediaQuery.of(context).size.height / 2;
      p2_height = MediaQuery.of(context).size.height / 2;
      flag = true;
    }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: (){
              setState(() {
                p1_height += 30;
                p2_height -= 30;
                p1_score += 10;
              });
              if(p1_height > MediaQuery.of(context).size.height-60)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WinningPage("1",p1_score)));
                }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              width: double.infinity,
              height: p1_height,
              alignment: Alignment.topRight,
              child: Row(
                children: [
                  Expanded(
                    child: Text("Player-1",style: TextStyle(fontSize: 25),)
                    ),
                  Text(p1_score.toString(),style: TextStyle(fontSize: 30))
                ],
              ),
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: (){
              print(MediaQuery.of(context).size.height);
                setState(() {
                  p2_height += 30;
                  p1_height -= 30;
                  p2_score += 10;
                });
                if(p2_height > MediaQuery.of(context).size.height-60)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WinningPage("2",p2_score)));
                }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.red,
              width: double.infinity,
              height: p2_height,
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.rotate(angle:3.14,child: Text(p2_score.toString(),style: TextStyle(fontSize: 30),)),
                  Transform.rotate(angle: 3.14,child: Text("Player-2",style: TextStyle(fontSize: 25)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimerPage extends StatefulWidget{

  const TimerPage({super.key});
  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int timeleft = 3;
  Color bg = Colors.blueAccent;
  void initState(){
    Timer.periodic(Duration(seconds: 1), (timer){
      if(timeleft > 0)
      {
        setState(() {
          timeleft--;
          if(timeleft == 2)
          {
            bg = Colors.red;
          }
          if(timeleft == 1)
          {
            bg = Colors.orangeAccent;
          }
          if(timeleft == 0)
          {
            bg = Colors.green;
          }
        });
      }
      else{
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>GamePage()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((timeleft.toString()) == '0'?"Let's Battle":timeleft.toString(),style: TextStyle(color: Colors.white,fontSize: 60),),
          ],
        ),
      ),
    );
  }
}

class WinningPage extends StatelessWidget{
  String player = "";
  int score = 0;
  WinningPage(this.player,this.score,);
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      backgroundColor: (player == "1")?Colors.blue:Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Winner",style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold)),
            Text((player == "1")?"Player-1":"Player-2",style: const TextStyle(fontSize: 40),),
            Text("Score : $score",style: const TextStyle(fontSize: 25),),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MaterialButton(
                onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.blueGrey,
              child: const Text("Restart",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
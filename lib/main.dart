import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    // Timer(Duration(seconds: 1),(){
    //   setState(() {
    //     showanimation = true;
    //   });
    // });
    Timer(Duration(seconds: 3),(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.black
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("FingerBlitzz" , style: GoogleFonts.oxanium(fontSize: 40,fontWeight: FontWeight.bold, color: Colors.amber),),
            SizedBox(height: 80,),
            Lottie.asset("assets/loading.json",width: 180,
            delegates: LottieDelegates(
            values: [
                    ValueDelegate.color(
            const ['**'],
                    value: Colors.white, 
                    ),
                  ],
                  ),),
            ]
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> colours= [Colors.blue,Colors.red,Colors.amber,Colors.orange,Colors.greenAccent,Colors.pink,Colors.deepPurple,Colors.deepPurpleAccent];
  Color button_color1 = Colors.white;
  Color button_color2 = Colors.white;
  bool p1_start = false;
  bool p2_start = false;
  Color selected = Colors.white;
  Color p1_color = Colors.blue;
  Color p2_color = Colors.red;
  Color palatte_color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: p1_color,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PopupMenuButton<Color>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    color: Colors.black54,
                  icon: Icon(Icons.color_lens_rounded,color: palatte_color,size:35,),
                  onSelected: (Color color){
                    setState(() {
                      if(color != p2_color)
                      {
                        p1_color = color;
                      }
                    });
                  },
                  itemBuilder: (BuildContext context){
                    return colours.map((Color colour)
                    {
                      return PopupMenuItem<Color>(
                        value: colour,
                        child: Container(
                          width: double.infinity,
                          height: 20,
                          color: colour,
                        )
                        );
                    }).toList();
                  },
                ),
                  MaterialButton(
                  onPressed: () {
                    p1_start = true;
                    setState(() {
                      button_color1 = Colors.white70;
                    });
                    if(p1_start && p2_start)
                    {
                      p1_start = false;
                      p2_start = false;
                      setState(() {
                        button_color1 = Colors.white;
                        button_color2 = Colors.white;
                      });
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimerPage(color1: p1_color,color2: p2_color)),
                      );
                    }
                  },
                  child: Text("Start",style: GoogleFonts.rajdhani(color: p1_color,fontSize: 25,fontWeight: FontWeight.w600),),
                  color: button_color1,
                  shape: const CircleBorder(),
                  height: 150,
                  minWidth: 150,
                ),
                ]
              ),
            ),
          ),
          Container(
            color: p2_color,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [MaterialButton(
                  onPressed: () {
                    p2_start  = true;
                    setState(() {
                      button_color2 = Colors.white70;
                    });
                    if(p1_start && p2_start)
                    {
                      p1_start = false;
                      p2_start = false;
                      setState(() {
                        button_color1 = Colors.white;
                        button_color2 = Colors.white;
                      });
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimerPage(color1: p1_color,color2: p2_color,)),
                      );
                    }
                  },
                  child: Text("Start",style: GoogleFonts.rajdhani(color: p2_color,fontSize: 25,fontWeight: FontWeight.w600)),
                  color: button_color2,
                  shape: const CircleBorder(),
                  height: 150,
                  minWidth: 150,
                ),
                PopupMenuButton<Color>(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    color: Colors.black54,
                  icon: Icon(Icons.color_lens_rounded,color: palatte_color,size:35,),
                  onSelected: (Color color){
                    setState(() {
                      if(color != p1_color)
                      {
                        p2_color = color;
                      }
                    });
                  },
                  itemBuilder: (BuildContext context){
                    return colours.map((Color colour)
                    {
                      return PopupMenuItem<Color>(
                        value: colour,
                        child: Container(
                          width: double.infinity,
                          height: 20,
                          color: colour,
                        )
                        );
                    }).toList();
                  },
                ),
                ]
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  final Color c1;
  final Color c2;
  const GamePage({super.key, required this.c1,required this.c2});
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WinningPage("1",p1_score,widget.c1,widget.c2)));
                }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: widget.c1,
              width: double.infinity,
              height: p1_height,
              alignment: Alignment.topRight,
              child: Row(
                children: [
                  Expanded(
                    child: Text("Player-1",style: GoogleFonts.rajdhani(fontSize: 30,fontWeight: FontWeight.w600),)
                    ),
                  Text(p1_score.toString(),style: GoogleFonts.rajdhani(fontSize: 30,fontWeight: FontWeight.w600))
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WinningPage("2",p2_score,widget.c1,widget.c2)));
                }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: widget.c2,
              width: double.infinity,
              height: p2_height,
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.rotate(angle:3.14,child: Text(p2_score.toString(),style: GoogleFonts.rajdhani(fontSize: 30,fontWeight: FontWeight.w600),)),
                  Transform.rotate(angle: 3.14,child: Text("Player-2",style: GoogleFonts.rajdhani(fontSize: 30,fontWeight: FontWeight.w600)))
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
  final Color color1;
  final Color color2;
  const TimerPage( {super.key,required this.color1,required this.color2});
  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int timeleft = 3;
  Color bg = Colors.cyan;
  void initState(){
    Timer.periodic(Duration(seconds: 1), (timer){
      if(timeleft > 0)
      {
        setState(() {
          timeleft--;
          if(timeleft == 2)
          {
            bg = widget.color1;
          }
          else if(timeleft == 1)
          {
            bg = widget.color2;
          }
          else if(timeleft == 0)
          {
            bg = Colors.green;
          }
        });
      }
      else{
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>GamePage(c1: widget.color1,c2: widget.color2,)));
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
            Text((timeleft.toString()) == '0'?"Let's Battle":timeleft.toString(),style: GoogleFonts.rajdhani(color: Colors.white,fontSize: 65,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

class WinningPage extends StatelessWidget{
  String player = "";
  int score = 0;
  final Color player1_color;
  final Color palyer2_color;
  WinningPage(this.player,this.score,this.player1_color,this.palyer2_color);
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      backgroundColor: (player == "1")?player1_color:palyer2_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 550,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Lottie.asset(
                    'assets/winning.json',
                    ),
                    Text("You Won",style: GoogleFonts.bangers(fontSize: 60,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Text("Score : $score",style: GoogleFonts.rajdhani(fontSize: 30,fontWeight: FontWeight.w700),),
            Padding(
              padding: const EdgeInsets.all(15),
              child: MaterialButton(
                onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.blueGrey,
              child: Text("Restart",style: GoogleFonts.rajdhani(fontSize: 15,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
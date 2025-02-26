import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/animation.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  void initState(){
    super.initState();
    
    Future.delayed(Duration(seconds: 3), () {
      // _controller.stop();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
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
            const Text("FingerBlitzz" , style: TextStyle(fontFamily: 'Oxanium',fontSize: 40,fontWeight: FontWeight.bold, color: Colors.amber),),
            const SizedBox(height: 80,),
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
  List<Color> colours= [Colors.blue,Colors.red,Colors.amberAccent,Colors.deepOrangeAccent,Colors.greenAccent,Colors.pink,Colors.deepPurple,Colors.deepPurpleAccent];
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
                      Future.delayed(Duration(milliseconds: 100),(){
                        setState(() {
                        button_color1 = Colors.white;
                        button_color2 = Colors.white;
                      });
                      });
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimerPage(color1: p1_color,color2: p2_color)),
                      );
                    }
                  },
                  child: Text("Start",style: TextStyle(fontFamily: 'Rajdhani',color: p1_color,fontSize: 25,fontWeight: FontWeight.w600),),
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
                      Future.delayed(const Duration(milliseconds: 100),(){
                      setState(() {
                        button_color1 = Colors.white;
                        button_color2 = Colors.white;
                        });
                      });
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimerPage(color1: p1_color,color2: p2_color,)),
                      );
                    }
                  },
                  child: Text("Start",style: TextStyle(fontFamily:'Rajdhani',color: p2_color,fontSize: 25,fontWeight: FontWeight.w600)),
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
  int p1_taps = 0;
  int p2_taps = 0;

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
            padding: const EdgeInsets.all(0),
            onPressed: (){
              setState(() {
                p1_taps += 1;
                p1_height += 30;
                p2_height -= 30;
                p1_score += 12;
              });
              if(p1_height > MediaQuery.of(context).size.height-60)
                {
                  print(p1_taps);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WinningPage("1",p1_score,widget.c1,widget.c2,p1_taps)));
                }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              color: widget.c1,
              width: double.infinity,
              height: p1_height,
              alignment: Alignment.topRight,
              child: Row(
                children: [
                  const Expanded(
                    child: Text("Player-1",style: TextStyle(fontFamily:'Rajdhani',fontSize: 30,fontWeight: FontWeight.w600),)
                    ),
                  Text(p1_score.toString(),style: const TextStyle(fontFamily:'Rajdhani',fontSize: 30,fontWeight: FontWeight.w600))
                ],
              ),
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: (){
                p2_taps += 1;
                setState(() {
                  p2_height += 30;
                  p1_height -= 30;
                  p2_score += 12;
                });
                if(p2_height > MediaQuery.of(context).size.height-60)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WinningPage("2",p2_score,widget.c1,widget.c2,p2_taps)));
                }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              color: widget.c2,
              width: double.infinity,
              height: p2_height,
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.rotate(angle:3.14,child: Text(p2_score.toString(),style: const TextStyle(fontFamily:'Rajdhani',fontSize: 30,fontWeight: FontWeight.w600),)),
                  Transform.rotate(angle: 3.14,child: const Text("Player-2",style:TextStyle(fontFamily:'Rajdhani',fontSize: 30,fontWeight: FontWeight.w600)))
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
  List<String> quotes = ["Tap fast,the winner gets 1 crore!","Win, and the winner might get a GF / BF...","Tap fast, looser gets a break UP!","Winner will get a date with a cute girl/boy"];
  int timeleft = 3;
  Color bg = Colors.cyan;
  void initState(){
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer){
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GamePage(c1: widget.color1,c2: widget.color2,)));
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
            Text((timeleft.toString()) == '0'?"Let's Battle":timeleft.toString(),style: const TextStyle(fontFamily:'Rajdhani',color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

class WinningPage extends StatefulWidget{
  String player = "";
  int score = 0;
  final Color player1_color;
  final Color palyer2_color;
  final int taps;
  WinningPage(this.player,this.score,this.player1_color,this.palyer2_color,this.taps,{super.key});

  @override
  State<WinningPage> createState() => _WinningPageState();
}

class _WinningPageState extends State<WinningPage>with SingleTickerProviderStateMixin {
  late AnimationController winning_controller;
  final Color board_text = Colors.amber;
  @override
  void initState(){
    super.initState();
    winning_controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );
    winning_controller.repeat();
  }
  @override
  void dispose(){
    winning_controller.dispose();
    super.dispose();
  }
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      backgroundColor: (widget.player == "1")?widget.player1_color:widget.palyer2_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 500,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Lottie.asset(
                    'assets/winning.json',
                    onLoaded: (composition){
                      winning_controller.duration = composition.duration;
                    }
                    ),
                    const Text("You Won",style: TextStyle(fontFamily:'Bangers',fontSize: 60,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width*0.55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.amberAccent,
                  )
                ),
                child: Column(
                  children: [
                    Text("Score Board",style: TextStyle(fontFamily: 'Oxanium',fontSize: 30,fontWeight: FontWeight.bold,color: board_text),),
                    Text("Score : ${widget.score}",style: TextStyle(fontFamily: 'Rajdhani',fontSize: 20,fontWeight: FontWeight.w600,color: board_text),),
                    Text("No of taps : ${widget.taps}",style: TextStyle(fontFamily: 'Rajdhani',fontSize: 20,fontWeight: FontWeight.w600,color: board_text),)
                  ],
                ),
              ),]
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:10),
              child: SizedBox(
                width: 100,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: (){
                    winning_controller.stop();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                color: const Color.fromARGB(255, 114, 137, 148),
                child:const  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Restart",style: TextStyle(fontFamily: 'Rajdhani',fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Icon(Icons.restart_alt_sharp,color: Color.fromARGB(255, 233, 223, 130),),
                  ]
                ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
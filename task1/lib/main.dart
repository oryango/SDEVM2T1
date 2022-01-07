import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quote Generator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _col = 0;
  int _row = 5;

  final List<AssetImage> background = [
    AssetImage("assets/images/wells_BG.jpg"),
    AssetImage("assets/images/keller_BG.jpg"),
    AssetImage("assets/images/carroll_BG.jpg"),
    AssetImage("assets/images/twain_BG.jpg"),
    AssetImage("assets/images/kafka_BG.jpg"),
    AssetImage("")
  ];

  final List<List> _quotes = [
      [
        "Beauty is in the heart of the beholder.",
        "Human history in essence is the history of ideas.",
        "The past is but the past of a beginning.",
        "If you fell down yesterday, stand up today.",
        "The crisis of today is the joke of tomorrow."
      ],//H.G. Wells
      [
        "Alone we can do so little; together we can do so much.",
        "Keep your face to the sunshine and you cannot see a shadow.",
        "Although the world is full of suffering, it is also full of the overcoming of it.",
        "We can do anything we want to if we stick to it long enough.",
        "The highest result of education is tolerance."
      ],//Helen Keller
      [
        "Take care of the sense and the sounds will take care of themselves.",
        "Always speak the truth, think before you speak, and write it down afterwards.",
        "One of the secrets of life is that all that is really worth the doing is what we do for others.",
        "I can't go back to yesterday - because I was a different person then.",
        "Which form of proverb do you prefer Better late than never, or Better never than late?"
      ],//Lewis Carroll
      [
        "It's not the size of the dog in the fight, it's the size of the fight in the dog.",
        "Age is an issue of mind over matter. If you don't mind, it doesn't matter.",
        "Do the thing you fear most and the death of fear is certain.",
        "When you fish for love, bait with your heart, not your brain.",
        "Wrinkles should merely indicate where smiles have been."
      ],//Mark Twain
      [
        "Start with what is right rather than what is acceptable.",
        "Anyone who keeps the ability to see beauty never grows old.",
        "A first sign of the beginning of understanding is the wish to die.",
        "He who seeks does not find, but he who does not seek will be found.",
        "Evil is whatever distracts."
      ],//Franz Kafka
      ["To see a quote, please choose a figure and then press the 'Get Quote' button"]
    ];

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double _figureButton = height/3;
    double _figureChosen = height/4;
    double _quoteButton = 0;
    double _quoteChosen = width*2/13;


    ButtonStyle listButton = ElevatedButton.styleFrom(
      minimumSize: Size(width*5/17, 0), primary: const Color(0xFF32383D)
    );

    ButtonStyle getQuoteButton = ElevatedButton.styleFrom(
      //side: BorderSide(width: 2, color: Color(0xFF86C232)),
      primary: const Color(0xFF61892F)
    );

    const TextStyle buttonText = TextStyle(fontSize: 25);

    void choseFigure(int row){
      setState(() {
        _row = row;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Color(0xFF86C232), fontSize: 23),),
        backgroundColor: const Color(0xFF32383D),
      ),
      body: Center(
        child: Container(
          color: const Color(0xFF222629 ),
          padding: const EdgeInsets.all(6.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ignore: prefer_const_constructors
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: background[_row],
                    fit: BoxFit.fitHeight
                  ),
                  color: const Color(0xFF222629),
                  border: Border.all(
                    width: 5,
                    color: const Color(0xFF61892F)
                  )
                ),
                height: height/2,
                alignment: Alignment.center, 
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Color(0xAA33333A),
                  child: Text(
                    _quotes[_row][_col],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEEEEEE)
                    ), 
                  ),
                ),
              ),
              AnimatedContainer(
                height: (_row!=5) ? _figureChosen : _figureButton ,
                duration: const Duration(milliseconds: 500),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 9),
                      child: ElevatedButton(
                        onPressed: (){choseFigure(0);},
                        style: listButton, 
                        child: const Text("H.G.\nWells", style: buttonText,)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 9),
                      child: ElevatedButton(
                        onPressed: (){choseFigure(1);},
                        style: listButton,
                        child: const Text("Helen\nKeller", style: buttonText,)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 9),
                      child: ElevatedButton(
                        onPressed: (){choseFigure(2);},
                        child: const Text("Lewis\nCarroll", style: buttonText,),
                        style: listButton,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 9),
                      child: ElevatedButton(
                        onPressed: (){choseFigure(3);}, 
                        child: const Text("Mark\nTwain", style: buttonText,),
                        style: listButton,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 9),
                      child: ElevatedButton(
                        onPressed: (){choseFigure(4);}, 
                        child: const Text("Franz\nKafka", style: buttonText,),
                        style: listButton,
                        
                      ),
                    ),
                  ],
                )
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.all(6),
                height: (_row!=5) ? _quoteChosen : _quoteButton,
                width: width,
                child: OutlinedButton(
                  style: getQuoteButton,
                  onPressed: (){setState(() {
                    _col += 1;
                    if(_col >= 5)
                    {
                      _col = 0;
                    }
                  });},
                  child: Text("Get Quote", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFFFFFF)
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}

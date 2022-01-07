import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:task2/height_weight_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Tracker',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Calorie Tracker'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentVal = 25;
  double _genderVal = 0;
  final List<String> _genderChar = ["F","M"];

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF88D1F1),),
      backgroundColor: Color(0xFFFFFAF1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Welcome!", 
                  style: TextStyle(
                    fontSize: 50, 
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("This is a calorie tracking application. Select your age from the number picker (Only accepts 15 - 80)",
                  style: TextStyle(fontSize: 20,),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:15.0),
                child: NumberPicker(
                  haptics: true,
                  value: _currentVal,
                  minValue: 15,
                  maxValue: 80,
                  axis: Axis.horizontal,
                  itemHeight: height/5,
                  itemWidth: width*6/20,
                  selectedTextStyle: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Color(0xFF777777)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xFF88D1F1), width: 5),
                  ),
                  onChanged: (value) => setState(() {
                    _currentVal = value;
                  }),
                ),
              ),
              Text("Position the slider to your gender", style: TextStyle(fontSize: 20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.female_rounded, size: height.toDouble()/16,),

                  SizedBox(
                    height: height/16,
                    width: width/2,
                    child: Slider(
                      value: _genderVal, 
                      onChanged: (double value){setState(() {
                        _genderVal = value;
                        });
                      },
                      max: 1,
                      divisions: 1,
                      label: _genderChar[(_genderVal).toInt()],
                    ),
                  ),
                  
                  Icon(Icons.male_rounded, size: height.toDouble()/16,)
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('You\'re $_currentVal years old, and your gender is '+ _genderChar[_genderVal.toInt()] +
                  ".\nIf that is correct please proceed to the next page by clicking 'Next'", 
                  style: const TextStyle(fontSize: 19),
                  textAlign: TextAlign.justify,
                ),
              ),

              Container(
                width: width*4/5,
                height: height/9,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFABDFF6)),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25))
                  ),
                  onPressed: () {
                    Map<String,double> inputs = {"age":_currentVal.toDouble(),"gender":_genderVal};
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HeightAndWeightScreen(inputs),)
                    );
                  },
                  child: const Text("Next"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

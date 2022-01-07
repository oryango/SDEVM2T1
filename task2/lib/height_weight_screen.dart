import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:task2/activity.dart';

class HeightAndWeightScreen extends StatefulWidget {
  Map<String,double> inputs;
  HeightAndWeightScreen(this.inputs, { Key? key }) : super(key: key);

  @override
  _HeightAndWeightScreenState createState() => _HeightAndWeightScreenState();
}

class _HeightAndWeightScreenState extends State<HeightAndWeightScreen> {

  double _height = 180;
  double _weight = 65;

  InputDecoration heightField = const InputDecoration(
    filled: true,
    fillColor: Color(0xFFEEEEEE),
    labelText: "Height in cm",
  );
  InputDecoration weightField = const InputDecoration(
    filled: true, 
    fillColor: Color(0xFFEEEEEE),
    labelText: "Weight in kg",
  );

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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Step 2.",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const Text("Input your height in cm and weight in kg",
                style: TextStyle(fontSize: 30,),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0,bottom: 15),
                child: TextFormField(
                  decoration: heightField,
                  keyboardType: TextInputType.number,
                  initialValue: "180",
                  style: const TextStyle(fontSize: 20),
                  onChanged: (String value){
                    _height = double.parse(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: TextFormField(
                  decoration: weightField,
                  keyboardType: TextInputType.number,
                  initialValue: "65",
                  style: const TextStyle(fontSize: 20),
                  onChanged: (String value){
                    _weight = double.parse(value);
                  },
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
                    widget.inputs.addAll({"height":_height,"weight":_weight});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Activity(
                          widget.inputs
                        )
                      ),
                    );
                  },
                  child: const Text("Next")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
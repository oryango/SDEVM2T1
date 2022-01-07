import "package:flutter/material.dart";
import 'package:task2/tracking.dart';

class Activity extends StatefulWidget {
  Map<String,double> inputs;

  Activity(this.inputs, { Key? key }) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  double _activity = 1.2001;


  void buttonClick(double multiplier){
    setState(() {
      _activity = multiplier;
    });
  }

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    Map<double, String> activityLevel = {1.2:"Minimal",1.4:"Moderate",1.6:"Heavy",1.9:"Intense"};
    
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
                padding: EdgeInsets.all(8.0),
                child:  Text("And finally...",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              Text((_activity!= 12.001)?"You have selected "+activityLevel[_activity].toString()+" activity":"Select your level of weekly activity.",
                style: TextStyle(fontSize: 30,),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 1/2*height,
                child: GridView.count(
                  primary: false, 
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    Container(
                      color: const Color(0xFF88D1F1),
                      child: TextButton(
                        onPressed: (){buttonClick(1.2);}, 
                        child: Column(
                          children: [
                            Image(image: const AssetImage("assets/images/moderate.png"), height: 1/7*height,),
                            const Text("Minimal",style: TextStyle(color: Color(0xFF000000),fontSize: 25),)
                          ],
                        ),),
                    ),
                    Container(
                      color: const Color(0xFFABDFF6),
                      child: TextButton(
                        onPressed: (){buttonClick(1.4);}, 
                        child: Column(
                          children: <Widget>[
                            Image(image: const AssetImage("assets/images/moderate.png"), height: 1/7*height,),
                            const Text("Moderate",style: TextStyle(color: Color(0xFF000000),fontSize: 25),)
                          ],
                        ),),
                    ),
                    Container(
                      color: const Color(0xFFABDFF6),
                      child: TextButton(
                        onPressed: (){buttonClick(1.6);}, 
                        child: Column(
                          children: [
                            Image(image: const AssetImage("assets/images/running.png"), height: 1/7*height,),
                            const Text("Heavy",style: TextStyle(color: Color(0xFF000000),fontSize: 25),)
                          ],
                        ),),
                    ),
                    Container(
                      color: const Color(0xFF88D1F1),
                      child: TextButton(
                        onPressed: (){buttonClick(1.9);}, 
                        child: Column(
                          children: [
                            Image(image: const AssetImage("assets/images/intense.png"), height: 1/7*height,),
                            const Text("Intense",style: TextStyle(color: Color(0xFF000000),fontSize: 25),)
                          ],
                        ),),
                    )
                  ],
                ),
              ),
              Container(
                width: width*4/5,
                height: height/9,
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFABDFF6)),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25))
                  ),
                  onPressed: () {
                    double gender = (widget.inputs["gender"] == 1) ? 5 : -161;
                    double _totalCal = (10*widget.inputs["weight"]!.toDouble()+6.25*widget.inputs["height"]!.toDouble()-5*widget.inputs["age"]!.toDouble()+gender)*_activity;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tracking(
                          _totalCal, _totalCal
                        )
                      ),
                    );
                  }, 
                  child: const Text("Calculate")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
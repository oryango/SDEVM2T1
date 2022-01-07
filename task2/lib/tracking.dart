import "package:flutter/material.dart";

class Tracking extends StatefulWidget {
  double totalCal, currentCal;
  Tracking(this.totalCal, this.currentCal, { Key? key }) : super(key: key);

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  double _totalConsumed = 0;

  TextEditingController foodController = TextEditingController();
  TextEditingController calController = TextEditingController();

  InputDecoration foodField = const InputDecoration(
    filled: true, 
    fillColor: Color(0xFFEEEEEE),
    labelText: "Food Name"
  );
  InputDecoration calField = const InputDecoration(
    filled: true, 
    fillColor: Color(0xFFEEEEEE),
    labelText: "Calorie Count"
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("Calories left today:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 250,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        backgroundColor: Color(0xFFAAAAAA),
                        strokeWidth: 25,
                        value: _totalConsumed/widget.totalCal,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.currentCal.toString(),
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width/2,
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Calories/day:\n\n"+widget.totalCal.toString(), 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: width/2,
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Calories consumed today:\n$_totalConsumed", 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: foodController, decoration: foodField,style: const TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: calController, decoration: calField, keyboardType: TextInputType.number,style: const TextStyle(fontSize: 20),),
            ),
            Container(
              width: width*4/5,
              height: height/9,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFABDFF6)),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25))
                  ),                
                onPressed: (){
                  setState(() {
                    widget.currentCal -= double.parse(calController.text);
                    _totalConsumed += double.parse(calController.text);
                  });
                }, 
              child: const Text("Track")
              ),
            )
          ],
        ),
      ),
    );
  }
}
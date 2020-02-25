import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;
  bool reverse;

  Drawhorizontalline(this.reverse) {
    _paint = Paint()
      ..color = Colors.white70
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (!reverse) {
      canvas.drawLine(Offset(10.0, 0.0), Offset(90.0, 0.0), _paint);
    } else {
      canvas.drawLine(Offset(-90.0, 0.0), Offset(-10.0, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class _MyAppState extends State<MyApp> {

  TextEditingController _num1numerator = new TextEditingController();
  TextEditingController _num1denominator = new TextEditingController();
  TextEditingController _num2numerator = new TextEditingController();
  TextEditingController _num2denominator = new TextEditingController();
  double result = 0;


  Widget build(BuildContext context) {

    Widget topBox = new Container(
      child: Row(
        children: <Widget>[
          
          Expanded(child:Padding(
            padding: EdgeInsets.fromLTRB(50, 80, 50, 0),
            child: TextField(
            controller: _num1numerator,
            keyboardType: TextInputType.numberWithOptions(),
            style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"),
            decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.blue[200],
                        ),
                        ),
                        ),
                        ),

            Expanded(child: Padding(padding: EdgeInsets.fromLTRB(50, 80, 50, 0),
            child: TextField(
            controller: _num2numerator,
            keyboardType: TextInputType.numberWithOptions(),
            style: TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"),
            decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.blue[200]
                        ),
                        ),
                        ),
            ),           
            ],
      ),
    );

    Widget bottomBox = new Container(
      child: Row(
        children: <Widget>[
          Expanded(child: Padding(padding: EdgeInsets.fromLTRB(50, 20, 50, 50),
          child: TextField(
            controller: _num1denominator,
            keyboardType: TextInputType.numberWithOptions(),
            style: TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"),
            decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.blue[200],
                        ),
                        ),
                        ),
                        ),
            Expanded(
              child: Padding(padding: EdgeInsets.fromLTRB(50, 20, 50, 50),
              child: TextField(
                controller: _num2denominator,
                keyboardType: TextInputType.numberWithOptions(),
                style: TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto"),
            decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.blue[200],
                        ),
                        ),
                  ),
                  ),
        ],
      ),
    );

    Widget buttons = new Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
      Padding(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 50.0),
                child: new MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    elevation: 5.0,
                    minWidth: 80.0,
                    height: 40,
                    color: Colors.pinkAccent,
                    child: new Text('+',
                    style:
                           new TextStyle(fontSize: 20.0, color: Colors.black)),
                           onPressed: _addOperation,
                  ),
                ),
                Padding(
                  padding:EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 50),
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      elevation: 5.0,
                      minWidth: 80.0,
                      height: 40,
                      color: Colors.purpleAccent,
                      child: new Text('-',
                      style: 
                             new TextStyle(fontSize: 20.0, color: Colors.black)),
                      onPressed: _subOperation,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 50),
                    child: new MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      elevation: 5.0,
                      minWidth: 80.0,
                      height: 40,
                      color: Colors.orangeAccent,
                      child: new Text('x',
                      style:
                             new TextStyle(fontSize: 20.0, color: Colors.black)),
                      onPressed: _multOperation,
                      ),
                      ),

                  Padding(
                    padding:EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 50),
                    child: new MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      elevation: 5.0,
                      minWidth: 80.0,
                      height: 40,
                      color: Colors.greenAccent,
                      child: new Text('/ ',
                      style: 
                             new TextStyle(fontSize: 20.0, color: Colors.black)),
                      onPressed: _divOperation,
                    ),
                    ),

                ],
                ),
                );

    Widget line = new Container(
      child: Row(children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
        child: CustomPaint(
          painter: Drawhorizontalline(false),
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(160, 30, 50, 0),
        child: CustomPaint(
          painter: Drawhorizontalline(false)),
        ),
        ],
        ),
        );


    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
        /*primaryColor: Colors.blue,

      ),*/
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.limeAccent[700],
          title: Text('Welcome to Fraction Calculator',
          style: TextStyle(fontSize: 22.0),
          
          ),
        ),
        body: Column(
          children: <Widget>[
            topBox,
            line,
            bottomBox,
            buttons,
            Text(
              "Result : $result",
                  style: new TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Arial"
                  ),
                  ),

            Padding(padding: EdgeInsets.all(30),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: _resetOperation,
              child: Text('RESET', style: TextStyle(fontSize: 22.0),),
              color: Colors.yellow,
            ),
          ),

          ],
        ),
      ),
    );
  }

void _addOperation(){
  setState(() {
    double a = double.parse(_num1numerator.text);
    double b = double.parse(_num1denominator.text);
    double c = double.parse(_num2numerator.text);
    double d = double.parse(_num2denominator.text);

    result = ((a*d) + (b*c)) / (b*d);

  }
  );

}

void _subOperation(){
  setState(() {
    double a = double.parse(_num1numerator.text);
    double b = double.parse(_num1denominator.text);
    double c = double.parse(_num2numerator.text);
    double d = double.parse(_num2denominator.text);

    result = ((a*d) - (b*c)) / (b*d);

    
  });
}

void _multOperation(){
  setState(() {
    double a = double.parse(_num1numerator.text);
    double b = double.parse(_num1denominator.text);
    double c = double.parse(_num2numerator.text);
    double d = double.parse(_num2denominator.text);

    result = (a*c) / (b*d);
    
  });
}

void _divOperation(){
  setState(() {
    double a = double.parse(_num1numerator.text);
    double b = double.parse(_num1denominator.text);
    double c = double.parse(_num2numerator.text);
    double d = double.parse(_num2denominator.text);

    result = (a*d) / (b*c);
    
  });
}

void _resetOperation(){
  setState(() {
    _num1numerator.clear();
    _num1denominator.clear();
    _num2numerator.clear();
    _num2denominator.clear();
    result = 0.0;
  });
}

}



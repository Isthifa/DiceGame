import 'dart:math';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text('DiceGame',style:TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: DiceApp(),
      ),
    ),
  );
}

class DiceApp extends StatefulWidget {

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftdice=1;
  int rightdice=1;
  void changeDiceFace(){
    setState(() {
      rightdice=Random().nextInt(6)+1;
      leftdice=Random().nextInt(6)+1;

    });
  }
  void _showDailogBox()
    {
      context.showFlashDialog(
          content: Text('you won.....'),
        title: Text('Thank you for playing')
          );
  }
@override
Widget build(BuildContext context) {
return Center(
child: Row(
children: <Widget>[
Expanded(
child: Padding(
padding: const EdgeInsets.all(16.0),
child: TextButton(
onPressed: () {
  changeDiceFace();
},
child: Image.asset('images/dice$leftdice.png'),
),
),
),
Expanded(
child: Padding(
padding: const EdgeInsets.all(16.0),
child: TextButton(
onPressed: () {
setState(() {
  changeDiceFace();
  if(leftdice==rightdice)
    {
      _showDailogBox();
    }
});
},
child: Image.asset('images/dice$rightdice.png'),
),
),
),
],
),
);
}
}




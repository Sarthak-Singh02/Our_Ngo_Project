import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Submitted extends StatefulWidget {
  const Submitted({Key? key}) : super(key: key);

  @override
  State<Submitted> createState() => _SubmittedState();
}

class _SubmittedState extends State<Submitted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.orangeAccent),
              child: Icon(
                Icons.done_rounded,
                color: Colors.indigoAccent,
                size: 90,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                "Your details has been recorded",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

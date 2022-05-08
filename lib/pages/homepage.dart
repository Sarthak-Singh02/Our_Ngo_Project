import 'package:flutter/material.dart';
import 'package:ngo_app/pages/donatepage.dart';
import 'package:ngo_app/pages/helpUs.dart';
import 'package:ngo_app/pages/join.dart';
import 'package:ngo_app/utilities/MyRoutes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF9A826)
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.indigoAccent,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/icon.jpg'),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.indigoAccent,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Passion For Giving",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Choose any one",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DonatePage()))
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 50,
                            backgroundImage: AssetImage('assets/donate.png'),
                          ),
                        ),
                        Text(
                          "Donate",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "Donate to NGO",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HelpUs()));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 50,
                            backgroundImage: AssetImage('assets/help.png'),
                          ),
                        ),
                        Text(
                          "Help Us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "Need help from NGO",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: 208,
                width: 200,
                child: Image.asset('assets/background.png'))
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoinUs()));
                          },
        child: Container(
            color: Color(0xFFF9A826),
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              "Join NGO To Help",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ngo_app/utilities/MyRoutes.dart';

class HelpUs extends StatefulWidget {
  const HelpUs({ Key? key }) : super(key: key);

  @override
  State<HelpUs> createState() => _HelpUsState();
}

class _HelpUsState extends State<HelpUs> {
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  double _currentSliderValue = 20;

  moveToSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.submitRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                alignment: Alignment.centerLeft,
                child: Text(
                  "We are here to help you ",
                  style: TextStyle(
                    color: Color(0xFFF9A826),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        
                          labelText: "Name",
                          hintText: 'Enter Name',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: "Location",
                          hintText: 'Enter Location',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Location cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: "Description",
                          hintText: 'Describe how we can help you...',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Description cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                  SizedBox(height: 10,),
                  Material(
                          color: Color(0xFFF9A826),
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                          child: InkWell(
                            onTap: () => moveToSubmit(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButton ? 50 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: changeButton
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Submit",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                            ),
                          ),
                        
              )],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

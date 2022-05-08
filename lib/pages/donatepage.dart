import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngo_app/utilities/MyRoutes.dart';

class DonatePage extends StatefulWidget {
  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  // const DonatePage({Key? key}) : super(key: key);
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
                  "Donate Food Details",
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
                        
                          labelText: "Pickup where ?",
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
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: "Food Item(s)",
                          hintText: 'Enter Food Items',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Food Item(s) cannot be empty";
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
                          labelText: "Preffered Time",
                          hintText: 'Enter Pickup Time',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Pickup time cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: "Pickup day",
                          hintText: 'Enter day',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Day cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Quantity:- " +
                          _currentSliderValue.round().toString() +
                          " persons"),
                    ),
                  ),
                  Slider(
                    value: _currentSliderValue,
                    min: 20,
                    max: 300,
                    divisions: 280,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          child: Text("Min: 20"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          child: Text("Max: 300"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
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

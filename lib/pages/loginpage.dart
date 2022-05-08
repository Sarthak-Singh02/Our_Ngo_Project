import 'package:flutter/material.dart';
import 'package:ngo_app/utilities/MyRoutes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool changeButton=false;

  final _formkey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async{
    if(_formkey.currentState!.validate()){
      setState(() {
                        changeButton=true;
                      });
                    await Future.delayed(Duration(seconds: 1));
                    await Navigator.pushNamed(context, MyRoutes.homeRoute);
                    setState(() {
                        changeButton=false;
                      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/icon.jpg'),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "Sign in NGO App",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText:"Enter Username",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Username can't be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              
                            });
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText:"Enter Password",
                            labelText: "Password",
                            
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Password can't be empty";
                            }
                            else if(value.length<8){
                              return "Password length should be atleast 8";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                    onTap: () => movetoHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton? 50 :150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                        ? CircularProgressIndicator(
                          color: Colors.indigoAccent,
                        )
                        : Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                          ),
                          decoration: BoxDecoration(
                            color: changeButton?Colors.transparent:Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(changeButton?50:8),
                          ), 
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

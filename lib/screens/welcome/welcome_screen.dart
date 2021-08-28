import 'package:flutter/material.dart';
import 'package:flutter_app/screens/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

import '../signup/cad_screen.dart';
import '../home_screen.dart';
import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("BEM VINDO AO \nAG NOTÍCIAS", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              SizedBox(height: size.height*0.03,),
              SvgPicture.asset("assets/icons/reading-newspaper.svg", height: size.height*0.45 ,),
              SizedBox(height: size.height*0.05,),
              RoundedButton(
                text: "Login",
                press: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return LoginScreen();
                    })
                  );
                },
              ),
              RoundedButton(
                text: "Cadastrar",
                press: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return CadScreen();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
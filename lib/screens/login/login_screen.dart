import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/components/rounded_button.dart';
import 'package:flutter_app/screens/components/rounded_input_field.dart';
import 'package:flutter_app/screens/components/rounded_pass_field.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../signup/cad_screen.dart';
import '../welcome/welcome_screen.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final myControllerEmail = TextEditingController();
  final myControllerUsuer = TextEditingController();
  @override
  void dispose() {
    myControllerEmail.dispose();
    myControllerUsuer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telaLogin(),
    );
  }
  SingleChildScrollView telaLogin(){
    Size size =  MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold),),
            SvgPicture.asset("assets/icons/reading-newspaper.svg", height: size.height*0.35,),
            RoundedInputField(hintText: "Email", iconData: Icons.email, onChanged: (value){},  myController: myControllerEmail),
            SizedBox(height: size.height*0.01,),
            RoundedPassField(hintText: "Senha", iconData: Icons.lock, onChanged: (value){}, myController: myControllerUsuer),
            SizedBox(height: size.height*0.01,),
            RoundedButton(text: 'Login', press: (){
              Navigator.pushNamedAndRemoveUntil(context, "/home_screen", (Route<dynamic> route) => false);
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return HomeScreen();
                  })
              );*/

            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Não tem uma conta? ", style: TextStyle(color: kTextColor),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return CadScreen();
                      }),
                    );
                  },
                  child: Text("Cadastre-se",
                    style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
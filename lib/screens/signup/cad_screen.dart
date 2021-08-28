import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/data/album_remote_datasource.dart';
import 'package:flutter_app/models/Cliente.dart';
import 'package:flutter_app/models/ClienteModel.dart';
import 'package:flutter_app/screens/conecdb.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/welcome/welcome_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/rounded_input_field.dart';
import '../components/text_field_container.dart';
class CadScreen extends StatefulWidget {
  @override
  _CadScreenState createState() => _CadScreenState();
}
class _CadScreenState extends State<CadScreen> {
  final myControllerEmail = TextEditingController();
  final myControllerUsuer = TextEditingController();
  final myControllerPass = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerPass.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telaCadastro(),
    );
  }
  SingleChildScrollView telaCadastro(){
    Size size =  MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/reading-newspaper.svg',
              height: size.height*0.35,
            ),
            RoundedInputField(hintText: "email", iconData: Icons.email, onChanged: (value){},  myController: myControllerEmail,),
            SizedBox(height: size.height*0.01,),
            RoundedInputField(hintText: "usuário", iconData: Icons.person, onChanged: (value){},  myController: myControllerUsuer,),
            SizedBox(height: size.height*0.01,),
            RoundedInputField(hintText: "senha",iconData: Icons.lock,  onChanged: (value){}, myController: myControllerPass,),
            SizedBox(height: size.height*0.01,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              width: size.width*0.85,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(23),
              ),
              child: ClipRRect(
                child: TextButton(
                  onPressed: (){
                    var nome = myControllerPass.text;
                    ClienteRemoteDataSourceImpl().createCliente(new Cliente(id: '', nome: nome));
                    myControllerPass.clear();
                  },
                  child: Text("Cadastrar", style: TextStyle(color: Colors.white),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

import '../components/rounded_button.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> _options = <String>['Minha conta', 'Configurações', 'Ajuda', 'Sair'];
  final List<IconData> _iconOptions = <IconData>[Icons.person_outline, Icons.settings_outlined, Icons.help_outline, Icons.logout_outlined];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profile(),
    );
  }
  Column profile(){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: size.height*0.45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
                child: Image.asset(
                  "assets/images/male-avatar.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: size.width  * 0.06,
              bottom: size.height * 0.04,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Xoury",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(child: buildListView()),
      ],
    );
  }
  ListView buildListView(){
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: size.width * 0.85,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: TextButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(_iconOptions[index], color: Colors.black87,),
                          SizedBox(width: 20,),
                          Text(_options[index], style: TextStyle(color: Colors.black87),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.arrow_forward_outlined, color: Colors.black87,),
                        ],
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    primary: Colors.black26,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}

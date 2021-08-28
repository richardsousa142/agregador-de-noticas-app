import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_svg/svg.dart';
class Noticias extends StatefulWidget {
  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  final List<String> jornal = <String>['Terra', 'TechTudo', 'G1', 'Canal_Rural'];
  final List<String> titulo = <String>['Tecnologia_auxilia_o_produtor_no_controle_das_principais_pragas_do_café_e_hortifrúti',
                                       'Tecnologia_jurídica_ganha_mais_força_no_mundo_e_pode_gerar_celeridade_processual',
                                       'Twitter_testa_opção_para_usuários_denunciarem_tuítes_enganosos',
                                       'Benedito_Rosa_fala_sobre_importância_da_tecnologia_para_diagnosticar_PSA'];
  final List<String> intro = <String>['O mercado de tecnologia jurídica cresce no mundo todo e plataformas brasileiras são exemplos de como essa tendência impacta o dia a dia das ...',
                                      'O mercado de tecnologia jurídica cresce no mundo todo e plataformas brasileiras são exemplos de como essa tendência impacta o dia a dia das ...',
                                      'Rede social informou que um experimento com algumas pessoas nos Estados Unidos, na Coreia do Sul e na Austrália vai indicar se esta é uma ...',
                                      'Para comentarista do Canal Rural, é dever do governo federal cuidar para impedir a chegada da Peste Suína Africana.'];
  String _value = 'one';
  //List<int> isFavorite = <int>[0, 0, 0, 0];
  List<bool> isFavorite = <bool>[false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildListView(),
    );
  }
  AppBar buildAppBar(){
    return AppBar(
      //automaticallyImplyLeading: false,
      title: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new DropdownButton<String>(
            value: _value,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.black,
            style: new TextStyle(
              color: Colors.black,
            ),
            underline: SizedBox(),
            items: <DropdownMenuItem<String>>[
              new DropdownMenuItem(
                child: SizedBox(
                  width: 100,
                  child: new Text('one'),
                ),
                value: 'one',
              ),
              new DropdownMenuItem(
                child: SizedBox(
                  width: 100,
                  child: new Text('two'),
                ),
                value: 'two',
              ),
              new DropdownMenuItem(
                child: SizedBox(
                  width: 100,
                  child: new Text('three'),
                ),
                value: 'three',
              ),
            ],
            onChanged: (value) {
              setState(() => _value = value!);
            },
          ),
        ],
      ),
      elevation: 5,
      actions: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.filter_list_outlined),
            ),
          ],
        ),
      ],
    );
  }
  ListView buildListView(){
    return ListView.builder(
      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
      itemCount: jornal.length,
      itemBuilder: (BuildContext context, int index){
        return GestureDetector(
          onTap: _launchURL,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100.0, 5.0, 20.0, 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //icone e nome do jornal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Image.asset('assets/images/${jornal[index]}.jpg'),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            jornal[index],
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      //titulo da noticia
                      Container(
                        child: Text(
                          titulo[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 2,),
                      //intro da noticia
                      Container(
                        child: Text(
                          intro[index],
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Colors.grey,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite[index] ? isFavorite[index] = false :  isFavorite[index] = true;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: //Text(isFavorite[index].toString())
                              isFavorite[index] ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ): Icon(Icons.favorite_outline),

                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //imagem da noticia, lado esquerdo
              Positioned(
                left: 20.0,
                top: 15.0,
                bottom: 15.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/images/${titulo[index]}.jpg',
                    width: 110.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  void _launchURL() async {
    try {
      await launch(
        'https://www.tecmundo.com.br/internet/223343-10-noticias-tecnologia-voce-comecar-dia-19-08.htm',
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
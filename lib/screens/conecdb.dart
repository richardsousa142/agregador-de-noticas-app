import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/album_remote_datasource.dart';
import 'package:flutter_app/models/Cliente.dart';
import 'package:flutter_app/models/ClienteModel.dart';

class ConecDB extends StatefulWidget {
  @override
  _ConecDBState createState() => _ConecDBState();
}

class _ConecDBState extends State<ConecDB>  {
  ClienteRemoteDataSourceImpl clienteRemoteDataSource = ClienteRemoteDataSourceImpl();
  Future<List<ClienteModel>> _clientes = ClienteRemoteDataSourceImpl().getAllClientes();
  Future<ClienteModel> cli = ClienteRemoteDataSourceImpl().getCliente("6123b7ce2a2c2b36e694c3ed");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias favoritadas "),
      ),
      body: Container(
        child: teste(),/*FutureBuilder<List<ClienteModel>>(
          future:  _clientes,
          builder:  (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Center(child: CircularProgressIndicator(),);
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text('ID'+' NOME'),
                  subtitle: Text(
                    '${snapshot.data[index].id}'+'          '
                    '${snapshot.data[index].nome}'
                  ),
                );
              },
            );
          },
        ),*/
      ),
    );
  }
  Container teste(){
    ClienteModel cli = getCliente();
    return Container(
      child: Column(
        children: <Widget>[
          Text("${cli.nome}"),
          Text("${cli.id}"),
        ],
      ),
    );
  }
}
getCliente() async{
  final response = await ClienteRemoteDataSourceImpl().getCliente("6123b7ce2a2c2b36e694c3ed");
  return response;
}

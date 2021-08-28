import 'dart:convert';
import 'package:flutter_app/models/Cliente.dart';
import 'package:flutter_app/models/ClienteModel.dart';
import 'package:http/http.dart' as http;

abstract class ClienteRemoteDataSource {
  Future<List<ClienteModel>> getAllClientes();
  Future<ClienteModel> getCliente(String id);
  Future<ClienteModel> updateCliente(Cliente cliente);
  Future<ClienteModel> deleteCliente(String id);
  Future<ClienteModel> createCliente(Cliente cliente);
}
const API_URL_BASE = 'http://192.168.0.109:8080';
const Map<String, String> API_HEADERS ={
  'Content-Type' : 'application/json; charset=UTF-8'
};
class ClienteRemoteDataSourceImpl implements ClienteRemoteDataSource{
  @override
  Future<ClienteModel> createCliente(cliente) async{//funcionando
    try {
      if (cliente != null) {
        final response = await http.post(
          Uri.parse('$API_URL_BASE/clientes'),
          headers: API_HEADERS,
          body: jsonEncode(<String, String>{
            'nome': cliente.nome,
          }),
        );
        if(response.statusCode == 201){
          return ClienteModel.fromJson(jsonDecode(response.body));
        }else{
          throw "Ocorreu um erro ao criar um cliente" + response.statusCode.toString();
        }
      }
    }catch (error){
      throw "2. Ocorreu um erro ao criar um cliente" + error.toString();
    }
    throw UnimplementedError();
  }
  @override
  Future<List<ClienteModel>> getAllClientes() async{//funcionando
    try{
      final response = await http.get(Uri.parse('$API_URL_BASE/clientes'));
      if(response.statusCode == 200){
        List<ClienteModel> result = (json.decode(response.body) as List)
          .map((i) => ClienteModel.fromJson(i))
          .toList();
        return result;
      }else{
        throw "1. Ocorreu um erro ao obter os cliente" + response.statusCode.toString();
      }
    }catch (error){
      throw "2. Ocorreu um erro ao obter os clientes" + error.toString();
    }
    throw UnimplementedError();
  }
  @override
  Future<ClienteModel> getCliente(String id) async{//funcionando
    try{
      if(id != null){
        final response = await http.get(Uri.parse('$API_URL_BASE/clientes/$id'));
        if(response.statusCode == 200){
          return ClienteModel.fromJson(json.decode(response.body));
        }else{
          throw "1. Ocorreu um erro ao obter os cliente" + response.statusCode.toString();
        }
      }
    }catch(error){
      throw "2. Ocorreu um erro ao obter os cliente" + error.toString();
    }
    throw UnimplementedError();
  }

  @override
  Future<ClienteModel> updateCliente(cliente) {
    throw UnimplementedError();
  }
  @override
  Future<ClienteModel> deleteCliente(String id) {
    throw UnimplementedError();
  }
}
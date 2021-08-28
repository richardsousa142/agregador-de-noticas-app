import 'package:equatable/equatable.dart';
import 'dart:convert';

import 'Cliente.dart';

class ClienteModel extends Cliente{
   final String id;
   final String nome;

  ClienteModel({required this.id, required this.nome})
      : super(id: id, nome: nome);

  factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
      id: json['id'],
      nome: json['nome']
  );
  Map<String, dynamic> toJson() => {
    "id":id,
    "nome": nome
  };
  @override
  List<Object?> get props => [
    id,
    nome,
  ];
}
parseResult(List<dynamic> data) {
  List<ClienteAttrs> results = [];
  data.forEach((item) {
    results.add(ClienteAttrs.fromJson(item));
  });
  return results;
}
_parseString(List<dynamic> data) {
  List<String> results = [];
  data.forEach((item) {
    results.add(item);
  });
  return results;
}
class ClienteAttrs{
  String nome;
  String id;

  ClienteAttrs({required this.id, required this.nome});

  factory ClienteAttrs.fromJson(Map<String, dynamic> json) => ClienteAttrs (
    id: json['id'],
    nome: json['nome'],
  );
}

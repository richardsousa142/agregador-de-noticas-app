import 'package:equatable/equatable.dart';
class Cliente extends Equatable{
  final String id;
  final String nome;

  Cliente({required this.id, required this.nome});

  @override
  List<Object?> get props => [
    id,
    nome,
  ];
  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
      id: json['id'],
      nome: json['nome']
  );
}
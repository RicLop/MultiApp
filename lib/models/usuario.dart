import 'package:multi/models/empresa.dart';

class Usuario {
  String id;
  String nome;
  String email;
  String senha;
  String tenantId;
  List<Empresa> empresas;

  Usuario(
      {this.id,
      this.email,
      this.nome,
      this.senha,
      this.tenantId,
      this.empresas});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        email: json['email'],
        nome: json['nome'],
        senha: json['senha'],
        tenantId: json['tenantId'],
        empresas: new List<Empresa>());
  }
}

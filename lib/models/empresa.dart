class Empresa {
  String id;
  String nome;
  String tenantId;

  Empresa({this.id, this.nome, this.tenantId});

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
        id: json['id'], nome: json['nome'], tenantId: json['tenantId']);
  }
}

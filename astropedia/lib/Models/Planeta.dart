class Planeta {
  int id;
  String nome;
  double distanciaDoSol;
  String apelido;
  double tamanho;

  Planeta({
    this.id = 0,
    required this.nome,
    required this.distanciaDoSol,
    required this.apelido,
    required this.tamanho,
  });

  factory Planeta.fromMap(Map<String, dynamic> map) {
    return Planeta(
      id: map['id'],
      nome: map['nome'],
      distanciaDoSol: map['distanciaDoSol'],
      apelido: map['apelido'],
      tamanho: map['tamanho'],
    );
  }

  factory Planeta.fromJson(Map<String, dynamic> json) {
    return Planeta(
      id: json['id'],
      nome: json['nome'],
      distanciaDoSol: json['distanciaDoSol'],
      apelido: json['apelido'],
      tamanho: json['tamanho'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'distanciaDoSol': distanciaDoSol,
      'apelido': apelido,
      'tamanho': tamanho,
    };
  }

  Planeta copyWith({
    int? id,
    String? nome,
    double? distanciaDoSol,
    String? apelido,
    double? tamanho,
  }) {
    return Planeta(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      distanciaDoSol: distanciaDoSol ?? this.distanciaDoSol,
      apelido: apelido ?? this.apelido,
      tamanho: tamanho ?? this.tamanho,
    );
  }
}

class Pessoa {

  final int id;
  final String nome;
  final int idade;

  Pessoa(this.id, this.nome, this.idade);
 
  @override
  String toString() {
    return 'Pessoa{id: $id, nome: $nome, idade: $idade}';
  }
}

import 'package:sqflite/sqflite.dart';
import 'package:testando_bd_existente/models/pessoa.dart';

import 'dbhelper.dart';

class PessoaDao {
  Future<List<Pessoa>> findAll() async {
    final Database db = await initDb();
    final List<Map<String, dynamic>> result = await db.query('pessoa');
    List<Pessoa> pessoas = _toList(result);
    return pessoas;
  }

  List<Pessoa> _toList(List<Map<String, dynamic>> result) {
    final List<Pessoa> pessoas = [];
    for (Map<String, dynamic> row in result) {
      final Pessoa pessoa = Pessoa(
        row['id'],
        row['nome'],
        row['idade'],
      );
      pessoas.add(pessoa);
    }
    return pessoas;
  }
}
import 'package:flutter/material.dart';
import 'package:testando_bd_existente/models/pessoa.dart';
import 'package:testando_bd_existente/pessoa_dao.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
final PessoaDao _dao = PessoaDao();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de Pessoas'),
      ),
      body: FutureBuilder<List<Pessoa>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Pessoa> pessoas = snapshot.data as List<Pessoa>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Pessoa pessoa = pessoas[index];
                  return _PessoaItem(pessoa);
                },
                itemCount: pessoas.length,
              );
          }
          return Text('Unknown error');
        },
      )
     );
  }
}

class _PessoaItem extends StatelessWidget {
  final Pessoa pessoa;

  _PessoaItem(this.pessoa);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Nome: ${pessoa.nome}',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          'Idade: ${pessoa.idade.toString()}',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
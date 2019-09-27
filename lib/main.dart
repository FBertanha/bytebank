import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ByteBank'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("rsrsrs");
          },
        ),
        body: ListaTransferencias(),
      ),
    ));

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ItemTransferencia(Transferencia(100.0, 'Conta: Felipe B.')),
        ItemTransferencia(Transferencia(200.0, 'Conta: Evelyn P. Sanches'))
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta),
          onTap: () {
            print('Clicado: ${_transferencia.numeroConta}');
          },
        ));
  }
}

class Transferencia {
  final double valor;
  final String numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

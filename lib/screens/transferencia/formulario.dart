import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Bytebank';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              icon: Icons.account_balance,
              rotulo: 'Número da conta',
              dica: '0000',
            ),
            Editor(
              controlador: _controladorCampoValor,
              icon: Icons.monetization_on,
              rotulo: 'Valor',
              dica: '0.00',
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criaTransferencia(context),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta == null || valor == null) {
//      Scaffold.of(context).showSnackBar(
//        SnackBar(
//          content: Text('Dados inválidos, verifique!'),
//        ),
//      );
      return;
    }
    final transferencia = Transferencia(valor, numeroConta);

//    Scaffold.of(context).showSnackBar(
//      SnackBar(
//        content: Text(
//            'Transferência para ${transferencia.numeroConta} no valor de ${transferencia.valor} foi criada com sucesso!'),
//      ),
//    );

    Navigator.pop(context, transferencia);
  }
}

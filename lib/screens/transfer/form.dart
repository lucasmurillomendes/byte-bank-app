import 'package:bytebank/compenents/editor.dart';
import 'package:bytebank/models/Transfer.dart';
import 'package:flutter/material.dart';

const String _titleAppBar = "Criando Transferência";
const String _labelNumberAccount = "Número da Conta";
const String _clewNumberAccount = "0000";
const String _value = "Valor";
const String _clewValue = "0.00";
const String _buttonConfirm = "Confirmar";

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _controlCampNumberAccount =
      TextEditingController();
  final TextEditingController _controlValueCamp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _controlCampNumberAccount,
                label: _labelNumberAccount,
                clew: _clewNumberAccount,
              ),
              Editor(
                controller: _controlValueCamp,
                label: _value,
                clew: _clewValue,
                icon: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_buttonConfirm),
                onPressed: () => _createTransfer(context),
              ),
            ],
          ),
        ));
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta = AlertDialog(
      title: Text("Erro de preenchimento"),
      content: Text("Preencha os campos corretamente"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void _createTransfer(BuildContext context) {
    final int numberAccount = int.tryParse(_controlCampNumberAccount.text);
    final double value = double.tryParse(_controlValueCamp.text);
    if (numberAccount != null && value != null) {
      final createdTransfer = Transfer(value, numberAccount);
      Navigator.pop(context, createdTransfer);
    }else{
      showAlertDialog(context);
    }
  }
}

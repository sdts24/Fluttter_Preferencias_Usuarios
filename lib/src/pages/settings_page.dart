import 'package:flutter/material.dart';
import 'package:preferenciasusuariosapp/src/shared_pref/preferencias_usuarios.dart';
import 'package:preferenciasusuariosapp/src/widgets/menu_widget.dart';



class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = PreferenciasUsuario();
  bool _colorSecundario = true;
  int _genero;
  String _nombre = 'Starlyng';
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textEditingController = new TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectRadio(int valor) async {
    prefs.genero = valor;
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color Secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona',
                ),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            ),
          ],
        ));
  }
}

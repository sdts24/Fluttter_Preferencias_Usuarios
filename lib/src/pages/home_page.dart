import 'package:flutter/material.dart';
import 'package:preferenciasusuariosapp/src/shared_pref/preferencias_usuarios.dart';
import 'package:preferenciasusuariosapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    
    prefs.ultimaPagina = HomePage.routeName;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuarios'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre Usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}

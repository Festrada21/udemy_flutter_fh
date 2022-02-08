import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({Key? key}) : super(key: key);
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'),
        ),
        body: ListView(
          children: _crearItems(),
        ));
  }

  List<Widget> _crearItems() {
    //Anteriormente
    // List<Widget> lista = new List<Widget>();
    // for (String opt in opciones) {
    //   final tempWidget = ListTile(
    //     title: Text(opt),
    //   );

    //   lista
    //     ..add(tempWidget)
    //     ..add(Divider());
    // }
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            subtitle: Text('Subtitulo'),
            title: Text(item + '!'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}

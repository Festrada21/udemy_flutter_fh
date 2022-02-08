import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          cardTipo1(),
          const SizedBox(height: 30),
          cardTipo2(),
          const SizedBox(height: 30),
          cardTipo2(),
          const SizedBox(height: 30),
          cardTipo2(),
          const SizedBox(height: 30),
          cardTipo2(),
        ],
      ),
    );
  }

  Widget cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Card Tipo 1'),
            subtitle:
                Text('Test de mostrar titulo de no se que estou aprendiendo'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget cardTipo2() {
    final card = Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        child: Column(children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://cdn.shopify.com/s/files/1/2127/0521/products/PCL1079_-_Milford_Sound_1024x1024.jpg?v=1571609081'),
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Nombre y descripcion de la imagen'),
          ),
        ]));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black26,
        //     blurRadius: 10.0,
        //     spreadRadius: 2.0,
        //     offset: Offset(2.0, 3.0),
        //   ),
        // ],
        // color: Colors.red,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: card,
      ),
    );
  }
}

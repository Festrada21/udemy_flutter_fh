import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _agregar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];

          return FadeInImage(
              placeholder: AssetImage('assets/images/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$imagen'));
        });
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }
}

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SladerPageState createState() => _SladerPageState();
}

class _SladerPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _crearSlider(),
            // _crearCheckbox(),
            // _crearSwitch(),
            // _crearImagen()
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: 100.0,
      min: 10.0,
      max: 400.0,
      onChanged: (valor) {
        print(valor);
      },
    );
  }
}

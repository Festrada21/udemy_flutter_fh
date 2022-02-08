import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Correo Electronico',
            labelText: 'Correo',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Password',
            labelText: 'password',
            suffixIcon: Icon(Icons.password),
            icon: Icon(Icons.lock)),
        onChanged: (valor) => setState(() {
              _password = valor;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Fecha de Nacimiento',
            labelText: 'Fecha',
            suffixIcon: Icon(Icons.perm_contact_calendar),
            icon: Icon(Icons.calendar_today)),
        onTap: () async {
          //para quitar el foco de la caja de texto
          FocusScope.of(context).requestFocus(FocusNode());
          DateTime? picked = await showDatePicker(
            helpText: 'Selecciona una fecha',
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 3),
            lastDate: DateTime(DateTime.now().year + 5),
            // flutter_localizations: # Add this line
            // sdk: flutter
            locale: const Locale('es', 'ES'),
          );

          if (picked != null) {
            setState(() {
              _fecha = picked.toString();
              _inputFieldDateController.text = _fecha;
            });
            print('Fecha seleccionada: ${picked.toString()}');
          }
        });
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = '$opt';
              });
            },
          ),
        )
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Column(
        children: [
          Text('Email: $_email'),
          Text('Password: $_password'),
          Text('Poder: $_opcionSeleccionada'),
        ],
      ),
      trailing: Text('Fecha: $_fecha'),
    );
  }
}
//  _selectDate(BuildContext context) async {
//   DateTime? picked = await showDatePicker(
//     helpText: 'Selecciona una fecha',
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(DateTime.now().year - 3),
//     lastDate: DateTime(DateTime.now().year + 5),
//     // locale: const Locale('es', 'ES'),
//   );

//   if (picked != null) {
//     setState(() {
//       _fecha = picked.toString();
//       _inputFieldDateController.text = _fecha;
//     });
//     print('Fecha seleccionada: ${picked.toString()}');
//   }
// }

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:alert/alert.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var passwrd = TextEditingController();
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text('Password Generator'),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Icon(
                Icons.verified_user,
                color: Colors.black87,
                size: 40,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                cursorColor: Colors.black87,
                style: TextStyle(
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                    labelText: 'Contraseña:',
                    labelStyle: TextStyle(color: Colors.black87),
                    fillColor: Colors.black87,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black87, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    )),
                controller: passwrd,
                textAlign: TextAlign.center,
                enabled: false,
              ),
            ),
            ElevatedButton(
              child: Text('Generar contraseña'),
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white, primary: Colors.black87),
              onPressed: () {
                passwrd.text = getRandomString(10);
              },
            ),
            ElevatedButton(
              child: Text('Copiar contraseña'),
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white, primary: Colors.black87),
              onPressed: () {
                FlutterClipboard.copy(passwrd.text);
                Alert(message: 'Copiada').show();
              },
            ),
          ],
        ));
  }
}

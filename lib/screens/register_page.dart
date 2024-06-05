// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gestion_exercice/widgets/arrow_back_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFefe0ca),
      appBar: AppBar(
        leading: ArrowBack(),
        elevation: 0,
        backgroundColor: Color(0xFFefe0ca),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'S\'inscrire',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001233),
                ),
              ),
              const SizedBox(height: 32.0),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Adresse e-mail',
                        fillColor: Color(0xFFF3F6FB),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Veuillez saisir une adresse e-mail';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        fillColor: const Color(0xFFF3F6FB),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Veuillez saisir un mot de passe';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                        }
                      },
                      child: const Text("S'inscrire",
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFff5500),
                        fixedSize: Size(327, 56),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 40.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Gym",
                            style: TextStyle(color: Color(0xFF001233)),
                          ),
                          TextSpan(
                            text: "Hub",
                            style: TextStyle(color: Color(0xFF001233)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

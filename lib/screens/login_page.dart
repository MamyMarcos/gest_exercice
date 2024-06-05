import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFefe0ca),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Se connecter',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001233),
                ),
              ),
              SizedBox(height: 32.0),
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
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        fillColor: Color(0xFFF3F6FB),
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
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          // Logique pour gérer la connexion
                        }
                      },
                      child: Text('Se connecter',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFff5500),
                        fixedSize: Size(327, 56),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    RichText(
                      text: TextSpan(
                        text: "Vous n'avez pas de compte ? ",
                        style: TextStyle(color: Color(0xFF9C9BC2)),
                        children: <TextSpan>[
                          TextSpan(
                            text: "S'inscrire",
                            style: TextStyle(color: Color(0xFFff5500)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    RichText(
                      text: TextSpan(
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

import 'package:brew_crew/Services/sign_in.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/shared/constants.dart';

class Register extends StatefulWidget {
  static const String id = 'register_screen';
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              title: Text('Register to BrewCrew'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Sign In'),
                    onPressed: () {
                      widget.toggleView();
                      // Navigator.pushNamed(context, SignIn.id);
                    })
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: KtextDecoration.copyWith(
                              hintText: 'Enter Your Email',
                              hintStyle: TextStyle(color: Colors.black)),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: KtextDecoration.copyWith(
                              hintText: 'Enter Your Email',
                              hintStyle: TextStyle(color: Colors.black)),
                          validator: (val) => val.length < 6
                              ? 'Enter a 6+ cahracter long pass'
                              : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FlatButton(
                          child: Text('Register'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'enter a valid email address';
                                  loading = false;
                                });
                              }
                            }
                          },
                          color: Colors.pink,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(fontSize: 20.0, color: Colors.red),
                        ),
                      ],
                    ))),
          );
  }
}

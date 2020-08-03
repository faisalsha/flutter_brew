import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/Services/register.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  static const String id = 'SignIn_screen';
  SignIn({this.toggleView});
  final Function toggleView;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              title: Text('Sign in to BrewCrew'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                      // Navigator.pushNamed(context, Register.id);
                    },
                    icon: Icon(Icons.person),
                    label: Text('Register'))
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
                              hintText: 'Enter Your Password',
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
                          child: Text('Sign In'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.SignInWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'User doesnt exist in our system';
                                  loading = false;
                                });
                              }
                            }
                          },
                          color: Colors.blue,
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

// RaisedButton(
//           color: Colors.blueAccent,
//           child: Text('Sign In Anon'),
//           onPressed: () async {
//             dynamic result = await _auth.signInAnon();
//             if (result == null) {
//               print("error signining in");
//             } else {
//               print("signed in");
//               print(result.uid);
//             }
//           },
//         ),

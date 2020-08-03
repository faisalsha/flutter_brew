import 'package:brew_crew/Screens/wrapper.dart';
import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/Services/register.dart';
import 'package:brew_crew/Services/sign_in.dart';
import 'package:brew_crew/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Wrapper(),
        // initialRoute: Register.id,
        // routes: {
        //   Register.id: (context) => Register(),
        //   SignIn.id: (context) => SignIn()
        // },
      ),
    );
  }
}

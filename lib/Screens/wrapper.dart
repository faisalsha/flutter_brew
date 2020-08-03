import 'package:brew_crew/Screens/Authenticate/authenticate.dart';
import 'package:brew_crew/Screens/Home/home.dart';
import 'package:brew_crew/Services/register.dart';
import 'package:brew_crew/Services/sign_in.dart';
import 'package:brew_crew/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}

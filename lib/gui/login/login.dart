import 'package:flutter/material.dart';
import 'package:list_view/gui/films/films.dart';

import '../../util/strings.dart';
import '../../util/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          Strings.kinopoiskPremiers,
          style: Styles.navBarTitle,
        )),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter User Name'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password'),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => FilmsScreen()));
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                        child: const Text("Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)))))
          ],
        ));
  }
}

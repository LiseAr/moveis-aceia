// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:acea/transactions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> login(String email, String password) async {
  final queryParameters = {
    'email': email,
    'password': password,
  };

  var uri =
      new Uri.http('ponto-if.domcloud.dev', '/api/login', queryParameters);
  print(uri);
  http.Response response = await http.post(uri);

  return response;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _top(context),
            _bottom(context),
          ],
        ),
      ),
    );
  }

  _top(context) {
    return Container(
      color: Colors.blueAccent,
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: _header(context),
    );
  }

  _header(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WELCOME",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Icon(
            Icons.account_balance,
            color: Colors.white,
            size: 200,
            semanticLabel: 'Welcome icon',
          ),
        ],
      ),
    );
  }

  _bottom(context) {
    return Container(
      margin: EdgeInsets.all(36),
      color: Colors.white,
      // height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: _form(context),
    );
  }

  final emailController = TextEditingController();
  final passController = TextEditingController();

  _form(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Username or Email".toUpperCase(),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
            ),
            controller: emailController,
          ),
          SizedBox(height: 14),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Password".toUpperCase(),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
            ),
            controller: passController,
          ),
          SizedBox(height: 14),
          ElevatedButton(
            onPressed: () async {
              var req = await login(emailController.text, passController.text);

              final body = json.decode(req.body);

              if (body['status'] == 'success') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Transactions()),
                );
              }
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10), right: Radius.circular(10)),
                ),
              ),
            ),
            child: const Text('LOG IN'),
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New to Bank Apps',
              ),
              TextButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const RegisterPage(),
                  //   ),
                  // );
                },
                child: const Text(
                  'SignUp',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<StatefulWidget> createState() => _Transactions();
}

Future<http.Response> login(String email, String password) async {
  var uri = Uri.http('ponto-if.domcloud.dev', '/api/service_listagem');

  http.Response response = await http.get(uri);

  return response;
}

class _Transactions extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 30),
          title: const Text(
            'Transaction',
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(
                  Icons.supervised_user_circle,
                  // color: Colors.white,
                  // size: 200,
                  // semanticLabel: 'Welcome icon',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

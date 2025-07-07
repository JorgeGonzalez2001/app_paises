import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ColombiaScreen extends StatefulWidget {
  const ColombiaScreen({super.key});

  @override
  State<ColombiaScreen> createState() => _ColombiaScreenState();
}

class _ColombiaScreenState extends State<ColombiaScreen> {
  String ciudad_name = "";
  String link_bandera = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final url = Uri.parse("https://restcountries.com/v3.1/name/colombia");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      //print(jsonDecode(response.body));

      var data = jsonDecode(response.body);

      var flag = data[0]['flags']['png'];
      print(flag);

      setState(() {
        link_bandera = flag;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(" Colombia"),
          Image.network(link_bandera),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Volver ")
          ),
          TextButton(
            onPressed: () {
              getData();
            },
            child: Text("Cargar")
          )
        ],
      ),
    );
  }
}
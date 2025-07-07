import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeruScreen extends StatefulWidget {
  const PeruScreen({super.key});

  @override
  State<PeruScreen> createState() => _PeruScreenState();
}

class _PeruScreenState extends State<PeruScreen> {
  String ciudad_name = "";
  String link_bandera = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final url = Uri.parse("https://restcountries.com/v3.1/name/peru");

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
          Text("Perú"),
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
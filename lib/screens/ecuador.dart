import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EcuadorScreen extends StatefulWidget {
  const EcuadorScreen({super.key});

  @override
  State<EcuadorScreen> createState() => _EcuadorScreenState();
}

class _EcuadorScreenState extends State<EcuadorScreen> {
  String ciudad_name = "";
  String link_bandera = "";
  String link_escudo ="";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final url = Uri.parse("https://restcountries.com/v3.1/name/ecuador");

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

  Future<void> getEscudo() async {
    final url = Uri.parse("https://mainfacts.com/media/images/coats_of_arms/ec.png");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      //print(jsonDecode(response.body));

      var data = jsonDecode(response.body);

      var flag = data[0]['flags']['png'];
      print(flag);

      setState(() {
        link_escudo = flag;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(" Ecuador"),
          Image.network(link_bandera),
          Image.network(link_escudo),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Volver ")
          ),
          TextButton(
            onPressed: () {
              getData();
              getEscudo();
            },
            child: Text("Cargar")
          )
        ],
      ),
    );
  }
}
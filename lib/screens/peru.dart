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
  String link_escudo = "";
  String poblacion = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final url = Uri.parse("https://restcountries.com/v3.1/name/peru");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var flag = data[0]['flags']['png'];
      var escudo = data[0]['coatOfArms']['png'];
      var population = data[0]['population'];
      
      print(flag);
      print(escudo);
      print(population);

      setState(() {
        link_bandera = flag;
        link_escudo = escudo;
        poblacion = population.toString();
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
          Image.network(
            link_escudo,
            width: 150,
            height: 200,
            ),
          Text("Población: $poblacion"),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Volver")
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
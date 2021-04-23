import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_news/pokeHub.dart';
import 'package:flutter_api_news/pokemon.dart';
import 'package:http/http.dart' as http;


void main() => runApp(pokeApp());

class pokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pokedex(),
    );
  }
}

class Pokedex extends StatefulWidget {
  @override

  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override


  void initState()
  {

    super.initState();

    fetchData();

  }

  String url="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeHub pokehub;

  void fetchData () async

  {
    var response= await http.get(Uri.parse(url));
    var decoder=jsonDecode(response.body);
    pokehub=PokeHub.fromJson(decoder);
    setState(() {

    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text('Pokedex',style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.w700,fontSize: 30
        ),),
        centerTitle: true,
      ),
      body:pokehub==null?Center(child: CircularProgressIndicator(),):GridView.count(crossAxisCount: 2,children: pokehub.pokemon.map((poke) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 5),
        child: InkWell(

          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => the_pokemon(pokemon:poke)),
            );
          },
          child: Card(
            elevation: 3.0,
            child: Column(
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(poke.img)
                      )
                  ),
                ),
                Text(poke.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                Text(poke.type.toString())
              ],
            ),),
        ),
      )).toList(),




      ),
    );
  }
}









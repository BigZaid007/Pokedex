// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_api_news/pokeHub.dart';

class the_pokemon extends StatelessWidget {
  final Pokemon pokemon;

  the_pokemon({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            pokemon.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              height: MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width - 20,
              left: 10,
              top: MediaQuery.of(context).size.height*0.1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 100,),
                    Text(pokemon.name,style: TextStyle(
                      fontSize: 30,fontWeight: FontWeight.w600,
                    ),),

                    Text('Height: ${pokemon.height}',style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w600,
                    ),),
                    Text('Weight: ${pokemon.weight}',style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w600,
                    ),),

                    Text('Types:',style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w600,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                       pokemon.type.map((t) => Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 4),
                         child: FilterChip(backgroundColor: Colors.indigoAccent,label: Text(t,style: TextStyle(
                           color: Colors.white
                         ),), onSelected: (b){}),
                       )).toList(),

                    ),
                    Text('Weakness:',style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w600,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      pokemon.weaknesses.map((t) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: FilterChip(backgroundColor: Colors.red,label: Text(t,style: TextStyle(
                            color: Colors.white
                        ),), onSelected: (b){}),
                      )).toList(),

                    ),
                    Text('Next Evolution:',style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w600,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      pokemon.nextEvolution.map((n) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: FilterChip(backgroundColor: Colors.green,label: Text(n.name,style: TextStyle(
                            color: Colors.white
                        ),), onSelected: (b){}),
                      )).toList(),

                    ),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(pokemon.img)
                  )
                ),
              ),
            )
          ],
        ));
  }
}

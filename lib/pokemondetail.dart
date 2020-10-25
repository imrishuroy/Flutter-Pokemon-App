import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon.dart';

class PokeDetail extends StatelessWidget {
  bodyWidget(BuildContext context) => Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20.0,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                    ),
                  ),
                  Text('Height : ${pokemon.height}'),
                  Text('Weight : ${pokemon.weight}'),
                  Text('Types',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: pokemon.type
                        .map(
                          (t) => FilterChip(
                            backgroundColor: Colors.yellow,
                            label: Text(t),
                            onSelected: (b) {},
                          ),
                        )
                        .toList(),
                  ),
                  Text(
                    'Weakness',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: pokemon.weaknesses
                        .map(
                          (t) => FilterChip(
                            backgroundColor: Colors.blue,
                            label: Text(
                              t,
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (b) {},
                          ),
                        )
                        .toList(),
                  ),
                  Text('Next Evolution',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: pokemon.nextEvolution
                        .map(
                          (n) => FilterChip(
                            backgroundColor: Colors.pink,
                            label: Text(n.name,
                                style: TextStyle(color: Colors.white)),
                            onSelected: (b) {},
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(pokemon.img),
                  ),
                ),
              ),
            ),
          )
        ],
      );

  final Pokemon pokemon;
  PokeDetail({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }
}

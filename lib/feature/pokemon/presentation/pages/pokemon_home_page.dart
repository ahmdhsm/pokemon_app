import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';
import 'package:pokemon_app/core/usecase/usecase.dart';
import 'package:pokemon_app/feature/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon_app/feature/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_app/feature/pokemon/domain/entities/pokemon_entity.dart';
import 'dart:math' as math;

import '../../domain/usecases/get_pokemon_list_usecase.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({Key? key}) : super(key: key);

  @override
  State<PokemonHomePage> createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage> {
  static const Color grass = Color.fromRGBO(103, 111, 163, 1);
  static const Color fire = Color.fromRGBO(244, 67, 54, 1);
  static const Color water = Color.fromRGBO(33, 150, 243, 1);

  List<PokemonEntity> pokemonList = [];

  start() async {
    final result =
        await GetPokemonListUsecase(PokemonRepositoryImpl()).call(NoParams());

    setState(() {
      pokemonList = result;
    });
  }

  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 242, 255, 1),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // leading: FlutterLogo(),
            pinned: true,
            stretch: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              expandedTitleScale: 2,
              title: const Text(
                'Pokemon',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                children: [
                  Positioned(
                    right: -30,
                    child: Transform.rotate(
                      angle: -math.pi / 6,
                      child: Image.asset(
                        'assets/images/pokeball.png',
                        color: Colors.black.withOpacity(0.1),
                        scale: 4,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -50,
                    top: -100,
                    child: Transform.rotate(
                      angle: -math.pi / 3,
                      child: Image.asset(
                        'assets/images/pokeball.png',
                        color: Colors.black.withOpacity(0.1),
                        scale: 3,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Color.fromRGBO(238, 242, 255, 1),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 140,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: card(pokemonList[index]),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: card(pokemonList[index]),
                  );
                }
              },
              childCount: pokemonList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget card(PokemonEntity pokemon) {
    List<Widget> types = [];
    // for (var typePokemon in pokemon.type) {
    //   types.add(type(typePokemon));
    // }

    Color color = grass;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 5,
          right: 5,
        ),
        decoration: BoxDecoration(
          color: color,
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png',
            ),
            scale: 2,
            opacity: 0.1,
            alignment: Alignment.center,
            fit: BoxFit.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: types,
                    ),
                  ),
                  const SizedBox(width: 60),
                  CachedNetworkImage(
                    imageUrl:
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png',
                    width: 100,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name.toCamelCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '#${pokemon.id.toString().padLeft(3, '0')}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget type(String type) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Container(
        width: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 3,
        ),
        child: Text(
          type,
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}

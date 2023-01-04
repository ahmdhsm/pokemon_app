import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';
import 'package:pokemon_app/core/usecase/usecase.dart';
import 'package:pokemon_app/feature/pokemon/data/online_data.dart';
import 'package:pokemon_app/feature/pokemon/entities/pokemon_entity.dart';
import 'package:pokemon_app/feature/pokemon/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokemon_app/feature/pokemon/presentation/pages/pokemon_detail_page.dart';
import 'package:pokemon_app/feature/pokemon/presentation/state/pokemon_list_state.dart';
import 'dart:math' as math;

import 'package:pokemon_app/feature/pokemon/usecases/get_data.dart';
import 'package:pokemon_app/main.dart';

import '../notifier/pokemon_list_notifier.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({super.key});

  @override
  State<PokemonHomePage> createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage>
    with TickerProviderStateMixin {
  static const Color grass = Color.fromRGBO(103, 111, 163, 1);
  static const Color fire = Color.fromRGBO(244, 67, 54, 1);
  static const Color water = Color.fromRGBO(33, 150, 243, 1);

  final PokemonListNotifier tes = PokemonListNotifier();

  ScrollController _controller = ScrollController();

  AnimationController? animations;

  @override
  void initState() {
    animations = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      value: 1,
    );

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          print('aaaa');
          tes.tes();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 242, 255, 1),
      body: Stack(
        children: [
          CustomScrollView(
            physics: ClampingScrollPhysics(),
            controller: _controller,
            slivers: <Widget>[
              SliverAppBar(
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
              AnimatedBuilder(
                animation: tes,
                builder: (context, child) {
                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 140,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (index % 2 == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: card(tes.pokemonList[index], index),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: card(tes.pokemonList[index], index),
                          );
                        }
                      },
                      childCount: tes.pokemonList.length,
                    ),
                  );
                },
              ),
            ],
          ),
          AnimatedBuilder(
            animation: tes,
            builder: (context, child) => AnimatedPositioned(
              bottom: tes.isLoading == true ? 0 : -70,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              duration: Duration(milliseconds: 300),
            ),
          ),
        ],
      ),
    );
  }

  Widget card(PokemonEntity pokemon, int index) {
    List<Widget> types = [];
    // for (var typePokemon in pokemon.type) {
    //   types.add(type(typePokemon));
    // }

    Color color = grass;
    double scale = 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PokemonDetailPage(pokemonEntity: pokemon),
            ),
          );
        },
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
                    Hero(
                      tag: "${pokemon.id}_image",
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png',
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "${pokemon.id}_name",
                    child: Text(
                      pokemon.name.toCamelCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
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

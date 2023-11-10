import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_list_model.dart';
import 'package:pokemon_app/feature/pokemon/presentation/notifier/pokemon_list_notifier.dart';
import 'package:pokemon_app/feature/pokemon/presentation/pages/pokemon_detail_page.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({super.key});

  @override
  State<PokemonHomePage> createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage>
    with TickerProviderStateMixin {
  final _pokemonListNotifier = PokemonListNotifier();

  final _controller = ScrollController();

  AnimationController? animations;

  @override
  void initState() {
    animations = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      value: 1,
    );

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          _pokemonListNotifier.getData();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 242, 255, 1),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              CustomScrollView(
                physics: const ClampingScrollPhysics(),
                controller: _controller,
                slivers: <Widget>[
                  const SliverAppBar(
                    pinned: true,
                    stretch: true,
                    expandedHeight: 160.0,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      expandedTitleScale: 2,
                      title: Text(
                        'Pokemon',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      background: _BackgroundStack(),
                    ),
                    backgroundColor: Color.fromRGBO(238, 242, 255, 1),
                  ),
                  AnimatedBuilder(
                    animation: _pokemonListNotifier,
                    builder: (context, child) {
                      return SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              orientation == Orientation.portrait ? 2 : 4,
                          mainAxisExtent: 140,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return _PokemonCard(
                              pokemonListModel:
                                  _pokemonListNotifier.pokemonList[index],
                              index: index,
                            );
                          },
                          childCount: _pokemonListNotifier.pokemonList.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: _pokemonListNotifier,
                builder: (context, child) => AnimatedPositioned(
                  bottom: _pokemonListNotifier.isLoading == true ? 0 : -70,
                  duration: const Duration(milliseconds: 300),
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
                    child: const Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PokemonCard extends StatelessWidget {
  const _PokemonCard({
    required this.pokemonListModel,
    required this.index,
  });

  final PokemonListModel pokemonListModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    List<Widget> types = [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PokemonDetailPage(
                pokemonListModel: pokemonListModel,
              ),
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
            color: const Color.fromRGBO(103, 111, 163, 1),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonListModel.id}.png',
              ),
              scale: 2,
              opacity: 0.1,
              alignment: Alignment.center,
              fit: BoxFit.none,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: types,
                      ),
                    ),
                    const SizedBox(width: 60),
                    Hero(
                      tag: "${pokemonListModel.id}_image",
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonListModel.id}.png',
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
                    tag: "${pokemonListModel.id}_name",
                    child: Text(
                      pokemonListModel.name.toCamelCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '#${pokemonListModel.id.toString().padLeft(3, '0')}',
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
}

class _BackgroundStack extends StatelessWidget {
  const _BackgroundStack();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

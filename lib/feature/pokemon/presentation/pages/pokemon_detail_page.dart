import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';
import 'package:pokemon_app/feature/pokemon/model/pokemon_list_model.dart';
import 'package:pokemon_app/feature/pokemon/presentation/notifier/pokemon_detail_notifier.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/about_tab.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/base_stats_tab.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/evolution_tab.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/moves_tab.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/pokemon_type_widget.dart';
import 'package:pokemon_app/main.dart';

class PokemonDetailPage extends StatefulWidget {
  final PokemonListModel pokemonListModel;
  const PokemonDetailPage({
    Key? key,
    required this.pokemonListModel,
  }) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final PokemonDetailNotifier tes = getIt.get();

  @override
  void initState() {
    tes.pokemonDetail = null;
    tes.getData(widget.pokemonListModel.id);
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(238, 242, 255, 1),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _OrientationSwitcher(
            children: [
              SizedBox(
                height: orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height / 2
                    : MediaQuery.of(context).size.height,
                width: orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      top: 50,
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
                    Positioned(
                      left: 20,
                      top: 250,
                      child: Transform.rotate(
                        angle: -math.pi / 1.5,
                        child: Image.asset(
                          'assets/images/pokeball.png',
                          color: Colors.black.withOpacity(0.1),
                          scale: 2,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Center(
                        child: Hero(
                          tag: "${widget.pokemonListModel.id}_image",
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.pokemonListModel.id}.png',
                            width: 250,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: orientation == Orientation.portrait
                                    ? 60
                                    : 30,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.pokemonListModel.name.toCamelCase(),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '#${widget.pokemonListModel.id.toString().padLeft(3, "0")}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: AnimatedBuilder(
                                animation: tes,
                                builder: (context, child) {
                                  if (tes.pokemonDetail == null) {
                                    return Container();
                                  } else {
                                    return Row(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                tes
                                                    .pokemonDetail!
                                                    .pokemonDetailModel
                                                    .types
                                                    .length;
                                            i++)
                                          PokemonTypeWidget(
                                            type: tes
                                                .pokemonDetail!
                                                .pokemonDetailModel
                                                .types[i]
                                                .type
                                                .name,
                                            index: i,
                                          )
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: orientation == Orientation.portrait
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )
                        : const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                  ),
                  padding: orientation == Orientation.portrait
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        tabs: const <Widget>[
                          Tab(
                            child: Text(
                              'About',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Base Stats',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Moves',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Evoloution',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            AboutTab(),
                            BaseStatsTab(),
                            MovesTab(),
                            EvolutionTab(),
                          ],
                        ),
                      ),
                    ],
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

class _OrientationSwitcher extends StatelessWidget {
  final List<Widget> children;

  const _OrientationSwitcher({required this.children});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? Column(children: children)
        : Row(children: children);
  }
}

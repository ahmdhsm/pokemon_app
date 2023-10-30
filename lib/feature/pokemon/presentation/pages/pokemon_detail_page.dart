import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';
import 'package:pokemon_app/feature/pokemon.bak/presentation/widgets/moves_widget.dart';
import 'package:pokemon_app/feature/pokemon/entities/pokemon_entity.dart';
import 'dart:math' as math;

import '../../../../main.dart';
import '../../../pokemon.bak/presentation/widgets/about_widget.dart';
import '../../data/pokemon_detail_data.dart';
import '../notifier/pokemon_detail_notifier.dart';

class PokemonDetailPage extends StatefulWidget {
  final PokemonEntity pokemonEntity;
  const PokemonDetailPage({Key? key, required this.pokemonEntity})
      : super(key: key);

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
    tes.getData(widget.pokemonEntity.id);
    _tabController = TabController(length: 3, vsync: this);
    super.initState();

    // tes.addListener(tes1());

    String tes3 = r'$hhhh';
    String tes2 = tes3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 242, 255, 1),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        ),
      ),
      // body: Stack(
      //   children: [
      //     Positioned(
      //       right: -30,
      //       top: 50,
      //       child: Transform.rotate(
      //         angle: -math.pi / 6,
      //         child: Image.asset(
      //           'assets/images/pokeball.png',
      //           color: Colors.black.withOpacity(0.1),
      //           scale: 4,
      //           fit: BoxFit.none,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: -50,
      //       top: -100,
      //       child: Transform.rotate(
      //         angle: -math.pi / 3,
      //         child: Image.asset(
      //           'assets/images/pokeball.png',
      //           color: Colors.black.withOpacity(0.1),
      //           scale: 3,
      //           fit: BoxFit.none,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: -20,
      //       top: 250,
      //       child: Transform.rotate(
      //         angle: -math.pi / 1.5,
      //         child: Image.asset(
      //           'assets/images/pokeball.png',
      //           color: Colors.black.withOpacity(0.1),
      //           scale: 2,
      //           fit: BoxFit.none,
      //         ),
      //       ),
      //     ),
      //     Column(
      //       // mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         Expanded(
      //           child: Container(
      //             color: Colors.transparent,
      //             width: MediaQuery.of(context).size.width,
      //             child: Stack(
      //               children: [
      //                 Padding(
      //                   padding: EdgeInsets.only(top: 50),
      //                   child: Center(
      //                     child: Hero(
      //                       tag: "${widget.pokemonEntity.id}_image",
      //                       child: CachedNetworkImage(
      //                         imageUrl:
      //                             'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.pokemonEntity.id}.png',
      //                         width: 250,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Positioned(
      //                   top: 50,
      //                   child: Container(
      //                     width: MediaQuery.of(context).size.width,
      //                     child: Column(
      //                       children: [
      //                         Row(
      //                           children: [
      //                             SizedBox(width: 10),
      //                             Padding(
      //                               padding: EdgeInsets.all(0),
      //                               child: InkWell(
      //                                 onTap: () {
      //                                   Navigator.of(context).pop();
      //                                 },
      //                                 child: Icon(
      //                                   Icons.arrow_back_ios,
      //                                   size: 30,
      //                                 ),
      //                               ),
      //                             ),
      //                             Text(
      //                               widget.pokemonEntity.name.toCamelCase(),
      //                               style: TextStyle(
      //                                 fontSize: 30,
      //                                 fontWeight: FontWeight.bold,
      //                               ),
      //                             ),
      //                             Expanded(child: Container()),
      //                             FaIcon(
      //                               FontAwesomeIcons.solidHeart,
      //                               color: Colors.red,
      //                               size: 30,
      //                             ),
      //                             SizedBox(width: 20),
      //                           ],
      //                         ),
      //                         Row(
      //                           children: [
      //                             SizedBox(width: 10),
      //                             Text(
      //                               '#${widget.pokemonEntity.id.toString().padLeft(3, "0")}',
      //                               style: TextStyle(
      //                                 fontSize: 20,
      //                                 fontWeight: FontWeight.bold,
      //                               ),
      //                               textAlign: TextAlign.left,
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           decoration: const BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(30),
      //               topRight: Radius.circular(30),
      //             ),
      //           ),
      //           child: Column(
      //             children: [
      //               TabBar(
      //                 controller: _tabController,
      //                 tabs: const <Widget>[
      //                   Tab(
      //                     child: Text(
      //                       'About',
      //                       style: TextStyle(
      //                         color: Colors.grey,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 13,
      //                       ),
      //                     ),
      //                   ),
      //                   Tab(
      //                     child: Text(
      //                       'Moves',
      //                       style: TextStyle(
      //                         color: Colors.grey,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 13,
      //                       ),
      //                     ),
      //                   ),
      //                   Tab(
      //                     child: Text(
      //                       'Evoloution',
      //                       style: TextStyle(
      //                         color: Colors.grey,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 13,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //         Container(
      //           height: MediaQuery.of(context).size.height / 2,
      //           color: Colors.white,
      //           child: TabBarView(
      //             controller: _tabController,
      //             children: [
      //               AboutWidget(),
      //               MovesWidget(),
      //               SingleChildScrollView(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(
      //                     left: 20,
      //                     right: 20,
      //                     top: 30,
      //                   ),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         'Evolution Chain',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 20,
      //                         ),
      //                       ),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Container(
      //                             padding: EdgeInsets.all(10),
      //                             child: CachedNetworkImage(
      //                               imageUrl:
      //                                   'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
      //                               width: 100,
      //                             ),
      //                           ),
      //                           const Text('Level 16'),
      //                           Container(
      //                             padding: EdgeInsets.all(10),
      //                             child: CachedNetworkImage(
      //                               imageUrl:
      //                                   'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
      //                               width: 100,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       Center(
      //                         child: SizedBox(
      //                           width: MediaQuery.of(context).size.width / 3,
      //                           child: Divider(
      //                             color: Colors.black,
      //                           ),
      //                         ),
      //                       ),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Container(
      //                             padding: EdgeInsets.all(10),
      //                             child: CachedNetworkImage(
      //                               imageUrl:
      //                                   'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
      //                               width: 100,
      //                             ),
      //                           ),
      //                           const Text('Level 16'),
      //                           Container(
      //                             padding: EdgeInsets.all(10),
      //                             child: CachedNetworkImage(
      //                               imageUrl:
      //                                   'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
      //                               width: 100,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //     // CustomScrollView(
      //     //   physics: const ClampingScrollPhysics(),
      //     //   slivers: [
      //     //     SliverPersistentHeader(
      //     //       pinned: true,
      //     //       delegate: _SliverAppBarDelegate(
      //     //         minHeight: 100,
      //     //         maxHeight: MediaQuery.of(context).size.height,
      //     //         child: Container(
      //     //           color: Colors.transparent,
      //     //           width: MediaQuery.of(context).size.width,
      //     //           child: Stack(
      //     //             children: [
      //     //               Center(
      //     //                 child: Hero(
      //     //                   tag: "${widget.pokemonEntity.id}_image",
      //     //                   child: CachedNetworkImage(
      //     //                     imageUrl:
      //     //                         'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.pokemonEntity.id}.png',
      //     //                     width: 200,
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //               Positioned(
      //     //                 top: 50,
      //     //                 child: Container(
      //     //                   width: MediaQuery.of(context).size.width,
      //     //                   child: Row(
      //     //                     children: [
      //     //                       SizedBox(width: 10),
      //     //                       Padding(
      //     //                         padding: EdgeInsets.all(0),
      //     //                         child: InkWell(
      //     //                           onTap: () {
      //     //                             Navigator.of(context).pop();
      //     //                           },
      //     //                           child: Icon(
      //     //                             Icons.arrow_back_ios,
      //     //                             size: 30,
      //     //                           ),
      //     //                         ),
      //     //                       ),
      //     //                       Text(
      //     //                         widget.pokemonEntity.name.toCamelCase(),
      //     //                         style: TextStyle(
      //     //                           fontSize: 30,
      //     //                           fontWeight: FontWeight.bold,
      //     //                         ),
      //     //                       ),
      //     //                       Expanded(child: Container()),
      //     //                       Text(
      //     //                         '#${widget.pokemonEntity.id.toString().padLeft(3, "0")}',
      //     //                         style: TextStyle(
      //     //                           fontSize: 20,
      //     //                         ),
      //     //                       ),
      //     //                       SizedBox(width: 20),
      //     //                     ],
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //             ],
      //     //           ),
      //     //         ),
      //     //       ),
      //     //     ),
      //     // SliverToBoxAdapter(
      //     //   child: Column(
      //     //     children: [
      //     //       Container(
      //     //         decoration: const BoxDecoration(
      //     //           color: Colors.white,
      //     //           borderRadius: BorderRadius.only(
      //     //             topLeft: Radius.circular(30),
      //     //             topRight: Radius.circular(30),
      //     //           ),
      //     //         ),
      //     //         child: Column(
      //     //           children: [
      //     //             SizedBox(height: 20),
      //     //             TabBar(
      //     //               controller: _tabController,
      //     //               tabs: const <Widget>[
      //     //                 Tab(
      //     //                   child: Text(
      //     //                     'About',
      //     //                     style: TextStyle(
      //     //                       color: Colors.grey,
      //     //                       fontWeight: FontWeight.bold,
      //     //                       fontSize: 13,
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //                 Tab(
      //     //                   child: Text(
      //     //                     'Moves',
      //     //                     style: TextStyle(
      //     //                       color: Colors.grey,
      //     //                       fontWeight: FontWeight.bold,
      //     //                       fontSize: 13,
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //                 Tab(
      //     //                   child: Text(
      //     //                     'Evoloution',
      //     //                     style: TextStyle(
      //     //                       color: Colors.grey,
      //     //                       fontWeight: FontWeight.bold,
      //     //                       fontSize: 13,
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //               ],
      //     //             ),
      //     //           ],
      //     //         ),
      //     //       ),
      //     //       Container(
      //     //         height: 500,
      //     //         color: Colors.white,
      //     //         child: TabBarView(
      //     //           controller: _tabController,
      //     //           children: [
      //     //             AboutWidget(),
      //     //             SingleChildScrollView(
      //     //               child: Column(
      //     //                 children: [
      //     //                   Container(color: Colors.red, height: 150.0),
      //     //                   Container(color: Colors.blue, height: 150.0),
      //     //                   Container(
      //     //                       color: Colors.yellow, height: 150.0),
      //     //                   Container(
      //     //                       color: Colors.orange, height: 150.0),
      //     //                 ],
      //     //               ),
      //     //             ),
      //     //             SingleChildScrollView(
      //     //               child: Padding(
      //     //                 padding: const EdgeInsets.only(
      //     //                   left: 20,
      //     //                   right: 20,
      //     //                   top: 30,
      //     //                 ),
      //     //                 child: Column(
      //     //                   crossAxisAlignment: CrossAxisAlignment.start,
      //     //                   children: [
      //     //                     Text(
      //     //                       'Evolution Chain',
      //     //                       style: TextStyle(
      //     //                         fontWeight: FontWeight.bold,
      //     //                         fontSize: 20,
      //     //                       ),
      //     //                     ),
      //     //                     Row(
      //     //                       mainAxisAlignment:
      //     //                           MainAxisAlignment.spaceBetween,
      //     //                       children: [
      //     //                         Container(
      //     //                           padding: EdgeInsets.all(10),
      //     //                           child: CachedNetworkImage(
      //     //                             imageUrl:
      //     //                                 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
      //     //                             width: 100,
      //     //                           ),
      //     //                         ),
      //     //                         const Text('Level 16'),
      //     //                         Container(
      //     //                           padding: EdgeInsets.all(10),
      //     //                           child: CachedNetworkImage(
      //     //                             imageUrl:
      //     //                                 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
      //     //                             width: 100,
      //     //                           ),
      //     //                         ),
      //     //                       ],
      //     //                     ),
      //     //                     Center(
      //     //                       child: SizedBox(
      //     //                         width:
      //     //                             MediaQuery.of(context).size.width /
      //     //                                 3,
      //     //                         child: Divider(
      //     //                           color: Colors.black,
      //     //                         ),
      //     //                       ),
      //     //                     ),
      //     //                     Row(
      //     //                       mainAxisAlignment:
      //     //                           MainAxisAlignment.spaceBetween,
      //     //                       children: [
      //     //                         Container(
      //     //                           padding: EdgeInsets.all(10),
      //     //                           child: CachedNetworkImage(
      //     //                             imageUrl:
      //     //                                 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
      //     //                             width: 100,
      //     //                           ),
      //     //                         ),
      //     //                         const Text('Level 16'),
      //     //                         Container(
      //     //                           padding: EdgeInsets.all(10),
      //     //                           child: CachedNetworkImage(
      //     //                             imageUrl:
      //     //                                 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
      //     //                             width: 100,
      //     //                           ),
      //     //                         ),
      //     //                       ],
      //     //                     ),
      //     //                   ],
      //     //                 ),
      //     //               ),
      //     //             ),
      //     //           ],
      //     //         ),
      //     //       ),
      //     //     ],
      //     //   ),
      //     // ),
      //     //   ],
      //     // ),
      //   ],
      // ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

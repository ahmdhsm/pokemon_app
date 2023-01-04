import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';
import 'package:pokemon_app/feature/pokemon.bak/presentation/widgets/pokemon_type_widget.dart';
import 'package:pokemon_app/feature/pokemon.bak/presentation/widgets/stat_row_widget.dart';

import '../../../../main.dart';
import '../../../pokemon/presentation/notifier/pokemon_detail_notifier.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget>
    with AutomaticKeepAliveClientMixin<AboutWidget> {
  final PokemonDetailNotifier tes = getIt.get();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: tes,
        builder: (context, child) {
          if (tes.pokemonDetail == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                      // strokeWidth: 10,
                      ),
                ),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: SingleChildScrollView(
                child: AnimatedBuilder(
                  animation: tes,
                  builder: (context, child) {
                    if (tes.pokemonDetail == null) {
                      return Container();
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Types',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              children: [
                                for (int i = 0;
                                    i < tes.pokemonDetail!.types.length;
                                    i++)
                                  PokemonTypeWidget(
                                    type: tes.pokemonDetail!.types[i],
                                    index: i,
                                  )
                              ],
                            ),
                            SizedBox(height: 20),
                            // Center(
                            //   child: Container(
                            //     width: MediaQuery.of(context).size.width,
                            //     height: 1,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                            // SizedBox(height: 10),
                            Text(
                              'Base Stat',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                            // SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (var tes2
                                      in tes.pokemonDetail!.baseStatEntity)
                                    StatRowWidget(
                                      stat: tes2.label,
                                      value: tes2.value,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}

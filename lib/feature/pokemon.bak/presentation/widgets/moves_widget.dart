import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../pokemon/presentation/notifier/pokemon_detail_notifier.dart';
import 'pokemon_type_widget.dart';

class MovesWidget extends StatefulWidget {
  const MovesWidget({super.key});

  @override
  State<MovesWidget> createState() => _MovesWidgetState();
}

class _MovesWidgetState extends State<MovesWidget>
    with AutomaticKeepAliveClientMixin<MovesWidget> {
  final PokemonDetailNotifier tes = getIt.get();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tes,
      builder: (context, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Wrap(
              children: [
                for (int i = 0; i < tes.pokemonDetail!.moves.length; i++)
                  PokemonTypeWidget(
                    type: tes.pokemonDetail!.moves[i],
                    index: i,
                    withAnimation: false,
                  )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

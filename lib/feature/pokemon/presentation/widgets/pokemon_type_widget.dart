import 'package:flutter/material.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';

class PokemonTypeWidget extends StatefulWidget {
  const PokemonTypeWidget({
    super.key,
    required this.type,
    required this.index,
    this.withAnimation = true,
  });

  final String type;
  final int index;
  final bool withAnimation;

  @override
  State<PokemonTypeWidget> createState() => _PokemonTypeWidgetState();
}

class _PokemonTypeWidgetState extends State<PokemonTypeWidget> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 5),
      child: FutureBuilder(
        future: widget.withAnimation == true
            ? Future.delayed(Duration(milliseconds: 100 * widget.index))
            : Future.delayed(const Duration(seconds: 0)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            opacity = 1;
          }

          return AnimatedOpacity(
            opacity: opacity,
            duration: widget.withAnimation == true
                ? const Duration(milliseconds: 500)
                : const Duration(milliseconds: 0),
            child: Container(
              height: 25,
              padding:const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(103, 111, 163, 1),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Text(
                widget.type.toCamelCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

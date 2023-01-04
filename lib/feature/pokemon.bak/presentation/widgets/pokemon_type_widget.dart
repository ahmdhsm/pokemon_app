import 'package:flutter/material.dart';
import 'package:pokemon_app/core/extensions/string_extension.dart';

class PokemonTypeWidget extends StatefulWidget {
  const PokemonTypeWidget({super.key, required this.type, required this.index});

  final String type;
  final int index;

  @override
  State<PokemonTypeWidget> createState() => _PokemonTypeWidgetState();
}

class _PokemonTypeWidgetState extends State<PokemonTypeWidget> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, right: 5),
      child: FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 100 * widget.index)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            opacity = 1;
          }
          // return Stack(
          //   children: [
          //     Container(
          //       height: 25,
          //       padding: EdgeInsets.symmetric(
          //         horizontal: 10,
          //       ),
          //       decoration: BoxDecoration(
          //         color: Colors.green,
          //         borderRadius: BorderRadius.all(Radius.circular(50)),
          //       ),
          //       child: Text(
          //         widget.type.toCamelCase(),
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 15,
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       left: 0,
          //       right: 0,
          //       bottom: 0,
          //       child: Container(
          //         color: Colors.black,
          //         width: 1,
          //         height: 100,
          //       ),
          //     ),
          //   ],
          // );
          return AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: 500),
            child: Container(
              height: 25,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Text(
                widget.type.toCamelCase(),
                style: TextStyle(
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

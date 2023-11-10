import 'package:flutter/material.dart';

class LoadingCircularWidget extends StatelessWidget {
  const LoadingCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}

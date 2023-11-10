import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatRowWidget extends StatelessWidget {
  StatRowWidget({
    Key? key,
    required this.stat,
    required this.value,
  }) : super(key: key);

  final String stat;
  final int value;

  double width = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 85,
            child: Text(
              stat,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$value',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraint) {
                    return FutureBuilder(
                      future: Future.delayed(
                        const Duration(milliseconds: 100),
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          width = constraint.maxWidth * value / 255;
                        }
                        return AnimatedContainer(
                          width: width,
                          height: 10,
                          duration: const Duration(milliseconds: 500),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

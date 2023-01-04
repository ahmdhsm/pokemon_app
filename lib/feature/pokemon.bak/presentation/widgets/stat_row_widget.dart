import 'package:flutter/material.dart';
import 'package:pokemon_app/const/app_colors.dart';

class StatRowWidget extends StatefulWidget {
  const StatRowWidget({
    Key? key,
    required this.stat,
    required this.value,
  }) : super(key: key);

  final String stat;
  final int value;

  @override
  State<StatRowWidget> createState() => _StatRowWidgetState();
}

class _StatRowWidgetState extends State<StatRowWidget> {
  double width = 0;

  @override
  void initState() {
    print('tes');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          SizedBox(
            width: 85,
            child: Text(
              widget.stat,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraint) {
                    return FutureBuilder(
                      future: Future.delayed(Duration(milliseconds: 100)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          width = constraint.maxWidth * widget.value / 255;
                        }
                        return AnimatedContainer(
                          width: width,
                          height: 10,
                          duration: const Duration(milliseconds: 500),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
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
          SizedBox(
            width: 40,
            child: Text(
              '${widget.value}',
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

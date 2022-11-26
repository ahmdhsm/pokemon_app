import 'package:flutter/material.dart';
import 'package:pokemon_app/const/app_colors.dart';

class StatRowWidget extends StatelessWidget {
  const StatRowWidget({
    Key? key,
    required this.stat,
    required this.value,
  }) : super(key: key);

  final String stat;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
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
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: value / 100,
                minHeight: 10,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.green,
                ),
                backgroundColor: const Color(0xffD6D6D6),
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$value',
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

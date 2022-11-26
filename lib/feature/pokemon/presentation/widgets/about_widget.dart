import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokemon_app/feature/pokemon/presentation/widgets/stat_row_widget.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Base Stat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            StatRowWidget(
              stat: 'HP',
              value: 45,
            ),
            StatRowWidget(
              stat: 'Attack',
              value: 49,
            ),
            StatRowWidget(
              stat: 'Defense',
              value: 49,
            ),
            StatRowWidget(
              stat: 'Sp. Attack',
              value: 65,
            ),
            StatRowWidget(
              stat: 'Sp. Defense',
              value: 65,
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

class AvailabilityItem extends StatelessWidget {
  final String textavailability;
  const AvailabilityItem({Key? key, required this.textavailability})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/checklist.png'),
              ),
            ),
          ),
          Text(
            textavailability,
            style: hitamTextStyle,
          )
        ],
      ),
    );
  }
}

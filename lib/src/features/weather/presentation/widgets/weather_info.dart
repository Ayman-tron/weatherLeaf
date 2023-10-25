import 'package:flutter/material.dart';
import 'package:weatherLeaf/src/common_widgets/breakpoints.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo(
      {super.key,
      required this.icon,
      required this.iconDescription,
      required this.data});

  final Widget icon;
  final String iconDescription;
  final Widget data;

  @override
  Widget build(BuildContext context) {
    Breakpoint breakpoint = Breakpoint();
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.shade200,
          ),
          child: IconButton(
            onPressed: null,
            icon: icon,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              iconDescription,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            data,
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        children: <InlineSpan>[
          WidgetSpan(
            child: Text(
              'tech',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          WidgetSpan(
            child: Text(
              'Genius',
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          WidgetSpan(
            child: Text(
              'Labs.ai',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Welocme to weather App 🥰',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'start searching about your city 🔍',
            style: TextStyle(
              fontSize: 23.0,
            ),
          )
        ],
      ),
    );
  }
}

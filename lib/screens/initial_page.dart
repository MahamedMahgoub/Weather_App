import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_page.dart';

class InitialBody extends StatelessWidget {
  const InitialBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SearchPage.id,
                );
              },
              icon: Icon(
                Icons.search,
                size: 30,
              ))
        ],
        centerTitle: true,
        title: const Text('Weather'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Welocme to weather App 🥰',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'search Now about your city 🔍',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

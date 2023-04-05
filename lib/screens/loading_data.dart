import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_page.dart';

class LoadingData extends StatelessWidget {
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
        child: CircularProgressIndicator(),
      ),
    );
  }
}

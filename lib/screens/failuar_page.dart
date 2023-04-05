import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_page.dart';

class FailureBody extends StatelessWidget {
  const FailureBody({Key? key}) : super(key: key);

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
      body: Column(
        children: const [
          Center(
            child: CircularProgressIndicator(),
          ),
          Center(
            child: Text('   Something Went Wrong 😕   '),
          ),
          Center(
            child: Text('Please try again'),
          ),
        ],
      ),
    );
  }
}

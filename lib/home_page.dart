import 'package:carrousel/carrousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: SizedBox(
          height: 200.0,
          child: Carrousel(
            children: <Widget>[
              _FakePage(number: 1, color: Colors.red),
              _FakePage(number: 2, color: Colors.blue),
              _FakePage(number: 3, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}

class _FakePage extends StatelessWidget {
  const _FakePage({
    Key? key,
    required this.number,
    required this.color,
  }) : super(key: key);

  final int number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text('$number'),
    );
  }
}

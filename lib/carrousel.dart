import 'package:flutter/material.dart';

class Carrousel extends StatefulWidget {
  const Carrousel({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  State<Carrousel> createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: widget.children,
    );
  }
}

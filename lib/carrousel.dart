import 'package:flutter/material.dart';

class Carrousel extends StatefulWidget {
  const Carrousel({
    Key? key,
    required this.children,
    this.initialPage = 0,
    this.viewportFraction = 0.8,
  }) : super(key: key);

  final List<Widget> children;
  final int initialPage;
  final double viewportFraction;

  @override
  State<Carrousel> createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  late int _pageNumber;
  late PageController _pageController;

  void _onPageChanged(int pageNumber) {
    setState(() => _pageNumber = pageNumber);
  }

  @override
  void initState() {
    super.initState();
    _pageNumber = widget.initialPage;
    _pageController = PageController(
      initialPage: _pageNumber,
      viewportFraction: widget.viewportFraction,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: widget.children,
          ),
        ),
        _Indicator(
          childCount: widget.children.length,
          currentPageNumber: _pageNumber,
        ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    Key? key,
    required this.childCount,
    required this.currentPageNumber,
  }) : super(key: key);

  final int childCount;
  final int currentPageNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        childCount,
        (index) => Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: (index == currentPageNumber) ? Colors.blue : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

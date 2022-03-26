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
          child: PageView.builder(
            controller: _pageController,
            pageSnapping: true,
            onPageChanged: _onPageChanged,
            itemCount: widget.children.length,
            itemBuilder: (_, index) => AnimatedContainer(
              duration: kThemeAnimationDuration,
              padding: index != _pageNumber
                  ? const EdgeInsets.all(16.0)
                  : EdgeInsets.zero,
              child: widget.children[index],
            ),
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
    this.dotSize = 8.0,
    this.margin = const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
  }) : super(key: key);

  final int childCount;
  final int currentPageNumber;
  final double dotSize;
  final EdgeInsetsGeometry margin;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        childCount,
        (index) => Container(
          width: dotSize,
          height: dotSize,
          margin: margin,
          decoration: BoxDecoration(
            color: (index == currentPageNumber) ? primaryColor : secondaryColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

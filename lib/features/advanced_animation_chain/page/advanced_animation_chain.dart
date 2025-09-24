import 'package:flutter/material.dart';

class AdvancedAnimationChain extends StatefulWidget {
  const AdvancedAnimationChain({super.key});

  @override
  _AdvancedAnimationChainState createState() => _AdvancedAnimationChainState();
}

class _AdvancedAnimationChainState extends State<AdvancedAnimationChain>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late List<Animation<double>> _scaleAnimations;
  late List<Animation<double>> _opacityAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();

    _scaleAnimations = List.generate(3, (index) {
      return Tween(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            0.2 * index,
            0.2 * index + 0.4,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });

    _opacityAnimations = List.generate(3, (index) {
      return Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            0.2 * index,
            0.2 * index + 0.4,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimations[index].value,
                  child: Transform.scale(
                    scale: _scaleAnimations[index].value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Circle(),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
    );
  }
}

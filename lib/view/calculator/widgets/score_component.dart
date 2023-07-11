import 'package:flutter/material.dart';

class ScoreComponent extends StatefulWidget {
  final int score;

  ScoreComponent({required this.score});

  @override
  _ScoreComponentState createState() => _ScoreComponentState();
}

class _ScoreComponentState extends State<ScoreComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation =
        Tween<double>(begin: 0.2, end: 0.7).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          height: MediaQuery.of(context).size.height * _animation.value,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.score} points'),
                    ElevatedButton(
                      onPressed: _toggleExpanded,
                      child:
                          Text(_expanded ? '<- Previous step' : 'Next step ->'),
                    ),
                  ],
                ),
              ),
              if (_expanded)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Detail information'),
                ),
            ],
          ),
        );
      },
    );
  }
}

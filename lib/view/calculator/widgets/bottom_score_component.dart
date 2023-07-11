import 'package:flutter/material.dart';

class BottomScoreComponent extends StatefulWidget {
  final int score;

  BottomScoreComponent({required this.score});

  @override
  _BottomScoreComponentState createState() => _BottomScoreComponentState();
}

class _BottomScoreComponentState extends State<BottomScoreComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  bool _expanded = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, 0.7),
    ).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: _expanded
          ? MediaQuery.of(context).size.height * 0.7
          : MediaQuery.of(context).size.height * 0.2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _toggleExpand,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Text(
                  '${widget.score} points',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (_expanded)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  child: const Text(
                    'Detailed information goes here...',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            if (_expanded)
              ElevatedButton(
                onPressed: _toggleExpand,
                child: Text('Close'),
              )
          ],
        ),
      ),
    );
  }
}

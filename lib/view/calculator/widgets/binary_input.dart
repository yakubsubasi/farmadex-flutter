import 'package:flutter/material.dart';

class BinaryInput extends StatefulWidget {
  final String trueLabel;
  final String falseLabel;
  final String label;

  final double trueScore;
  final double falseScore;
  double score = 0;

  BinaryInput({
    super.key,
    required this.trueLabel,
    required this.falseLabel,
    required this.label,
    required this.trueScore,
    required this.falseScore,
  });

  @override
  _BinaryInputState createState() => _BinaryInputState();
}

class _BinaryInputState extends State<BinaryInput> {
  List<bool> _values = [false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: Text(widget.label)),
        Align(
          alignment: Alignment.centerRight,
          child: ToggleButtons(
            children: [
              Container(
                width: 100,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(widget.falseLabel)),
              ),
              Container(
                padding: EdgeInsets.only(right: 8),
                width: 100,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(widget.trueLabel),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "+" + widget.trueScore.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
            isSelected: _values,
            onPressed: (index) {
              setState(() {
                _values = [false, false];
                _values[index] = true;
                widget.score =
                    index == 0 ? widget.falseScore : widget.trueScore;
              });
            },
          ),
        ),
      ],
    );
  }
}

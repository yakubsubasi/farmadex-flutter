// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:farmadex/view/calculator/provider/score_provider.dart';

class BinaryInput extends StatefulWidget {
  final String trueLabel;
  final String falseLabel;
  final String label;

  final double trueScore;
  final double falseScore;

  late final score;

  BinaryInput({
    Key? key,
    required this.trueLabel,
    required this.falseLabel,
    required this.label,
    required this.trueScore,
    required this.falseScore,
    this.score = 0.0,
  }) : super(key: key);

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
          child: Consumer(
            builder: (context, watch, child) {
              return ToggleButtons(
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
                    if (_values[index == 0 ? 1 : 0]) {
                      watch
                          .read(scoreProvider.notifier)
                          .updateScore(-widget.score);
                    }
                    widget.score =
                        index == 0 ? widget.falseScore : widget.trueScore;

                    if (!_values[index]) {
                      watch
                          .read(scoreProvider.notifier)
                          .updateScore(widget.score);
                    }

                    _values = [false, false];
                    _values[index] = true;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

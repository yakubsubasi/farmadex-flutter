import 'package:farmadex/view/calculator/provider/score_provider.dart';
import 'package:farmadex/view/calculator/widgets/binary_input.dart';
import 'package:farmadex/view/calculator/widgets/score_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorPageView extends ConsumerWidget {
  final List<BinaryInput> children;

  CalculatorPageView({required this.children});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator Page')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: children.length,
                    itemBuilder: (BuildContext context, int index) {
                      BinaryInput binaryInput = children[index];
                      return binaryInput;
                    },
                  ),
                ),
                // SCORE
                Text(
                  "Score: " + "${ref.watch(scoreProvider)}",
                  style: TextStyle(fontSize: 24),
                ),
                ScoreComponent(score: 100),
              ],
            ),
          )
        ],
      ),
    );
  }
}

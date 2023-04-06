import 'package:farmadex/view/calculator/widgets/binary_input.dart';
import 'package:flutter/material.dart';

class CalculatorPageView extends StatefulWidget {
  final List<BinaryInput> children;

  CalculatorPageView({required this.children});

  @override
  _CalculatorPageViewState createState() => _CalculatorPageViewState();
}

class _CalculatorPageViewState extends State<CalculatorPageView> {
  double _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _totalScore = 0;
            widget.children.forEach((binaryInput) {
              _totalScore += binaryInput.score;
            });
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Toplam Skor'),
                content: Text(_totalScore.toString()),
                actions: [
                  TextButton(
                    child: Text('Tamam'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        label: Text('Hesapla'),
        icon: Icon(Icons.calculate),
      ),
      appBar: AppBar(title: Text('Calculator Page')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: widget.children.length,
                itemBuilder: (BuildContext context, int index) {
                  BinaryInput binaryInput = widget.children[index];
                  return binaryInput;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:farmadex/core/constants.dart';
import 'package:farmadex/core/text_theme.dart';
import 'package:farmadex/view/feedback/models/feedback.dart';
import 'package:flutter/material.dart' hide Feedback;

@RoutePage()
class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  List<Feedback> allFeedback = [];

  ValueNotifier<bool> loading = ValueNotifier(false);

  void setLoading(bool val) {
    loading.value = val;
  }

  @override
  void initState() {
    setLoading(false);
    // feedbackService.getLatestFeedback().then((value) {
    //   setState(() {
    //     allFeedback = value;
    //     setLoading(false);
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: allFeedback.length,
              itemBuilder: (BuildContext context, int index) {
                Feedback feedback = allFeedback[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feedback.message,
                          style: context.bodyLarge,
                        ),
                        gap8,
                        Text(
                          MaterialLocalizations.of(context)
                              .formatFullDate(feedback.createdAt!)
                              .toString(),
                          style: context.bodySmall,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

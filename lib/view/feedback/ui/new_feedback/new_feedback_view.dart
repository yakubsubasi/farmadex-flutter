import 'package:farmadex/core/constants.dart';
import 'package:farmadex/view/feedback/services/supabase_feedback_service.dart';
import 'package:farmadex/view/shared/ui/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FeedbackType {
  bug,
  feature,
  other,
}

class NewFeedbackView extends ConsumerStatefulWidget {
  const NewFeedbackView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewFeedbackViewState();
}

class _NewFeedbackViewState extends ConsumerState<NewFeedbackView> {
  final TextEditingController feedbackController = TextEditingController();
  bool loading = false;
  FeedbackType? type;

  void setLoading(bool val) {
    setState(() {
      loading = val;
    });
  }

  void setType(FeedbackType val) {
    setState(() {
      type = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> submitFeedback() async {
      assert(type != null, 'Feedback type must be selected');
      assert(feedbackController.text.isNotEmpty,
          'Feedback message must not be empty');

      setLoading(true);
      await ref
          .read(feedbackServiceProvider)
          .submitFeedback(feedbackController.text, type!);
      setLoading(false);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Geri Bildirim Gönder')),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const Text('Hangi tür geri bildiriminiz var?'),
              gap12,
              LayoutBuilder(builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (FeedbackType feedbackType in FeedbackType.values)
                      SizedBox(
                        child: FilterChip(
                          selected: type == feedbackType,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(feedbackType == FeedbackType.bug
                                  ? 'Hata'
                                  : feedbackType == FeedbackType.feature
                                      ? 'Yeni Özellik'
                                      : feedbackType == FeedbackType.other
                                          ? 'Diğer'
                                          : ''),
                            ],
                          ),
                          onSelected: (value) {
                            setType(feedbackType);
                          },
                        ),
                      ),
                  ],
                );
              }),
              gap16,
              TextField(
                controller: feedbackController,
                maxLines: 4,
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Geri Bildirim',
                    border: OutlineInputBorder()),
              ),
            ],
          ),
          if (loading) const Positioned.fill(child: LoadingOverlay()),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
            extendedPadding: const EdgeInsets.symmetric(horizontal: 64),
            onPressed: () async {
              if (feedbackController.text.trim().isEmpty || type == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Lütfen tüm alanları doldurun.')));
              } else {
                FocusScope.of(context).unfocus();
                await submitFeedback().then((value) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Geri bildirim gönderildi!')));
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(error.toString())));
                });
              }
            },
            label: Text(
              'Gönder',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'agreement_page_provider.dart';

class AgreementPage extends ConsumerWidget {
  const AgreementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreementText = ref.watch(fetchAgreementProvider);

    return Scaffold(
        appBar: AppBar(
            title: const Text('Kullanıcı Sözleşmesi'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: agreementText.when(
                data: (data) => Html(
                  data: data,
                ),
                error: (e, s) => const Text("Error"),
                loading: () => const CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ));
  }
}

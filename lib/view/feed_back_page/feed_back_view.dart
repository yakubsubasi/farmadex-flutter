import 'package:farmadex/view/feed_back_page/feed_back_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bize Ulaşın'),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Sizden duymak isteriz!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Herhangi bir öneriniz varsa veya uygulamamızda herhangi bir hata bulursanız bizimle iletişime geçin. Geri bildiriminiz bizim için değerlidir.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 60),
                Consumer(builder: (context, ref, child) {
                  final email = ref.watch(fetchEmailProvider);
                  return email.when(
                    data: (data) {
                      return Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                launch(
                                    'mailto:$data?subject=Farmadex%20Geri%20Bildirim&body=Merhaba%20Farmadex%20ekibi,%0A%0A');
                              },
                              child: const Text("E-posta Gönder")),
                          const SizedBox(height: 20),
                          Text(
                            data,
                          ),
                        ],
                      );
                    },
                    error: (e, s) => const Text("Error"),
                    loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                }),
              ],
            )),
      ),
    );
  }
}

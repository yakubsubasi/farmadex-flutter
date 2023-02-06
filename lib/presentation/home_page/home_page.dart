import 'package:farmadex/presentation/drug_guide/search_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Farmadex',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                    'Farmadex, etken madde bazlı aramalarınızla Jenerik ilaç bilgilerini kolayca bulmanızı sağlar. Jenerik ilaç hakkında fiyat, etken madde, atc kodu, üretici firma bilgilerine ulaşabilirsiniz.',
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/landing_page_image.png',
                    width: 350,
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[200],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Başla'),
                      SizedBox(width: 10, height: 40),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
                //log out button
                ElevatedButton(
                    onPressed: () {
                      Supabase.instance.client.auth.signOut();
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text('Çıkış Yap'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:farmadex/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../disease_list/search_page_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(),
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
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                    'Farmadex, etken madde bazlı aramalarınızla Jenerik ilaç bilgilerini kolayca bulmanızı sağlar. Jenerik ilaç hakkında fiyat, etken madde, atc kodu, üretici firma bilgilerine ulaşabilirsiniz.',
                    style: Theme.of(context).textTheme.bodyLarge),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrescsPage())),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Başla'),
                        SizedBox(width: 10, height: 40),
                        Icon(Icons.arrow_forward)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Menu',
            )),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          onTap: () {
            //Navigate to profile page
            GoRouter.of(context).goNamed(AppRoute.profile.name);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {},
        ),
      ],
    ),
  );
}

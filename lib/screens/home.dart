import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccinationcard/services/auth.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Vaccination card')),
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          padding: const EdgeInsets.all(20.0),
          children: [
            Container(
              color: Theme.of(context).backgroundColor,
              child: GridTile(
                header: Center(
                  child: Text('Info',
                      style: Theme.of(context).textTheme.headline6),
                ),
                child: const Icon(FontAwesomeIcons.info),
              ),
            ),
            user.when(
              data: (data) {
                if (data != null) {
                  return GestureDetector(
                    child: Container(
                      color: Theme.of(context).backgroundColor,
                      child: GridTile(
                        header: Center(
                          child: Text(data.displayName ?? 'Annonymous',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        child: const Icon(FontAwesomeIcons.personRifle),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                  );
                } else {
                  return ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  );
                }
              },
              error: (e, s) => const Text('error'),
              loading: () => const Text('loading'),
            )
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vaccinationcard/services/auth.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final screenTitleProvider = Provider((_) => 'Profile');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: userStream.when(
        data: (user) {
          return ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL ?? ''),
                radius: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  user.displayName ?? 'Annonymous',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  user.email ?? '',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            )
          ]);
        },
        error: (e, s) => const Text('error'),
        loading: () => const Text('loading'),
      ),
    );
  }
}

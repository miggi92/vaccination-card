import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vaccinationcard/services/auth.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Main')),
      body: Column(children: [
        user.when(
          data: (data) {
            if (data != null) {
              return Text(data.uid);
            } else {
              return ElevatedButton(
                child: const Text('Login'),
                onPressed: () => Navigator.pushNamed(context, '/login'),
              );
            }
          },
          error: (e, s) => Text('error'),
          loading: () => Text('loading'),
        )
      ]),
    );
  }
}

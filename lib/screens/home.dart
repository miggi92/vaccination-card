import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Main')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () => Navigator.pushNamed(context, '/login'),
        ),
      ),
    );
  }
}

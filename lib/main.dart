import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vaccinationcard/routes.dart';
import 'package:vaccinationcard/theme.dart';
import 'firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  analytics.logScreenView(screenName: 'Main');
  runApp(const ProviderScope(child: MyApp()));
}

final userProvider = StreamProvider<User?>(
  (ref) => FirebaseAuth.instance.authStateChanges(),
);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final user = ref.watch(userProvider);
     return user.when(
      data: (user) {
        return MaterialApp(
          title: 'Vaccination card',
          theme: appTheme,
          routes: appRoutes,
        );
      },
      error: (e, s) => Text('error'),
      loading: () => Text('loading'),
    );
  }
}

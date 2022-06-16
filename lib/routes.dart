import 'package:vaccinationcard/screens/login.dart';
import 'package:vaccinationcard/screens/profile.dart';

import 'screens/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen()
};

import 'package:domasna_1/firebase_options.dart';
import 'package:domasna_1/providers/app_provider.dart';
import 'package:domasna_1/providers/auth_provider.dart';
import 'package:domasna_1/screens/category_meals.dart';
import 'package:domasna_1/screens/meal_details.dart';
import 'package:domasna_1/screens/meal_receip.dart';
import 'package:domasna_1/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ApplicationProvider>(
        create: (_) => ApplicationProvider()),
    ChangeNotifierProvider<AuthServiceProvider>(
        create: (_) => AuthServiceProvider())
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const Wrapper(),
        '/cateegory': (context) => const CategoryMeals(),
        '/detailed': (context) => const MealDetails(),
        '/recipes': (context) => const MealRecip()
      },
    );
  }
}

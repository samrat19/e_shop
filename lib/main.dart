import 'package:e_shop/configure_dependency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/provider/shopping_data_provider.dart';
import 'screens/product_listing_screen.dart';

void main() {
  configureDependencies();
  runApp(
    const MyApp(),
  );
}

var navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ShoppingDataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: navigationKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductListingScreen(),
      ),
    );
  }
}

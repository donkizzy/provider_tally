import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/ui/home_page.dart';

import 'providers/business_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BusinessProvider(),
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomePage(),
      ),
    );
  }
}


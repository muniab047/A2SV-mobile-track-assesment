import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/feature/grocery/presentation/bloc/grocery_bloc.dart';
import 'package:grocery_shopping_app/feature/grocery/presentation/page/home_page.dart';

import 'feature/grocery/presentation/page/splash_screen.dart';
import 'injection_container.dart' as di;


import 'injection_container.dart';

void main() async {
  await di.init();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GroceryBloc>(create: (context) => di.sl<GroceryBloc>(),),
       
        // Add other providers here if needed
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          //'/' : (context) => SplashScreen(),
          //'/home': (context) => const HomePage(),
         
        },
        debugShowCheckedModeBanner: false,
        title: 'Grocery Shopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        
        ),
        home: SplashScreen(),

      ),
    );
  }
}
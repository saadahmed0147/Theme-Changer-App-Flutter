import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_changer/providers/theme_changer_provider.dart';
import 'package:theme_changer/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeChangerProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => SliderProvider(),
          ),
        ],
        child: Builder(
          builder: (context) {
            final provider = Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              themeMode: provider.themeMode,
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  appBarTheme: const AppBarTheme(
                    foregroundColor: Colors.black,
                    color: Colors.white,
                  )),
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  foregroundColor: Colors.white,
                  color: Colors.black,
                ),
                useMaterial3: true,
              ),
              home: const HomeScreen(),
            );
          },
        ));
  }
}

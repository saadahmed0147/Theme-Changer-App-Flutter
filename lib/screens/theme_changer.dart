import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_changer/providers/theme_changer_provider.dart';

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeChangerProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Theme Changer'),
        ),
        body: Column(
          children: [
            Consumer<ThemeChangerProvider>(
              builder: (context, value, child) {
                return Slider(
                  min: 1,
                  max: 10,
                  value: provider.value,
                  onChanged: (val) {
                    provider.setValue(val);
                  },
                );
              },
            ),
            Consumer<ThemeChangerProvider>(
              builder: (context, value, child) {
                return Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(value.value / 10),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

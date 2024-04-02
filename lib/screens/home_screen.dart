import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_changer/providers/theme_changer_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeChangerProvider>(context);
    final sliderProvider = Provider.of<SliderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        title: const Text('Theme Changer'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Switch(
                activeColor: Colors.black,
                value: provider.themeMode == ThemeMode.dark,
                onChanged: ((value) {
                  provider.setTheme(value ? ThemeMode.dark : ThemeMode.light);
                })),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadioMenuButton<ThemeMode>(
              value: ThemeMode.light,
              groupValue: provider.themeMode,
              onChanged: (v) {
                provider.setTheme(ThemeMode.light);
              },
              child: const Text('Light Mode')),
          RadioMenuButton<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: provider.themeMode,
            onChanged: (v) {
              provider.setTheme(ThemeMode.dark);
            },
            child: const Text('Dark Mode'),
          ),
          Expanded(
            child: Center(
              child: ToggleButtons(
                  onPressed: (index) {
                    provider.setTheme(
                        index == 0 ? ThemeMode.dark : ThemeMode.light);
                  },
                  isSelected: [
                    provider.themeMode == ThemeMode.dark,
                    provider.themeMode == ThemeMode.light
                  ],
                  children: const [
                    Text('On'),
                    Text('Off')
                  ]),
            ),
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                min: 1,
                max: 10,
                value: sliderProvider.value,
                onChanged: (val) {
                  sliderProvider.setValue(val);
                },
              );
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Expanded(
                child: Container(
                  color: Colors.black.withOpacity((11 - value.value) / 10),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

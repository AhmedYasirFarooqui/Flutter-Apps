import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class DarkThemeScreen extends StatelessWidget {
  const DarkThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Light Mode Provider'),
      ),
      body: Column(
        children: [
          RadioListTile(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: provider.themeMode,
            onChanged: provider.setTheme,
          ),
          RadioListTile(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: provider.themeMode,
            onChanged: provider.setTheme,
          ),
          RadioListTile(
            title: const Text('System'),
            value: ThemeMode.system,
            groupValue: provider.themeMode,
            onChanged: provider.setTheme,
          ),
        ],
      ),
    );
  }
}

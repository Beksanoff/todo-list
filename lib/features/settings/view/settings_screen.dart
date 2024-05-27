import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_foundation/cubit/theme/theme_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: const Text('Темный режим'),
            value: brightness == Brightness.dark,
            onChanged: (bool value) {
              context.read<ThemeCubit>().setThemeBrightness(
                  value ? Brightness.dark : Brightness.light);
            },
          ),
        ],
      ),
    );
  }
}

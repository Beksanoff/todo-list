import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_foundation/cubit/theme/theme_cubit.dart';
import 'package:go_foundation/features/home/bloc/tasks_bloc.dart';
import 'package:go_foundation/features/home/view/tasks_screen.dart';
import 'package:go_foundation/features/settings/view/settings_screen.dart';
import 'package:go_foundation/repository/tasks/tasks.dart';
import 'package:go_foundation/ui/theme/theme.dart';
import 'package:realm/realm.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.realm});

  final Realm realm;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(
            TasksRepository(realm: widget.realm),
          ),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:
                  state.brightness == Brightness.dark ? darkTheme : lightTheme,
              initialRoute: '/',
              routes: {
                '/': (context) => const MyHomePage(),
                '/settings': (context) => const SettingsScreen(),
              });
        },
      ),
    );
  }
}

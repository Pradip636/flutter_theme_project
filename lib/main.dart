import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/bloc/my_theme_cubit.dart';
import 'package:flutter_theme/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyThemeCubit>(
      create: (context) => MyThemeCubit()..initialTheme(),
      child: BlocBuilder<MyThemeCubit, MyThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.theme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

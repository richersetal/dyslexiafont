import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/font_cubit.dart';
import 'screens/homepage.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => FontCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, String?>(
      builder: (context, font) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: ThemeData.light().textTheme.apply(
                  fontFamily: font, // Use the dynamic fonts
                ),
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

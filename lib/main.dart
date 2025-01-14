import 'package:com_richersetal_dyslexiafont/logic/cubit/opacity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/font_cubit.dart';
import 'screens/homepage.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FontCubit()),
        BlocProvider(create: (_) => OpacityCubit()),
      ],
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
        return BlocBuilder<OpacityCubit, int>(
          builder: (context, opacity) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: ThemeData.light().textTheme.apply(
                      fontFamily: font, // Dynamic fonts
                      bodyColor: ThemeData.light()
                          .textTheme
                          .bodyLarge
                          ?.color
                          ?.withAlpha((255 *
                              opacity ~/
                              100)), // use opacity or use fallback
                      displayColor: ThemeData.light()
                          .textTheme
                          .displayLarge
                          ?.color
                          ?.withAlpha((255 *
                              opacity ~/
                              100)), // use opacity or use fallback
                    ),
              ),
              home: const MyHomePage(),
            );
          },
        );
      },
    );
  }
}

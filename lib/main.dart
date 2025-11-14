import 'package:college_schedule/provider/theme_provider.dart';
import 'package:college_schedule/screens/full_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const CollegeScheduleApp(),
    ),
  );
}

class CollegeScheduleApp extends StatelessWidget {
  const CollegeScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'College Schedule',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorSchemeSeed: Colors.deepPurple,
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorSchemeSeed: Colors.deepPurple,
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          themeMode: themeProvider.currentTheme,
          home: const FullScheduleScreen(),
        );
      },
    );
  }
}

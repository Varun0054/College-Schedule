import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/timetable_data.dart';
import '../widgets/period_card.dart';
import '../provider/theme_provider.dart';

class FullScheduleScreen extends StatefulWidget {
  const FullScheduleScreen({super.key});

  @override
  State<FullScheduleScreen> createState() => _FullScheduleScreenState();
}

class _FullScheduleScreenState extends State<FullScheduleScreen> {
  String selectedBatch = 'T1';
  String selectedDay = DateTime.now().weekday == 7
      ? 'Monday'
      : ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  [DateTime.now().weekday - 1];

  @override
  Widget build(BuildContext context) {
    final allPeriods = timetable[selectedDay] ?? [];
    final filteredPeriods = allPeriods
        .where((p) => p.batch == selectedBatch || p.batch == 'All')
        .toList();

    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Developed by. V@run🥂"),
                backgroundColor: Colors.black87,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: const Text('📅 Ai-Ds Schedule'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: 'Toggle Theme',
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [Colors.grey.shade900, Colors.black]
                : [const Color(0xFFEEE8FF), const Color(0xFFD6C8FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Day Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButton<String>(
                    value: selectedDay,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    underline: const SizedBox(),
                    dropdownColor: Theme.of(context).cardColor,
                    items: timetable.keys.map((day) {
                      return DropdownMenuItem(
                        value: day,
                        child: Text("📆 $day"),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDay = value!;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// Batch Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButton<String>(
                    value: selectedBatch,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    underline: const SizedBox(),
                    dropdownColor: Theme.of(context).cardColor,
                    items: ['T1', 'T2', 'T3'].map((batch) {
                      return DropdownMenuItem(
                        value: batch,
                        child: Text("👥 Batch $batch"),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedBatch = value!;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Period List
            Expanded(
              child: filteredPeriods.isEmpty
                  ? Center(
                child: Text(
                  "No lectures for this batch on this day.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: filteredPeriods.length,
                itemBuilder: (context, index) {
                  return PeriodCard(period: filteredPeriods[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

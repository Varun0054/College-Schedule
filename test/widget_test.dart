import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:college_schedule/main.dart';

void main() {
  testWidgets('App loads and shows home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const CollegeScheduleApp());

    expect(find.text('My Daily Schedule'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:hweek/app/app.dart';
import 'package:hweek/features/view_paths/view_paths_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(ViewPathsPage), findsOneWidget);
    });
  });
}

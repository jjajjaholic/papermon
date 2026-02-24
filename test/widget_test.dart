import 'package:flame/game.dart'; // GameWidget을 위해 필요합니다
import 'package:flutter_test/flutter_test.dart';
import 'package:papermon/main.dart';

void main() {
  testWidgets('Papermon game load test', (WidgetTester tester) async {
    // PaperMonGame을 GameWidget으로 감싸서 빌드합니다.
    await tester.pumpWidget(
      GameWidget(
        game: PaperMonGame(),
      ),
    );

    // 게임 위젯이 정상적으로 화면에 떴는지 확인합니다.
    expect(find.byType(GameWidget<PaperMonGame>), findsOneWidget);
  });
}
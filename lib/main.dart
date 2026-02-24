import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  // PaperMonGame 인스턴스를 생성합니다.
  final game = PaperMonGame();

  runApp(GameWidget<PaperMonGame>(game: game,));
}

// 1. 게임의 전체 흐름을 관리하는 클래스 (Main Loop)
class PaperMonGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFFFDF5E6);

  @override
  Future<void> onLoad() async {
    // 첫 번째 종이몬 캐릭터 추가
    final player = JongEMonPlayer();
    add(player); // 화면에 캐릭터 등록
  }
}

// 2. 캐릭터(종이몬) 클래스
class JongEMonPlayer extends SpriteComponent with HasGameRef<PaperMonGame> {
  JongEMonPlayer() : super(size: Vector2(128, 128), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    // 이미지 불러오기 (assets/images/ 폴더 기준)
    sprite = await gameRef.loadSprite('papermon.jpg');
    
    // 화면 중앙에 배치
    position = gameRef.size / 2;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // 여기에 캐릭터의 움직임이나 애니메이션 로직을 넣습니다.
    // 예: 천천히 회전하는 효과 (종이가 흔들리는 느낌)
    angle += 0.5 * dt; 
  }
}
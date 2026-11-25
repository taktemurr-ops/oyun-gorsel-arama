import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_gorsel_arama/oyun_gorsel_arama.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(gorselAramaConfig.title.length, 33);
    expect(gorselAramaConfig.tagline.length, 33);
    for (final s in gorselAramaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(gorselAramaConfig.gameId, gorselAramaId);
    expect(gorselAramaRules.gameId, gorselAramaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(gorselAramaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: gorselAramaId, optionalMechanics: gorselAramaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(gorselAramaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

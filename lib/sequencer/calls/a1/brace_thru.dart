/*

  Taminations Square Dance Animations
  Copyright (C) 2021 Brad Christie

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

import '../common.dart';

class BraceThru extends ActivesOnlyAction with CallWithParts {

  @override final level = LevelData.A1;
  @override int numberOfParts = 2;
  @override var help = '''Brace Thru is a two-part call:
  1.  Pass Thru (can start from waves)
  2.  a. Normal couples courtesy turn
      b. Sashayed couples turn back
Part 2 cannot be done with same-sex couples.''';
  @override var helplink  = 'a1/brace_thru';
  BraceThru() : super('Brace Thru');

  @override
   void performPart1(CallContext ctx) {
    ctx.applyCalls('Pass Thru');
  }

  @override
   void performPart2(CallContext ctx) {
    ctx.analyze();
    for (final d in ctx.dancers) {
      final partner = d.data.partner.throwIfNull(CallError('Dancer $d cannot Brace Thru'));
      if (d.gender == partner.gender)
        throw CallError('Same-sex dancers cannot Brace Thru');
    }
    final normal = ctx.dancers.where((d) => d.data.beau ^ (d.gender == Gender.GIRL)).toList();
    final sashay = ctx.dancers.where((d) => d.data.beau ^ (d.gender == Gender.BOY)).toList();
    if (normal.isNotEmpty) {
      ctx.subContext(normal, (ctx3) {
        ctx3.applyCalls('Courtesy Turn');
      });
    }
    if (sashay.isNotEmpty) {
      ctx.subContext(sashay, (ctx3) {
        ctx3.applyCalls('Turn Back');
      });
    }
  }

}
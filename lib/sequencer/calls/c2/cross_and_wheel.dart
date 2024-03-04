/*

  Taminations Square Dance Animations
  Copyright (C) 2024 Brad Christie

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

class CrossAndWheel extends Action with IsLeft, CallWithParts {

  @override final level = LevelData.C2;
  @override var help = '''Cross and Wheel is a 2-part call:
  1.  As Couples Hinge
  2.  As Couples Step and Fold''';
  @override var helplink = 'c2/cross_and_wheel';
  @override int numberOfParts = 2;

  CrossAndWheel(super.name);

  @override
   void performPart1(CallContext ctx) {
    ctx.applyCalls('As Couples $left Hinge');
  }

  @override
   void performPart2(CallContext ctx) {
    ctx.applyCalls('As Couples Step and Fold');
  }

}
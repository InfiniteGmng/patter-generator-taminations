/*
 *     Copyright 2022 Brad Christie
 *
 *     This file is part of Taminations.
 *
 *     Taminations is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU Affero General Public License as published
 *     by the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     Taminations is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU Affero General Public License for more details.
 *
 *     You should have received a copy of the GNU Affero General Public License
 *     along with Taminations.  If not, see <http://www.gnu.org/licenses/>.
 */

import '../common.dart';

class GrandSingleCrossAndWheel extends Action with CallWithParts {

  @override final level = LevelData.C2;
  @override int numberOfParts = 2;
  GrandSingleCrossAndWheel(name) : super(name);

  @override
  Future<void> performPart1(CallContext ctx, [int stackIndex = 0]) async {
    final left = name.startsWith('Left') ? 'Left' : '';
    await ctx.applyCalls('$left Hinge');
  }

  @override
  Future<void> performPart2(CallContext ctx, [int stackIndex = 0]) async {
    ctx.analyze();
    await ctx.applyCalls('Center 6 Step While Very Ends Fold');
  }

}
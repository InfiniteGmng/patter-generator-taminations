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

class RelayTheTop extends Action with CallWithParts, CallWithStars, ButCall {

  @override int numberOfParts = 4;
  @override final level = LevelData.C1;
  RelayTheTop(String name) : super(name);

  @override
  Future<void> performPart1(CallContext ctx) async {
    await ctx.applyCalls('Swing');
  }

  @override
  Future<void> performPart2(CallContext ctx) async {
    await ctx.applyCalls('Centers Cast Off 3/4 '
        'While Ends Do Your Part Big Hourglass Circulate');

  }

  @override
  Future<void> performPart3(CallContext ctx) async {
    final turns = [
      for (var i=0; i<turnStarAmount; i++)
        'Turn the Star'
    ].join(' ');
    await ctx.applyCalls('Outer 4 Trade While Center 4 $turns');
  }

  @override
  Future<void> performPart4(CallContext ctx) async {
    await ctx.applyCalls('Wave of 6 Center 4 $butCall '
        'While Others Do Your Part Hourglass Circulate');
  }

}
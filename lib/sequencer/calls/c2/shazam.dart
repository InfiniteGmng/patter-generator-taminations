/*

  Taminations Square Dance Animations
  Copyright (C) 2020 Brad Christie

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

class Shazam extends Action {

  @override final level = LevelData.C2;
  Shazam() : super('Shazam');

  @override
  Future<void> perform(CallContext ctx, [int stackIndex = 0]) async {
    if (ctx.dancers.any((d) => !ctx.isInWave(d)))
      throw CallError('All dancers must be in a Wave');
    await ctx.applyCalls('Hinge and Roll and Roll');
  }

}
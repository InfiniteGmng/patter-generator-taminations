/*

  Taminations Square Dance Animations
  Copyright (C) 2023 Brad Christie

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

import '../../../moves.dart';
import '../common.dart';
import '../common/left.dart';

class Vertical extends ActivesOnlyAction with IsLeft {

  Vertical(super.name);

  @override
  Path performOne(DancerModel d, CallContext ctx) {
    //  This section copied from VerticalTag (refactor??)
    if (!d.data.beau && !d.data.belle)
      throw CallError('Dancer $d is not part of a couple');
    if (!d.data.leader && !d.data.trailer)
      throw CallError('Dancer $d is not in a box');
    final dp = d.data.partner
        .throwIfNull(CallError('Cannot find partner for $d'));
    final dt = (d.data.leader ? ctx.dancerInBack(d) : ctx.dancerInFront(d))
        .throwIfNull(CallError('Cannot find dancer in front or behind $d'));
    //  Distance from this dancer to center point of box
    final w = d.distanceTo(dp) / 2.0;
    final h = d.distanceTo(dt) / 2.0;

    if (d.data.leader) {
      //  Leader always goes behind unless belle of a couple facing out
      if (d.data.belle && dp.data.beau)
        return FlipLeft.skew(isLeft ? 0.5 : -h/2 , w - 2.0);
      else if (d.data.beau && dp.data.belle)
        return FlipRight.skew(isLeft ? -h/2 : 0.5, 2.0 - w);
      else if (d.data.belle)
        return FlipLeft.skew(0.5, w - 2.0);
      else
        return FlipRight.skew(0.5, 2.0 - w);
    } else {  // trailer
      //  Trailer always goes in front unless beau of a couple facing in
      if (d.data.beau && dp.data.belle)
        return DodgeRight.changeBeats(3.0).skew(isLeft ? h/2 : -0.5, 2.0 - w);
      else if (d.data.belle && dp.data.beau)
        return DodgeLeft.changeBeats(3).skew(isLeft ? -0.5 : h/2, w - 2.0);
      else if (d.data.beau)
        return ExtendRight.changeBeats(3).skew(h/2 - 1.0, 1.0 -w);
      else
        return ExtendLeft.changeBeats(3.0).skew(h/2 - 1.0, w - 1.0);
    }


  }

}
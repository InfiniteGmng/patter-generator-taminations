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

import '../../../moves.dart';
import '../common.dart';

class Touch extends Action {

  @override
  var level = LevelData.B2;
  Touch(String name) : super(name);

  @override
  Path performOne(DancerModel d, CallContext ctx) {
    var d2 = ctx.dancerFacing(d);
    if (d2 == null || !d2.data.active)
      return ctx.dancerCannotPerform(d,name);
    var dist = d.distanceTo(d2);
    var move = name.contains('Left') ? ExtendRight : ExtendLeft;
    //  Make sure there is room for any adjacent dancers to Touch
    return move.scale(dist/2,0.5);
  }

  @override
  void performCall(CallContext ctx) {
    //  First try Step to a Wave, which has some good XML animations
    if (name.contains('Touch')) {
      try {
        var hand =  name.startsWith('Left') ? 'Left-Hand' : '';
        ctx.applyCalls('Step to a $hand Wave');
        return;
        // ignore: empty_catches
      } on CallError { }
    }
    super.performCall(ctx);
  }

}
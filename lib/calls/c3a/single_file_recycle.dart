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

import '../../animated_call.dart';
import '../../formations.dart';
import '../../moves.dart';

  final List<AnimatedCall> SingleFileRecycle = [

    AnimatedCall('Single File Recycle',
      formation:Formations.SingleDoublePassThru,
      from:'Single Double Pass Thru',
      paths:[
          ExtendLeft.changeBeats(4).scale(3.0,3.0),

          ExtendLeft.changeBeats(1.5) +
          UmTurnRight.changeBeats(2.5)
      ]),
  ];

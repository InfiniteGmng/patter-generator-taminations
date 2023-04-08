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
import '../../common_dart.dart';
import '../../formation.dart';
import '../../formations.dart';
import '../../moves.dart';

  final List<AnimatedCall> ExplodeTheDiamond = [

    AnimatedCall('Explode the Diamond',
      formation:Formation('', [
        DancerModel.fromData(gender:Gender.BOY,x:2,y:3,angle:0),
        DancerModel.fromData(gender:Gender.GIRL,x:3,y:0,angle:270),
        DancerModel.fromData(gender:Gender.BOY,x:2,y:-3,angle:180),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:0,angle:90),
  ]),
      from:'Right-Hand Diamonds',
      paths:[
          RunRight.changeBeats(6).scale(2.0,3.0),

          LeadRight.changeBeats(3).scale(1.5,2.0) +
          ExtendRight.changeBeats(3).scale(3.0,0.5),

          Forward_3.changeBeats(4) +
          UmTurnRight.changeBeats(2).skew(1.0,0.0),

          LeadLeft.changeBeats(3).scale(0.5,2.0) +
          ExtendRight.changeBeats(3).scale(1.0,0.5)
      ]),

    AnimatedCall('Explode the Diamond',
      formation:Formations.DiamondsLHGirlPoints,
      from:'Left-Hand Diamonds',
      paths:[
          LeadLeft.changeBeats(3).scale(0.5,2.0) +
          ExtendRight.changeBeats(3).scale(3.0,0.5),

          RunLeft.changeBeats(6).scale(2.0,3.0),

          LeadRight.changeBeats(3).scale(1.5,2.0) +
          ExtendRight.changeBeats(3).scale(1.0,0.5),

          Forward_3.changeBeats(4) +
          UmTurnLeft.changeBeats(2).skew(1.0,0.0)
      ]),

    AnimatedCall('Explode the Diamond',
      formation:Formations.n34Tag,
      from:'3/4 Tag',
      paths:[
          FlipLeft,

          RunRight,

          LeadRight.changeBeats(3).scale(1.5,2.0) +
          ExtendRight.changeBeats(3).scale(2.0,0.5),

          LeadLeft.changeBeats(3).scale(0.5,1.0) +
          ExtendRight.changeBeats(3).scale(1.0,0.5)
      ]),
  ];


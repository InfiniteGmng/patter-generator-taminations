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

import '../../common_dart.dart';
import '../../formation.dart';
import '../../formations.dart';
import '../../moves.dart';
import '../../animated_call.dart';

  final List<AnimatedCall> RipOff = [ 

    AnimatedCall('Rip Off',
      formation:Formations.BoxRH,
      from:'Right-Hand Box',
      paths:[
          Forward_4,

          RunRight.changeBeats(4)
      ]),

    AnimatedCall('Rip Off',
      formation:Formations.BoxLH,
      from:'Left-Hand Box',
      paths:[
          RunRight.skew(-2.0,0.0) +
          RunRight.skew(2.0,0.0),

          DodgeLeft.changeBeats(6)
      ]),

    AnimatedCall('Rip Off',
      formation:Formations.FacingCouplesCompact,
      from:'Facing Couples',
      paths:[
          Forward_3,

          DodgeLeft
      ]),

    AnimatedCall('Rip Off',
      formation:Formations.CouplesFacingOut,
      from:'Couples Facing Out',
      paths:[
          RunRight.skew(-2.0,0.0) +
          RunRight.skew(2.0,0.0),

          RunRight.changeBeats(6)
      ]),

    AnimatedCall('Rip Off',
      formation:Formations.CompletedDoublePassThru,
      from:'Completed Double Pass Thru',
      paths:[
          RunRight.skew(-1.0,0.0) +
          RunRight.skew(1.0,0.0),

          RunRight.changeBeats(6),

          DodgeLeft.changeBeats(6),

          Forward_2.changeBeats(6)
      ]),

    AnimatedCall('Rip Off',
      formation:Formation('', [
        DancerModel.fromData(gender:Gender.BOY,x:3,y:1,angle:0),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:1,angle:180),
        DancerModel.fromData(gender:Gender.BOY,x:1,y:-1,angle:0),
        DancerModel.fromData(gender:Gender.GIRL,x:3,y:-1,angle:180),
  ]),
      from:'Magic Columns',
      paths:[
          RunRight.changeBeats(6),

          RunRight.skew(-1.0,0.0) +
          RunRight.skew(1.0,0.0),

          DodgeLeft.changeBeats(6),

          Forward_2.changeBeats(6)
      ]),

    AnimatedCall('Mirror Rip Off',
      formation:Formations.CompletedDoublePassThru,
      from:'Completed Double Pass Thru',
      paths:[
          RunLeft.changeBeats(6),

          RunLeft.skew(-1.0,0.0) +
          RunLeft.skew(1.0,0.0),

          Forward_2.changeBeats(6),

          DodgeRight.changeBeats(6)
      ]),

    AnimatedCall('Mirror Rip Off',
      formation:Formation('', [
        DancerModel.fromData(gender:Gender.BOY,x:3,y:1,angle:0),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:1,angle:180),
        DancerModel.fromData(gender:Gender.BOY,x:1,y:-1,angle:0),
        DancerModel.fromData(gender:Gender.GIRL,x:3,y:-1,angle:180),
  ]),
      from:'Magic Columns',
      paths:[
          RunLeft.skew(-1.0,0.0) +
          RunLeft.skew(1.0,0.0),

          RunLeft.changeBeats(6).scale(0.5,1.0),

          Forward_2.changeBeats(6),

          DodgeRight.changeBeats(6)
      ]),
  ];


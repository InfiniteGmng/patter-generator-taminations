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
import '../../moves.dart';

  final List<AnimatedCall> WindTheBobbin = [

    AnimatedCall('Wind the Bobbin',
      formation:Formation('', dancers:[
        DancerModel.fromData(gender:Gender.GIRL,x:-1,y:3,angle:90),
        DancerModel.fromData(gender:Gender.BOY,x:-1,y:1,angle:90),
        DancerModel.fromData(gender:Gender.GIRL,x:-1,y:-1,angle:90),
        DancerModel.fromData(gender:Gender.BOY,x:-1,y:-3,angle:90),
  ]),
      from:'Right-Hand Columns',fractions:'1;4.5;3',
      paths:[
          RunLeft.skew(-1.0,0.0) +
          Forward_4 +
          RunLeft.changeBeats(6).scale(2.0,3.0),

          Forward +
          CastRight +
          SwingLeft +
          CastRight,

          RunLeft.skew(-1.0,0.0) +
          RunLeft.changeBeats(6).scale(2.0,3.0) +
          Forward_4,

          Forward +
          CastRight +
          Stand.changeBeats(3) +
          CastRight
      ]),

    AnimatedCall('Wind the Bobbin',
      formation:Formation('Column LH GBGB'),
      from:'Left-Hand Columns',fractions:'1;4.5;3',
      paths:[
          Forward +
          CastLeft +
          Stand.changeBeats(3) +
          CastLeft,

          RunRight.skew(-1.0,0.0) +
          RunRight.changeBeats(6).scale(2.0,3.0) +
          Forward_4,

          Forward +
          CastLeft +
          SwingRight +
          CastLeft,

          RunRight.skew(-1.0,0.0) +
          Forward_4 +
          RunRight.changeBeats(6).scale(2.0,3.0)
      ]),
  ];


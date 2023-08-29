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
import '../../moves.dart';

  final List<AnimatedCall> Boomerang = [

    AnimatedCall('Boomerang',
      formation:Formation('', dancers:[
        DancerModel.fromData(gender:Gender.BOY,x:1,y:2,angle:270),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:-2,angle:270),
  ]),
      from:'Right-Hand Box',fractions:'3',
      paths:[
          ExtendRight.changeBeats(1.5).scale(2.0,0.25) +
          SwingRight.scale(0.75,0.75) +
          ExtendLeft.changeBeats(1.5).scale(2.0,0.25),

          RunLeft.skew(-2.0,0.0) +
          RunLeft.skew(2.0,0.0)
      ]),

    AnimatedCall('Boomerang',
      formation:Formation('Box LH'),
      from:'Left-Hand Box',fractions:'3',
      paths:[
          RunRight.skew(-2.0,0.0) +
          RunRight.skew(2.0,0.0),

          ExtendLeft.changeBeats(1.5).scale(2.0,0.25) +
          SwingLeft.scale(0.75,0.75) +
          ExtendRight.changeBeats(1.5).scale(2.0,0.25)
      ]),

    AnimatedCall('Boomerang',
      formation:Formation('', dancers:[
        DancerModel.fromData(gender:Gender.BOY,x:1,y:1,angle:0),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:-1,angle:90),
  ]),
      from:'T-Bone Box',fractions:'3',
      paths:[
          RunLeft.skew(-1.0,0.0) +
          RunLeft.skew(1.0,0.0),

          ExtendLeft.changeBeats(1.5).scale(1.0,0.25) +
          SwingLeft.scale(0.75,0.75) +
          ExtendRight.changeBeats(1.5).scale(1.0,0.25)
      ]),

    AnimatedCall('Boomerang',
      formation:Formation('Completed Double Pass Thru'),
      from:'Completed Double Pass Thru',
      paths:[
          RunRight.changeBeats(3).skew(-1.0,0.0) +
          RunRight.changeBeats(3).skew(1.0,0.0),

          RunLeft.changeBeats(3).skew(-1.0,0.0) +
          RunLeft.changeBeats(3).skew(1.0,0.0),

          Forward_2.changeBeats(3).changehands(Hands.LEFT) +
          FlipLeft,

          Forward_2.changeBeats(3).changehands(Hands.RIGHT) +
          RunRight
      ]),

    AnimatedCall('Couples Twosome Boomerang',
      formation:Formation('Two-Faced Lines RH'),
      group:' ',
      paths:[
          ExtendRight.changeBeats(1.5).scale(2.0,1.5) +
          RunRight.scale(0.5,1.0) +
          ExtendLeft.changeBeats(1.5).scale(2.0,0.5),

          ExtendRight.changeBeats(1.5).scale(2.0,0.5) +
          RunRight.scale(0.5,1.0) +
          ExtendLeft.changeBeats(1.5).scale(2.0,1.5),

          RunLeft.skew(-2.0,0.0) +
          RunLeft.skew(2.0,0.0),

          RunLeft.skew(-2.0,0.0) +
          RunLeft.skew(2.0,0.0)
      ]),

    AnimatedCall('Tandem Twosome Boomerang',
      formation:Formation('Column RH GBGB'),
      group:' ',fractions:'3',
      paths:[
          RunLeft.skew(-2.0,0.0) +
          RunLeft.skew(2.0,0.0),

          RunLeft.skew(-2.0,0.0) +
          RunLeft.skew(2.0,0.0),

          ExtendRight.changeBeats(1.5).scale(2.5,0.25) +
          RunRight.scale(0.75,0.75) +
          ExtendLeft.changeBeats(1.5).scale(2.5,0.25),

          ExtendRight.changeBeats(1.5).scale(3.0,0.25) +
          RunRight.scale(0.5,0.75) +
          ExtendLeft.changeBeats(1.5).scale(3.0,0.25)
      ]),
  ];


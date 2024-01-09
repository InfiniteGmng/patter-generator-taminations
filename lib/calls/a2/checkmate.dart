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

import '../../animated_call.dart';
import '../../common_dart.dart';
import '../../moves.dart';

  final List<AnimatedCall> Checkmate = [

    AnimatedCall('Checkmate',
      formation:Formation('', dancers:[
        DancerModel.fromData(gender:Gender.GIRL,x:-1,y:3,angle:90),
        DancerModel.fromData(gender:Gender.BOY,x:-1,y:1,angle:90),
        DancerModel.fromData(gender:Gender.GIRL,x:-1,y:-1,angle:90),
        DancerModel.fromData(gender:Gender.BOY,x:-1,y:-3,angle:90),
  ]),
      from:'Right-Hand Columns',
      paths:[
          FlipRight.changeBeats(2).scale(1.0,1.5) +
          Forward_5 +
          QuarterRight.skew(1.0,0.0),

          Forward_2 +
          FlipRight.changeBeats(2).scale(1.0,1.5) +
          Forward_3 +
          QuarterRight.skew(1.0,0.0),

          Forward_3 +
          LeadRight.changeBeats(3) +
          Forward_2.changehands(Hands.RIGHT),

          Forward_3 +
          LeadRight.changeBeats(3) +
          Forward_2.changehands(Hands.LEFT)
      ]),

    AnimatedCall('Checkmate',
      formation:Formation('', dancers:[
        DancerModel.fromData(gender:Gender.BOY,x:1,y:-3,angle:90),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:-1,angle:90),
        DancerModel.fromData(gender:Gender.BOY,x:1,y:1,angle:90),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:3,angle:90),
  ]),
      from:'Left-Hand Columns',
      paths:[
          Forward_3 +
          LeadLeft.changeBeats(3) +
          Forward_2.changehands(Hands.RIGHT),

          Forward_3 +
          LeadLeft.changeBeats(3) +
          Forward_2.changehands(Hands.LEFT),

          Forward_2 +
          FlipLeft.changeBeats(2).scale(1.0,1.5) +
          Forward_3 +
          QuarterLeft.skew(1.0,0.0),

          FlipLeft.changeBeats(2).scale(1.0,1.5) +
          Forward_5 +
          QuarterLeft.skew(1.0,0.0)
      ]),

    AnimatedCall('Checkmate',
      formation:Formation('', dancers:[
        DancerModel.fromData(gender:Gender.BOY,x:1,y:3,angle:270),
        DancerModel.fromData(gender:Gender.GIRL,x:-1,y:3,angle:270),
        DancerModel.fromData(gender:Gender.BOY,x:1,y:1,angle:270),
        DancerModel.fromData(gender:Gender.GIRL,x:-1,y:1,angle:270),
  ]),
      from:'Double Pass Thru',
      taminator: '''
      According to the definition, the last part is Couples Circulate.
      But most dancers do a All 8 Circulate as shown here.
    ''',
      paths:[
          ExtendLeft.scale(1.0,0.5) +
          Forward_2 +
          LeadRight.scale(1.5,1.5) +
          ExtendRight.changeBeats(2).scale(2.0,0.5),

          ExtendLeft.scale(1.0,0.5) +
          Forward_2 +
          LeadLeft.scale(0.5,0.5) +
          ExtendRight.changeBeats(2).scale(2.0,0.5),

          ExtendLeft.scale(1.0,0.5) +
          Forward_2 +
          LeadRight.scale(1.5,1.5) +
          ExtendRight.changeBeats(2).scale(2.0,0.5),

          ExtendLeft.scale(1.0,0.5) +
          Forward_2 +
          LeadLeft.scale(0.5,0.5) +
          ExtendRight.changeBeats(2).scale(2.0,0.5)
      ]),

    AnimatedCall('Checkmate',
      formation:Formation('', dancers:[
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:3,angle:90),
        DancerModel.fromData(gender:Gender.BOY,x:-1,y:3,angle:90),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:1,angle:90),
        DancerModel.fromData(gender:Gender.BOY,x:-1,y:1,angle:90),
  ]),
      from:'Completed Double Pass Thru',
      paths:[
          RunLeft.changeBeats(2).scale(0.5,0.5) +
          ExtendRight.changeBeats(4).scale(5.0,2.0) +
          QuarterLeft.skew(1.0,0.0),

          RunRight.changeBeats(5).scale(2.0,2.0) +
          Forward_5.changeBeats(3) +
          LeadRight,

          Forward_2.changeBeats(2) +
          RunLeft.changeBeats(3).skew(-1.0,0.0) +
          LeadLeft.changeBeats(3).skew(2.0,-2.0),

          Forward_2.changeBeats(1.5) +
          RunRight.changeBeats(4.5).scale(2.0,2.0) +
          Forward_3 +
          LeadRight
      ]),
  ];


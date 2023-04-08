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

  final List<AnimatedCall> Reactivate = [ 

    AnimatedCall('Reactivate',
      formation:Formation('', [
        DancerModel.fromData(gender:Gender.GIRL,x:3,y:-1,angle:180),
        DancerModel.fromData(gender:Gender.BOY,x:3,y:1,angle:180),
        DancerModel.fromData(gender:Gender.BOY,x:0,y:3,angle:0),
        DancerModel.fromData(gender:Gender.GIRL,x:0,y:1,angle:180),
  ]),
      from:'Quarter Tag',fractions:'3;3',
      paths:[
          ExtendLeft.changeBeats(1.5).scale(1.5,0.5) +
          ExtendRight.changeBeats(1.5).scale(1.5,0.5) +
          SwingRight.scale(0.5,1.0) +
          ExtendLeft.changeBeats(3).scale(2.0,2.0),

          Forward.changeBeats(3) +
          SwingLeft.scale(0.5,1.0),

          LeadRight.changeBeats(6).scale(4.0,3.0) +
          LeadRight.changeBeats(3).scale(3.0,2.0),

          ExtendLeft.changeBeats(2).scale(1.5,0.5) +
          ExtendRight.changeBeats(1).scale(0.5,0.5) +
          SwingLeft.scale(0.5,1.0)
      ]),

    AnimatedCall('Reactivate',
      formation:Formations.QuarterTagLH,
      from:'Left-Hand Quarter Tag',fractions:'3;3',
      paths:[
          Forward.changeBeats(3) +
          SwingRight.scale(0.5,1.0),

          ExtendLeft.changeBeats(1.5).scale(1.5,0.5) +
          ExtendRight.changeBeats(1.5).scale(1.5,0.5) +
          SwingLeft.scale(0.5,1.0) +
          ExtendRight.changeBeats(3).scale(2.0,2.0),

          LeadLeft.changeBeats(6).scale(4.0,3.0) +
          LeadLeft.changeBeats(3).scale(3.0,2.0),

          ExtendLeft.changeBeats(2).scale(1.5,0.5) +
          ExtendRight.changeBeats(1).scale(0.5,0.5) +
          SwingRight.scale(0.5,1.0)
      ]),

    AnimatedCall('Reactivate',
      formation:Formations.QuarterLinesRH,
      from:'Quarter Lines',fractions:'3;3',
      paths:[
          Forward.changeBeats(3) +
          SwingRight.scale(0.5,1.0),

          ExtendLeft.changeBeats(1.5).scale(1.5,0.5) +
          ExtendRight.changeBeats(1.5).scale(1.5,0.5) +
          SwingLeft.scale(0.5,1.0) +
          ExtendRight.changeBeats(3).scale(2.0,2.0),

          ExtendLeft.changeBeats(2).scale(1.5,0.5) +
          ExtendRight.changeBeats(1).scale(0.5,0.5) +
          SwingRight.scale(0.5,1.0),

          LeadRight.changeBeats(4).scale(4.0,3.0) +
          LeadRight.changeBeats(5).scale(5.0,2.0)
      ]),

    AnimatedCall('Reactivate',
      formation:Formations.MixedQuarterTag1,
      from:'Quarter Waves',fractions:'3;3',
      paths:[
          ExtendLeft.changeBeats(1.5).scale(1.5,0.5) +
          ExtendRight.changeBeats(1.5).scale(1.5,0.5) +
          SwingRight.scale(0.5,1.0) +
          ExtendLeft.changeBeats(3).scale(2.0,2.0),

          Stand.changeBeats(3) +
          RunRight.skew(-1.0,0.0),

          LeadRight.changeBeats(6).scale(4.0,3.0) +
          LeadRight.changeBeats(3).scale(3.0,2.0),

          ExtendLeft.changeBeats(2).scale(1.5,0.5) +
          ExtendRight.changeBeats(1).scale(0.5,0.5) +
          FlipLeft.scale(0.5,1.0)
      ]),

    AnimatedCall('Cross Reactivate',
      formation:Formations.QuarterTag,
      from:'Quarter Tag',
      paths:[
          Forward.changeBeats(3) +
          SwingRight.scale(0.5,1.0),

          ExtendLeft.changeBeats(2).scale(2.0,2.0) +
          Forward +
          SwingRight.scale(0.5,1.0) +
          ExtendLeft.changeBeats(3).scale(2.0,2.0),

          LeadRight.changeBeats(6).scale(4.0,3.0) +
          LeadRight.changeBeats(3).scale(3.0,2.0),

          ExtendLeft.changeBeats(3).scale(2.0,2.0) +
          SwingRight.scale(0.5,1.0)
      ]),
  ];


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

  final List<AnimatedCall> Cloverleaf = [

    AnimatedCall('Cloverleaf',
      formation:Formations.CouplesFacingOut,
      from:'Couples Facing Out',isExact:true,
      paths:[
          LeadRight +
          LeadRight +
          LeadRight,

          LeadLeft +
          LeadLeft +
          LeadLeft
      ]),

    AnimatedCall('Cloverleaf',
      formation:Formations.CompletedDoublePassThru,
      from:'Completed Double Pass Thru',
      paths:[
          LeadRight +
          LeadRight.changeBeats(2).scale(1.5,1.5) +
          LeadRight.changeBeats(2).scale(1.5,1.5) +
          Forward,

          LeadLeft +
          LeadLeft.changeBeats(2).scale(1.5,1.5) +
          LeadLeft.changeBeats(2).scale(1.5,1.5) +
          Forward,

          Forward_2 +
          LeadRight +
          LeadRight.scale(1.5,1.5) +
          LeadRight.scale(1.5,0.5),

          Forward_2 +
          LeadLeft +
          LeadLeft.scale(1.5,1.5) +
          LeadLeft.scale(1.5,0.5)
      ]),

    AnimatedCall('Cloverleaf',
      formation:Formations.TradeBy,
      from:'Trade By',
      paths:[
          LeadRight +
          LeadRight.changeBeats(2).scale(2.0,1.5) +
          LeadRight.changeBeats(2).scale(1.5,1.0),

          LeadLeft +
          LeadLeft.changeBeats(2).scale(2.0,1.5) +
          LeadLeft.changeBeats(2).scale(1.5,1.0),

          Path(),

          Path()
      ]),

    AnimatedCall('Cloverleaf',
      formation:Formations.n34Tag,
      from:'3/4 Tag',
      paths:[
          LeadRight.changeBeats(2).scale(1.0,2.0) +
          LeadRight.changeBeats(2).scale(2.0,1.5) +
          LeadRight.changeBeats(2).scale(1.5,1.0),

          LeadLeft.changeBeats(2).scale(1.0,2.0) +
          LeadLeft.changeBeats(2).scale(2.0,1.5) +
          LeadLeft.changeBeats(2).scale(1.5,1.0),

          Stand.changeBeats(6).changehands(2).skew(0.0,-0.5),

          Stand.changeBeats(6).changehands(3).skew(0.0,0.25)
      ]),

    AnimatedCall('Cloverleaf',
      formation:Formation('', [
        DancerModel.fromData(gender:Gender.BOY,x:1,y:1,angle:0),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:-1,angle:0),
        DancerModel.fromData(gender:Gender.BOY,x:-1,y:-3,angle:90),
        DancerModel.fromData(gender:Gender.GIRL,x:1,y:-3,angle:90),
  ]),
      from:'After Heads Pass Thru',
      paths:[
          LeadLeft.changeBeats(2).scale(2.0,1.0) +
          LeadLeft.scale(2.0,1.0) +
          LeadLeft,

          LeadRight.changeBeats(2).scale(2.0,1.0) +
          LeadRight.scale(2.0,1.0) +
          LeadRight,

          Forward_2.changeBeats(3).changehands(2),

          Forward_2.changeBeats(3).changehands(1)
      ]),
  ];


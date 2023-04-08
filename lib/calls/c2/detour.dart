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

  final List<AnimatedCall> Detour = [

    AnimatedCall('Detour',
      formation:Formations.OceanWavesRHBGGB,
      from:'Right-Hand Waves',
      paths:[
          Forward_2 +
          QuarterLeft.changehands(1).skew(1.0,0.0),

          CounterRotateLeft_0_2.changeBeats(3.5).changehands(1).skew(-1.0,0.0),

          CounterRotateLeft_2_0.changeBeats(3.5).changehands(1).skew(1.0,0.0),

          RunLeft.changeBeats(2).skew(-2.0,-1.0) +
          HingeLeft
      ]),

    AnimatedCall('Detour',
      formation:Formations.TwomFacedLinesRH,
      from:'Right-Hand Two-Faced Lines',
      paths:[
          Forward_2 +
          QuarterLeft.changehands(1).skew(1.0,0.0),

          CounterRotateRight_2_0.changeBeats(3.5).changehands(2).skew(1.0,0.0),

          CounterRotateRight_0_m2.changeBeats(3.5).changehands(2).skew(-1.0,0.0),

          RunLeft.changeBeats(2).skew(-2.0,-1.0) +
          HingeLeft
      ]),

    AnimatedCall('Detour',
      formation:Formations.OceanWavesLHBGGB,
      from:'Left-Hand Waves',
      paths:[
          RunRight.changeBeats(2).skew(-2.0,1.0) +
          HingeRight,

          CounterRotateRight_2_0.changeBeats(3.5).changehands(2).skew(1.0,0.0),

          CounterRotateRight_0_m2.changeBeats(3.5).changehands(2).skew(-1.0,0.0),

          Forward_2 +
          QuarterRight.changehands(2).skew(1.0,0.0)
      ]),

    AnimatedCall('Detour',
      formation:Formations.TwomFacedLinesLH,
      from:'Left-Hand Two-Faced Lines',
      paths:[
          RunRight.changeBeats(2).skew(-2.0,1.0) +
          HingeRight,

          CounterRotateLeft_0_2.changeBeats(3.5).changehands(1).skew(-1.0,0.0),

          CounterRotateLeft_2_0.changeBeats(3.5).changehands(1).skew(1.0,0.0),

          Forward_2 +
          QuarterRight.changehands(2).skew(1.0,0.0)
      ]),

    AnimatedCall('Detour',
      formation:Formations.DiamondsRHGirlPoints,
      from:'Right-Hand Diamonds',
      paths:[
          LeadRight.changeBeats(3).scale(2.0,3.0),

          Forward_2.changeBeats(3) +
          HingeLeft.scale(1.0,0.5),

          HingeLeft.changeBeats(3).scale(0.75,1.0),

          RunLeft.scale(1.0,0.5).skew(-2.0,0.0) +
          HingeLeft.scale(1.0,0.5)
      ]),

    AnimatedCall('Detour',
      formation:Formations.DiamondsLHGirlPoints,
      from:'Left-Hand Diamonds',
      paths:[
          LeadLeft.changeBeats(3).scale(2.0,3.0),

          RunRight.scale(1.0,0.5).skew(-2.0,0.0) +
          HingeRight.scale(1.0,0.5),

          HingeRight.changeBeats(3).scale(0.75,1.0),

          Forward_2.changeBeats(3) +
          HingeRight.scale(1.0,0.5)
      ]),

    AnimatedCall('Detour',
      formation:Formations.TmBoneURRD,
      from:'T-Bones 1',
      paths:[
          Forward.changeBeats(3) +
          HingeLeft.skew(0.0,-1.0),

          CounterRotateLeft_2_0.changeBeats(3).changehands(1),

          CounterRotateLeft_0_2.changeBeats(3).changehands(1),

          RunLeft.scale(1.0,0.5).skew(-1.0,0.0) +
          HingeLeft
      ]),

    AnimatedCall('Detour',
      formation:Formations.TmBoneDRRU,
      from:'T-Bones 2',
      paths:[
          RunRight.scale(1.0,0.5).skew(-1.0,0.0) +
          HingeRight,

          CounterRotateLeft_2_0.changeBeats(3).changehands(1),

          CounterRotateLeft_0_2.changeBeats(3).changehands(1),

          Forward.changeBeats(3) +
          HingeRight.skew(0.0,1.0)
      ]),
  ];


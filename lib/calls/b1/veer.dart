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

  final List<AnimatedCall> Veer = [

    AnimatedCall('Veer Left',
      formation:Formations.FacingCouplesCompact,
      from:'Facing Couples',difficulty: 1,
      paths:[
          ExtendLeft.changeBeats(2).changehands(2).scale(1.5,2.0),

          ExtendLeft.changeBeats(2).changehands(1).scale(1.5,2.0)
      ]),

    AnimatedCall('Veer Left',
      formation:Formations.TwomFacedLineLH,
      from:'Left-Hand Two-Faced Line',difficulty: 1,
      paths:[
          ExtendLeft.changeBeats(2).changehands(2).scale(2.0,2.0),

          ExtendLeft.changeBeats(2).changehands(1).scale(2.0,2.0)
      ]),

    AnimatedCall('Veer Left',
      formation:Formations.EightChainThru,
      from:'Eight Chain Thru',difficulty: 1,
      paths:[
          ExtendLeft.changeBeats(2).changehands(6).scale(1.0,2.0),

          ExtendLeft.changeBeats(2).changehands(5).scale(1.0,2.0),

          ExtendLeft.changeBeats(2).changehands(6).scale(1.0,2.0),

          ExtendLeft.changeBeats(2).changehands(5).scale(1.0,2.0)
      ]),

    AnimatedCall('Veer Left',
      formation:Formations.TwomFacedLinesLH,
      from:'Two-Faced Lines',difficulty: 1,
      paths:[
          ExtendLeft.changeBeats(2).changehands(5).scale(1.0,2.0),

          ExtendLeft.changeBeats(2).changehands(6).scale(1.0,2.0),

          ExtendLeft.changeBeats(2).changehands(6).scale(1.0,2.0),

          ExtendLeft.changeBeats(2).changehands(5).scale(1.0,2.0)
      ]),

    AnimatedCall('Veer Left',
      formation:Formations.TwomFacedTidalLineLH,
      from:'Two-Faced Tidal Line',difficulty: 2,
      paths:[
          ExtendLeft.changeBeats(2).changehands(5).scale(2.0,0.5),

          ExtendLeft.changeBeats(2).changehands(6).scale(2.0,1.5),

          ExtendLeft.changeBeats(2).changehands(6).scale(2.0,1.5),

          ExtendLeft.changeBeats(2).changehands(5).scale(2.0,0.5)
      ]),

    AnimatedCall('Veer Left',
      formation:Formations.NormalLines,
      from:'Normal Lines',difficulty: 2,
      paths:[
          ExtendLeft.changeBeats(2).changehands(2).scale(2.0,0.5),

          ExtendLeft.changeBeats(2).changehands(1).scale(2.0,1.5),

          ExtendLeft.changeBeats(2).changehands(2).scale(2.0,0.5),

          ExtendLeft.changeBeats(2).changehands(1).scale(2.0,1.5)
      ]),

    AnimatedCall('Veer Right',
      formation:Formations.FacingCouplesCompact,
      from:'Facing Couples',difficulty: 1,
      paths:[
          ExtendRight.changeBeats(2).changehands(2).scale(1.5,2.0),

          ExtendRight.changeBeats(2).changehands(1).scale(1.5,2.0)
      ]),

    AnimatedCall('Veer Right',
      formation:Formations.TwomFacedLineRH,
      from:'Right-Hand Two-Faced Line',difficulty: 1,
      paths:[
          ExtendRight.changeBeats(2).changehands(2).scale(2.0,2.0),

          ExtendRight.changeBeats(2).changehands(1).scale(2.0,2.0)
      ]),

    AnimatedCall('Veer Right',
      formation:Formations.EightChainThru,
      from:'Eight Chain Thru',difficulty: 1,
      paths:[
          ExtendRight.changeBeats(2).changehands(6).scale(1.0,2.0),

          ExtendRight.changeBeats(2).changehands(5).scale(1.0,2.0),

          ExtendRight.changeBeats(2).changehands(6).scale(1.0,2.0),

          ExtendRight.changeBeats(2).changehands(5).scale(1.0,2.0)
      ]),

    AnimatedCall('Veer Right',
      formation:Formations.TwomFacedLinesRH,
      from:'Two-Faced Lines',difficulty: 1,
      paths:[
          ExtendRight.changeBeats(2).changehands(6).scale(1.0,2.0),

          ExtendRight.changeBeats(2).changehands(5).scale(1.0,2.0),

          ExtendRight.changeBeats(2).changehands(5).scale(1.0,2.0),

          ExtendRight.changeBeats(2).changehands(6).scale(1.0,2.0)
      ]),

    AnimatedCall('Veer Right',
      formation:Formations.TwomFacedTidalLineRH,
      from:'Tidal Two-Faced Line',difficulty: 2,
      paths:[
          ExtendRight.changeBeats(2).changehands(6).scale(2.0,0.5),

          ExtendRight.changeBeats(2).changehands(5).scale(2.0,1.5),

          ExtendRight.changeBeats(2).changehands(5).scale(2.0,1.5),

          ExtendRight.changeBeats(2).changehands(6).scale(2.0,0.5)
      ]),

    AnimatedCall('Veer Right',
      formation:Formations.NormalLines,
      from:'Normal Lines',difficulty: 2,
      paths:[
          ExtendRight.changeBeats(2).changehands(2).scale(2.0,1.5),

          ExtendRight.changeBeats(2).changehands(1).scale(2.0,0.5),

          ExtendRight.changeBeats(2).changehands(2).scale(2.0,1.5),

          ExtendRight.changeBeats(2).changehands(1).scale(2.0,0.5)
      ]),
  ];


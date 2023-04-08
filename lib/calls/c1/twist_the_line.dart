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

  final List<AnimatedCall> TwistTheLine = [

    AnimatedCall('Twist the Line',
      formation:Formations.NormalLines,
      from:'Normal Lines',isGenderSpecific:true,
      paths:[
          QuarterRight.changeBeats(3).skew(-0.5,-3.0) +
          LeadRight.changeBeats(1).scale(1.0,0.5),

          RunRight.changeBeats(4).skew(1.0,0.0),

          FlipLeft.changeBeats(4).skew(1.0,0.0),

          QuarterLeft.changeBeats(3).skew(-1.5,3.0) +
          QuarterLeft.changeBeats(1).skew(1.0,-0.5)
      ]),

    AnimatedCall('Twist the Line',
      formation:Formations.LinesFacingOut,
      from:'Lines Facing Out',isGenderSpecific:true,
      paths:[
          QuarterLeft.changeBeats(3).skew(-1.5,3.0) +
          QuarterLeft.changeBeats(1).skew(1.0,-0.5),

          FlipLeft.changeBeats(4).skew(1.0,0.0),

          RunRight.changeBeats(4).skew(1.0,0.0),

          QuarterRight.changeBeats(3).skew(-0.5,-3.0) +
          LeadRight.changeBeats(1).scale(1.0,0.5)
      ]),

    AnimatedCall('Twist the Line',
      formation:Formations.TidalLineRH,
      from:'Tidal Line',isGenderSpecific:true,
      paths:[
          QuarterRight.changeBeats(2).skew(0.5,-1.5) +
          LeadRight.changeBeats(2).scale(1.0,0.5),

          Forward +
          RunRight.changeBeats(4).skew(2.0,0.5),

          Forward +
          FlipLeft.changeBeats(4).skew(2.0,-0.5),

          QuarterLeft.changeBeats(2).skew(-0.5,1.5) +
          QuarterLeft.changeBeats(2).skew(1.0,-0.5)
      ]),

    AnimatedCall('Twist And',
      formation:Formations.LinesFacingOut,
      from:'Lines Facing Out',
      paths:[
          QuarterLeft.changeBeats(3).skew(-1.0,2.0),

          FlipLeft.skew(1.0,0.0),

          RunRight.skew(1.0,0.0),

          QuarterRight.changeBeats(3).skew(-1.0,-2.0)
      ]),

    AnimatedCall('Twist And',
      formation:Formations.NormalLines,
      from:'Lines Facing In',
      paths:[
          QuarterRight.changeBeats(3).skew(-1.0,-2.0),

          RunRight.skew(1.0,0.0),

          FlipLeft.skew(1.0,0.0),

          QuarterLeft.changeBeats(3).skew(-1.0,2.0)
      ]),

    AnimatedCall('Twist And',
      formation:Formations.InvertedLinesEndsFacingOut,
      from:'Inverted Lines Ends Facing Out',
      paths:[
          LeadLeft.changeBeats(3).scale(1.0,2.0),

          RunRight.skew(1.0,0.0),

          FlipLeft.skew(1.0,0.0),

          LeadRight.changeBeats(3).scale(1.0,2.0)
      ]),

    AnimatedCall('Twist And',
      formation:Formations.InvertedLinesEndsFacingIn,
      from:'Inverted Lines Ends Facing In',
      paths:[
          LeadRight.changeBeats(3).scale(1.0,2.0),

          FlipLeft.skew(1.0,0.0),

          RunRight.skew(1.0,0.0),

          LeadLeft.changeBeats(3).scale(1.0,2.0)
      ]),

    AnimatedCall('Twist And',
      formation:Formations.n3and_1lines1,
      from:'3 and 1 Lines #1',
      paths:[
          LeadLeft.changeBeats(3).scale(1.0,2.0),

          RunRight.skew(1.0,0.0),

          FlipLeft.skew(1.0,0.0),

          QuarterLeft.changeBeats(3).skew(-1.0,2.0)
      ]),

    AnimatedCall('Twist And',
      formation:Formations.n3and_1lines4,
      from:'3 and 1 Lines #4',
      paths:[
          QuarterRight.changeBeats(3).skew(-1.0,-2.0),

          RunRight.skew(1.0,0.0),

          FlipLeft.skew(1.0,0.0),

          LeadRight.changeBeats(3).scale(1.0,2.0)
      ]),

    AnimatedCall('Twist And',
      formation:Formations.n3and_1lines5,
      from:'3 and 1 Lines #5',
      paths:[
          LeadRight.changeBeats(3).scale(1.0,2.0),

          FlipLeft.skew(1.0,0.0),

          RunRight.skew(1.0,0.0),

          QuarterRight.changeBeats(3).skew(-1.0,-2.0)
      ]),

    AnimatedCall('Twist And',
      formation:Formations.n3and_1lines8,
      from:'3 and 1 Lines #8',
      paths:[
          QuarterLeft.changeBeats(3).skew(-1.0,2.0),

          FlipLeft.skew(1.0,0.0),

          RunRight.skew(1.0,0.0),

          LeadLeft.changeBeats(3).scale(1.0,2.0)
      ]),

    AnimatedCall('Twist And Pass Out',
      formation:Formations.LinesFacingOut,
      from:'Lines Facing Out',group:' ',
      paths:[
          QuarterLeft.changeBeats(2).skew(-1.0,2.0) +
          ExtendLeft.scale(1.0,0.5) +
          LeadRight.changeBeats(1).scale(1.0,0.5),

          FlipLeft.skew(1.0,0.0),

          RunRight.skew(1.0,0.0),

          QuarterRight.changeBeats(2).skew(-1.0,-2.0) +
          ExtendLeft.scale(1.0,0.5) +
          QuarterLeft.skew(1.0,-0.5)
      ]),

    AnimatedCall('Twist And Split Square Thru 2',
      formation:Formations.LinesFacingOut,
      from:'Lines Facing Out',group:' ',
      paths:[
          QuarterLeft.changeBeats(2).skew(-1.0,2.0) +
          ExtendLeft.scale(1.0,0.5) +
          LeadRight.scale(0.5,1.5) +
          ExtendLeft.scale(1.0,0.5),

          FlipLeft.skew(1.0,0.0) +
          ExtendRight.changeBeats(1.5).scale(1.0,0.5) +
          ExtendLeft.scale(1.0,0.5),

          RunRight.skew(1.0,0.0) +
          ExtendRight.changeBeats(1.5).scale(1.0,0.5) +
          ExtendLeft.scale(1.0,0.5),

          QuarterRight.changeBeats(2).skew(-1.0,-2.0) +
          ExtendLeft.scale(1.0,0.5) +
          LeadLeft.scale(1.5,0.5) +
          ExtendLeft.scale(1.0,0.5)
      ]),

    AnimatedCall('Twist And Square Thru 2',
      formation:Formations.LinesFacingOut,
      from:'Lines Facing Out',group:' ',
      paths:[
          QuarterLeft.changeBeats(2).skew(-1.0,2.0) +
          ExtendLeft.scale(1.0,0.5) +
          LeadLeft.scale(1.5,0.5) +
          ExtendLeft.scale(1.0,0.5),

          FlipLeft.skew(1.0,0.0),

          RunRight.skew(1.0,0.0),

          QuarterRight.changeBeats(2).skew(-1.0,-2.0) +
          ExtendLeft.scale(1.0,0.5) +
          LeadRight.scale(0.5,1.5) +
          ExtendLeft.scale(1.0,0.5)
      ]),
  ];


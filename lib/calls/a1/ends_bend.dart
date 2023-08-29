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

  final List<AnimatedCall> EndsBend = [

    AnimatedCall('Bend',
      formation:Formation('', dancers:[
        DancerModel.fromData(gender:Gender.GIRL,x:-2,y:3,angle:180),
        DancerModel.fromData(gender:Gender.BOY,x:-2,y:-3,angle:180),
  ]),
      isPerimeter:true,noDisplay: true,
      paths:[
          LeadLeft.changeBeats(2).scale(1.0,2.0),

          LeadRight.changeBeats(2).scale(1.0,2.0)
      ]),

    AnimatedCall('Ends Bend',
      formation:Formation('Lines Facing Out'),
      from:'Lines Facing Out',actives:'Ends',notForSequencer: true,
      paths:[
          LeadLeft.changeBeats(2).scale(1.0,2.0),

          Back.changeBeats(2).changehands(Hands.LEFT),

          Back.changeBeats(2).changehands(Hands.RIGHT),

          LeadRight.changeBeats(2).scale(1.0,2.0)
      ]),

    AnimatedCall('Ends Bend',
      formation:Formation('', dancers:[
        DancerModel.fromData(gender:Gender.GIRL,x:-2,y:3,angle:180),
        DancerModel.fromData(gender:Gender.BOY,x:-2,y:1,angle:0),
        DancerModel.fromData(gender:Gender.GIRL,x:-2,y:-1,angle:0),
        DancerModel.fromData(gender:Gender.BOY,x:-2,y:-3,angle:180),
  ]),
      from:'Inverted Lines, Ends Facing Out',actives:'Ends',notForSequencer: true,
      paths:[
          LeadLeft.changeBeats(2).scale(1.0,2.0),

          Forward.changeBeats(2).changehands(Hands.RIGHT),

          Forward.changeBeats(2).changehands(Hands.LEFT),

          LeadRight.changeBeats(2).scale(1.0,2.0)
      ]),

    AnimatedCall('Ends Bend',
      formation:Formation('Normal Lines'),
      from:'Facing Lines',actives:'Ends',
      paths:[
          LeadRight.changeBeats(2).scale(1.0,2.0),

          Back.changeBeats(2),

          Back.changeBeats(2),

          LeadLeft.changeBeats(2).scale(1.0,2.0)
      ]),

    AnimatedCall('Ends Bend',
      formation:Formation('Inverted Lines Ends Facing In'),
      from:'Inverted Lines, Ends Facing In',actives:'Ends',
      paths:[
          LeadRight.changeBeats(2).scale(1.0,2.0),

          Forward.changeBeats(2),

          Forward.changeBeats(2),

          LeadLeft.changeBeats(2).scale(1.0,2.0)
      ]),
  ];


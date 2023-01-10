/*

  Taminations Square Dance Animations
  Copyright (C) 2022 Brad Christie

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

import '../common.dart';

class TagTheLine extends Action {

  @override var level = LevelData.MS;
  @override var help = '''[Left] [fraction] Tag the Line
Works with one or two Lines of 4.  A tidal formation is two Lines of 4.
For larger lines, use
Line of (6 or 8) [Left] [Half] Tag the Line
''';
  @override var helplink = 'ms/tag';
  TagTheLine(name) : super(name);

  @override
   void perform(CallContext ctx, [int i = 0]) {
    final left = name.startsWith('Left') ? 'Left' : '';
    ctx.applyCalls('$left 34tag');
    ctx.contractPaths();
    ctx.applyCalls('extend');
  }

}

class BigLineTagTheLine extends ActivesOnlyAction {

  @override var level = LevelData.MS;
  @override var help = TagTheLine('').help;
  var isLeft;
  var _minDist = 0.0;
  var _maxDist = 0.0;
  var _isHalfTag;

  static final Formation ColumnsOf3 =
  Formation('Columns of 3', [
    Dancer.fromData(number:'1',couple:'1',gender:Gender.BOY,x:-2,y:1,angle:0),
    Dancer.fromData(number:'5',couple:'3',gender:Gender.BOY,x:2,y:-1,angle:180),
    Dancer.fromData(number:'2',couple:'1',gender:Gender.GIRL,x:0,y:-1,angle:180),
    Dancer.fromData(number:'6',couple:'3',gender:Gender.GIRL,x:0,y:1,angle:0),
    Dancer.fromData(number:'3',couple:'2',gender:Gender.BOY,x:-2,y:-1,angle:180),
    Dancer.fromData(number:'7',couple:'4',gender:Gender.BOY,x:2,y:1,angle:0),
  ]);

  BigLineTagTheLine(String name) : isLeft=name.contains('Left'), super(name) ;

  @override
  void perform(CallContext ctx) {
    _isHalfTag = norm.contains('12');
    final length = norm.contains('6') ? '6' : '8';
    if (length == '6' && ctx.dancers.length > 6)
      ctx.applyCalls('Wave of 6 $name');
    else {
      _minDist = ctx.dancers.fold<double>(9.9, (prev, d) => min(prev,d.location.length));
      _maxDist = ctx.dancers.fold<double>(0.0, (prev, d) => max(prev,d.location.length));
      super.perform(ctx);
      if (ctx.dancers.length == 6 && _isHalfTag) {
        ctx.animateToEnd();
        var ctx2 = CallContext.fromFormation(ColumnsOf3);
        var mapping = ctx.matchFormations(ctx2,sexy:false,fuzzy:true,rotate:180,
            handholds:false, maxError : 3.0, delta: 0.3, maxAngle: 0.5);
        if (mapping != null)
          ctx.adjustToFormationMatch(mapping.match);
      }
    }
  }

  @override
  Path performOne(Dancer d, CallContext ctx) {
    Path p1, p2, p3;
    var skewAmount = _isHalfTag ? 1.0 : 0.5;
    if (isLeft) {
      if (d.isCenterRight)
        p1 = TamUtils.getMove('Quarter Right', skew: [-skewAmount, 0.0].v);
      else
        p1 = TamUtils.getMove('Quarter Left', skew: [skewAmount, 0.0].v);
    } else {
      if (d.isCenterRight)
        p1 = TamUtils.getMove('Quarter Right', skew: [skewAmount, 0.0].v);
      else
        p1 = TamUtils.getMove('Quarter Left', skew: [-skewAmount, 0.0].v);
    }
    var howMuch = _isHalfTag
        ? (_minDist + _maxDist) / 2.0
        : _minDist + _maxDist - 0.5;
    p2 = TamUtils.getMove('Forward', scale: [howMuch, 1.0].v, beats:howMuch);
    if (_isHalfTag)
      p3 = Path();
    else if (isLeft)
      p3 = TamUtils.getMove('Extend Left',scale: [0.5,0.5].v);
    else
      p3 = TamUtils.getMove('Extend Right',scale: [0.5,0.5].v);
    return p1 + p2 + p3;
  }

}
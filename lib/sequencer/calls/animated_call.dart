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

import 'common.dart';

class AnimatedCall {

  String title;
  String group;
  Formation formation;
  List<Path> paths;
  bool isExact;
  bool isAsymmetric;
  bool isPerimeter;
  bool isGenderSpecific;
  int difficulty;
  bool noDisplay;
  bool notForSequencer;
  String actives;
  LevelData level = LevelData.B1;
  String from;
  String parts;
  String fractions;
  List<String> numbers;
  List<String> coupleNumbers;

  AnimatedCall(this.title,
      { required Formation formation,
        required List<Path> paths,
        this.from = '',
        this.group = '',
        this.parts = '',
        this.fractions = '',
        this.difficulty = 0,
        this.actives = '',
        this.isPerimeter = false,
        this.isExact = false,
        this.isAsymmetric = false,
        this.isGenderSpecific = false,
        this.notForSequencer = false,
        this.noDisplay = false,
        this.numbers = const ['1', '5', '2', '6', '3', '7', '4', '8'],
        this.coupleNumbers = const ['1', '3', '1', '3', '2', '4', '2', '4']
      })
      : formation = formation.copy(), paths = paths.clone() {
    if (formation.asymmetric)
      isAsymmetric = true;
    if (paths.length == formation.dancers.length) {
      for (var i = 0; i < formation.dancers.length; i++)
        formation.dancers[i].path = paths[i];
    } else if (paths.length * 2 == formation.dancers.length) {
      for (var i = 0; i < formation.dancers.length; i++)
        formation.dancers[i].path = paths[i ~/ 2];
    } else
      throw ArgumentError('Animated Call length mismatch: ${paths.length} ${formation.dancers.length}.');
  }

  AnimatedCall xref({ String? title, String? group, int? difficulty }) {
    return AnimatedCall(title ?? this.title,
      formation: formation,
      paths: paths,
      from: from,
      group: group ?? this.group,
      parts: parts,
      fractions: fractions,
      difficulty: difficulty ?? this.difficulty,
      actives: actives,
      isPerimeter: isPerimeter,
      isExact: isExact,
      isAsymmetric: isAsymmetric,
      isGenderSpecific: isGenderSpecific,
      notForSequencer: notForSequencer,
      noDisplay: noDisplay,
      numbers: numbers,
      coupleNumbers: coupleNumbers
    );
  }

}
/*

  Taminations Square Dance Animations
  Copyright (C) 2020 Brad Christie

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

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart' as FM;
import 'package:flutter/services.dart' as FS;
import 'package:tuple/tuple.dart';
import '../common.dart';

class AbbreviationsModel extends FM.ChangeNotifier {

  static SharedPreferences prefs;

  static final initialAbbreviations = {
    "g" : "Girls",
    "b" : "Boys",
    "c" : "Centers",
    "e" : "Ends",
    "h" : "Heads",
    "s" : "Sides",
    "ct" : "Courtesy Turn",
    "hs" : "Half Sashay",
    "pt" : "Pass Thru",
    "al" : "Allemande Left",
    "btl" : "Bend the Line",
    "rlg" : "Right and Left Grand",
    "rlt" : "Right and Left Thru",
    "sq2" : "Square Thru 2",
    "sq3" : "Square Thru 3",
    "sq4" : "Square Thru 4",
    "dpt" : "Double Pass Thru",
    "vl" : "Veer Left",
    "vr" : "Veer Right",
    "x" : "Cross",
    "xt" : "Extend",
    "fw" : "Ferris Wheel",
    "fl" : "Flutterwheel",
    "rf" : "Reverse Flutterwheel",
    "pto" : "Pass the Ocean",
    "st" : "Swing Thru",
    "tq" : "Touch a Quarter",
    "tb" : "Trade By",
    "whd" : "Wheel and Deal",
    "wa" : "Wheel Around",
    "zo" : "Zoom",
    "c34" : "Cast Off 3/4",
    "circ" : "Circulate",
    "ci" : "Centers In",
    "cl" : "Cloverleaf",
    "dx" : "Dixie Style to a Wave",
    "ht" : "Half Tag",
    "ptc" : "Pass to the Center",
    "sb" : "Scoot Back",
    "stt" : "Spin the Top",
    "ttl" : "Tag the Line",
    "wad" : "Walk and Dodge"
  };

  List<Tuple2<String,String>> currentAbbreviations = [];
  List<bool> errors = [];

  AbbreviationsModel() {
    _load();
  }

  Future<void> _load() async {
    if (prefs == null)
      prefs = await SharedPreferences.getInstance();
    if (prefs.getString("+abbrev stored") == null) {
      for (var k in initialAbbreviations.keys)
        prefs.setString("abbrev $k",initialAbbreviations[k]);
      prefs.setString("+abbrev stored", "true");
    }
    for (var k in prefs.getKeys()) {
      if (k.startsWith("abbrev "))
        currentAbbreviations.add(
            Tuple2(k.replaceFirst("abbrev ",""),
            prefs.getString(k)));
    }
    currentAbbreviations = currentAbbreviations.sortedBy((e) => e.item1);
    currentAbbreviations.add(Tuple2("",""));
    errors = List.filled(currentAbbreviations.length,false);
  }

  void setAbbreviation(int index, String abbr) {
    print(abbr);
    currentAbbreviations[index] = currentAbbreviations[index].withItem1(abbr);
    checkForErrors();
  }

  void setExpansion(int index, String expan) {
    currentAbbreviations[index] = currentAbbreviations[index].withItem2(expan);
    checkForErrors();
  }

  void clear() {
    for (var k in prefs.getKeys()) {
      if (k.startsWith("abbrev "))
        prefs.remove(k);
    }
    notifyListeners();
  }

  void reset() {
    clear();
    currentAbbreviations = [];
    for (var k in initialAbbreviations.keys) {
      currentAbbreviations.add(Tuple2(k,initialAbbreviations[k]));
    }
    currentAbbreviations.add(Tuple2("",""));
    _save();
    notifyListeners();
  }

  void _save() {
    clear();
    for (var p in currentAbbreviations) {
      if (p.item1.isNotBlank)
        prefs.setString("abbrev ${p.item1.trim()}",p.item2);
    }
  }

  bool checkForErrors() {
    for (var i=0; i<currentAbbreviations.length; i++) {
      errors[i] = false;
      var p = currentAbbreviations[i];
      if (p.item1.isNotBlank && p.item2.isNotBlank) {
        if (p.item1.isBlank || p.item2.isBlank)
          errors[i] = true;
        if(p.item1.trim().contains(" "))
          errors[i] = true;
      }
    }
  //  notifyListeners();
    return true;
  }

  void copy() {
    var text = currentAbbreviations
        .where((e) => e.item1.isNotBlank).map((e) => "${e.item1} ${e.item2}").join("\n");
    var clip = FS.ClipboardData(text:text);
    FS.Clipboard.setData(clip);
  }

  void paste() {
    FS.Clipboard.getData("text/plain").then((value) {
      if (value is FS.ClipboardData)
        print(value.text);
    });
  }

  void defaultAbbreviations() {
    clear();
    for (var k in initialAbbreviations.keys)
      prefs.setString("abbrev $k",initialAbbreviations[k]);
    _load();
    notifyListeners();
  }

}
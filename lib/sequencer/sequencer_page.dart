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

import 'package:flutter/material.dart' as FM;
import 'package:provider/provider.dart' as PP;
import 'package:taminations/pages/web_page.dart';

import '../pages/settings_page.dart';
import '../request.dart';
import '../title_bar.dart';
import 'abbreviaions_model.dart';
import 'abbreviations_frame.dart';
import 'calls_frame.dart';
import 'sequencer_animation_frame.dart';
import 'sequencer_model.dart';

class SequencerPage extends FM.StatefulWidget {
  @override
  _SequencerPageState createState() => _SequencerPageState();
}

class _SequencerPageState extends FM.State<SequencerPage> {

  SequencerModel model;
  AbbreviationsModel abbreviationsModel;
  FM.Widget rightChild;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model = SequencerModel();
    abbreviationsModel = AbbreviationsModel();
    if (rightChild == null)
      rightChild = WebFrame("info/sequencer.html");
  }

  @override
  FM.Widget build(FM.BuildContext context) {
    return PP.MultiProvider(
      providers: [
        PP.ChangeNotifierProvider.value(value: model),
        PP.ChangeNotifierProvider.value(value: model.animation),
        PP.ChangeNotifierProvider.value(value: abbreviationsModel)
      ],
      child: FM.Scaffold(
          appBar: FM.PreferredSize(
              preferredSize: FM.Size.fromHeight(56.0),
              child: TitleBar(title: "Sequencer")
          ),
          body: RequestHandler(
            handler: (Request request) {
              if (request("button") == "Undo")
                setState(() {
                  model.undoLastCall();
                });
              if (request("button") == "Reset")
                model.reset();
              if (request("button") == "Help")
                setState(() {
                  rightChild = WebFrame("info/sequencer.html");
                });
              if (request("button") == "Settings")
                setState(() {
                  rightChild = SettingsFrame();
                });
              if (request("button") == "Abbrev")
                setState(() {
                  rightChild = AbbreviationsFrame();
                });
            },
            child: FM.Row(
              children: [
                FM.Expanded(child: SequencerCallsFrame()),
                FM.Expanded(child: SequencerAnimationFrame()),
                FM.Expanded(child: rightChild)
              ],
            ),
          )
      ),
    );
  }

}

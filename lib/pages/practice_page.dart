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

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart' as fm;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart' as pp;

import '../button.dart';
import '../dance_animation_painter.dart';
import '../dancer.dart';
import '../level_data.dart';
import '../main.dart';
import '../math/vector.dart';
import '../settings.dart';
import '../tam_utils.dart';
import '../title_bar.dart';
import '../color.dart';

class PracticePage extends fm.StatefulWidget {

  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends fm.State<PracticePage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  fm.Widget build(fm.BuildContext context) {
    return pp.ChangeNotifierProvider<TitleModel>(
        create: (_) => TitleModel(),
        child: fm.Scaffold(
            appBar: fm.PreferredSize(
                preferredSize: fm.Size.fromHeight(56.0),
                child: TitleBar()
            ),
            body: PracticeFrame(PracticeModel())
        )
    );
  }

}

class PracticeModel {

  void nextDialog(fm.BuildContext context, DanceAnimationPainter painter) { }

  Future<bool> firstAnimation(fm.BuildContext context, DanceAnimationPainter painter) async =>
    nextAnimation(context, painter);

  Future<bool> nextAnimation(fm.BuildContext context, DanceAnimationPainter painter) async {
    //  Choose a random call from the selected level
    final appState = pp.Provider.of<fm.ValueNotifier<TamState>>(context,listen: false);
    final titleModel = pp.Provider.of<TitleModel>(context,listen: false);
    final levelDatum = LevelData.find(appState.value.level);
    final levelCalls = TamUtils.calldata.where((element) =>
        levelDatum.selector(element.link)).toList();
    final randomCall = levelCalls[Random().nextInt(levelCalls.length)];

    //  Load that call and choose a random animation
    final randomLink = randomCall.link;
    final doc = await TamUtils.getXMLAsset(randomLink);
    final tams = TamUtils.tamList(doc)
        .where((element) => element.name.toString() == 'tam').toList();
    final randomAnim = Random().nextInt(tams.length);
    final randomTam = tams[randomAnim];
    titleModel.title = randomTam.getAttribute('title');
    titleModel.level = levelDatum.name;
    await painter.setAnimation(randomTam,practiceGender:Gender.BOY);
    painter.doPlay();
    return true;
  }

  bool canContinue(double fractionalScore) => true;

}

class PracticeFrame extends fm.StatefulWidget {
  final PracticeModel practiceModel;
  PracticeFrame(this.practiceModel);
  @override
  _PracticeFrameState createState() => _PracticeFrameState();
}

class _PracticeFrameState extends fm.State<PracticeFrame>
    with fm.SingleTickerProviderStateMixin {

  //  painter is where all the drawing and animation is done
  DanceAnimationPainter painter = DanceAnimationPainter();
  var animationFinished = false;
  var score = 0;
  var maxScore = 0;
  String congrats(double fraction) =>
      fraction >= 0.9 ? 'Excellent!'
          : fraction >= 0.7 ? 'Very Good!' : 'Poor';
  Future<bool> waitForAnimation;

  void _reset() {
    score = 0;
    animationFinished = false;
    painter.doPlay();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    waitForAnimation = widget.practiceModel.firstAnimation(context,painter);
  }

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.FutureBuilder(
      future: waitForAnimation,
      builder: (context,snapshot) {
        if (!snapshot.hasData) return fm.Container();
        widget.practiceModel.nextDialog(context, painter);
        return pp.ChangeNotifierProvider.value(
        value: painter,
        child: pp.Consumer3<DanceAnimationPainter, TitleModel, Settings>(
          //  Even though we know the painter, get it via Consumer
          //  so it triggers a rebuild when finished
            builder: (context, painter, titleModel, settings, child) {
              titleModel.title = painter.title;
              painter.setGridVisibility(true);
              painter.setSpeed(settings.practiceSpeed);
              return fm.Listener(
                onPointerDown: (event) {
                  painter.practiceDancer.touchDown(
                      event.pointer,
                      painter.mouse2dance(event.position.v),
                      isMouse: event.kind == PointerDeviceKind.mouse
                  );
                },
                onPointerUp: (event) {
                  painter.practiceDancer.touchUp(
                      event.pointer,
                      painter.mouse2dance(event.position.v),
                      isMouse: event.kind == PointerDeviceKind.mouse
                  );
                },
                onPointerMove: (event) {
                  painter.practiceDancer.touchMove(
                      event.pointer,
                      painter.mouse2dance(event.position.v)
                  );
                },
                child: fm.Stack(
                  children: [
                    fm.CustomPaint(
                      painter: painter,
                      child: fm.Center(), // so CustomPaint gets sized correctly
                    ),
                    if (painter.beat < 0.2)
                    fm.Positioned(
                        bottom: 10,
                        left: 300,
                        child: fm.Text('${-painter.beat.floor()}',
                            style: fm.TextStyle(color: Color.GRAY, fontSize: 180))
                    ),
                    if (painter.isFinished) fm.Positioned(
                        top: 100.0,
                        left: 20.0,
                        child: fm.Column(
                          children: [
                            _AnimationCompleteText('Animation Complete'),
                            _AnimationCompleteText('Your Score'),
                            _AnimationCompleteText(
                                '${painter.practiceScore.ceil()} / ${(painter
                                    .movingBeats * 10).ceil()}'),
                            _AnimationCompleteText(
                                congrats(painter.practiceScore /
                                    (painter.movingBeats * 10))
                            ),
                            fm.Row(
                              children: [
                                Button('Repeat', onPressed: () {
                                  setState(() {
                                    _reset();
                                  });
                                }),
                                if (widget.practiceModel.canContinue(painter.practiceScore /
                                    (painter.movingBeats * 10)))
                                  Button('Continue', onPressed: () {
                                    setState(() {
                                      waitForAnimation = widget.practiceModel.nextAnimation(context,painter);
                                    });
                                  }),
                                Button('Return', onPressed: () {
                                  //fm.Navigator.maybePop(context);
                                  fm.Router
                                      .of(context)
                                      .routerDelegate
                                      .popRoute();
                                })
                              ],
                            ),
                            Button('Definition') // TODO
                          ],
                        )
                    )
                  ],
                ),
              );
            }
        ),
      );}
    );
  }


}

class _AnimationCompleteText extends fm.StatelessWidget {

  final String text;
  _AnimationCompleteText(this.text);

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Text(text,style: fm.TextStyle(fontSize: 36));
  }
}

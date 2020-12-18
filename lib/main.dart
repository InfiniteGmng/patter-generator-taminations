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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as fm;
import 'package:provider/provider.dart' as pp;

import 'extensions.dart';
import 'level_data.dart';
import 'pages/anim_list_page.dart';
import 'pages/animation_page.dart';
import 'pages/calls_page.dart';
import 'pages/first_landscape_page.dart';
import 'pages/level_page.dart';
import 'pages/practice_page.dart';
import 'pages/second_landscape_page.dart';
import 'pages/settings_page.dart';
import 'pages/start_practice_page.dart';
import 'pages/tutorial_page.dart';
import 'pages/web_page.dart';
import 'sequencer/sequencer_page.dart';
import 'settings.dart';
import 'tam_utils.dart';

///  Main routine
void main() {
  fm.runApp(TaminationsApp());
}

enum MainPage {
  LEVELS,
  ANIMATIONS,
  SEQUENCER,
  STARTPRACTICE,
  PRACTICE,
  TUTORIAL
}
extension MainPageEx on String {
  MainPage toMainPage() => MainPage.values.firstWhere((d) => describeEnum(d) == this);
}

enum DetailPage {
  NONE,  // portrait only
  CALLS,
  SETTINGS,
  DEFINITION,
  HELP,
  ABBREVIATIONS
}
extension DetailPageEx on String {
  DetailPage toDetailPage() => DetailPage.values.firstWhere((d) => describeEnum(d) == this);
}

//  This class holds state information used to
//  generate the current layout
class TamState {

  final String level;  //  if not null, generate Calls page
  final String link;  //  if not null, generate AnimList page
  final int animnum;   //  if >= 0, generate Animation page
  final MainPage mainPage;
  final DetailPage detailPage;

  @override
  bool operator ==(Object other) =>
      (other is TamState)
      && other.toString() == toString();

  //  Default parameters generate the layout for the main menu
  TamState({
    this.level,
    this.link,
    this.animnum = -1,
    this.mainPage = MainPage.LEVELS,
    this.detailPage = DetailPage.NONE
  });

  //  Convenience methods to create a new route by
  //  adding onto a previous route
  TamState modify({String level, String link, int animnum,
  MainPage mainPage, DetailPage detailPage}) =>
      TamState(
          level:level ?? this.level,
          link: link ?? this.link,
          animnum: animnum ?? this.animnum,
          mainPage: mainPage ?? this.mainPage,
          detailPage: detailPage ?? this.detailPage);

  //  For URL generation
  @override
  String toString() => <String>[
    if (level != null && level.isNotEmpty) 'level=$level',
    if (animnum >= 0) 'animnum=${animnum.d}',
    if (link != null && link.isNotEmpty) 'link=$link',
    if (mainPage != null) 'main=${describeEnum(mainPage)}',
    if (detailPage != null && detailPage!=DetailPage.NONE)
      'detail=${describeEnum(detailPage)}'
  ].join('&');

  bool get isBlank => toString().isBlank;

}


//  TaminationsApp is the top-level widget.
//  Here it is just a wrapper for the router and its delegate (below),
//  which does all the work
//  Also holds global state and initialization futures
class TaminationsApp extends fm.StatefulWidget {

  @override
  fm.State<fm.StatefulWidget> createState() => _TaminationsAppState();

}

class _TaminationsAppState extends fm.State<TaminationsApp> {

  final TaminationsRouterDelegate _routerDelegate = TaminationsRouterDelegate();
  final TaminationsRouteInformationParser _routeInformationParser =
      TaminationsRouteInformationParser();

  @override
  fm.Widget build(fm.BuildContext context) {
    //  Wrap the Settings around the top of the program
    //  so everybody has access to them
    return pp.MultiProvider(
      providers: [
        pp.ChangeNotifierProvider(create: (context) => Settings()),
        pp.ChangeNotifierProvider(create: (context) => AnimationState())
      ],
        //  Read initialization files
      child: fm.FutureBuilder<bool>(
        future: TamUtils.init(),
        builder: (context,snapshot) =>
        snapshot.hasData ?
          fm.MaterialApp.router(
            title: 'Taminations',
            routerDelegate: _routerDelegate,
            routeInformationParser: _routeInformationParser,
          ) : fm.Container(),
    ));
  }

}

//  Router Delegate
//  Handles all requests to change the layout
class TaminationsRouterDelegate extends fm.RouterDelegate<TamState>
    with fm.ChangeNotifier, fm.PopNavigatorRouterDelegateMixin<TamState> {

  @override
  final fm.GlobalKey<fm.NavigatorState> navigatorKey;
  TaminationsRouterDelegate() : navigatorKey = fm.GlobalKey<fm.NavigatorState>();

  var appState = fm.ValueNotifier(TamState());
  var _orientation = fm.Orientation.landscape;
  //  this is necessary for the web URL and back button to work
  @override
  TamState get currentConfiguration => appState.value;

  @override
  fm.Widget build(fm.BuildContext context) {
    return pp.ChangeNotifierProvider.value(
      value: appState,
      child: fm.OrientationBuilder(
          builder: (context, orientation) {
            _orientation = orientation;
            return pp.Consumer<fm.ValueNotifier<TamState>>(
                builder: (context,appState,_) {
                  final config = appState.value;
                  return fm.Navigator(
                      key: navigatorKey,

                      //  Pages for landscape - first and second, Sequencer, Practice
                      pages: (orientation == fm.Orientation.landscape)
                          ? [ fm.MaterialPage(
                          key: fm.ValueKey('Landscape Page'),
                          child: FirstLandscapePage()
                      ),
                        if (config?.link?.isNotEmpty ?? false)
                          fm.MaterialPage(
                              key: fm.ValueKey('Landscape Page ' +
                                  config.link),
                              child: SecondLandscapePage()
                          ),
                        if (config.mainPage == MainPage.PRACTICE)
                          fm.MaterialPage(
                              key: fm.ValueKey('Start Practice'),
                              child: StartPracticePage()
                          ),
                        if (config.mainPage == MainPage.TUTORIAL)
                          fm.MaterialPage(
                              key: fm.ValueKey('Tutorial'),
                              child: TutorialPage()
                          ),
                        if (config.mainPage == MainPage.STARTPRACTICE)
                          fm.MaterialPage(
                              key: fm.ValueKey('Start Practice'),
                              child: StartPracticePage()
                          ),
                        if (config.mainPage == MainPage.PRACTICE)
                          fm.MaterialPage(
                              key: fm.ValueKey('Practice'),
                              child: PracticePage()
                          ),
                        if (config.mainPage == MainPage.SEQUENCER)
                          fm.MaterialPage(
                              key: fm.ValueKey('Sequencer'),
                              child: SequencerPage()
                          ),
                      ]

                      //  Pages for portrait - Level, Animlist, Animation, Settings, etc
                          : [
                        fm.MaterialPage(
                            key: fm.ValueKey('LevelPage'),
                            child: LevelPage()
                        ),
                        if (config.level != null &&
                            LevelData.find(config.level) != null)
                          fm.MaterialPage(
                              key: fm.ValueKey(config.level),
                              child: CallsPage()
                          ),
                        if (config.link?.isNotEmpty ?? false)
                          fm.MaterialPage(
                              key: fm.ValueKey(config.link),
                              child: AnimListPage()
                          ),
                        if (config.animnum >= 0 )
                          fm.MaterialPage(
                              key: fm.ValueKey(
                                  config.link + ' animation'),
                              child: AnimationPage()
                          ),
                        if (config.detailPage == DetailPage.HELP)
                          fm.MaterialPage(
                              key: fm.ValueKey('About'),
                              child: WebPage('info/about.html')
                          ),
                        if (config.detailPage ==
                            DetailPage.DEFINITION)
                          fm.MaterialPage(
                              key: fm.ValueKey(
                                  config.link + ' definition'),
                              child: WebPage(config.link)
                          ),
                        if (config.detailPage ==
                            DetailPage.SETTINGS)
                          fm.MaterialPage(
                              key: fm.ValueKey('Settings'),
                              child: SettingsPage()
                          ),
                        //  TODO more pages to add here
                        if (config.mainPage == MainPage.PRACTICE)
                          fm.MaterialPage(
                              key: fm.ValueKey('Practice'),
                              child: StartPracticePage()
                          ),
                      ],

                      //  Standard onPopPage method, required
                      onPopPage: (route, result) {
                        print('Pop Navigator: ${route.currentResult}');
                        if (!route.didPop(result)) {
                          return false;
                        }
                        return true;
                      });
                });
          })
    );
  }

  @override
  Future<void> setInitialRoutePath(TamState configuration) async {
    appState.addListener(() {
      setNewRoutePath(appState.value);
    });
  }

  @override
  Future<void> setNewRoutePath(TamState configuration) async {
    if (configuration != null) {
      print('New Route Path: $configuration');
      appState.value = configuration;
      notifyListeners();
    }
    return;
  }
}

//  This class converts an URL to/from the fields in
//  TaminationsRoutePath
//  Used by web browser implementation
class TaminationsRouteInformationParser extends fm.RouteInformationParser<TamState> {

  @override
  Future<TamState>
  parseRouteInformation(fm.RouteInformation routeInformation) async {
    final params = Uri.parse(routeInformation.location).queryParameters;
    var mainPage = params['main']?.toMainPage();
    var detailPage = params['detail']?.toDetailPage();
    var level = params['level'] ?? '';
    var link = params['link'] ?? '';
    var animnum = int.tryParse(params['animnum'] ?? '-1') ?? -1;
    return TamState(mainPage: mainPage, detailPage: detailPage, level:level,link:link,animnum:animnum);
  }

  @override
  fm.RouteInformation restoreRouteInformation(TamState path) {
    var location = path.toString();
    return fm.RouteInformation(location: '?$location');
  }

}

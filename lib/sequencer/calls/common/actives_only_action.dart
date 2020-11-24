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

import '../../call_context.dart';
import '../action.dart';

abstract class ActivesOnlyAction extends Action {

  ActivesOnlyAction(String name) : super(name);

  @override
  Future<void> perform(CallContext ctx, [int stackIndex=0]) async {
    if (ctx.actives.length < ctx.dancers.length) {
      await ctx.subContext(ctx.actives, (ctx2) async {
        ctx2.analyze();
        await perform(ctx2,stackIndex);
      });
    } else
      await super.perform(ctx,stackIndex);
  }

}

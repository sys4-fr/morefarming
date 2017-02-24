# morefarming
by sys4

A Minetest mod that extend the default farming mod of minetest_game

This mod add more things to do farming, make it more realistic, more harder and make it compatible with maidroid core farming.

Dependencies:
- moreflowers, by me (https://github.com/sys4-fr/moreflowers)
- farming
- farming_redo, by TenPlus1 (optional)
- farming_plus, by PilzAdam (optional)
- maidroid_core, by tacigar (optional)

Why another farming mod ?
- 1- I want to have a more realistic farming mod because when you spawn into a blank world, i think it's a non-sense if you found "domestic" vegetables wich already populate the world IMHO.
- 2- So, it's your own work to make your "domestic" vegetables in a slow process of natural selection from harvested seed originate from wild homolog plant.
- 3- The other existing farming mods (farming_plus, farming_redo) seems to not use the original farming library provided by MT_game (keep in mind I respect this choice). This implies possible incompatibilities with mods that uses original farming mod (ie: maidroid).
- 4- Anyway i don't criticize the other farming mods (I still use it, even I maked it compatible with this mod), but i wanted to do a mod with a different way of looking at things.

General way of utilization:
- 1- First of all, found and harvest a wild plant or flower.
- 2- With more or less chance, you can get seeds of this plant.
- 3- Plant the seeds into a tilled soil.
- 4- Leave your plant growing up until maturity.
- 5- Harvest it.
- 6- If you have chance, you can get seeds from the "domestic" counterpart vegetable (rarely) else you get seeds of the original wild plant (by chance too, but more often) or the wild plant herself (the most often) or a rustic vegetable (by chance) or a mix of this items with a maximum of 3 items at once.
- 7- Repeat from point 1 (or 3, depending what you get)

A concrete example with Wild carrot:
- 1- Found a wild carrot flower and harvest it until you get seeds.
- 2- Plant the seeds in a tilled soil (as if you plant wheat seeds).
- 3- Leave your plant growing up until maturity.
- 4- Harvest it and suppose you get in return only the original wild plant,
- 5- re-plant it and harvest it until you get seeds again,
- 6- (Repeat from 2 to 3)
- 7- Harvest it and this time you get a rustic vegetable (a wild carrot with plenty of roots) and seeds but this time this seeds seems to be different (except if farming_redo is loaded without farming_plus, if this is the case you get directly a carrot).
- 8- You eat your wild carrot but his nutritional power is very weak so,
- 9- with your new seeds (or carrot from farming_redo) repeat from 2 to 3,
- 10- Oh! you harvest a beautiful carrot and in addition you get the same different seeds ! (or carrots from farming_redo)
- 11- Good you have a new variety of carrots, you taste it and you realize that his nutritional power is much better than the wild version.

For now this mod add:
- Wild Carrot
- Carrot (domestic)
- Golden Carrot

Behaviour with optional mods loaded (for now):
- farming_redo: Domestic and golden carrots are provided by farming_redo. There is no carrot seeds.
- farming_plus: Domestic carrots and carrots seeds are provided by farming_plus.
- farming_redo and farming_plus together: Domestic carrots and carrots seeds provided by farming_plus, golden carrot by farming_redo.
- maidroid_core: The core farming was modified so that your robot has ability to harvest and plant wild carrots (flowers and seeds) and domestic carrots.
- WARNING: If farming_redo or farming_plus is loaded then maidroid_core will not load due to incompatibility.

LICENCES:
- Code: GPLv3
- Code of maidroid_core_morefarming.lua: GPLv2.1+
- Textures: WTFPL v2

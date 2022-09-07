if not P1 or not P2 then backToSongWheel('Two Player Mode Required') return end
require ('helpers')
require ('definemods')
require ('swap')
setShitUp()

stretchAndColor(bg, {0.3,0.3,0.3})

setdefault {300, 'cmod', 100, 'zbuffer', 1, 'approachtype', 200, 'modtimer', 1, 'halgun', 1, 'dizzyholds', -100, 'drawsizeback', 1, 'stealthtype', 1, 'stealthpastreceptors', 100, 'receptorzbuffer', 100, 'scrollspeedmult'}
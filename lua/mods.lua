require ('helpers')
require ('definemods')
require ('swap')
if not P1 or not P2 then backToSongWheel('Two Player Mode Required') return end
aftTexture = aftsprite

for pn = 1, 2 do
	setupJudgeProxy(PJ[pn], P[pn]('Judgment'), pn)
	setupJudgeProxy(PC[pn], P[pn]('Combo'), pn)
	P[pn]('Combo'):zoom2(0.75)
	P[pn]('Judgment'):zoom2(0.75)
	P[pn]('NoteField'):addy(-10)
end
for pn = 1, #PP do
	P[pn]:SetFarDist(9e9)
	PP[pn]:SetTarget(P[pn])
	P[pn]:hidden(1)
end

local c2l = {}
local modz = {}

setdefault {
	300, 'cmod',
	100, 'zbuffer',
	1, 'approachtype',
	200, 'modtimer',
	1, 'halgun',
	1, 'dizzyholds',
	-100, 'drawsizeback',
	1, 'stealthtype',
	1, 'stealthpastreceptors',
	100, 'receptorzbuffer',
	100, 'scrollspeedmult',
}

--aftTexture(gmap_aft, gmap_spr)
--gmap_spr:GetShader():uniformTexture('noise', rand:GetTexture())
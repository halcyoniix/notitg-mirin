math = setmetatable({}, {__index = _G.math})

math.mod = function(a, b) return a - math.floor(a/b)*b end

math.clamp = function(a, min, max)
	return math.min(math.max(a, min), max)
end

math.scale = function(a, in_min, in_max, out_min, out_max)
	return out_min + (a-in_min)*(out_max-out_min)/(in_max-in_min)
end

math.dist = function(x1, x2, y1, y2)
	local xd = x2 - x1
	local yd = y2 - y1
	return math.sqrt( xd * xd + yd * yd )
end

math.round = function(x)
	return math.floor(x + 0.5)
end

spb = function(beat) return (1 / GAMESTATE:GetCurBPS()) * beat end
realFov = function(fov) return 360 / math.pi * math.atan(math.tan(math.pi * (1 / (360 / fov))) * sw / sh * 0.75) end
randomxd = function(t) if t == 0 then return 0.5 else return (math.sin(t * 3229.3) * 43758.5453)%1 end end
fluct = function(i) return math.mod(i,2)*2-1 end
ease2 = function(t)
	local beat, len, curve, from, to, mod = t[1], t[2], t[3], t[4], t[5], t[6]
	set {beat, from, mod, plr = t.plr}
	ease {beat, len, curve, to, mod, plr = t.plr}
end
rgba = function(r, g, b, a)
	if not a then a = 255 end
	return r/255, g/255, b/255, a/255
end
isBetween = function(a, b, c)
	if a >= b and a <= c then return true end return false 
end
stretchAndColor = function(quad, color)
	if quad then
		quad:stretchto(0,0,sw,sh)
		if color then
			quad:diffuse(color[1], color[2], color[3], color[4] or 1)
		end
	end
end
bumpy_osc = function(period, len)
	return -((16 * (1+(period/100)) ) * (2 * math.pi))*len
end
wiggle = function(beat, len, num, curve, amt, mod, extras)
	local sus = extras.sus and len*(extras.sus/len) or len
	local amt2, a = 0, 0
	if type(amt) == 'table' then
		amt2, amt = amt[2], amt[1]
	else
		amt2, amt = -amt, amt
	end
	for i = 0,num-1 do
		if i == 0 then
			a = amt
		elseif math.mod(i, 2) == 0 then
			a = amt - amt2
		else
			a = amt2 - amt
		end
		add {beat + i * sus, len, curve, a, mod, plr = extras.plr}
	end

	if not extras.persist then
		if math.mod(num, 2) == 1 then
			a = -amt
		else
			a = -amt2
		end
		add {beat + num * sus, len, curve, a, mod, plr = extras.plr}
	end
end
bounce = function(curve_in, curve_out, mirror)
	return function(t)
		local t = t * 2
		local mirror = mirror and -1 or 1
		if t < 1 then
			return curve_in(t)
		else
			return mirror - curve_out(t-1) * mirror
		end
	end
end
flicker = function(curve, fps)
	local curve, fps = curve or linear, fps or 59
	return function(t)
		local bunga = 1 / (fps / 2)
		local f = (math.floor(math.mod(GAMESTATE:GetSongTime(), bunga) / bunga * 2) * 2) - 1
		return f * curve(t)
	end
end
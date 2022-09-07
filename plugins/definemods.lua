definemod {'coolskewx','coolskewy', function(x, y)
		return x, -x, y, -y
	end,
	'skewx','noteskew','skewy','noteskewy'
}

local rr = function(angleX, angleY, angleZ)
	local sinX,cosX,sinY,cosY,sinZ,cosZ = math.sin(angleX),math.cos(angleX),math.sin(angleY),math.cos(angleY),math.sin(angleZ),math.cos(angleZ)
	return { math.atan2(-cosX*sinY*sinZ-sinX*cosZ,cosX*cosY), math.asin(-cosX*sinY*cosZ+sinX*sinZ), math.atan2(-sinX*sinY*cosZ-cosX*sinZ,cosY*cosZ) }
end

aux {'coolrotationx','coolrotationy','coolrotationz'}
node {'coolrotationx','coolrotationy','coolrotationz',function(xd, yd, zd, plr)
	local d2r = math.pi / 180
	local ang = rr(xd * d2r, yd * d2r, zd * d2r)
	local rx, ry, rz = xd, yd, zd
	local cx, cy, cz = ang[1] * 100, ang[2] * 100, ang[3] * 100
		return rx, ry, rz, cx, cy, cz
	end,
	'rotationx','rotationy','rotationz','confusionxoffset','confusionyoffset','confusionzoffset'
}
alias {'confusionoffset', 'confusionzoffset'}

definemod {'centerplayersx', function(x, pn)
		for pn = 1,2 do
			local a = P[pn]
			if a then
				a:x(scx + (160 * (pn*2-3) * (1-(x/100))))
			end
		end
	end
}

definemod {'x2','y2','z2', function(x, y, z, pn)
		local a = P[pn]
		if a then
			a:x2(x)
			a:y2(y)
			a:z2(z)
		end
	end
}

definemod {'rotationx2', 'rotationy2', 'rotationz2', function(x, y, z, pn)
		local a = P[pn]
		if a then
			a:rotationx2(x)
			a:rotationy2(y)
			a:rotationz2(z)
		end
	end
}

aux {'blackspherealternate','blackspherecross','blacksphereflip'}

node {'blackspherealternate', function(b)
	local b = (-b * 2) / 360
	local sin = 0.5*math.sin(((b)-0.5)*math.pi)+0.5
	local cos = math.sin((b)*math.pi)
	return sin * 100, 25/2 * cos, -25 * cos
end, 'invert', 'reverse', 'alternate'}

node {'blackspherecross', function(b)
	local b = (-b * 2) / 360
	local sin = 0.5*math.sin(((b)-0.5)*math.pi)+0.5
	local cos = math.sin((b)*math.pi)
	return sin * 100, 25/2 * cos, -25 * cos
end, 'invert', 'reverse', 'cross'}

node {'blacksphereflip', function(b)
	local b = (-b * 2) / 360
	local sin = 0.5*math.sin(((b)-0.5)*math.pi)+0.5
	local cos = math.sin((b)*math.pi)
	return 
	sin * 100,
	-50 * cos,
	-25 * cos,
	37.5 * cos
end, 'flip', 'split', 'alternate', 'reverse'}


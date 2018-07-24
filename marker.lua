local bX,bY,bZ = -14.4267578125,-274.0986328125,5.4296875
local basesMarker = createMarker(bX,bY,bZ-0.875,"cylinder",5,0,255,0)
local basesBlip = createBlip(bX,bY,bZ,25)
local insideMarker_1 = createMarker(1443.4,1336.0,-8.1-0.875,"cylinder",2,0,255,0)
local insideMarker_2 = createMarker(1443.4,1361.2,-8.1-0.875,"cylinder",2,0,255,0)
local insideMarker_3 = createMarker(1443.4,1387.2,-8.1-0.875,"cylinder",2,0,255,0)
local insideMarker_4 = createMarker(1444.4,1412.9,-8.1-0.875,"cylinder",2,0,255,0)

function basesMarkerHit (element)
	if ( getElementType(element) == "player" ) then
		triggerClientEvent(element,"openBasesWindow",element)
	end
end
addEventHandler("onMarkerHit",basesMarker,basesMarkerHit)

function basesMarkerLeave (element)
	if ( getElementType(element) == "player" ) then
		triggerClientEvent(element,"closeBasesWindow",element)
	end
end
addEventHandler("onMarkerLeave",basesMarker,basesMarkerLeave)

function insideMarkerHit (element)
	if ( getElementType(element) == "player" ) then
		if ( getPedOccupiedVehicle(element) ) then
			local vehicle = getPedOccupiedVehicle(element)
			removePedFromVehicle(element)
			setElementPosition(vehicle,bX,bY,bZ)
		end
		setElementPosition(element,bX,bY,bZ)
	end
end
addEventHandler("onMarkerHit",insideMarker_1,insideMarkerHit)
addEventHandler("onMarkerHit",insideMarker_2,insideMarkerHit)
addEventHandler("onMarkerHit",insideMarker_3,insideMarkerHit)
addEventHandler("onMarkerHit",insideMarker_4,insideMarkerHit)
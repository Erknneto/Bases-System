local basesData = {
-- número da base / local para ser transportado
{"Base #1",1435.1491699219,1336.6171875,-8.109375},
{"Base #2",1433.4616699219,1361.7705078125,-8.109375},
{"Base #3",1433.8483886719,1387.3720703125,-8.109375},
{"Base #4",1432.3630371094,1413.1884765625,-8.109375},
}

function getBaseData (baseName)
	for i,data in ipairs(basesData) do
		if ( baseName == data[1] ) then
			return data[2],data[3],data[4]
		end
	end
	return false
end

function warpPlayerIntoBase (baseName)
	if ( baseName ) then
		local x,y,z = getBaseData(baseName)
		if ( x and y and z ) then
			if ( getPedOccupiedVehicle(client) ) then
				local vehicle = getPedOccupiedVehicle(client)
				removePedFromVehicle(client)
				setElementPosition(vehicle,x,y,z)
			end
			setElementPosition(client,x,y,z)
		end
	end
end
addEvent("warpPlayerIntoBase",true)
addEventHandler("warpPlayerIntoBase",getRootElement(),warpPlayerIntoBase)
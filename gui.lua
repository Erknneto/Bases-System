local baseList = {
-- número da base / senha da base
{"Base #1","mtaevorust"},
{"Base #2","@negaopirocudo123"},
{"Base #3","@negaopirocudo123"},
{"Base #4","@negaopirocudo123"},
}

local screenW, screenH = guiGetScreenSize()
bWindow = guiCreateWindow((screenW - 358) / 2, (screenH - 333) / 2, 358, 333, "Bases", false)
guiWindowSetSizable(bWindow, false)
guiSetVisible(bWindow, false)
bList = guiCreateGridList(10, 55, 139, 268, false, bWindow)
bColumn = guiGridListAddColumn(bList, "Bases", 0.82)
bListLabel = guiCreateLabel(39, 32, 80, 13, "Lista de Bases", false, bWindow)
guiSetFont(bListLabel, "default-bold-small")
bPass = guiCreateEdit(159, 87, 189, 34, "", false, bWindow)
guiEditSetMasked(bPass, true)
bPassLabel = guiCreateLabel(169, 65, 169, 17, "Digite a senha aqui :", false, bWindow)
guiSetFont(bPassLabel, "default-bold-small")
bEnter = guiCreateButton(169, 207, 169, 48, "Entrar", false, bWindow)
bClose = guiCreateButton(169, 265, 169, 48, "Fechar", false, bWindow)

local row = 0
local name = ""
for i, item in ipairs(baseList) do
	name = item[1]
	row = guiGridListAddRow(bList)
	guiGridListSetItemText(bList, row, bColumn, name, false, false)
end

function bEnterClick (btn,state)
	if ( btn == "left" ) and ( state == "up" ) then
		local base = guiGridListGetItemText(bList,guiGridListGetSelectedItem(bList),1)
		if ( base ) and ( base ~= nil ) and ( base ~= "" ) then
			local pass = guiGetText(bPass)
			if ( pass ) and ( pass ~= nil ) and ( pass ~= "" ) then
				for i,data in ipairs(baseList) do
					if ( pass == data[2] ) then
						triggerServerEvent("warpPlayerIntoBase",getLocalPlayer(),base)
					end
				end
			else
				outputChatBox("Você precisa digitar uma senha!",255,0,0)
			end
		else
			outputChatBox("Você precisa selecionar alguma base!",255,0,0)
		end
	end
end
addEventHandler("onClientGUIClick",bEnter,bEnterClick)

function bCloseClick (btn,state)
	if ( btn == "left" ) and ( state == "up" ) then
		guiSetVisible(bWindow,false)
		showCursor(false)
	end
end
addEventHandler("onClientGUIClick",bClose,bCloseClick)

function openBasesWindow ()
	guiSetVisible(bWindow,true)
	showCursor(true)
end
addEvent("openBasesWindow",true)
addEventHandler("openBasesWindow",getRootElement(),openBasesWindow)

function closeBasesWindow ()
	guiSetVisible(bWindow,false)
	showCursor(false)
end
addEvent("closeBasesWindow",true)
addEventHandler("closeBasesWindow",getRootElement(),closeBasesWindow)
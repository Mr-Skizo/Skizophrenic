--[[
version = 0.08
author = "Mr-Skizo"
SCRIPT_NAME = "SkizophrenicNidalee"
]]
 
if myHero.charName ~= "Nidalee" then return end

--------------------------------------------- Auto Update -------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
local version = 0.08
local author = "Mr-Skizo"
local last_update = "04/04/2016"

function AutoUpdater()
	
	local AUTOUPDATE = true
	if(AUTOUPDATE) then
		local UPDATE_HOST = "raw.githubusercontent.com"
		local UPDATE_PATH = "/Mr-Skizo/Skizophrenic/master/SkizophrenicNidalee.lua".."?rand="..math.random(1,10000)
		local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
		local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
		local ServerData = GetWebResult(UPDATE_HOST, "/Mr-Skizo/Skizophrenic/master/Nidalee.version.txt")
		if ServerData then
			ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
			if ServerVersion then
				if tonumber(version) < ServerVersion then
					SendMsg("New version available "..ServerVersion)
					SendMsg(">>Updating, please don't press F9<<")
					DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () SendMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
				else
					DelayAction(function() SendMsg("Hello, "..GetUser()..". You got the latest version! :) ("..ServerVersion..")") end, 3)
				end
			end
			else
				SendMsg("Error downloading version info")
		end
	end
end

---------------------------------------------BOL Tracker --------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("fVt2gRlTLGR2baWz")

--------------------------------------------- Sprites Load & Download -------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------


function DownloadSprites()
	if not DirectoryExist(SPRITE_PATH.."SkizophrenicNidalee") then
		CreateDirectory(SPRITE_PATH.."SkizophrenicNidalee//")
	end
  	
	if not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Javelin_Toss.png") or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Javelin_Toss_grey.png") or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Bushwhack.png")or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Bushwhack_grey.png")
		or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Primal_Surge.png")or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Primal_Surge_grey.png")or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Takedown.png")
		or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Takedown_grey.png")or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Pounce.png")or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Pounce_grey.png")
		or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Swipe.png")or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Swipe_grey.png")or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Aspect_of_the_Cougar_2.png")or not FileExist(SPRITE_PATH.."SkizophrenicNidalee/Aspect_of_the_Cougar_2_grey.png")  then
	SendMsg("Downloading Sprites")
  	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Javelin_Toss.png", SPRITE_PATH.."SkizophrenicNidalee/Javelin_Toss.png",function()end)
  	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Javelin_Toss_grey.png", SPRITE_PATH.."SkizophrenicNidalee/Javelin_Toss_grey.png",function()end)
  	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Bushwhack.png", SPRITE_PATH.."SkizophrenicNidalee/Bushwhack.png",function()end)
  	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Bushwhack_grey.png", SPRITE_PATH.."SkizophrenicNidalee/Bushwhack_grey.png",function()end)
  	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Primal_Surge.png", SPRITE_PATH.."SkizophrenicNidalee/Primal_Surge.png",function()end)
  	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Primal_Surge_grey.png", SPRITE_PATH.."SkizophrenicNidalee/Primal_Surge_grey.png",function()end)
  	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Takedown.png", SPRITE_PATH.."SkizophrenicNidalee/Takedown.png", function ()end)
	
	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Takedown_grey.png", SPRITE_PATH.."SkizophrenicNidalee/Takedown_grey.png",function()end)
	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Pounce.png", SPRITE_PATH.."SkizophrenicNidalee/Pounce.png",function()end)
	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Pounce_grey.png", SPRITE_PATH.."SkizophrenicNidalee/Pounce_grey.png",function()end)
	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Swipe.png", SPRITE_PATH.."SkizophrenicNidalee/Swipe.png",function()end)
	
	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Swipe_grey.png", SPRITE_PATH.."SkizophrenicNidalee/Swipe_grey.png",function()end)
	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Aspect_of_the_Cougar_2.png", SPRITE_PATH.."SkizophrenicNidalee/Aspect_of_the_Cougar_2.png",function()end)
	DownloadFile("https://raw.githubusercontent.com/Mr-Skizo/Skizophrenic/master/Sprites/Aspect_of_the_Cougar_2_grey.png", SPRITE_PATH.."SkizophrenicNidalee/Aspect_of_the_Cougar_2_grey.png",function()	
  	SendMsg("Sprites Downloaded, press 2x F9")
  	end)
	end
end

function LoadSprites()
	NidaSpriteQ_On = GetSprite("\\SkizophrenicNidalee\\Javelin_Toss.png")
	NidaSpriteQ_Off = GetSprite("\\SkizophrenicNidalee\\Javelin_Toss_grey.png")
	NidaSpriteW_On = GetSprite("\\SkizophrenicNidalee\\Bushwhack.png")
	NidaSpriteW_Off = GetSprite("\\SkizophrenicNidalee\\Bushwhack_grey.png")
	NidaSpriteE_On = GetSprite("\\SkizophrenicNidalee\\Primal_Surge.png")
	NidaSpriteE_Off = GetSprite("\\SkizophrenicNidalee\\Primal_Surge_grey.png")
	
	NidaSpriteRQ_On = GetSprite("\\SkizophrenicNidalee\\Takedown.png")
	NidaSpriteRQ_Off = GetSprite("\\SkizophrenicNidalee\\Takedown_grey.png")
	NidaSpriteRW_On = GetSprite("\\SkizophrenicNidalee\\Pounce.png")
	NidaSpriteRW_Off = GetSprite("\\SkizophrenicNidalee\\Pounce_grey.png")
	NidaSpriteRE_On = GetSprite("\\SkizophrenicNidalee\\Swipe.png")
	NidaSpriteRE_Off = GetSprite("\\SkizophrenicNidalee\\Swipe_grey.png")
	
	NidaSpriteR_On = GetSprite("\\SkizophrenicNidalee\\Aspect_of_the_Cougar_2.png")
	NidaSpriteR_Off = GetSprite("\\SkizophrenicNidalee\\Aspect_of_the_Cougar_2_grey.png")
end

--------------------------------------------- Orblwalker Loader -------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

local OrbWalkers = {}
local LoadedOrb = nil

function LoadOrb()
  if OrbWalkers[Menu.Orbwalkers.Orbwalker] == "SAC" then
  LoadedOrb = "Sac"
  TIMETOSACLOAD = false
  DelayAction(function() TIMETOSACLOAD = true end,15)
  elseif OrbWalkers[Menu.Orbwalkers.Orbwalker] == "MMA" then
  LoadedOrb = "Mma"
  elseif OrbWalkers[Menu.Orbwalkers.Orbwalker] == "Pewalk" then
  LoadedOrb = "Pewalk"
  elseif OrbWalkers[Menu.Orbwalkers.Orbwalker] == "NOW" then
  LoadedOrb = "Now"
  require "Nebelwolfi's Orb Walker"
  _G.NOWi = NebelwolfisOrbWalkerClass()
  _G.NebelwolfisOrbWalkerClass(Menu.Orbwalkers.NOW) 
  elseif OrbWalkers[Menu.Orbwalkers.Orbwalker] == "Big Fat Walk" then
  LoadedOrb = "Big"
  require "Big Fat Orbwalker"
  elseif OrbWalkers[Menu.Orbwalkers.Orbwalker] == "SOW" then
  LoadedOrb = "Sow"
  require "SOW"
  _G.SOWi = SOW(_G.VP)
  SOW:LoadToMenu(Menu.Orbwalkers.SOW)
  elseif OrbWalkers[Menu.Orbwalkers.Orbwalker] == "SxOrbWalk" then
  LoadedOrb = "SxOrbWalk"
  require "SxOrbWalk"
  SxOrb:LoadToMenu(Menu.Orbwalkers.SxOrbWalk)
  end
end

function Keys()
  if LoadedOrb == "Sac" and TIMETOSACLOAD then
  if _G.AutoCarry.Keys.AutoCarry then return "Combo" end
  if _G.AutoCarry.Keys.MixedMode then return "Harass" end
  if _G.AutoCarry.Keys.LaneClear then return "Laneclear" end
  if _G.AutoCarry.Keys.LastHit then return "Lasthit" end
  elseif LoadedOrb == "Mma" then
  if _G.MMA_IsOrbwalking() then return "Combo" end
  if _G.MMA_IsDualCarrying() then return "Harass" end
  if _G.MMA_IsLaneClearing() then return "Laneclear" end
  if _G.MMA_IsLastHitting() then return "Lasthit" end
  elseif LoadedOrb == "Pewalk" then
  if _G._Pewalk.GetActiveMode().Carry then return "Combo" end
  if _G._Pewalk.GetActiveMode().Mixed then return "Harass" end
  if _G._Pewalk.GetActiveMode().LaneClear then return "Laneclear" end
  if _G._Pewalk.GetActiveMode().Farm then return "Lasthit" end
  elseif LoadedOrb == "Now" then
  if _G.NOWi.Config.k.Combo then return "Combo" end
  if _G.NOWi.Config.k.Harass then return "Harass" end
  if _G.NOWi.Config.k.LaneClear then return "Laneclear" end
  if _G.NOWi.Config.k.LastHit then return "Lasthit" end
  elseif LoadedOrb == "Big" then
  if _G["BigFatOrb_Mode"] == "Combo" then return "Combo" end
  if _G["BigFatOrb_Mode"] == "Harass" then return "Harass" end
  if _G["BigFatOrb_Mode"] == "LaneClear" then return "Laneclear" end
  if _G["BigFatOrb_Mode"] == "LastHit" then return "Lasthit" end
  elseif LoadedOrb == "Sow" then
  if _G.SOWi.Menu.Mode0 then return "Combo" end
  if _G.SOWi.Menu.Mode1 then return "Harass" end
  if _G.SOWi.Menu.Mode2 then return "Laneclear" end
  if _G.SOWi.Menu.Mode3 then return "Lasthit" end
  elseif LoadedOrb == "SxOrbWalk" then
  if _G.SxOrb.isFight then return "Combo" end
  if _G.SxOrb.isHarass then return "Harass" end
  if _G.SxOrb.isLaneClear then return "Laneclear" end
  if _G.SxOrb.isLastHit then return "Lasthit" end
  end
end

function LoadTableOrbs()
  if _G.Reborn_Loaded or _G.Reborn_Initialised or _G.AutoCarry ~= nil then
  table.insert(OrbWalkers, "SAC")
  end
  if _G.MMA_IsLoaded then
  table.insert(OrbWalkers, "MMA")
  end
  if _G._Pewalk then
  table.insert(OrbWalkers, "Pewalk")
  end
  if FileExist(LIB_PATH .. "/Nebelwolfi's Orb Walker.lua") then
  table.insert(OrbWalkers, "NOW")
  end
  if FileExist(LIB_PATH .. "/Big Fat Orbwalker.lua") then
  table.insert(OrbWalkers, "Big Fat Walk")
  end
  if FileExist(LIB_PATH .. "/SOW.lua") then
  table.insert(OrbWalkers, "SOW")
  end
  if FileExist(LIB_PATH .. "/SxOrbWalk.lua") then
  table.insert(OrbWalkers, "SxOrbWalk")
  end
  if #OrbWalkers > 0 then
  Menu:addSubMenu("> Orbwalkers", "Orbwalkers")
  Menu:addSubMenu("> Key Config", "Keys")
  Menu.Orbwalkers:addParam("Orbwalker", "OrbWalker", SCRIPT_PARAM_LIST, 1, OrbWalkers)
  Menu.Keys:addParam("Flee", "Flee key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Q"))
  Menu.Keys:addParam("info", "Detecting others keys from: "..OrbWalkers[Menu.Orbwalkers.Orbwalker], SCRIPT_PARAM_INFO, "")
  local OrbAlr = false
    Menu.Orbwalkers:setCallback("Orbwalker", function(value) 
    if OrbAlr then return end
    OrbAlr = true
	Menu.Orbwalkers:addParam("info", "Press F9 2x to load your selected Orbwalker.", SCRIPT_PARAM_INFO, "")
    SendMsg("Press F9 2x to load your selected Orbwalker")
    end)
  end
end 

--------------------------------------------- Variables ---------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
local Humain = true

function Variables()
	lastAttack = 0
	lastAttackCD = 0
	VARS = 	
	{	Q 	= 	{range = 1400, delay = 0.25, width = 37.5, speed = 1325},
		W 	= 	{range = 900, delay = 0.500, width = 80, speed = 1450},
		E 	= 	{range = 600},
		CW 	= 	{range = 375},
		HW 	= 	{range = 750},
		CE 	= 	{range = 300}
	}
	CDTracker =
	{	Q = 0,
		W = 0,
		E = 0,
		R = 0,
		RQ = 0,
		RW = 0,
		RE = 0
		
	}
	Champ = { }
    Passive = { }
    lastTime = { }
    myEnemyTable = GetEnemyHeroes()
    for i, enemy in pairs(myEnemyTable) do
        Champ[i] = enemy.charName
    end
	
	--drawThis = {time = 0}
	Last_LevelSpell = 0
   	UPL:AddSpell(_Q, {speed = VARS.Q.speed, delay = VARS.Q.delay, range = VARS.Q.range, width = VARS.Q.width, collision = true, aoe = false, type = "linear"})
    UPL:AddSpell(_W, {speed = VARS.W.speed, delay = VARS.W.delay, range = VARS.W.range, width = VARS.W.width, collision = false, aoe = false, type = "cone"})
   	enemyMinions = minionManager(MINION_ENEMY, 1000, myHero, MINION_SORT_MAXHEALTH_ASC)
   	jungleMinions = minionManager(MINION_JUNGLE, 1400, myHero, MINION_SORT_MAXHEALTH_DEC)
	ts = TargetSelector(TARGET_LOW_HP, 1800, DAMAGE_MAGICAL, false, true)
	target = ts.target
	
end


--------------------------------------------- Menu Function --------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

function DrawMenu()
    Menu = scriptConfig("Skizophrenic Nidalee", "Skizophrenic")
	
    Menu:addSubMenu("> Combo", "comboM")
		Menu.comboM:addSubMenu("> Humain Combo", "humancombo")
		Menu.comboM.humancombo:addParam("usehq", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM.humancombo:addParam("usehw", "Use W", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM:addSubMenu("> Cougar Combo", "cougarcombo")
		Menu.comboM.cougarcombo:addParam("usecq", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM.cougarcombo:addParam("usecw", "Use W", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM.cougarcombo:addParam("usece", "Use E", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM:addParam("useR", "Use R in combo", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM:addParam("autocougar", "Switch to Cougar if target is Hunted", SCRIPT_PARAM_ONOFF, true)
    Menu:addSubMenu("> Harass Mode", "harass")
		Menu.harass:addParam("harassILC", "Harass with lane clear Key", SCRIPT_PARAM_ONOFF, false)
	UPL:AddToMenu(Menu, "> Predictions")
    Menu:addSubMenu("> TargetSelector", "TargetSelector")
	Menu:addSubMenu("> LaneClear/JungleClear", "farm")
	Menu.farm:addSubMenu("> JungleClear", "Jfarm")
		Menu.farm.Jfarm:addParam("blank", "<------Human------>", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Jfarm:addParam("Qinjungle","Use Human Q", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("Winjungle","Use Human W", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("Einjungle","Use Human E", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("blank", "<------Cougar------>", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Jfarm:addParam("RQinjungle","Use Cougar Q", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("RWinjungle","Use Cougar W", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("REinjungle","Use Cougar E", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("blank", "<------------------>", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Jfarm:addParam("Rinjungle","Use R", SCRIPT_PARAM_ONOFF,true)
	Menu.farm:addSubMenu("> LaneClear", "Lfarm")
		Menu.farm.Lfarm:addParam("blank", "<------Human------>", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Lfarm:addParam("QinLane","Use Human Q", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Lfarm:addParam("blank", "<------Cougar------>", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Lfarm:addParam("RQinLane","Use Cougar Q", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Lfarm:addParam("RWinLane","Use Cougar W", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Lfarm:addParam("REinLane","Use Cougar E", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Lfarm:addParam("blank", "<------------------>", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Lfarm:addParam("RinLane","Use R", SCRIPT_PARAM_ONOFF,true)
	Menu:addSubMenu("> Multiformtracker","Multiformtracker")
		Menu.Multiformtracker:addParam("MultiformtrackerOn", "Use Multiformtracker", SCRIPT_PARAM_ONOFF, true)
		Menu.Multiformtracker:addParam("MultiformtrackerScale", "Multiformtracker Scale", SCRIPT_PARAM_SLICE, 80, 0, 100)
        Menu.Multiformtracker:addParam("MultiformtrackerX", "Multiformtracker x Position", SCRIPT_PARAM_SLICE, 1.897, 0.5, 10, 0.5)
        Menu.Multiformtracker:addParam("MultiformtrackerZ", "Multiformtracker z Position", SCRIPT_PARAM_SLICE, 1.264, 0.5, 10, 0.5)	
   Menu:addSubMenu("> Auto Heal", "autoH")
	 Menu.autoH:addParam("", "<------Self Heal------>", SCRIPT_PARAM_INFO, "")
	 Menu.autoH:addParam("activeAutoH","Auto heal when low hp", SCRIPT_PARAM_ONOFF,true)
	 Menu.autoH:addParam("autoR","Change Form for heal", SCRIPT_PARAM_ONOFF,true)
	 Menu.autoH:addParam("hp", "Heal if hp under -> %", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
	 Menu.autoH:addParam("", "<------Ally Heal------>", SCRIPT_PARAM_INFO, "")
	 Menu.autoH:addParam("activeAllyAutoH","Auto heal ally", SCRIPT_PARAM_ONOFF,false)
	 for _, option in ipairs(GetAllyHeroes()) do 
				Menu.autoH:addParam(option.charName, "" .. option.charName, SCRIPT_PARAM_ONOFF, true)
	 end
	 Menu.autoH:addParam("hpAlly", "Heal ally if hp under -> %", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
    Menu:addSubMenu("> Draws Settings", "draws")
      Menu.draws:addParam("DisRang", "Disable All Range Draw", SCRIPT_PARAM_ONOFF, false) 
	  Menu.draws:addParam("blank", "	Human Form", SCRIPT_PARAM_INFO, " ")
	  Menu.draws:addParam("DrawQ", "Draw Q Rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("DrawW", "Draw W rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("DrawE", "Draw E rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("blank", "	Cougar Form", SCRIPT_PARAM_INFO, " ")
	  Menu.draws:addParam("DrawrWR", "Draw Cougar W Rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("DrawrER", "Draw Cougar E Rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam('drawType', 'Draw Type', SCRIPT_PARAM_LIST, 2, {"Lag Free", "Normal"})
	Menu:addSubMenu("> Mana Manager", "Mana")
		Menu.Mana:addParam("", "<------Harass------>", SCRIPT_PARAM_INFO, "")
		Menu.Mana:addParam("HarassQ", "Mana to use Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
		Menu.Mana:addParam("", "<------Heal------>", SCRIPT_PARAM_INFO, "")
		Menu.Mana:addParam("SelfHeal", "Mana to self auto heal", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		Menu.Mana:addParam("AllyHeal", "Mana to ally auto heal", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
		Menu.Mana:addParam("", "<------Jungle Clear------>", SCRIPT_PARAM_INFO, "")
		Menu.Mana:addParam("JungleClear", "Mana to jungle with humain form", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
	Menu:addSubMenu("> Damage Draw","dmgdraw")
		Menu.dmgdraw:addParam("drawit", "Draw dmg in hp bar", SCRIPT_PARAM_ONOFF, true)
	Menu:addSubMenu("> Steal","Steal")
		Menu.Steal:addParam("KillSteal", "KS with haumain Q", SCRIPT_PARAM_ONOFF, false)
		Menu.Steal:addParam("JungleSteal", "Jungle Steal", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
	Menu:addSubMenu("> Jump System Beta","JumpSystem")
		Menu.JumpSystem:addParam("AllSpotM", "Draw all spot in Mini Map", SCRIPT_PARAM_ONOFF, false)
		Menu.JumpSystem:addParam("AllSpot", "Draw all Spot in Mini", SCRIPT_PARAM_ONOFF, false)
		Menu.JumpSystem:addParam("InRangeSpot", "Draw in range spot", SCRIPT_PARAM_ONOFF, false)
		Menu.JumpSystem:addParam("jumpK", "Wall Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("W"))
		Menu.JumpSystem:addParam('drawType', 'Draw Type', SCRIPT_PARAM_LIST, 2, {"Lag Free", "Normal"})
    if VIP_USER then
    Menu:addSubMenu("> Skin Changer", "skin")
	--Menu:addSubMenu("> Auto Leveler", "AutoLvL")
   -- Menu.AutoLvL:addParam("lvlOn", "Use Auto Leveler", SCRIPT_PARAM_ONOFF, false)
 	--Menu.AutoLvL:addParam("lvlMode", "Mode", SCRIPT_PARAM_LIST, 2, {"Q>W>E", "Q>E>W", "E>Q>W", "E>W>Q"})
 	--Menu.AutoLvL.Enable = false
 	end
    Menu:addParam("", "", SCRIPT_PARAM_INFO, "")
	Menu:addParam("Version", "Version", SCRIPT_PARAM_INFO, version)
	Menu:addParam("Author", "Author:", SCRIPT_PARAM_INFO,author )
	Menu:addParam("LastUpdate", "LastUpdate", SCRIPT_PARAM_INFO, last_update)

end

--------------------------------------------- Utility Function --------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

function Checks()
	Qready = (myHero:CanUseSpell(_Q) == READY)
	Wready = (myHero:CanUseSpell(_W) == READY)
	Eready = (myHero:CanUseSpell(_E) == READY)
	Rready = (myHero:CanUseSpell(_R) == READY)
	jungleMinionsPriority()
	enemyMinions:update()
    jungleMinions:update()
	
end

function SendMsg(msg)
  PrintChat("Schizophrenic Nidalee<font color=\"#C2FDF3\"><b> "..msg..".</b></font>")
end

function CanAA()
   return (GetTickCount() + GetLatency() * 0.5 > lastAttack + lastAttackCD)
end

function CountEnemyHeroInRange(range, object)
    local object = object or myHero
    local range = range and range * range or myHero.range * myHero.range
    local enemyInRange = 0
    for i = 1, heroManager.iCount, 1 do
        local hero = heroManager:getHero(i)
        if ValidTarget(hero) and GetDistanceSqr(object, hero) <= range then
            enemyInRange = enemyInRange + 1
        end
    end
    return enemyInRange
end

function HowManyHpEgive()
	Ehp = {45,85 ,125 ,165 ,205}
	Elvl = myHero:GetSpellData(_E).level
	addAp = (myHero.ap * 50 ) / 100
	return (Ehp[Elvl] + addAp)
end

function TargetHunted(unit)
        for i, Champ in pairs(Champ) do
                if Champ == unit.charName then
                        return Passive[i]
                end
        end
		for _,v in pairs(jungleMinions.objects)do
			if v.charName == unit.charName then
				return TargetHaveBuff('NidaleePassiveHunted', unit)
			end
		end
end

function jungleMinionsPriority()
	if(jungleMinions.iCount > 1) then
		for i, jminion in pairs(jungleMinions.objects) do
			if(not jminion.name:lower():find("mini")) then
				local p = jungleMinions.objects[0]
				jungleMinions.objects[0] = jungleMinions.objects[i]
				jungleMinions.objects[i] = p
			end
			
		end
	end
end
 
function CastRQ(unit)
  	local Pos, HitChance, HeroPosition = UPL:Predict(_Q, myHero, unit)
	if HitChance > 0  then
  		CastSpell(_Q, Pos.x, Pos.z)
  	end
end

function CastQ(unit)
  	local Pos, HitChance, HeroPosition = UPL:Predict(_Q, myHero, unit)
	if HitChance > 0 then
  		CastSpell(_Q, Pos.x, Pos.z)
  	end
end

function CastW(unit)
  	local Pos, HitChance, HeroPosition = UPL:Predict(_W, myHero, unit)
	if HitChance > 0 then
  		CastSpell(_W, Pos.x, Pos.z)
  	end
end

function CastRW(unit)
	if TargetHunted(unit) then
		if GetDistance(unit) < VARS.HW.range then
            CastSpell(_W, unit.pos.x , unit.pos.z)       
        end
	else 
		if GetDistance(unit) < VARS.CW.range then
            CastSpell(_W, unit.pos.x , unit.pos.z)       
        end
	end
end

function CastRE(unit)
  	if GetDistance(unit) < VARS.CE.range then
            CastSpell(_E, unit.pos.x , unit.pos.z)       
    end
end

function CDCheck()
	if Humain then 
		CDTracker.Q = myHero:GetSpellData(_Q).currentCd
		CDTracker.W = myHero:GetSpellData(_W).currentCd
		CDTracker.E = myHero:GetSpellData(_E).currentCd
		if CDTracker.RQ > 0 then
			CDTracker.RQ = CDTracker.RQ - 0.006
		else
			CDTracker.RQ = 0
		end
		if CDTracker.RW > 0 then
			CDTracker.RW = CDTracker.RW - 0.006
		else
			CDTracker.RW = 0
		end
		if CDTracker.RE > 0 then
			CDTracker.RE = CDTracker.RE - 0.006
		else
			CDTracker.RE = 0
		end
	else
		CDTracker.RQ = myHero:GetSpellData(_Q).currentCd
		CDTracker.RW = myHero:GetSpellData(_W).currentCd
		CDTracker.RE = myHero:GetSpellData(_E).currentCd
		if CDTracker.Q > 0 then
			CDTracker.Q = CDTracker.Q - 0.006
		else
			CDTracker.Q = 0
		end
		if CDTracker.W > 0 then
			CDTracker.W = CDTracker.W - 0.006
		else
			CDTracker.W = 0
		end
		if CDTracker.E > 0 then
			CDTracker.E = CDTracker.E - 0.006
		else
			CDTracker.E = 0
		end
	end
	CDTracker.R = myHero:GetSpellData(_R).currentCd
end

function GetHPBarPos(enemy)
    enemy.barData = {PercentageOffset = {x = -0.05, y = 0}}
    local barPos = GetUnitHPBarPos(enemy)
    local barPosOffset = GetUnitHPBarOffset(enemy)
    local barOffset = { x = enemy.barData.PercentageOffset.x, y = enemy.barData.PercentageOffset.y }
    local barPosPercentageOffset = { x = enemy.barData.PercentageOffset.x, y = enemy.barData.PercentageOffset.y }
    local BarPosOffsetX = -50
    local BarPosOffsetY = 46
    local CorrectionY = 39
    local StartHpPos = 31
    barPos.x = math.floor(barPos.x + (barPosOffset.x - 0.5 + barPosPercentageOffset.x) * BarPosOffsetX + StartHpPos)
    barPos.y = math.floor(barPos.y + (barPosOffset.y - 0.5 + barPosPercentageOffset.y) * BarPosOffsetY + CorrectionY)
    local StartPos = Vector(barPos.x , barPos.y, 0)
    local EndPos = Vector(barPos.x + 108 , barPos.y , 0)    
    return Vector(StartPos.x, StartPos.y, 0), Vector(EndPos.x, EndPos.y, 0)
end

function DrawLineHPBar(damage, text, unit, enemyteam)
    if unit.dead or not unit.visible then return end
    local p = WorldToScreen(D3DXVECTOR3(unit.x, unit.y, unit.z))
    if not OnScreen(p.x, p.y) then return end
    local thedmg = 0
    local line = 2
    local linePosA  = {x = 0, y = 0 }
    local linePosB  = {x = 0, y = 0 }
    local TextPos   = {x = 0, y = 0 }
   
   
    if damage >= unit.maxHealth then
        thedmg = unit.maxHealth - 1
    else
        thedmg = damage
    end
   
    thedmg = math.round(thedmg)
   
    local StartPos, EndPos = GetHPBarPos(unit)
    local Real_X = StartPos.x + 24
    local Offs_X = (Real_X + ((unit.health - thedmg) / unit.maxHealth) * (EndPos.x - StartPos.x - 2))
    if Offs_X < Real_X then Offs_X = Real_X end
    local mytrans = 350 - math.round(255*((unit.health-thedmg)/unit.maxHealth))
    if mytrans >= 255 then mytrans=254 end
    local my_bluepart = math.round(400*((unit.health-thedmg)/unit.maxHealth))
    if my_bluepart >= 255 then my_bluepart=254 end
 
   
    if enemyteam then
        linePosA.x = Offs_X-150
        linePosA.y = (StartPos.y-(30+(line*15)))    
        linePosB.x = Offs_X-150
        linePosB.y = (StartPos.y-10)
        TextPos.x = Offs_X-148
        TextPos.y = (StartPos.y-(30+(line*15)))
    else
        linePosA.x = Offs_X-125
        linePosA.y = (StartPos.y-(30+(line*15)))    
        linePosB.x = Offs_X-125
        linePosB.y = (StartPos.y-15)
   
        TextPos.x = Offs_X-122
        TextPos.y = (StartPos.y-(30+(line*15)))
    end
       
        local dmgDraw = unit.health - thedmg
        if dmgDraw < 0 then dmgDraw = 0 end
    DrawLine(linePosA.x, linePosA.y, linePosB.x, linePosB.y , 2, ARGB(mytrans, 255, my_bluepart, 0))
    DrawText("HP: "..tostring(math.ceil(dmgDraw)).." | "..tostring(text), 15, TextPos.x, TextPos.y , ARGB(mytrans, 255, my_bluepart, 0))
end

--------------------------------------------- Feature Function --------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------


function TryToRun()
	if Menu.Keys.Flee then
			myHero:MoveTo(mousePos.x, mousePos.z)
		if Humain and myHero:CanUseSpell(_R) then
			CastSpell(_R)
		end
		CastSpell(_W, mousePos.x, mousePos.z)
	end
end

function AutoHeal()
	if CountEnemyHeroInRange(1500) > 0 then
		if Humain then
			if Menu.autoH.activeAutoH and myHero:CanUseSpell(_E) and myHero.health <= (myHero.maxHealth * Menu.autoH.hp / 100) and myHero.mana >= (myHero.maxMana * Menu.Mana.SelfHeal / 100) then
				CastSpell(_E)
			end
		elseif myHero:CanUseSpell(_R) and Menu.autoH.autoR and Menu.autoH.activeAutoH and myHero.health <= (myHero.maxHealth * Menu.autoH.hp / 100) and myHero.mana >= (myHero.maxMana * Menu.Mana.SelfHeal / 100) and CDTracker.E == 0 then
			CastSpell(_R)
			CastSpell(_E)
		end
		if Menu.autoH.activeAllyAutoH then 
			local allys = GetAllyHeroes()
			for _, h in pairs(allys) do
				if h and not h.isMe and h.team == myHero.team and h.visible and not h.dead and h.health > 0 and GetDistance(h.pos, myHero.pos) < 600 and h.health < (h.maxHealth * Menu.autoH.hpAlly / 100) then
					if Menu.autoH[h.charName] and myHero.mana >= (myHero.maxMana * Menu.Mana.AllyHeal / 100) and Humain then
						CastSpell(_E,h)
					end
					
				end
			end
		end
	end

end

function jungleClear()
	if Keys() == "Laneclear" then
		if Menu.harass.harassILC then
			harass()
		end
	---------------Lane CLEAR	
		for _, minion in pairs(enemyMinions.objects) do
			if ValidTarget(minion, 1000) then
				if Humain then
					if Qready and Menu.farm.Lfarm.QinLane then	
						CastQ(minion)
					end
					if Rready and Menu.farm.Lfarm.RinLane  then
							CastSpell(_R)		
					end		
				else 
					if  Qready and Menu.farm.Lfarm.RQinLane then
						CastRQ(minion)
					end
					if  Wready and Menu.farm.Lfarm.RWinLane then
						CastRW(minion)
					end
					if  Eready and Menu.farm.Lfarm.REinLane then
						CastRE(minion)
					end
					if Rready and Menu.farm.Lfarm.RinLane  then
							CastSpell(_R)		
					end	
				
				end
			end
		
		end
	---------------Jungle CLEAR	
		for _, jminion in pairs(jungleMinions.objects) do
			if ValidTarget(jminion, 1200) then
				if Humain then
					if Qready and Menu.farm.Jfarm.Qinjungle and  myHero.mana >= (myHero.maxMana * Menu.Mana.JungleClear / 100) then	
						CastQ(jminion)
					end
					if Wready and Menu.farm.Jfarm.Winjungle and myHero.mana >= (myHero.maxMana * Menu.Mana.JungleClear / 100) then
						CastW(jminion)
					end
					if Eready and Menu.farm.Jfarm.Einjungle and myHero.health <= (myHero.maxHealth - HowManyHpEgive()) and myHero.mana >= (myHero.maxMana * Menu.Mana.JungleClear / 100)then
						CastSpell(_E)
					end
					if not Qready and not Wready and not Enable then
						CastSpell(_R)
					end
				else 
					if  Qready and Menu.farm.Jfarm.RQinjungle then
						CastRQ(jminion)
						
					end
					if  Wready and Menu.farm.Jfarm.RWinjungle then
						CastRW(jminion)
					end
					if  Eready and Menu.farm.Jfarm.REinjungle then
						CastRE(jminion)
					end
					if Rready and Menu.farm.Jfarm.Rinjungle  then
						if myHero.mana >= (myHero.maxMana * Menu.Mana.JungleClear / 100) then
							CastSpell(_R)
						end
							
					end
				end
			end
		
		end
	end
end

function combo()
	if not target then return end
	if Keys() == "Combo" then
			if Humain then
				if Qready and ValidTarget(target, 1400) and target and GetDistance(target) <= 1400 and Menu.comboM.humancombo.usehq then
				CastQ(target)
				end
				if Wready and ValidTarget(target, 650) and target and GetDistance(target) <= 650 and Menu.comboM.humancombo.usehw then
					CastW(target)
				end
				if Eready and ValidTarget(target, 600) and target and GetDistance(target) <= 600 and Menu.comboM.humancombo.usehw then
					CastRE(target)
				end
				if Rready and Menu.comboM.useR and not Qready and not Wready  then
						CastSpell(_R)
				end
			else
				if Qready and ValidTarget(target, 100) and target and GetDistance(target) <= 100 and Menu.comboM.cougarcombo.usecq then
				CastRQ(target)
				end
				if Wready and TargetHunted(target) and ValidTarget(target, 750) and target and GetDistance(target) <= 750 and Menu.comboM.cougarcombo.usecw then
					CastRW(target)
				end
				if Wready and not TargetHunted(target) and ValidTarget(target, 375) and target and GetDistance(target) <= 375 and Menu.comboM.cougarcombo.usecw then
					CastRW(target)
				end
				if Eready and ValidTarget(target, 300) and target and GetDistance(target) <= 300 and Menu.comboM.cougarcombo.usecw then
					CastRE(target)
				end
				if Rready and Menu.comboM.useR and not TargetHunted(target)  or not Qready and not Eready and not Wready  then
					if GetDistance(target) < 1000 then
						CastSpell(_R)
					end
				end
				--if GetDistance(target) > 1200 and Eready then
					--CastSpell(_E)
				--end
				
				
			end
			if Menu.comboM.autocougar then
				if Rready and Menu.comboM.useR and not Qready and not Wready  or Rready and TargetHunted(target) and Humain then
							CastSpell(_R)
				end
			end
			
	end
	
end

function harass()
	if not target then return end
		if (Keys() == "Harass" or (Menu.harass.harassILC and Keys() == "Laneclear")) then
			if Humain and myHero.mana >= (myHero.maxMana * Menu.Mana.HarassQ / 100)then
				if Qready and ValidTarget(target, 1400) and target and GetDistance(target) <= 1400 and Menu.comboM.humancombo.usehq and not CanAA() then
				CastQ(target)
				end
			end
			
	end
end

function MultiformtrackerDraw()

	if Menu.Multiformtracker.MultiformtrackerOn then
		if not Humain then
			if(CDTracker.Q ~= 0) or myHero:GetSpellData(_Q).level == 0 then
				NidaSpriteQ_Off:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteQ_Off:Draw(WINDOW_W/Menu.Multiformtracker.MultiformtrackerX, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ, 250)
				DrawText(tostring(math.round(CDTracker.Q, 2)), 20 , WINDOW_W/Menu.Multiformtracker.MultiformtrackerX , WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ +50, ARGB(255,255,255,255))
			else
				NidaSpriteQ_On:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteQ_On:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) , (WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ), 250)
			end
			if(CDTracker.W ~= 0) or myHero:GetSpellData(_W).level == 0 then
				NidaSpriteW_Off:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteW_Off:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +70, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ, 250)
				DrawText(tostring(math.round(CDTracker.W, 2)), 20 , WINDOW_W/Menu.Multiformtracker.MultiformtrackerX +70, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ +50, ARGB(255,255,255,255))
			else
				NidaSpriteW_On:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteW_On:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +70 , (WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ), 250)
			end
			if(CDTracker.E ~= 0) or myHero:GetSpellData(_E).level == 0 then
				NidaSpriteE_Off:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteE_Off:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +140, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ, 250)
				DrawText(tostring(math.round(CDTracker.E, 2)), 20 , WINDOW_W/Menu.Multiformtracker.MultiformtrackerX +140, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ +50, ARGB(255,255,255,255))
			else
				NidaSpriteE_On:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteE_On:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +140, (WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ), 250)
			end
			if(CDTracker.R ~= 0) then
				NidaSpriteR_Off:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteR_Off:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +210, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ, 250)
				DrawText(tostring(math.round(CDTracker.R, 2)), 20 , WINDOW_W/Menu.Multiformtracker.MultiformtrackerX +210, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ +50, ARGB(255,255,255,255))
			else
				NidaSpriteR_On:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteR_On:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +210, (WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ), 250)
			end
		else
			if(CDTracker.RQ ~= 0) or myHero:GetSpellData(_Q).level == 0  then
				NidaSpriteRQ_Off:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteRQ_Off:Draw(WINDOW_W/Menu.Multiformtracker.MultiformtrackerX, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ, 250)
				DrawText(tostring(math.round(CDTracker.RQ, 2)), 20 , WINDOW_W/Menu.Multiformtracker.MultiformtrackerX , WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ +50, ARGB(255,255,255,255))
			else
				NidaSpriteRQ_On:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteRQ_On:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) , (WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ), 250)
			end
			if(CDTracker.RW ~= 0) or myHero:GetSpellData(_W).level == 0  then
				NidaSpriteRW_Off:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteRW_Off:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +70, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ, 250)
				DrawText(tostring(math.round(CDTracker.RW, 2)), 20 , WINDOW_W/Menu.Multiformtracker.MultiformtrackerX +70, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ +50, ARGB(255,255,255,255))
			else
				NidaSpriteRW_On:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteRW_On:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +70 , (WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ), 250)
			end
			if(CDTracker.RE ~= 0) or myHero:GetSpellData(_E).level == 0  then
				NidaSpriteRE_Off:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteRE_Off:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +140, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ, 250)
				DrawText(tostring(math.round(CDTracker.RE, 2)), 20 , WINDOW_W/Menu.Multiformtracker.MultiformtrackerX +140, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ +50, ARGB(255,255,255,255))
			else
				NidaSpriteRE_On:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteRE_On:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +140, (WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ), 250)
			end
			if(CDTracker.R ~= 0) then
				NidaSpriteR_Off:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteR_Off:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +210, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ, 250)
				DrawText(tostring(math.round(CDTracker.R, 2)), 20 , WINDOW_W/Menu.Multiformtracker.MultiformtrackerX +210, WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ +50, ARGB(255,255,255,255))
			else
				NidaSpriteR_On:SetScale(Menu.Multiformtracker.MultiformtrackerScale/100,Menu.Multiformtracker.MultiformtrackerScale /100)
				NidaSpriteR_On:Draw((WINDOW_W/Menu.Multiformtracker.MultiformtrackerX) +210, (WINDOW_H/Menu.Multiformtracker.MultiformtrackerZ), 250)
			end
		end
	end
end

function DrawLifeBar()
	if Menu.dmgdraw.drawit then
        for i, unit in pairs(myEnemyTable) do
            if ValidTarget(unit) and GetDistance(unit) <= 2500 then
                if(CDTracker.Q == 0) then
					QTdmg = getDmg("Q", unit, myHero)
					if(GetDistance(unit) > 525) then
						disDmg = (GetDistance(unit)/100) / 3.87
						if(disDmg > 2) then disDmg = 2 end
						QTdmg = QTdmg + (QTdmg *disDmg)
					end
				end
				if(CDTracker.W == 0) then
					WTdmg = getDmg("W", unit, myHero)
				end
				if(CDTracker.RQ == 0) then
					RQTdmg = getDmg("QM", unit, myHero)
					if TargetHunted(unit) then
						RQTdmg = RQTdmg + (RQTdmg * 33)/100
					end
				end
				if(CDTracker.RW == 0) then
					RWTdmg = getDmg("WM", unit, myHero)
				end
				if(CDTracker.RE == 0) then
					RETdmg = getDmg("EM", unit, myHero)
				end
			DrawLineHPBar(QTdmg+WTdmg+RQTdmg+RWTdmg+RETdmg,"", unit, true)	
            end
		
        end
    end
end

function KillSteal()
        if Humain and Menu.Steal.KillSteal then
                for i, unit in pairs(myEnemyTable) do
                        if(CDTracker.Q == 0 and GetDistance(unit) <1500) then
							QTdmg = getDmg("Q", unit, myHero)
							if(GetDistance(unit) > 525) then
								disDmg = (GetDistance(unit)/100) / 3.87
								if(disDmg > 2) then disDmg = 2 end
								QTdmg = QTdmg + (QTdmg *disDmg)
							end
						end
                        if ValidTarget(unit) and unit.health <= QTdmg then
                                CastQ(unit)
						end
                        
                end
        end
end

function JungleSteal()
        if Humain and Menu.Steal.JungleSteal then
				myHero:MoveTo(mousePos.x, mousePos.z)
                for i, unit in pairs(jungleMinions.objects) do
                        if(CDTracker.Q == 0 and GetDistance(unit) <1500) then
							QTdmg = getDmg("Q", unit, myHero)
							if(GetDistance(unit) > 525) then
								disDmg = (GetDistance(unit)/100) / 3.87
								if(disDmg > 2) then disDmg = 2 end
								QTdmg = QTdmg + (QTdmg *disDmg)
							end
						end
                        if ValidTarget(unit) and unit.health <= QTdmg then
                                CastQ(unit)
						end
                        
                end
        end
end
--------------------------------------------- Wall Jump ---------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
walls = {{8384,51,2906,8320,52,3276},
{9370,55,3182,9310,49,2812},
{9582,49,2826,9724,59,3174},
{9322,60,3758,9572,-68,4036},
{9302,-66,4308,9028,53,4082},
{9038,52,4488,9390,-71,4446},
{9822,-71,4892,9763,-68,5274},
{10654,-72,4536,10290,-71,4502},
{11822,-71,4458,12078,52,4708},
{11386,-18,5402,11734,53,5300},
{12060,54,5280,12430,52,5350},
{12322,57,5808,11946,50,5832},
{12822,51,5008,13094,52,4752},
{12916,52,5502,12694,52,5830},
{12772,52,6258,13156,55,6344},
{11372,52,7208,11381,52,7624},
{10786,52,7494,10824,52,7124},
{10712,52,6904,10342,52,6836},
{10241,30,6247,10332,-71,5900},
{8298,-71,6088,8075,52,5759},
{7938,50,5968,7992,-61,6490},
{7622,21,6558,7556,52,6180},
{7116,57,5582,7300,52,5910},
{11044,62,8154,11162,52,7798},
{10776,63,8498,10415,62,8629},
{10222,50,9056,10127,52,9414},
{9822,50,8756,10039,62,8454},
{11474,66,8814,11811,51,9078},
{11872,51,8756,11690,56,8377},
{11792,54,8112,12074,53,7864},
{11716,52,9196,11560,52,9536},
{4624,50,5508,4532,52,5892},
{3990,52,6374,4163,53,6115},
{4874,51,6458,5004,51,6106},
{3274,54,5340,3092,56,5668},
{2476,53,5614,2516,57,5986},
{3068,57,6008,3440,52,6076},
{3124,52,6408,2741,57,6262},
{2774,57,6658,3066,52,6896},
{3674,52,6708,3676,50,7084},
{3518,52,7424,3440,53,7790},
{6124,52,5608,6198,49,5242},
{6424,49,5058,6798,49,5102},
{6674,49,4258,6328,49,4400},
{6174,52,2708,6194,52,3028},
{11810,52,4904,11490,-71,4774},
{8022,52,3508,7900,54,3864},
{5940,49,4482,6012,49,4608},
{6024,49,4658,5824,49,4976},
{1786,53,7234,2054,50,7498},
{2024,50,7906,2252,52,8204},
{2024,52,8406,1658,53,8478},
{1974,53,9406,1976,53,9400},
{2174,52,9106,1896,53,9384},
{2024,53,9856,1796,53,10152},
{2576,52,9408,2922,52,9554},
{2874,51,9056,2492,52,8958},
{3214,52,8402,3116,51,8786},
{3224,51,9506,3540,-52,9684},
{3374,-65,10056,3120,52,9828},
{3224,-67,10406,2952,54,10172},
{3874,52,7706,4026,51,7364},
{4424,49,8106,4044,51,8046},
{4558,14,8608,4512,-67,8988},
{5100,-69,9640,5086,-71,10014},
{5458,-71,10374,5812,55,10356},
{5710,57,10862,5380,-71,10744},
{4474,-71,10406,4104,-71,10350},
{4122,43,11726,4074,56,12098},
{4824,56,12206,4580,57,11922},
{4974,57,11856,5184,56,12166},
{5474,56,12106,5348,57,11720},
{5424,57,11206,5230,-71,10908},
{6074,52,9756,5948,-71,9412},
{6810,54,11386,6878,56,11016},
{8072,52,9706,8444,50,9738},
{8670,50,9600,8708,53,9226},
{8876,50,10030,8878,51,10434},
{7224,-0,8156,7252,53,8530},
{6874,53,8834,6744,-71,8486},
{6374,-71,8956,6573,35,9286},
{7502,53,9014,7708,52,9328},
{8462,50,10476,8145,50,10753},
{8722,56,12206,8656,56,11890},
{9854,29,6558,9796,52,6930},
{6424,55,11656,6410,56,12112},
{6224,56,12056,5892,56,12268},
{5838,53,12934,6022,53,13196}

}


--local drawThis = {time = 0}

-- function NearestNonWall(_x, _y, _z, _radius, accuracy) --Credits to gReY
	-- local vec = D3DXVECTOR3(_x, _y, _z)
	
	-- accuracy = accuracy or 50
	-- _radius = _radius and math.floor(_radius / accuracy) or math.huge
	
	-- _x, _z = math.round(_x / accuracy) * accuracy, math.round(_z / accuracy) * accuracy

	-- local radius = 2
	
	-- local function checkP(x, y) 
		-- vec.x, vec.z = _x + x * accuracy, _z + y * accuracy 

		-- return IsWall(vec) 
	-- end
	
	-- while radius <= _radius do
		-- if not checkP(0, radius) or not checkP(radius, 0) or not checkP(0, -radius) or not checkP(-radius, 0) then
			-- return vec
		-- end

		-- local f, x, y = 1 - radius, 0, radius
		-- while x < y - 1 do
			-- x = x + 1

			-- if f < 0 then 
				-- f = f + 1 + 2 * x
			-- else 
				-- y, f = y - 1, f + 1 + 2 * (x - y)
			-- end

			-- if not checkP(x, y) or not checkP(-x, y) or not checkP(x, -y) or not checkP(-x, -y) or not checkP(y, x) or not checkP(-y, x) or not checkP(y, -x) or not checkP(-y, -x) then 
				-- return vec 
			-- end
		-- end

		-- radius = radius + 1
	-- end
-- end
-- function checkWall(pos)
	-- local vec = D3DXVECTOR3(pos.x,pos.y,pos.z)
	-- return IsWall(vec)
-- end

-- function GetIntersection( v1Start,  v1End, v2Start,  v2End)
    -- local s1_x, s1_y, s2_x, s2_y =  v1End.x - v1Start.x,v1End.z - v1Start.z,v2End.x - v2Start.x,v2End.z - v2Start.z
    -- local div = (-s2_x * s1_y + s1_x * s2_y)
	-- if div == 0 then return nil end
    -- local s = (-s1_y * (v1Start.x - v2Start.x) + s1_x * (v1Start.z - v2Start.z)) /div;
    -- local t = ( s2_x * (v1Start.z - v2Start.z) - s2_y * (v1Start.x - v2Start.x)) / div;
-- return (s >= 0 and s <= 1 and t >= 0 and t <= 1) and (Vector(v1Start.x + (t * s1_x),0,v1Start.z + (t * s1_y)) or nil)
-- end

function DrawJumpSpot()
	-- DrawLine3D(4768.71,93.89,2571.65,4799.94,94.56,2005.05, 3, RGB(66,63,129))
	 --DrawLine3D(myHero.x,myHero.y,myHero.z,myHero.endPath.x ,myHero.endPath.y,myHero.endPath.z, 3)
		for _, wall in pairs(walls) do
			local n = ((myHero.x-wall[1])^2+(myHero.z-wall[3])^2)
			n = math.sqrt(math.round(n))
			if(Menu.JumpSystem.AllSpotM) then
					DrawCircleMinimap(wall[1], wall[2], wall[3], 100, 2, c_green)
					DrawCircleMinimap(wall[4], wall[5], wall[6], 100, 2, c_green)
			end
			if(Menu.JumpSystem.AllSpot) then	
				if(Menu.JumpSystem.drawType == 2) then
					DrawCircle(wall[1], wall[2], wall[3], 100,  0x423f81)
					DrawLine3D(wall[1],wall[2],wall[3],wall[4],wall[5],wall[6], 3, RGB(66,63,129))
					DrawCircle(wall[4], wall[5], wall[6], 100,  0x423f81)
				else
					DrawCircle3D(wall[1], wall[2], wall[3], 100, 2)
					DrawLine3D(wall[1],wall[2],wall[3],wall[4],wall[5],wall[6], 3)
					DrawCircle3D(wall[4], wall[5], wall[6], 100, 2)
				end
			end
			
			if(Menu.JumpSystem.InRangeSpot and n < 1000 and Menu.JumpSystem.jumpK) then 
				if(Menu.JumpSystem.drawType == 2) then	
					DrawCircle(wall[1], wall[2], wall[3], 100,  0x423f81)
					DrawLine3D(wall[1],wall[2],wall[3],wall[4],wall[5],wall[6], 3, RGB(66,63,129))
					DrawCircle(wall[4], wall[5], wall[6], 100,  0x423f81)
				else
					DrawCircle3D(wall[1], wall[2], wall[3], 100, 2)
					DrawLine3D(wall[1],wall[2],wall[3],wall[4],wall[5],wall[6], 3)
					DrawCircle3D(wall[4], wall[5], wall[6], 100, 2)
				end
			end
		end
	
	
end

function Jump()
	Jump_inrange = false
	if Menu.JumpSystem.jumpK == true and Jump_inrange == false then
		myHero:MoveTo(mousePos.x, mousePos.z)
		--myHero:MoveTo(drawThis.spot.x,drawThis.spot.z)
	end
	for _, wall in pairs(walls) do
		local n = ((mousePos.x-wall[1])^2+(mousePos.z-wall[3])^2)
		n = math.sqrt(math.round(n))
		if n <= 200 then
			Jump_inrange = true
			myHero:MoveTo(wall[1],wall[3])
		else
			Jump_inrange = false
		end
		if inRange(math.round(myHero.x), wall[1]) == true and inRange(math.round(myHero.z), wall[3]) == true then
			if Humain then
				CastSpell(_R)
				CastSpell(_W,wall[1],wall[3])
			else 
				CastSpell(_W,wall[1],wall[3])
			end
		end
	end
	for _, wall in pairs(walls) do
		local n = ((mousePos.x-wall[4])^2+(mousePos.z-wall[6])^2)
		n = math.sqrt(math.round(n))
		if n <= 200 then
			Jump_inrange = true
			myHero:MoveTo(wall[4],wall[6])
		else
			Jump_inrange = false
		end
		if inRange(math.round(myHero.x), wall[4]) == true and inRange(math.round(myHero.z), wall[6]) == true then
			if Humain then
				CastSpell(_R)
				CastSpell(_W,wall[1],wall[3])
			else 
				CastSpell(_W,wall[1],wall[3])
			end
			
		end
	end
end
function inRange(cmp1, cmp2, range)
	if not range then
		range = 20
	end
	if cmp1 >= cmp2-range and cmp1 <= cmp2+range then
		return true
	else
		return false
	end
end

function OnNewPath(unit, startPos, endPos, isDash, dashSpeed ,dashGravity, dashDistance)
	--if(myHero.hasMovePath) then
		-- if unit.isMe then
			 -- local f = endPos
			-- if GetDistance(unit, endPos) > 375 then
				 -- f = Vector(unit) + (Vector(endPos) - Vector(unit)):normalized() * (375)
			-- end
			-- if checkWall(f) then
				-- f = NearestNonWall(f.x, f.y, f.z, 400, 60)
				--myHero:MoveTo(f.x,f.z)
			-- end
			-- local e = Vector(f) + (Vector(unit) - Vector(f)):normalized() * (65)
			-- drawThis = {spot = f, start = Vector(unit.pos), name = "Pounce", time = os.clock(), endAdj = e}
			--myHero:MoveTo(f.x,f.z)
		-- end
	--end
end

--------------------------------------------- VIP Function ------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
if VIP_USER then
	function SkinLoad()
		Menu.skin:addParam('changeSkin', 'Change Skin', SCRIPT_PARAM_ONOFF, false)
		Menu.skin:setCallback('changeSkin', function(nV)
			if (nV) then
				SetSkin(myHero, Menu.skin.skinID)
			else
				SetSkin(myHero, -1)
			end
		end)
		Menu.skin:addParam('skinID', 'Skin', SCRIPT_PARAM_LIST, 1, {"Snow Bunny", "Leopard", "French Maid", "Pharaoh", "Bewitching", "Headhunter", "Warring Kingdoms", "ChallengerNidalee", "Original"})
		Menu.skin:setCallback('skinID', function(nV)
			if (Menu.skin.changeSkin) then
				SetSkin(myHero, nV)
			end
		end)
		
		if (Menu.skin.changeSkin) then
			SetSkin(myHero, Menu.skin.skinID)
		end
	end
	
end
--------------------------------------------- Basic Function ----------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
function OnProcessSpell(unit,spell)
        if unit.isMe and spell.name == "AspectOfTheCougar" then
                if Humain then
                        Humain = false
                else
                        Humain = true
                end
        end
end

function OnAnimation(unit, animation)
   if unit and animation and unit.isMe and animation:lower():find("attack") then
      lastAttack = GetTickCount() - GetLatency() * 0.5
      lastAttackCD = unit.spell.animationTime * 1000
   end
end

function OnUpdateBuff(unit, buff)
        if buff.name == "NidaleePassiveHunted" and unit and not unit.isMe then
                for i, Champ in pairs(Champ) do
                        if Champ == unit.charName then
                                Passive[i] = true
                                lastTime[i] = os.clock()
                        end            
                end
        end
end
 
function OnRemoveBuff(unit,buff)
        if buff.name == "nidaleepassivehunted" and unit and not unit.isMe then
                for i, Champ in pairs(Champ) do
                        if Champ == unit.charName then
                                Passive[i] = false
                        end            
                end
        end
end

function OnDraw()
	if(Menu.draws.DisRang == false) then
		if(Humain) then
			if(Menu.draws.DrawQ and Qready) then
				if(Menu.draws.drawType == 2) then
					DrawCircle(myHero.x, myHero.y, myHero.z, 1500, 0x111111)
				else
					DrawCircle3D(myHero.x, myHero.y, myHero.z, 1500, 2)
				end	
			end
			if(Menu.draws.DrawW and Wready) then
				if(Menu.draws.drawType == 2)then
					DrawCircle(myHero.x, myHero.y, myHero.z, 900, 0x111111)
				else
					DrawCircle3D(myHero.x, myHero.y, myHero.z, 900, 2)
				end	
			end
			if(Menu.draws.DrawE and Eready) then
				if(Menu.draws.drawType == 2)then
					DrawCircle(myHero.x, myHero.y, myHero.z, 600, 0x111111)
				else
					DrawCircle3D(myHero.x, myHero.y, myHero.z, 600, 2)
				end	
			end
		else
			if(Menu.draws.DrawrWR and Wready) then
				if(Menu.draws.drawType == 2)then
					DrawCircle(myHero.x, myHero.y, myHero.z, 375, 0x111111)
				else
					DrawCircle3D(myHero.x, myHero.y, myHero.z, 375, 2)
				end	
			end
			if(Menu.draws.DrawrER and Eready) then
				if(Menu.draws.drawType == 2)then
					DrawCircle(myHero.x, myHero.y, myHero.z, 300, 0x111111)
				else
					DrawCircle3D(myHero.x, myHero.y, myHero.z, 300, 2)
				end	
			end
		end
	end
	MultiformtrackerDraw()	
	DrawJumpSpot()
	DrawLifeBar()
end

	 --local p4 = Vector(4768.71,93.89,2571.65)
	 --local p5 = Vector(4799.94,94.56,2005.05)

--local firstone = 0
function OnTick()
	ts:update()
	Checks()
	CDCheck()
	combo()
	harass()
	TryToRun()
	AutoHeal()
	jungleClear()
	target = ts.target
	MultiformtrackerDraw()
	KillSteal()
	JungleSteal()
   if Menu.JumpSystem.jumpK == true then
		Jump()
		DrawJumpSpot()
	
	end
	
	-- DelayAction(function()
		 -- posA = GetIntersection(p4,p5,myHero.pos,myHero.endPath)
	
		 -- if posA~= false and posA~=nil and firstone == 0 and Wready and not Humain then
			 -- myHero:MoveTo(posA.x,posA.z)
			 -- posA = nil
			 -- firstone = 2
		 -- end
	-- end,10)	
	-- if(not myHero.hasMovePath and firstone == 2) then
		 -- CastSpell(_W, mousePos.x , mousePos.z)
		 -- myHero:MoveTo(mousePos.x , mousePos.z)
		 
		 -- posA = nil
		 -- firstone = 0
		-- end  
	
end 


function OnLoad()
 --UPL FIN
	if not _G.UPLloaded then
	  if FileExist(LIB_PATH .. "/UPL.lua") then
		require("UPL")
		UPL = UPL()
	  else 
		SendMsg("Downloading UPL, please don't press F9")
		DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000), LIB_PATH.."UPL.lua", function () SendMsg("Successfully downloaded UPL. Press F9 twice") end) end, 3) 
		return
	  end
	end
--UPL FIN
	AutoUpdater()
	Variables()
	DownloadSprites()
	LoadSprites()
	DrawMenu()
	Menu.TargetSelector:addTS(ts)
	LoadTableOrbs()
	LoadOrb()
	if VIP_USER then 
		SkinLoad() 
	end
end

function OnUnload()
	if not Humain then
		CastSpell(_R)
	end
end




if myHero.charName ~= "Nidalee" then return end
require 'VPrediction'
local Cougar = false
local Humain = true
lastAttack = 0
lastAttackCD = 0

local OrbWalkers = {}
local LoadedOrb = nil
local VP = VPrediction()
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
local VARS = 	
{
	Q 	= 	{range = 1400, delay = 0.25, width = 37.5, speed = 1325},
	W 	= 	{range = 900, delay = 0.500, width = 80, speed = 1450},
	E 	= 	{range = 600},
	CW 	= 	{range = 375},
	HW 	= 	{range = 750},
	CE 	= 	{range = 300}
}

function OnLoad()
	Last_LevelSpell = 0
   	ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL)
   	UPL:AddSpell(_Q, {speed = VARS.Q.speed, delay = VARS.Q.delay, range = VARS.Q.range, width = VARS.Q.width, collision = true, aoe = false, type = "linear"})
    UPL:AddSpell(_W, {speed = VARS.W.speed, delay = VARS.W.delay, range = VARS.W.range, width = VARS.W.width, collision = false, aoe = false, type = "cone"})
   	enemyMinions = minionManager(MINION_ENEMY, 1000, myHero, MINION_SORT_MAXHEALTH_ASC)
   	jungleMinions = minionManager(MINION_JUNGLE, 1400, myHero, MINION_SORT_MAXHEALTH_DEC)
   	DrawMenu()
   	if VIP_USER then 
		SkinLoad() 
		CheckAutoLvl()
		AutoLvlUp()
	end
   	Menu:addTS(ts)
   LoadTableOrbs()
   LoadOrb()
   AutoUpdater()
   
end
function DrawMenu()
    Menu = scriptConfig("Skizophrenic Nidalee", "Skizophrenic")
	
    Menu:addSubMenu("Combo", "comboM")
		Menu.comboM:addSubMenu("HumanCombo", "humancombo")
		Menu.comboM.humancombo:addParam("usehq", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM.humancombo:addParam("usehw", "Use W", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM:addSubMenu("CougarCombo", "cougarcombo")
		Menu.comboM.cougarcombo:addParam("usecq", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM.cougarcombo:addParam("usecw", "Use W", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM.cougarcombo:addParam("usece", "Use E", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM:addParam("useR", "Use R in combo", SCRIPT_PARAM_ONOFF, true)
		Menu.comboM:addParam("autocougar", "Switch to Cougar if target is Hunted", SCRIPT_PARAM_ONOFF, true)
    Menu:addSubMenu("Harass Mode", "harass")
		Menu.harass:addParam("harassILC", "Harass with lane clear Key", SCRIPT_PARAM_ONOFF, false)
	UPL:AddToMenu(Menu, "Predictions")
    Menu:addSubMenu("LaneClear/JungleClear", "farm")
	Menu.farm:addSubMenu("JungleClear", "Jfarm")
		Menu.farm.Jfarm:addParam("blank", "---------Human---------", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Jfarm:addParam("Qinjungle","Use Human Q", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("Winjungle","Use Human W", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("Einjungle","Use Human E", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("blank", "---------Cougar---------", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Jfarm:addParam("RQinjungle","Use Cougar Q", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("RWinjungle","Use Cougar W", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("REinjungle","Use Cougar E", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Jfarm:addParam("blank", "<-------------------->", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Jfarm:addParam("Rinjungle","Use R", SCRIPT_PARAM_ONOFF,true)
	Menu.farm:addSubMenu("LaneClear", "Lfarm")
		Menu.farm.Lfarm:addParam("blank", "---------Human---------", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Lfarm:addParam("QinLane","Use Human Q", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Lfarm:addParam("blank", "---------Cougar---------", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Lfarm:addParam("RQinLane","Use Cougar Q", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Lfarm:addParam("RWinLane","Use Cougar W", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Lfarm:addParam("REinLane","Use Cougar E", SCRIPT_PARAM_ONOFF,true)
		Menu.farm.Lfarm:addParam("blank", "<-------------------->", SCRIPT_PARAM_INFO, " ")
		Menu.farm.Lfarm:addParam("RinLane","Use R", SCRIPT_PARAM_ONOFF,true)
   
   Menu:addSubMenu("Auto Heal", "autoH")
	 Menu.autoH:addParam("", "-------Self Heal-------", SCRIPT_PARAM_INFO, "")
	 Menu.autoH:addParam("activeAutoH","Auto heal when low hp", SCRIPT_PARAM_ONOFF,true)
	 Menu.autoH:addParam("autoR","Change Form for heal", SCRIPT_PARAM_ONOFF,true)
	 Menu.autoH:addParam("hp", "Heal if hp under -> %", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
	 Menu.autoH:addParam("", "------Ally Heal------", SCRIPT_PARAM_INFO, "")
	 Menu.autoH:addParam("activeAllyAutoH","Auto heal ally", SCRIPT_PARAM_ONOFF,false)
	 for _, option in ipairs(GetAllyHeroes()) do 
				Menu.autoH:addParam(option.charName, "" .. option.charName, SCRIPT_PARAM_ONOFF, true)
	 end
	 Menu.autoH:addParam("hpAlly", "Heal ally if hp under -> %", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
    Menu:addSubMenu("Draws Settings", "draws")
      Menu.draws:addParam("DisRang", "Disable All Range Draw", SCRIPT_PARAM_ONOFF, false) 
	  Menu.draws:addParam("blank", "	Human Form", SCRIPT_PARAM_INFO, " ")
	  Menu.draws:addParam("DrawQ", "Draw Q Rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("DrawW", "Draw W rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("DrawE", "Draw E rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("blank", "	Cougar Form", SCRIPT_PARAM_INFO, " ")
	  Menu.draws:addParam("DrawrWR", "Draw Cougar W Rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("DrawrER", "Draw Cougar E Rang", SCRIPT_PARAM_ONOFF, true)
	Menu:addSubMenu("Mana Manager", "Mana")
	Menu.Mana:addParam("", "<------Harass------>", SCRIPT_PARAM_INFO, "")
	Menu.Mana:addParam("HarassQ", "Mana to use Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	Menu.Mana:addParam("", "<------Heal------>", SCRIPT_PARAM_INFO, "")
	Menu.Mana:addParam("SelfHeal", "Mana to self auto heal", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
	Menu.Mana:addParam("AllyHeal", "Mana to ally auto heal", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
	Menu.Mana:addParam("", "<------Jungle Clear------>", SCRIPT_PARAM_INFO, "")
	Menu.Mana:addParam("JungleClear", "Mana to jungle with humain form", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
	
    if VIP_USER then
    Menu:addSubMenu("Skin Changer", "skin")
	Menu:addSubMenu("Auto Leveler", "AutoLvL")
    Menu.AutoLvL:addParam("lvlOn", "Use Auto Leveler", SCRIPT_PARAM_ONOFF, false)
 	Menu.AutoLvL:addParam("lvlMode", "Mode", SCRIPT_PARAM_LIST, 2, {"Q>W>E", "Q>E>W", "E>Q>W", "E>W>Q"})
 	Menu.AutoLvL.Enable = false
 	end
    
	Menu:addParam("info1", "", SCRIPT_PARAM_INFO, "")
	Menu:addParam("author", "Author:", SCRIPT_PARAM_INFO, "Mr-Skizo")
	
end

function Checks()
	ts:update()
	jungleMinions:update()
	enemyMinions:update()
	Qready = (myHero:CanUseSpell(_Q) == READY)
	Wready = (myHero:CanUseSpell(_W) == READY)
	Eready = (myHero:CanUseSpell(_E) == READY)
	Rready = (myHero:CanUseSpell(_R) == READY)
	target = ts.target
end

function OnTick()
   Checks()
   formChek()
   combo()
   harass()
   TryToRun()
   AutoHeal()
   jungleClear()
end 
function formChek()
	if myHero:GetSpellData(_Q).name == "Takedown" or myHero:GetSpellData(_W).name == "Pounce" or myHero:GetSpellData(_E).name == "Swipe" then
		Cougar 	= true
		Humain 	= false
	end
	if myHero:GetSpellData(_Q).name == "JavelinToss" or myHero:GetSpellData(_W).name == "Bushwhack" or myHero:GetSpellData(_E).name == "PrimalSurge" then
		Cougar 	= false 
		Humain 	= true
	end
end
function TryToRun()
	if Menu.keyConfig.runK then
			myHero:MoveTo(mousePos.x, mousePos.z)
		if Humain and myHero:CanUseSpell(_R) then
			CastSpell(_R)
		end
		CastSpell(_W, mousePos.x, mousePos.z)
	end
end
function AutoHeal()
	if CountEnemyHeroInRange(1500) > 0 then
		if not Cougar then
			if Menu.autoH.activeAutoH and myHero:CanUseSpell(_E) and myHero.health <= (myHero.maxHealth * Menu.autoH.hp / 100) and myHero.mana >= (myHero.maxMana * Menu.Mana.SelfHeal / 100) then
				CastSpell(_E)
			end
		elseif myHero:CanUseSpell(_R) and Menu.autoH.autoR and Menu.autoH.activeAutoH and myHero.health <= (myHero.maxHealth * Menu.autoH.hp / 100) and myHero.mana >= (myHero.maxMana * Menu.Mana.SelfHeal / 100) then
			CastSpell(_R)
			CastSpell(_E)
		end
		if Menu.autoH.activeAllyAutoH then 
			local allys = GetAllyHeroes()
			for _, h in pairs(allys) do
				if h and not h.isMe and h.team == myHero.team and h.visible and not h.dead and h.health > 0 and GetDistance(h.pos, myHero.pos) < 600 and h.health < (h.maxHealth * Menu.autoH.hpAlly / 100) then
					if Menu.autoH[h.charName] and myHero.mana >= (myHero.maxMana * Menu.Mana.AllyHeal / 100) then
						CastSpell(_E,h)
					end
					
				end
			end
		end
	end

end
function CountEnemyHeroInRange(range, object)
    object = object or myHero
    range = range and range * range or myHero.range * myHero.range
    local enemyInRange = 0
    for i = 1, heroManager.iCount, 1 do
        local hero = heroManager:getHero(i)
        if ValidTarget(hero) and GetDistanceSqr(object, hero) <= range then
            enemyInRange = enemyInRange + 1
        end
    end
    return enemyInRange
end
function OnDraw()
	if(Menu.draws.DisRang == false) then
		if(Humain) then
			if(Menu.draws.DrawQ and (myHero:CanUseSpell(_Q) == READY)) then
				DrawCircle(myHero.x, myHero.y, myHero.z, 1500, 0x111111)
			end
			if(Menu.draws.DrawW and (myHero:CanUseSpell(_W) == READY)) then
				DrawCircle(myHero.x, myHero.y, myHero.z, 900, 0x111111)
			end
			if(Menu.draws.DrawE and (myHero:CanUseSpell(_E) == READY)) then
				DrawCircle(myHero.x, myHero.y, myHero.z, 600, 0x111111)
			end
		end
		if(Cougar) then
			if(Menu.draws.DrawrWR and (myHero:CanUseSpell(_W) == READY)) then
				DrawCircle(myHero.x, myHero.y, myHero.z, 375, 0x111111)
			end
			if(Menu.draws.DrawrER and (myHero:CanUseSpell(_E) == READY)) then
				DrawCircle(myHero.x, myHero.y, myHero.z, 300, 0x111111)
			end
		end
	end
		
end
function OnAnimation(unit, animation)
   if unit and animation and unit.isMe and animation:lower():find("attack") then
      lastAttack = GetTickCount() - GetLatency() * 0.5
      lastAttackCD = unit.spell.animationTime * 1000
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
  Menu:addSubMenu("Orbwalkers", "Orbwalkers")
  Menu:addSubMenu("Key Config", "keyConfig")
  Menu.Orbwalkers:addParam("Orbwalker", "OrbWalker", SCRIPT_PARAM_LIST, 1, OrbWalkers)
  Menu.keyConfig:addParam("runK", "Run Away", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Q"))
  Menu.keyConfig:addParam("info", "Detecting others keys from: "..OrbWalkers[Menu.Orbwalkers.Orbwalker], SCRIPT_PARAM_INFO, "")
  local OrbAlr = false
    Menu.Orbwalkers:setCallback("Orbwalker", function(value) 
    if OrbAlr then return end
    OrbAlr = true
	Menu.Orbwalkers:addParam("info", "Press F9 2x to load your selected Orbwalker.", SCRIPT_PARAM_INFO, "")
    SendMsg("Press F9 2x to load your selected Orbwalker")
    end)
  end
end 

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

function SendMsg(msg)
  PrintChat("Schizophrenic Nidalee<font color=\"#C2FDF3\"><b> "..msg..".</b></font>")
end
function CanAA()
   return (GetTickCount() + GetLatency() * 0.5 > lastAttack + lastAttackCD)
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
---------------------------------------------AUTO AUPDATE -------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
local version = 0.01
local author = "Mr-Skizo"
local SCRIPT_NAME = "SkizophrenicNidalee"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.githubusercontent.com"
local UPDATE_PATH = "/Mr-Skizo/Skizophrenic/master/SkizophrenicNidalee.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
function AutoUpdater()
	local ServerData = GetWebResult(UPDATE_HOST, "/Mr-Skizo/Skizophrenic/master/Nidalee.version")
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
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
function TargetHunted(unit)
 return TargetHaveBuff('nidaleepassivehunted', unit)
end
function HowManyHpEgive()
	Ehp = {45,85 ,125 ,165 ,205}
	Elvl = myHero:GetSpellData(_E).level
	addAp = (myHero.ap * 50 ) / 100
	return (Ehp[Elvl] + addAp)
end
function jungleClear()
	if Keys() == "Laneclear" then
	---------------LANE CLEAR 
		if Menu.harass.harassILC then
			harass()
		end
		for _, minion in pairs(enemyMinions.objects) do
		  distance = GetDistanceSqr(minion)
			
			if ValidTarget(minion, 1000) then
				if Qready and Menu.farm.Lfarm.QinLane and Humain then
					CastRQ(minion)
				end
				if Rready and Menu.farm.Lfarm.RinLane and not Qready then
					CastSpell(_R)
				end
				if Cougar and Qready and Menu.farm.Lfarm.RQinLane then
					CastRQ(minion)
				end
				if Cougar and Wready and Menu.farm.Lfarm.RWinLane then
					if not TargetHunted(minion) then
						if distance < VARS.CW.range * VARS.CW.range then
							CastRW(minion)
						end
					else
						if distance < VARS.HW.range * VARS.HW.range then
							CastRW(minion)
						end
					end
				end
				if Cougar and Eready and Menu.farm.Lfarm.REinLane then
					if distance < VARS.CE.range * VARS.CE.range then
						CastRE(minion)
						
					end
				end
			end
		end
	---------------Jungle CLEAR	
		for _, jminion in pairs(jungleMinions.objects) do
			distance = GetDistanceSqr(jminion)
			
			if ValidTarget(jminion, 1000) then
				if Qready and Menu.farm.Jfarm.Qinjungle and Humain and myHero.mana >= (myHero.maxMana * Menu.Mana.JungleClear / 100) then
					CastRQ(jminion)
				end
				if Wready and Menu.farm.Jfarm.Winjungle and Humain and myHero.mana >= (myHero.maxMana * Menu.Mana.JungleClear / 100) then
					CastRW(jminion)
				end
				if Eready and Menu.farm.Jfarm.Einjungle and Humain and myHero.health <= (myHero.maxHealth - HowManyHpEgive()) and myHero.mana >= (myHero.maxMana * Menu.Mana.JungleClear / 100)then
					CastSpell(_E)
				end
				if Rready and Menu.farm.Jfarm.Rinjungle  then
					if myHero.mana >= (myHero.maxMana * Menu.Mana.JungleClear / 100) then
						
						CastSpell(_R)
					elseif Humain then
						
						CastSpell(_R)
					end
						
				end
				if Cougar and Qready and Menu.farm.Jfarm.RQinjungle then
					CastRQ(jminion)
				end
				if Cougar and Wready and Menu.farm.Jfarm.RWinjungle then
					if not TargetHunted(jminion) then
						if distance < VARS.CW.range * VARS.CW.range then
							CastRW(jminion)
						end
					else
						if distance < VARS.HW.range * VARS.HW.range then
							CastRW(jminion)
						end
					end
				end
				if Cougar and Eready and Menu.farm.Jfarm.REinjungle then
					if distance < VARS.CE.range * VARS.CE.range then
						CastRE(jminion)
						
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
function OnProcessAttack(unit, spell)
   if unit and spell and unit.isMe and spell.name:lower():find("attack") then
      return false
   else
	return true
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
function CastQ(unit)
  	Pos, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
	if HitChance > 0 then
  		CastSpell(_Q, Pos.x, Pos.z)
  	end
end
function CastW(unit)
  	Pos, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
	if HitChance > 0 then
  		CastSpell(_W, Pos.x, Pos.z)
  	end
end
function CastRQ(unit)
  	local CastPosition,  HitChance = VP:GetLineCastPosition(unit, VARS.Q.delay, VARS.Q.width, VARS.Q.range, VARS.Q.speed, myHero, true)
  		CastSpell(_Q, CastPosition.x, CastPosition.z)
end
function CastRW(unit)
	if TargetHunted(unit) then
		
		local CastPosition,  HitChance = VP:GetLineCastPosition(unit, VARS.W.delay, VARS.W.width, VARS.HW.range, VARS.W.speed, myHero, true)
		if HitChance > 1.25 then
			CastSpell(_W, CastPosition.x, CastPosition.z)
		end
	else 
		local CastPosition,  HitChance = VP:GetLineCastPosition(unit, VARS.W.delay, VARS.W.width, VARS.W.range, VARS.W.speed, myHero, true)
		if HitChance > 1.25 then
			CastSpell(_W, CastPosition.x, CastPosition.z)
		end
	end
end
function CastRE(unit)
  	local CastPosition,  HitChance = VP:GetLineCastPosition(unit, VARS.W.delay, VARS.W.width, VARS.W.range, VARS.W.speed, myHero, true)
	if HitChance > 1.25 then
		
  		CastSpell(_E, CastPosition.x, CastPosition.z)
  	end
  
end
function OnUnload()
	if Cougar then
		CastSpell(_R)
	end
end
if VIP_USER then
function SkinLoad()
    Menu.skin:addParam('changeSkin', 'Change Skin', SCRIPT_PARAM_ONOFF, false);
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
function AutoLvlUp()
	if Menu.AutoLvL.lvlOn then
		
 		SequenceLevel = {
 		[1] = {1,2,3,1,1,4,2,1,2,3,4,1,2,3,2,4,3,3},
 		[2] = {1,3,2,1,1,4,3,1,3,2,4,1,3,2,3,4,2,2},
 		[3] = {3,1,2,3,3,4,1,3,1,2,4,3,1,2,1,4,2,2},
 		[4] = {3,2,1,3,3,4,2,3,2,1,4,3,2,1,2,4,1,1},
 		}
 		AddTickCallback(function()
			
 			if Menu.AutoLvL.lvlOn and os.clock() - Last_LevelSpell > 0.5 then
			  autoLevelSetSequence(SequenceLevel[Menu.AutoLvL.lvlMode])
			  Last_LevelSpell = os.clock()  
			elseif not Menu.AutoLvL.lvlOn then
				autoLevelSetSequence(nil)
			end
			
 		end)

	end
end
function CheckAutoLvl()
	_G.GetHeroLeveled = function()
		return player:GetSpellData(SPELL_1).level + player:GetSpellData(SPELL_2).level + player:GetSpellData(SPELL_3).level + player:GetSpellData(SPELL_4).level-1
	end
	_G.LevelSpell = function(id)
	if (string.find(GetGameVersion(), 'Releases/6.5') ~= nil) and Menu.AutoLvL.lvlOn then
		local offsets = { 
		  [_Q] = 0x56,
		  [_W] = 0x17,
		  [_E] = 0x42,
		  [_R] = 0x6D,
		}
		local p = CLoLPacket(0x007A)
		  p.vTable = 0xEF9B8C
		  p:EncodeF(myHero.networkID)
		  p:Encode4(0x03)
		  p:Encode4(0x1C)
		  p:Encode4(0x07)
		  p:Encode1(0x75)
		  p:Encode1(offsets[id])
		  SendPacket(p)
	end
  end
  
end
end
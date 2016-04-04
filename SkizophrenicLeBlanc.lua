--[[
version = 0.02
author = "Mr-Skizo"
SCRIPT_NAME = "SkizophrenicLeBlanc"
]]
 
if myHero.charName ~= "Leblanc" then return end

--------------------------------------------- Auto Update -------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
local version = 0.02
local author = "Mr-Skizo"
local last_update = "04/04/2016"

function AutoUpdater()
	
	local AUTOUPDATE = true
	if(AUTOUPDATE) then
		local UPDATE_HOST = "raw.githubusercontent.com"
		local UPDATE_PATH = "/Mr-Skizo/Skizophrenic/master/SkizophrenicLeBlanc.lua".."?rand="..math.random(1,10000)
		local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
		local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
		local ServerData = GetWebResult(UPDATE_HOST, "/Mr-Skizo/Skizophrenic/master/Leblanc.version.txt")
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

--assert(load(Base64Decode("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"), nil, "bt", _ENV))()
--TrackerLoad("fVt2gRlTLGR2baWz")

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
local Rspell = 'Q'
local CanIBack = false
local CanIBackM = false
function Variables()
	lastAttack = 0
	lastAttackCD = 0
	Last_LevelSpell = 0
	VARS = 	
	{	Q 	= 	{range = 700},
		W 	= 	{range = 600, width = 250, speed = 1450, delay = 0.25},
		E 	= 	{range = 950, width = 55, speed= 1750, delay = 0.25}	
	}
    Champ = { }
    Passive = { }
    lastTime = { }
    myEnemyTable = GetEnemyHeroes()
    for i, enemy in pairs(myEnemyTable) do
        Champ[i] = enemy.charName
    end
   	
	myEnemyTable = GetEnemyHeroes()
	enemyMinions = minionManager(MINION_ENEMY, 1000, myHero, MINION_SORT_MAXHEALTH_ASC)
   	jungleMinions = minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_MAXHEALTH_DEC)
	
	UPL:AddSpell(_E, {speed = VARS.E.speed, delay = VARS.E.delay, range = VARS.E.range, width = VARS.E.width, collision = true, aoe = false, type = "linear"})
    UPL:AddSpell(_W, {speed = VARS.W.speed, delay = VARS.W.delay, range = VARS.W.range, width = VARS.W.width, collision = false, aoe = false, type = "circular"})
   	
	ts = TargetSelector(TARGET_LOW_HP, 1800, DAMAGE_MAGICAL, false, true)
	target = ts.target
	
end


--------------------------------------------- Menu Function --------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

function DrawMenu()
    Menu = scriptConfig("Skizophrenic LeBlanc", "Skizophrenic")
	
    Menu:addSubMenu("> Combo", "combo")
	  Menu.combo:addParam('comboM', 'Combo Mode', SCRIPT_PARAM_LIST, 4, {"Q>R>W>E", "Q>W>R>E","Q>W>E>R","Smart"})
	  Menu.combo:addParam("doublechaine", "Force Double E", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
	  Menu.combo:addParam("doublezed", "Force Double Z", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Menu:addSubMenu("> Harass Mode", "harass")
	 Menu.harass:addParam("harassQ","Use Q", SCRIPT_PARAM_ONOFF,true)
	 Menu.harass:addParam("harassW","Use W", SCRIPT_PARAM_ONOFF,true)
	 Menu.harass:addParam("harassW2","Back to W pos", SCRIPT_PARAM_ONOFF,true)
	UPL:AddToMenu(Menu, "> Predictions")
    Menu:addSubMenu("> TargetSelector", "TargetSelector")
	Menu:addSubMenu("> LaneClear/JungleClear", "farm")
	Menu.farm:addSubMenu("> JungleClear", "Jfarm")
	 Menu.farm.Jfarm:addParam("Qinjungle","Use Q", SCRIPT_PARAM_ONOFF,true)
	 Menu.farm.Jfarm:addParam("Winjungle","Use W", SCRIPT_PARAM_ONOFF,true)
	 Menu.farm.Jfarm:addParam("Einjungle","Use E", SCRIPT_PARAM_ONOFF,true)	
	Menu.farm:addSubMenu("> LaneClear", "Lfarm")
	 Menu.farm.Lfarm:addParam("Qinlane","Use Q", SCRIPT_PARAM_ONOFF,false)
	 Menu.farm.Lfarm:addParam("Winlane","Use W", SCRIPT_PARAM_ONOFF,false)
	 Menu.farm.Lfarm:addParam("Einlane","Use E", SCRIPT_PARAM_ONOFF,false)
    Menu:addSubMenu("> Draws Settings", "draws")
      Menu.draws:addParam("DisRang", "Disable All Range Draw", SCRIPT_PARAM_ONOFF, false) 
	  Menu.draws:addParam("DrawQ", "Draw Q Rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("DrawW", "Draw W rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam("DrawE", "Draw E rang", SCRIPT_PARAM_ONOFF, true)
	  Menu.draws:addParam('drawType', 'Draw Type', SCRIPT_PARAM_LIST, 2, {"Lag Free", "Normal"})		
	Menu:addSubMenu("> Damage Draw","dmgdraw")
		Menu.dmgdraw:addParam("drawit", "Draw dmg in hp bar", SCRIPT_PARAM_ONOFF, true)
	Menu:addSubMenu("> Steal","Steal")
		Menu.Steal:addParam("KillSteal", "Kill Steal", SCRIPT_PARAM_ONOFF, false)
		Menu.Steal:addParam("JungleSteal", "Jungle Steal", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
	
    if VIP_USER then
    Menu:addSubMenu("> Skin Changer", "skin")
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
	if(myHero:CanUseSpell(_Q) == READY and myHero:GetSpellData(_Q).level >= 1) then
		Qready = true
	else
		Qready = false
	end	
	if(myHero:CanUseSpell(_W) == READY and myHero:GetSpellData(_W).level >= 1) then
		Wready = true
	else 
		Wready = false
	end
	if(myHero:CanUseSpell(_E) == READY and myHero:GetSpellData(_E).level >= 1) then
		Eready = true
	else
		Eready = false
	end
	if(myHero:CanUseSpell(_R) == READY and myHero:GetSpellData(_R).level >= 1) then
		Rready = true
	else
		Rready = false
	end	
	enemyMinions:update()
    jungleMinions:update()
	
end

function SendMsg(msg)
  PrintChat("Schizophrenic LeBlanc: <font color=\"#C2FDF3\"><b> "..msg..".</b></font>")
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
function CountAllyHeroInRange(range, object)
    local object = object or myHero
    local range = range and range * range or myHero.range * myHero.range
    local AllyInRange = 0
    for i = 1, heroManager.iCount, 1 do
        local hero = heroManager:getHero(i)
        if hero.team == myHero.team and GetDistanceSqr(object, hero) <= range and not hero.isMe then
            AllyInRange = AllyInRange + 1
        end
    end
    return AllyInRange
end
function CastQ(unit)
  		CastSpell(_Q, unit)
end
function CastW(unit)
  	local Pos, HitChance, HeroPosition = UPL:Predict(_W, myHero, unit)
	if HitChance > 0 then
  		CastSpell(_W, Pos.x, Pos.z)
	end
end
function CastE(unit)
  	local Pos, HitChance, HeroPosition = UPL:Predict(_E, myHero, unit)
	if HitChance > 0 then
  		CastSpell(_E, Pos.x, Pos.z)
  	end
end
function CastR(unit)
	if(Rspell == 'Q') then
		CastSpell(_R, unit)
	elseif(Rspell == 'W' and not CanIBackM) then
		local Pos, HitChance, HeroPosition = UPL:Predict(_W, myHero, unit)
		if HitChance > 0 then
			CastSpell(_R, Pos.x, Pos.z)
		end
		
	elseif(Rspell == 'E') then
		local Pos, HitChance, HeroPosition = UPL:Predict(_E, myHero, unit)
		if HitChance > 0 then
			CastSpell(_R, Pos.x, Pos.z)
		end	
	end
end

function CastSpel(unit,Spell)
	if(Spell == 'Q') then
		CastQ(unit)
	end
	if(Spell == 'W' and not CanIBack) then
		CastW(unit)
	end
	if(Spell == 'E') then
		CastE(unit)
	end
	if(Spell == 'R') then
		CastR(unit)
	end
end

function TargetMarked(unit)
        for i, Champ in pairs(Champ) do
                if Champ == unit.charName then
                        return Passive[i]
                end
        end
end


function Qdmg(unit)
	QTdmg = getDmg("Q", unit, myHero)
	if TargetMarked(unit) then
		QTdmg = QTdmg*2
	end
	return QTdmg
end
function Wdmg(unit)
	WTdmg = getDmg("W", unit, myHero)
	return WTdmg
end
function Edmg(unit)
	ETdmg = getDmg("E", unit, myHero)
	return ETdmg
end
function GetUltimateDamage(unit, Rspell)
	RTdmg = 0
	Rlvl = myHero:GetSpellData(_R).level
	if(Rspell == 'Q') then
		Rdmg = {100, 200, 300}
		RTdmg = Rdmg[Rlvl] + (myHero.ap * 60 ) / 100
		if TargetMarked(unit) then
			RTdmg = RTdmg*2
		end
	elseif(Rspell == 'W') then
		Rdmg = {150, 300, 450}
		RTdmg = Rdmg[Rlvl] + (myHero.ap * 90 ) / 100
		
	elseif(Rspell == 'E') then
		Rdmg = {100, 200, 300}
		RTdmg = Rdmg[Rlvl] + (myHero.ap * 60 ) / 100	
	end
	--SendMsg(RTdmg)
	return RTdmg
end
function GetComboDmg(unit)
	TTdmg = 0
	if ValidTarget(unit) then
        if(Qready) then
			TTdmg = TTdmg + Qdmg(unit)
		end	
		if(Wready) then
			TTdmg = TTdmg + Wdmg(unit)
		end
		if(Eready) then
			TTdmg = TTdmg + Edmg(unit)
		end
		if(Rready) then
			RTdmg =  GetUltimateDamage(unit, Rspell)
			TTdmg = TTdmg + RTdmg
		end
			
	end
	--SendMsg(TTdmg)
	return TTdmg
end
function IsKillable(unit)
	if unit.health <= (GetComboDmg(unit)  + 100) then
		return true
	end
	return false
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

function BestCombo(unit)
	if GetDistance(unit) <= VARS.Q.range + VARS.W.range and GetDistance(unit) > VARS.Q.range then
		if unit.health < Qdmg(unit)+ GetUltimateDamage(unit,'Q') + Edmg(unit) then
			return {'W','Q','R','E'}
		end
	elseif GetDistance(unit) <= VARS.Q.range and GetDistance(unit) > VARS.W.range then
		if unit.health < Qdmg(unit) + GetUltimateDamage(unit,'Q') + Edmg(unit) then
			return {'Q','R','W','E'}
		end
	elseif GetDistance(unit) <= VARS.W.range then
		if unit.health < Qdmg(unit) + GetUltimateDamage(unit,'Q') + Edmg(unit) + Wdmg(unit) then
			return {'Q','R','W','E'}
		elseif  unit.health < Qdmg(unit) + GetUltimateDamage(unit,'W') + Edmg(unit) + Wdmg(unit) then
			return {'Q','W','R','E'}
		end
	end
	return nil
end

--------------------------------------------- Feature Function --------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
function TryToRun()
	if Menu.Keys.Flee and not CanIBack then
		myHero:MoveTo(mousePos.x, mousePos.z)
		CastSpell(_W, mousePos.x, mousePos.z)
	end
end

function combo()
	if not target then return end
	if Keys() == "Combo" then
		if Menu.combo.comboM == 1 and ValidTarget(target, VARS.Q.range) and target and GetDistance(target) <= VARS.Q.range then
			if Qready then
				CastQ(target)
			end
			if Rready and Rspell == 'Q' then
				CastR(target)
			end
			if Wready  and not CanIBack then
				CastW(target)
			end
			if Eready then
				CastE(target)
			end
		end
		if Menu.combo.comboM == 2 and ValidTarget(target, VARS.W.range) and target and GetDistance(target) <= VARS.W.range then
			if Qready then
				CastQ(target)
			end
			if Wready  and not CanIBack then
				CastW(target)
			end
			if Rready and Rspell == 'W' then
				CastR(target)
			end
			if Eready then
				CastE(target)
			end
		end
		if Menu.combo.comboM == 3 and ValidTarget(target, VARS.W.range) and target and GetDistance(target) <= VARS.W.range then
			if Qready then
				CastQ(target)
			end
			if Wready  and not CanIBack then
				CastW(target)
			end
			if Eready then
				CastE(target)
			end
			if Rready and Rspell == 'E' then
				CastR(target)
			end
		end		
		if Menu.combo.comboM == 4 then
			if(IsKillable(target) and GetDistance(target) < VARS.W.range) then
					CastQ(target)
					if not CanIBack then
						CastW(target)
					end
					CastE(target)
				end
			if not Rready and target then
				if(IsKillable(target) and GetDistance(target) < VARS.W.range) then
					CastQ(target)
					if not CanIBack then
						CastW(target)
					end
					CastE(target)
				end
				if(CountAllyHeroInRange(1600) >= 1 ) then 
					if(not IsKillable(target)) then
						if GetDistance(target) < VARS.W.range + VARS.E.range and not CanIBack and Wready and Eready then
							CastSpell(_W, target)
							CastE(target)
							if(Qready) then
								CastQ(target)
							end
						end
						if Eready and GetDistance(target) < VARS.E.range then
							if(Qready) then
								CastQ(target)
							end
							if(Wready) and not CanIBack then
								CastW(target)
							end
							CastE(target)					
						end	
					end
				elseif not IsKillable(target) then
					if(GetDistance(target) <= VARS.W.range) then
						if(Qready) then
							CastQ(target)
						end
						if Wready and not CanIBack then
							CastW(target)
							CastE(target)
						end
					end
				end
			end
			if Rready  and not CanIBack and target then
				sequence = BestCombo(target)
				if(sequence) then
					for i, spell in pairs(sequence) do
						CastSpel(target,spell)
					end
				elseif CountAllyHeroInRange(1600,target) >= 1 and GetDistance(target) <= VARS.W.range + VARS.E.range and GetDistance(target) > VARS.W.range then
					sequence = {'W','Q','E','R'}
					for i, spell in pairs(sequence) do
						CastSpel(target,spell)
					end
				elseif GetDistance(target) <= VARS.W.range then
					sequence = {'Q','W','R','E'}
					for i, spell in pairs(sequence) do
						CastSpel(target,spell)
					end
				end
			end
		
		end
	end
	
end

function DrawLifeBar()
	if Menu.dmgdraw.drawit then
        for i, unit in pairs(myEnemyTable) do
            if ValidTarget(unit) and GetDistance(unit) <= 2500 then
				DrawLineHPBar(GetComboDmg(unit),"", unit, true)	
            end
		
        end
    end
end

function KillSteal()
        if Menu.Steal.KillSteal then
                for i, unit in pairs(myEnemyTable) do
                        if Qready and GetDistance(unit) <VARS.Q.range and ValidTarget(unit) and unit.health <= Qdmg(unit) then
                            CastQ(unit)
						end
						if Wready and GetDistance(unit) <= VARS.W.range and ValidTarget(unit) and unit.health <= Wdmg(unit) then
							CastW(unit)
						end
						if Qready and Wready and GetDistance(unit) <VARS.Q.range + VARS.W.range and ValidTarget(unit) and unit.health <= Qdmg(unit) then
                            CastW(unit)
							CastQ(unit)
						end
                        if Eready and GetDistance(unit) <VARS.E.range and ValidTarget(unit) and unit.health <= Edmg(unit) then
							CastE(unit)
						end
                end
        end
end

function JungleSteal()
     if  Menu.Steal.JungleSteal then
				myHero:MoveTo(mousePos.x, mousePos.z)
                for i, unit in pairs(jungleMinions.objects) do
                        if ValidTarget(unit) and unit.health <= Qdmg(unit)+Edmg(unit) then
                                CastW(unit)
								CastQ(unit)
								CastE(unit)
						end
                        
                end
        end  
end

function harass()
	if not target then return end
		if (Keys() == "Harass" ) then
			if Menu.harass.harassQ  then
				if(Qready) then 
					CastQ(target)
				end
			end
			if Menu.harass.harassW  then
				if Wready and GetDistance(target) <= VARS.W.range then 
					if(Menu.harass.harassW2) then
						CastW(target)
					elseif(not CanIBack) then
						CastW(target)
					end
					
				end
			end
		end		
end

function doubleChaine()
	if not target then return end
	if  Menu.combo.doublechaine then
		myHero:MoveTo(mousePos.x, mousePos.z)
		if Rready  and GetDistance(target)< VARS.E.range and target then
			if Eready then
				CastE(target)
			end
			if Rready and Rspell == 'E' then
				CastR(target)
			end
			
			DelayAction(function() 
							if(Qready) then
								CastQ(target)
							end
							if Wready and not CanIBack then
								CastW(target)
							end	
						end,3)
		end
	end            
end

function doubleZed()
	if not target then return end
	if  Menu.combo.doublezed then
		myHero:MoveTo(mousePos.x, mousePos.z)
		if Rready  and GetDistance(target)< VARS.W.range and target then
			if Wready and not CanIBack then
				CastW(target)
			end
			if Rready and Rspell == 'W' then
				CastR(target)
			end
			
			DelayAction(function() 
							if(Qready) then
								CastQ(target)
							end
							if Eready then
								CastE(target)
							end	
						end,2)
		end
	end            
end

function jungleClear()
	if Keys() == "Laneclear" then
	---------------Lane CLEAR	
		for _, minion in pairs(enemyMinions.objects) do
			if ValidTarget(minion, 1000) then
					if Qready and Menu.farm.Lfarm.Qinlane then	
						CastQ(minion)
					end
					if Wready and Menu.farm.Lfarm.Winlane then	
						CastW(minion)
					end
					if Eready and Menu.farm.Lfarm.Einlane then	
						CastE(minion)
					end		
			end
		
		end
	---------------Jungle CLEAR		
		for _, jminion in pairs(jungleMinions.objects) do
			if ValidTarget(jminion, 1200) then
					if Qready and Menu.farm.Jfarm.Qinjungle then	
						CastQ(jminion)
					end
					if Wready and Menu.farm.Jfarm.Winjungle then
						CastW(jminion)
					end
					if Eready and Menu.farm.Jfarm.Einjungle then
						CastE(jminion)
					end
			end
		end	
	end
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
		Menu.skin:addParam('skinID', 'Skin', SCRIPT_PARAM_LIST, 1, {"Wicked", "Prestigious", "Mistletoe", "Ravenborn", "Elderwood","Original"})
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
        if unit.isMe and spell.name == "LeblancChaosOrb" then
            Rspell = 'Q'
        end
		if unit.isMe and spell.name == "LeblancSlide" then
            Rspell = 'W'
        end
		if unit.isMe and spell.name == "LeblancSoulShackle" then
            Rspell = 'E'
        end
end

function OnAnimation(unit, animation)
   if unit and animation and unit.isMe and animation:lower():find("attack") then
      lastAttack = GetTickCount() - GetLatency() * 0.5
      lastAttackCD = unit.spell.animationTime * 1000
   end
end

function OnUpdateBuff(unit, buff)
        if buff.name == "LeblancChaosOrb" and unit and not unit.isMe then
                for i, Champ in pairs(Champ) do
                        if Champ == unit.charName then
                                Passive[i] = true
                                lastTime[i] = os.clock()
                        end            
                end
        end
		if buff.name=="LeblancSlide" and unit and unit.isMe then
			CanIBack = true
		end
		if buff.name=="LeblancSlideM" and unit and unit.isMe then
			CanIBackM = true
		end
end
 
function OnRemoveBuff(unit,buff)
        if buff.name == "LeblancChaosOrb" and unit and not unit.isMe then
                for i, Champ in pairs(Champ) do
                        if Champ == unit.charName then
                                Passive[i] = false
                        end            
                end
        end
		if buff.name=="LeblancSlide" and unit and unit.isMe then
			CanIBack = false
		end
		if buff.name=="LeblancSlideM" and unit and unit.isMe then
			CanIBackM = false
		end
end

function OnDraw()
	if(Menu.draws.DisRang == false) then
			if(Menu.draws.DrawQ and Qready) then
				if(Menu.draws.drawType == 2) then
					DrawCircle(myHero.x, myHero.y, myHero.z, VARS.Q.range, 0x111111)
				else
					DrawCircle3D(myHero.x, myHero.y, myHero.z, VARS.Q.range, 2)
				end	
			end
			if(Menu.draws.DrawW and Wready) then
				if(Menu.draws.drawType == 2)then
					DrawCircle(myHero.x, myHero.y, myHero.z, VARS.W.range, 0x111111)
				else
					DrawCircle3D(myHero.x, myHero.y, myHero.z, 900, 2)
				end	
			end
			if(Menu.draws.DrawE and Eready) then
				if(Menu.draws.drawType == 2)then
					DrawCircle(myHero.x, myHero.y, myHero.z, VARS.E.range, 0x111111)
				else
					DrawCircle3D(myHero.x, myHero.y, myHero.z, VARS.E.range, 2)
				end	
			end
		DrawLifeBar()
	end
end

function OnTick()
	ts:update()
	Checks()
	target = ts.target	
	combo()
	harass()
	KillSteal()
	JungleSteal()
	doubleChaine()
	doubleZed()
	jungleClear()
	TryToRun()
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
	DrawMenu()
	Menu.TargetSelector:addTS(ts)
	LoadTableOrbs()
	LoadOrb()
	if VIP_USER then 
		SkinLoad() 
	end
end




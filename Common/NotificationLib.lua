class "NotificationLib"

local Length = 276;
local Thickness = 66;
local Position = {(WINDOW_W*0.995), (WINDOW_H*0.1)}
local Tiles = {}

function OnDraw()
    local time = 0.5;
    local gameTime = GetGameTimer();

    if tablelength(Tiles) > GetMaxTileCount()
    then
        table.remove(Tiles, 1)
    end

    for i ,v in pairs(Tiles) do

        if v[3] + v[4] + time <= gameTime
        then
            table.remove(Tiles, i)
        end

        v[5] = Position[1];
        v[6] = Position[2] + (Thickness + 6) * (i - 1);

        if time + v[4] >= gameTime
        then
            local percent = ((v[4] + time) - gameTime)/time
            v[5] = Position[1] + Length * percent;
        end

        if v[3] + v[4] <= gameTime and v[3] + v[4] + time > gameTime
        then
            local percent = (gameTime - (v[4]+v[3]))/time;
            v[5] = Position[1] + Length * percent;
        end

        DrawTile(v[5], v[6], v[1], v[2]);
    end
end

function OnWndMsg(msg,wParam)
        if msg ~= 513
        then
            return;
        end

        for i ,v in pairs(Tiles) do
            if CursorisOverBox(v[5], v[6])
            then
                v[3] = GetGameTimer() - v[4];
            end
        end
end

function NotificationLib:AddTile(Header, Text, Duration)
	
    Tiles[tablelength(Tiles) +1] = {Header, Text, Duration, GetGameTimer(), Position[1], Position[2]}
end

function DrawTile(x, y, header, text)
            local lenghtHeader = GetTextArea(header, 25).x - 240;
            local lenghtContext = GetTextArea(text, 20).x - 250;
            local extraLenght = lenghtHeader > lenghtContext and lenghtHeader or lenghtContext;
            local tileLenght = CursorIsOverTile(x, y) and Length + (extraLenght > 0 and extraLenght or 0) or Length;

	        --Border
            local borderColor = CursorIsOverTile(x, y) and ARGB(255,93,86,58) or ARGB(255*0.5,93,86,58);
            local borderThickness = 4;
            local borderYOffset = (Thickness * 0.5);
            DrawLine(x - tileLenght, y - borderYOffset, x, y - borderYOffset, borderThickness, borderColor);
            DrawLine(x - tileLenght, y + borderYOffset, x, y + borderYOffset, borderThickness, borderColor);
            DrawLine(x - tileLenght + (borderThickness * 0.5), y - borderYOffset + (borderThickness * 0.5), x - tileLenght + (borderThickness * 0.5), y + borderYOffset - (borderThickness * 0.5), borderThickness, borderColor);
            DrawLine(x - (borderThickness * 0.5), y - borderYOffset + (borderThickness * 0.5), x - (borderThickness * 0.5), y + borderYOffset - (borderThickness * 0.5), borderThickness, borderColor);

            --Main
            local mainColor = CursorIsOverTile(x, y) and ARGB(255,12,19,18) or ARGB(255*0.5,12,19,18);
            local mainBorderOffset = (borderThickness*0.5);
            DrawLine(x - tileLenght + borderThickness, y, x - borderThickness, y, Thickness - borderThickness, mainColor);

            --CloseBox
            local boxColor = ARGB(255, 35,65,63);
            local boxHeight = 24;
            local boxWidth = 24;
            local boxYOffset = (Thickness*0.5-boxHeight*0.5);
            if CursorisOverBox(x, y)
            then
                DrawLine(x - boxWidth - borderThickness, y - boxYOffset + mainBorderOffset, x - borderThickness, y - boxYOffset + mainBorderOffset, boxHeight, boxColor);
            end

            --Header
            local headerYOffset = 30;
            local fixedHeader = (not CursorIsOverTile(x, y) and GetTextArea(header, 25).x > 240) and header:sub(1, 20).." ..." or header;
            DrawText(fixedHeader, 25, x - tileLenght + borderThickness*2, y - headerYOffset, ARGB(255, 127, 255, 212));

            --Context
            local contextYOffsetLine1 = 5;
            local fixedContext = (not CursorIsOverTile(x, y) and GetTextArea(text, 20).x > 250) and text:sub(1, 25).." ..." or text;
            DrawText(fixedContext, 20, x - tileLenght + borderThickness*2, y + contextYOffsetLine1, ARGB(255, 250, 235, 215));

            --BoxX
            DrawText("x",33,x - boxWidth, y -boxYOffset*2 +5,ARGB(255,143,188,143))
end

function CursorIsOverTile(posX, posY)
	        local cursor = GetCursorPos();
            local x = posX - cursor.x;
            local y = posY - cursor.y;

            return (x < Length and x > 0) and (y < 30 and y > -45);
end

function CursorisOverBox(posX, posY)
            local cursor = GetCursorPos();
            local x = posX - cursor.x;
            local y = posY - cursor.y;

            return (x < 28 and x > 0) and (y < 24 and y > -10);
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

local function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function GetMaxTileCount()
    return round((WINDOW_H / 108), 0)
end
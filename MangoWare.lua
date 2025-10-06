local InsertService = game:GetService("InsertService")

local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()

--// Declare the Prefabs asset
local PrefabsId = "rbxassetid://" .. ReGui.PrefabsId -- Добавьте эту строку

ReGui:Init({
	Prefabs = InsertService:LoadLocalAsset(PrefabsId)
})



ReGui:Init()
ReGui:DefineTheme("Orange", {
	TitleAlign = Enum.TextXAlignment.Center,
	TextDisabled = Color3.fromRGB(0,128,0),
	Text = Color3.fromRGB(0,128,0),
	
	FrameBg = Color3.fromRGB(225, 142, 70),
	FrameBgTransparency = 0.4,
	FrameBgActive = Color3.fromRGB(240, 121, 16),
	FrameBgTransparencyActive = 0.4,
	
	CheckMark = Color3.fromRGB(0,100,0),
	SliderGrab = Color3.fromRGB(0,100,0),
	ButtonsBg = Color3.fromRGB(208, 63, 10),
	CollapsingHeaderBg = Color3.fromRGB(208, 63, 10),
	CollapsingHeaderText = Color3.fromRGB(0,128,0),
	RadioButtonHoveredBg = Color3.fromRGB(208, 63, 10),
	
	WindowBg = Color3.fromRGB(255,165,0),
	TitleBarBg = Color3.fromRGB(249,62,62),
	TitleBarBgActive = Color3.fromRGB(249,62,62),
	
	Border = Color3.fromRGB(0,128,0),
	ResizeGrab = Color3.fromRGB(0,100,0),
	RegionBgTransparency = 1,
})







local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local localPlayer = Players.LocalPlayer
local lines = {}  -- Таблица для хранения линий (ключ — игрок, значение — линия)
local connection  -- Для хранения соединения с RenderStepped

-- Функция для запуска отрисовки линий
local function StartDrawingLines()
    if connection then
        return  -- Уже запущено
    end
    
    -- Подключаем обновление каждый кадр
    connection = RunService.RenderStepped:Connect(function()
        local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        
        -- Обновляем/создаём линии для всех игроков
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                local screenPos, onScreen = Camera:WorldToScreenPoint(head.Position)
                
                if onScreen then
                    -- Создаём или обновляем линию
                    if not lines[player] then
                        local line = Drawing.new("Line")
                        line.Color = Color3.new(1, 0, 0)  -- Красный цвет
                        line.Thickness = 2
                        line.Transparency = 1
                        lines[player] = line
                    end
                    
                    lines[player].From = center
                    lines[player].To = Vector2.new(screenPos.X, screenPos.Y)
                    lines[player].Visible = true
                else
                    -- Скрываем линию, если игрок вне экрана
                    if lines[player] then
                        lines[player].Visible = false
                    end
                end
            else
                -- Удаляем линию, если персонаж не существует
                if lines[player] then
                    lines[player]:Remove()
                    lines[player] = nil
                end
            end
        end
        
        -- Удаляем линии для вышедших игроков
        for player, line in pairs(lines) do
            if not player.Parent then
                line:Remove()
                lines[player] = nil
            end
        end
    end)
end





-- Функция для остановки и удаления всех линий
local function StopDrawingLines()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    
    -- Удаляем все линии
    for _, line in pairs(lines) do
        line:Remove()
    end
    lines = {}
end






local MHMainWindow = ReGui:Window({
	Title = "MiniMod|t.me/FattySpy",
	Size = UDim2.fromOffset(300, 200)
	Theme = "Orange"
})





MHMainWindow:Label({
    Text = "Esp"
})

MHMainWindow:Separator()


TracerToggle = MHMainWindow:Checkbox({
	Value = false,
	Label = "Esp line",
	Callback = function(self, Value: boolean)
		if TracerToggle.Value = false then
			StopDrawingLines()
		elseif
			StartDrawingLines()
	end
})



TracerColor = MHMainWindow:SliderColor3({
    Value = Color3.fromRGB(255,255,255),
    Label = "Line Color"
})


MHMainWindow:Separator()



BoxToggle = MHMainWindow:Checkbox({
	Value = false,
	Label = "Esp Box",
	Callback = function(self)
		print("Ticked", Value)
	end
})


BoxColor = MHMainWindow:SliderColor3({
    Value = Color3.fromRGB(255,255,255),
    Label = "Box Color"
})
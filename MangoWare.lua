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

local MHMainWindow = ReGui:TabsWindow({
	Title = "Mangohub Testnet",
	Size = UDim2.fromOffset(300, 200)
	Theme = "Orange"
})





MHMainWindow:Label({
    Text = "Esp"
})

MHMainWindow:Separator()


local TracerToggle = MHMainWindow:Checkbox({
	Value = false,
	Label = "Esp line",
	Callback = function(self)
		print("Ticked", Value)
	end
})



local TracerColor = MHMainWindow:SliderColor3({
    Value = Color3.fromRGB(255,255,255),
    Label = "Line Color"
})


MHMainWindow:Separator()



local BoxToggle = MHMainWindow:Checkbox({
	Value = false,
	Label = "Esp Box",
	Callback = function(self)
		print("Ticked", Value)
	end
})


local BoxColor = MHMainWindow:SliderColor3({
    Value = Color3.fromRGB(255,255,255),
    Label = "Box Color"
})

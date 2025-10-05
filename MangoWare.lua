
local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()

local MHMainWindow = ReGui:Window({
	Title = "Mangohub Testnet",
	Size = UDim2.fromOffset(300, 200)
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

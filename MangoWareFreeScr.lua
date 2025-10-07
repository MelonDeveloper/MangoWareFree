local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()


local Window22 = ReGui:Window({
	Title = "MangoWare",
	NoClose = false,
	Size = UDim2.new(0, 400, 0, 250)
})






local Tab1 = Window22:CreateTab({Name = "Main"}) --> Canvas
Tab1:Label({Text = "Made by t.me/x1r441"})

local Tab2 = Window22:CreateTab({Name = "Player"})

local Tab3 = Window22:CreateTab({Name = "Visual"})

local sliSpeed = Tab2:SliderInt({
    Label = "Speed",
    Value = 5,
    Minimum = 1,
    Maximum = 500,
})

Tab2:Button({
Text = "Set Speed",
Callback = function() 
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = sliSpeed.Value
        end,
})


local sliJump = Tab2:SliderInt({
    Label = "Jump",
    Value = 5,
    Minimum = 1,
    Maximum = 500,
})

Tab2:Button({
Text = "Set Jump",
Callback = function() 
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = sliJump.Value
        end,
})



local sliH = Tab2:SliderInt({
    Label = "Health",
    Value = 100,
    Minimum = 0,
    Maximum = 1000,
})

Tab2:Button({
Text = "Add Health",
Callback = function() 
            game.Players.LocalPlayer.Character.Humanoid.Health += sliH.Value
        end,
})




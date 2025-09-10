local InsertService = game:GetService("InsertService")

local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()


--// Declare the Prefabs asset
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





local Window = ReGui:Window({
	Title = "MangoWare",
	Theme = "Orange",
	NoClose = false,
	Size = UDim2.new(0, 400, 0, 250),
}):Center()






local Tab1 = Window:CreateTab({Name = "Main"}) --> Canvas
Tab1:Label({Text = "Made by t.me/x1r441"})

local Tab2 = Window:CreateTab({Name = "Player"})

local Tab3 = Window:CreateTab({Name = "Visual"})

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



Tab2:Button({
Text = "Respawn",
Callback = function() 
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end,
})

Tab3:Button({
Text = "Chams"
Callback = function()
	        local Players = game:GetService("Players"):GetChildren()
            local RunService = game:GetService("RunService")
            local highlight = Instance.new("Highlight")
            highlight.Name = "Highlight"
 
            for i, v in pairs(Players) do
                repeat wait() until v.Character
                if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                    local highlightClone = highlight:Clone()
                    highlightClone.Adornee = v.Character
                    highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                    highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlightClone.Name = "Highlight"
                end
            end

            game.Players.PlayerAdded:Connect(function(player)
                repeat wait() until player.Character
                if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                    local highlightClone = highlight:Clone()
                    highlightClone.Adornee = player.Character
                    highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
                    highlightClone.Name = "Highlight"
                end
            end)

            game.Players.PlayerRemoving:Connect(function(playerRemoved)
                playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
            end)

            RunService.Heartbeat:Connect(function()
                for i, v in pairs(Players) do
                    repeat wait() until v.Character
                    if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                        local highlightClone = highlight:Clone()
                        highlightClone.Adornee = v.Character
                        highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlightClone.Name = "Highlight"
                        task.wait()
                    end
                end
            end)
        end,

})






Tab3:Button({
Text = "Esp line"
Callback = function()
            local lplr = game.Players.LocalPlayer
            local camera = game:GetService("Workspace").CurrentCamera
            local CurrentCamera = workspace.CurrentCamera
            local worldToViewportPoint = CurrentCamera.worldToViewportPoint

            _G.TeamCheck = false -- Use True or False to toggle TeamCheck

            for i,v in pairs(game.Players:GetChildren()) do
                local Tracer = Drawing.new("Line")
                Tracer.Visible = false
                Tracer.Color = Color3.new(1,1,1)
                Tracer.Thickness = 1
                Tracer.Transparency = 1

                function lineesp()
                    game:GetService("RunService").RenderStepped:Connect(function()
                        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                            local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                            if OnScreen then
                                Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                                Tracer.To = Vector2.new(Vector.X, Vector.Y)

                                if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                                    --//Teammates
                                    Tracer.Visible = false
                                else
                                    --//Enemies
                                    Tracer.Visible = true
                                end
                            else
                                Tracer.Visible = false
                            end
                        else
                            Tracer.Visible = false
                        end
                    end)
                end
                coroutine.wrap(lineesp)()
            end

            game.Players.PlayerAdded:Connect(function(v)
                local Tracer = Drawing.new("Line")
                Tracer.Visible = false
                Tracer.Color = Color3.new(1,1,1)
                Tracer.Thickness = 1
                Tracer.Transparency = 1

                function lineesp()
                    game:GetService("RunService").RenderStepped:Connect(function()
                        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                            local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                            if OnScreen then
                                Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                                Tracer.To = Vector2.new(Vector.X, Vector.Y)

                                if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                                    --//Teammates
                                    Tracer.Visible = false
                                else
                                    --//Enemies
                                    Tracer.Visible = true
                                end
                            else
                                Tracer.Visible = false
                            end
                        else
                            Tracer.Visible = false
                        end
                    end)
                end
                coroutine.wrap(lineesp)()
            end)
        end,
})







local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
local notifgui = loadstring(game:HttpGet("https://raw.githubusercontent.com/water5202/Notification-Library/refs/heads/main/Notify.lua"))()

notifgui.WaterNotify("Prot x armour gui", "Loaded!", 5);
local Window = OrionLib:MakeWindow({Name = "Prot x armour gui", HidePremium = false, SaveConfig = true, ConfigFolder = "Protxarmour", IntroText = "Prot x armour gui"});

local Tab1 = Window:MakeTab({Name = "Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false});
local Tab2 = Window:MakeTab({Name = "Extra", Icon = "rbxassetid://4483345998", PremiumOnly = false});
local Tab3 = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false});

local isenabled = false

Tab1:AddToggle({
    Name = "Auto Kill Mobs",
    Default = false,
    Callback = function(Value)
        task.spawn(function()
            isenabled = Value
            while isenabled do
                for _, Mobs in pairs(workspace.Live.MobModel:GetChildren()) do
                    if Mobs:FindFirstChild("Humanoid") then
                        local args = {{Mobs}}
                        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Combat"):WaitForChild("M1"):FireServer(unpack(args))
                    end
                end
                task.wait(0.0001)
            end
        end)
    end    
})

Tab2:AddLabel({Name = "This is the extra tab"});

Tab3:AddLabel({Name = "This is the settings tab"});

game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
game.Players.LocalPlayer.PlayerGui.CharacterSelection.Character.Value = "Asriel"
wait(1)
game.Players.LocalPlayer.Character:WaitForChild("ForceField"):Destroy()

game.Players.LocalPlayer.Character.Head.HealthBar.Frame.PName.Text = "Asgore"
game.Players.LocalPlayer.Character.Head.HealthBar.Frame.StaminaBar:Destroy()

game.Players.LocalPlayer.Character.Head.Voice:Destroy()
local Sound = Instance.new("Sound")
Sound.Parent = game.Players.LocalPlayer.Character.Head
Sound.Volume = 5
Sound.Playing = false
Sound.Looped = false
Sound.SoundId = "rbxassetid://7807218979"
Sound.Name = "Voice"
Sound.PlaybackSpeed = 1


game.Players.LocalPlayer.Backpack:WaitForChild("Main"):WaitForChild("AsrielMoves"):
WaitForChild("Animations"):WaitForChild("Walk").AnimationId =
"rbxassetid://5411071023"
game.Players.LocalPlayer.Backpack:WaitForChild("Main"):WaitForChild("AsrielMoves"):
WaitForChild("Animations"):WaitForChild("WalkBack").AnimationId =
"rbxassetid://5411071023"
game.Players.LocalPlayer.Backpack:WaitForChild("Main"):WaitForChild("AsrielMoves"):
WaitForChild("Animations"):WaitForChild("Block").AnimationId =
"rbxassetid://5411080645"
game.Players.LocalPlayer.Backpack:WaitForChild("Main"):WaitForChild("AsrielMoves"):
WaitForChild("Animations"):WaitForChild("Idle").AnimationId =
"rbxassetid://5411065101"
game.Players.LocalPlayer.Backpack:WaitForChild("Main"):WaitForChild("AsrielMoves"):
WaitForChild("Animations"):WaitForChild("Run").AnimationId =
"rbxassetid://5411068397"
wait(0.1)
game.Workspace.ServerEffects.ServerCooldown:Destroy()
game.ReplicatedStorage.Effects.HeavyHitEffect.Effect1.Color = Color3.fromRGB(255,
176, 0)
game.ReplicatedStorage.Effects.HeavyHitEffect.Effect2.Color = Color3.fromRGB(255,
0, 0)
game.ReplicatedStorage.Effects.SpearGroundExplosion.Explosion.Name = "Explosion1"
game.ReplicatedStorage.Effects.SpearGroundExplosion.Explosion1.Color =
Color3.fromRGB(255, 120, 0)
game.ReplicatedStorage.Effects.SpearGroundExplosion.Explosion.Color =
Color3.fromRGB(255, 0, 0)
game.ReplicatedStorage.Effects.SpearJusticeExplosion.Explosion.Name = "Explosion2"
game.ReplicatedStorage.Effects.SpearJusticeExplosion.Explosion2.Color =
Color3.fromRGB(255, 165, 0)
game.ReplicatedStorage.Effects.SpearJusticeExplosion.Explosion.Color =
Color3.fromRGB(255, 165, 0)
game.Players.LocalPlayer.Backpack.Main.AsrielMoves.ModuleScript.Animations.BasicCom
bat.Light1.AnimationId = "rbxassetid://5411089475"
game.Players.LocalPlayer.Backpack.Main.AsrielMoves.ModuleScript.Animations.BasicCom
bat.Light2.AnimationId = "rbxassetid://5411089475"
game.Players.LocalPlayer.Backpack.Main.AsrielMoves.ModuleScript.Animations.BasicCom
bat.Light3.AnimationId = "rbxassetid://4800163313"
game.Players.LocalPlayer.Backpack.Main.AsrielMoves.ModuleScript.Animations.BasicCom
bat.Light4.AnimationId = "rbxassetid://5776251749"
game.Players.LocalPlayer.Backpack.Main.AsrielMoves.ModuleScript.Animations.BasicCom
bat.Light5.AnimationId = "rbxassetid://4800630930"

wait(0.5)
pls = game:GetService'Players'
rs = game:GetService'RunService'
uinps = game:GetService'UserInputService'
lp = pls.LocalPlayer
mouse = lp:GetMouse()
c = lp.Character
human = c.Humanoid
critTime = .27
--------------------------------------------------------
local cf0 = CFrame.new(0,-0.80,0) * CFrame.Angles(-3,-1.50,0)
local h = Instance.new("Part",c)
h.Name = "Trident"
h.BrickColor = BrickColor.new(1,0,0)
h.Material = Enum.Material.Neon
h.Size = Vector3.new(2,1,10)
h.Locked = true
h.CanCollide = false
h.Name = "Handle"
local m = Instance.new("SpecialMesh",h)
m.MeshType = "FileMesh"
m.Scale = Vector3.new(1.5,2.3,2.3)
m.MeshId = "http://www.roblox.com/asset/?id=30694864"
local hw = Instance.new("Motor",game.Players.LocalPlayer.Character["Right Arm"])
hw.Name = "HandleWeld"
hw.Part0 = game.Players.LocalPlayer.Character["Right Arm"]
hw.Part1 = h
hw.C0 = cf0:Inverse()
wait(0.5)

game.Players.LocalPlayer.PlayerGui.UI.Ui.Info.Defense.Text = "Defense:80"
game.Players.LocalPlayer.PlayerGui.UI.Ui.Info.Attack.Text = "Attack:80"

spawn(function()
player = game.Players.LocalPlayer
char = player.Character
for _,v in pairs(game.Players:GetDescendants()) do
if v.Name == 'SansIndicator' then
print("b")
newIndicator = v:Clone()
newIndicator.Parent = game.Players.LocalPlayer.PlayerGui
newIndicator.Indicator.Text = "Trident Enabled"
newIndicator.Indicator.TextStrokeColor3 = Color3.fromRGB(255, 0, 5)
wait()
newIndicator.Help:Destroy()
newIndicator.Help:Destroy()
end
end
end)

spawn(function()
game.Players.LocalPlayer.PlayerGui.SansIndicator.Indicator.Position =
UDim2.new(0.73069042, 0, 0.71713078, 0)
game.Players.LocalPlayer.PlayerGui.SansIndicator.Indicator.TextTransparency = 0
game.Players.LocalPlayer.PlayerGui.SansIndicator.Indicator.Size = UDim2.new(0.1384,
0, 0.0557, 0)
game.Players.LocalPlayer.PlayerGui.SansIndicator.Help:Destroy()
end)



local mouse = game.Players.LocalPlayer:GetMouse()
mouse.KeyDown:Connect(function(k)
      if k == "1" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://5079313442"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1.5)
local args = {
    [1] = getrenv()._G.Pass,
    [2] =
game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value,
    [3] = {
         ["HitTime"] = 1,
         ["Type"] = "Normal",
         ["HitEffect"] = "KnifeHitEffect",
         ["CombatInv"] = true,
         ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
         ["Velocity"] = Vector3.new(0, 0.1, 0),
         ["Sound"] = game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
         ["Damage"] = 10
    }
}

game:GetService("ReplicatedStorage").Remotes.Damage:InvokeServer(unpack(args))
end
end)

                      local mouse = game.Players.LocalPlayer:GetMouse()
                mouse.KeyDown:Connect(function(k)
                    if k == "2" then
 if game.Players.LocalPlayer.PlayerGui.UI.Ui.Info.Attack.Text == "Attack:80" then
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 10
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 10
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 10
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
end
end
end)
                       local mouse = game.Players.LocalPlayer:GetMouse()
                 mouse.KeyDown:Connect(function(k)
                     if k == "3" then
 if game.Players.LocalPlayer.PlayerGui.UI.Ui.Info.Attack.Text == "Attack:80" then
local AnimationId = "5411089475"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(0.5)
wait(0.7)
k:AdjustSpeed(0)
                 local A_1 = getrenv()._G.Pass
                         local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                         local A_3 =
                               {
                                     ["HitTime"] = 1,
                                     ["Type"] = "Normal",
                                     ["HitEffect"] = "HeavyHitEffect",
                                     ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                     ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                     ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                     ["CombatInv"] = true,
                                     ["Damage"] = 3
                               }
                         local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                         Event:InvokeServer(A_1, A_2, A_3)
                 local A_1 = getrenv()._G.Pass
                         local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                         local A_3 =
                               {
                                     ["HitTime"] = 1,
                                     ["Type"] = "Normal",
                                     ["HitEffect"] = "HeavyHitEffect",
                                     ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                     ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                     ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                     ["CombatInv"] = true,
                                     ["Damage"] = 5
                               }
                         local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                         Event:InvokeServer(A_1, A_2, A_3)
                 local A_1 = getrenv()._G.Pass
                         local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                         local A_3 =
                               {
                                     ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 3
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 3
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 3
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                             {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 3
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 3
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                       local A_3 =
                             {
                                     ["HitTime"] = 1,
                                     ["Type"] = "Normal",
                                     ["HitEffect"] = "HeavyHitEffect",
                                     ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                     ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                     ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                     ["CombatInv"] = true,
                                     ["Damage"] = 5
                               }
                         local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                         Event:InvokeServer(A_1, A_2, A_3)
                 local A_1 = getrenv()._G.Pass
                         local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                         local A_3 =
                               {
                                     ["HitTime"] = 1,
                                     ["Type"] = "Normal",
                                     ["HitEffect"] = "HeavyHitEffect",
                                     ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                     ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                     ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                     ["CombatInv"] = true,
                                     ["Damage"] = 6
                               }
                         local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                         Event:InvokeServer(A_1, A_2, A_3)
k:AdjustSpeed(1)

end
end
end)

game:GetService("UserInputService").InputBegan:connect(function(inputObject,
gameProcessedEvent)
      if inputObject.KeyCode == Enum.KeyCode.Four then
 if game.Players.LocalPlayer.PlayerGui.UI.Ui.Info.Attack.Text == "Attack:80" then
            local mouse = game.Players.LocalPlayer:GetMouse()
            function getlockchar()
                  local char =
game.Players.LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                  return char
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
getlockchar().HumanoidRootPart.CFrame * CFrame.new(0,0,3)
local AnimationId = "5770437587"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
wait(0.3)
local A_1 = getrenv()._G.Pass
         local A_2 =
game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
         local A_3 = {
             ["HitTime"] = 1,
             ["Type"] = "Knockback",
             ["HitEffect"] = "BurstEffect",
             ["VictimCFrame"] = CFrame.new(Vector3.new(0,0,0)),
             ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Knockback2,
             ["Velocity"] = Vector3.new(-20, 0, -20),
             ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Knockback,
             ["Damage"] = 5
         }
         local Event = game:GetService("ReplicatedStorage").Remotes.Damage
         Event:InvokeServer(A_1, A_2, A_3)
lockon = game.Players.LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
for _,v in pairs(game.ReplicatedStorage.RogueEffects.FireEffect:GetDescendants())
do
     if v.Name == "Fire" then
         print("debug2398")
         clone = v:Clone()
         print("debug29388")
         clone.Parent = lockon.Torso
         clone.Name = "CustomParticle"
end
end
wait(5)
for i = 1,4 do
game.Players.LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value.Torso.CustomPartic
le:Destroy()
end
end
end
end)


                      local mouse = game.Players.LocalPlayer:GetMouse()
                mouse.KeyDown:Connect(function(k)
                    if k == "5" then
 if game.Players.LocalPlayer.PlayerGui.UI.Ui.Info.Attack.Text == "Attack:80" then
               local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079845969"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(1)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 0.1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knife_Slash2,
                                    ["Velocity"] = Vector3.new(-1, -1, -1),
                                    ["CombatInv"] = true,
                                    ["Damage"] = 10
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
end
end
end)

      local mouse = game.Players.LocalPlayer:GetMouse()
                   mouse.KeyDown:Connect(function(k)
                         if k == "6" then
local AnimationId = "5411089475"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
local A_1 = getrenv()._G.Pass
         local A_2 =
game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
         local A_3 = {
             ["HitTime"] = 0.8,
             ["Type"] = "Normal",
             ["HitEffect"] = "LightHitEffect",
             ["VictimCFrame"] = CFrame.new(Vector3.new(0,0,0)),
             ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Knockback2,
             ["Velocity"] = Vector3.new(0, -1, 0),
             ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Ping,
             ["Damage"] = 1
         }
         local Event = game:GetService("ReplicatedStorage").Remotes.Damage
         Event:InvokeServer(A_1, A_2, A_3)
h.BrickColor = BrickColor.new(255,170,0)
wait(0.5)
h.BrickColor = BrickColor.new(0,0,255)
local AnimationId = "5079313442"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
local A_1 = getrenv()._G.Pass
         local A_2 =
game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
         local A_3 = {
             ["HitTime"] = 0.8,
             ["Type"] = "Normal",
             ["HitEffect"] = "LightHitEffect",
             ["VictimCFrame"] = CFrame.new(Vector3.new(0,0,0)),
             ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Knockback2,
             ["Velocity"] = Vector3.new(0, -1, 0),
            ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Knockback,
            ["Damage"] = 10
         }
         local Event = game:GetService("ReplicatedStorage").Remotes.Damage
         Event:InvokeServer(A_1, A_2, A_3)
wait(0.5)
h.BrickColor = BrickColor.new(255,170,0)
local AnimationId = "5411089475"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
local A_1 = getrenv()._G.Pass
         local A_2 =
game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
         local A_3 = {
             ["HitTime"] = 0.8,
             ["Type"] = "Normal",
             ["HitEffect"] = "LightHitEffect",
             ["VictimCFrame"] = CFrame.new(Vector3.new(0,0,0)),
             ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Knockback2,
             ["Velocity"] = Vector3.new(0, -1, 0),
             ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Knockback,
             ["Damage"] = 10
         }
         local Event = game:GetService("ReplicatedStorage").Remotes.Damage
         Event:InvokeServer(A_1, A_2, A_3)
wait(0.5)
h.BrickColor = BrickColor.new(0,0,255)
local AnimationId = "5411089475"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
local A_1 = getrenv()._G.Pass
         local A_2 =
game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
         local A_3 = {
             ["HitTime"] = 0.8,
             ["Type"] = "Normal",
             ["HitEffect"] = "LightHitEffect",
             ["VictimCFrame"] = CFrame.new(Vector3.new(0,0,0)),
             ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Knockback2,
             ["Velocity"] = Vector3.new(0, -1, 0),
             ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Knockback,
             ["Damage"] = 10
         }
         local Event = game:GetService("ReplicatedStorage").Remotes.Damage
         Event:InvokeServer(A_1, A_2, A_3)
wait(0.5)
h.BrickColor = BrickColor.new(255,170,0)
local AnimationId = "5411089475"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
local A_1 = getrenv()._G.Pass
         local A_2 =
game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
         local A_3 = {
             ["HitTime"] = 0.8,
             ["Type"] = "Normal",
             ["HitEffect"] = "LightHitEffect",
             ["VictimCFrame"] = CFrame.new(Vector3.new(0,0,0)),
             ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Knockback2,
             ["Velocity"] = Vector3.new(0, -1, 0),
             ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Knockback,
             ["Damage"] = 10
         }
         local Event = game:GetService("ReplicatedStorage").Remotes.Damage
         Event:InvokeServer(A_1, A_2, A_3)
wait(0.5)
h.BrickColor = BrickColor.new(0,0,255)
local AnimationId = "5411089475"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
local A_1 = getrenv()._G.Pass
         local A_2 =
game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
         local A_3 = {
             ["HitTime"] = 0.8,
             ["Type"] = "Normal",
             ["HitEffect"] = "LightHitEffect",
             ["VictimCFrame"] = CFrame.new(Vector3.new(0,0,0)),
             ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Knockback2,
             ["Velocity"] = Vector3.new(0, -1, 0),
             ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Knockback,
             ["Damage"] = 10
         }
         local Event = game:GetService("ReplicatedStorage").Remotes.Damage
         Event:InvokeServer(A_1, A_2, A_3)
h.BrickColor = BrickColor.new(1,0,0)
end
end)

local mouse = game.Players.LocalPlayer:GetMouse()
                  mouse.KeyDown:Connect(function(k)
                        if k == "7" then
            local mouse = game.Players.LocalPlayer:GetMouse()
            function getlockchar()
                  local char =
game.Players.LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                  return char
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
getlockchar().HumanoidRootPart.CFrame * CFrame.new(0,0,3)
local AnimationId = "5411089475"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(0.3)
wait(0.3)
local A_1 = getrenv()._G.Pass
         local A_2 =
game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
         local A_3 = {
             ["HitTime"] = 1,
             ["Type"] = "Knockback",
             ["HitEffect"] = "HeavyHitEffect",
             ["VictimCFrame"] = CFrame.new(Vector3.new(0,0,0)),
             ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Knockback2,
             ["Velocity"] = Vector3.new(0, -1, 0),
             ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Knockback,
             ["Damage"] = 10
         }
         local Event = game:GetService("ReplicatedStorage").Remotes.Damage
         Event:InvokeServer(A_1, A_2, A_3)
lockon = game.Players.LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
for _,v in pairs(game.ReplicatedStorage.RogueEffects.FireEffect:GetDescendants())
do
     if v.Name == "Fire" then
         print("debug2398")
         clone = v:Clone()
         print("debug29388")
         clone.Parent = lockon.Torso
         clone.Name = "CustomParticle"
end
end
wait(5)
for i = 1,4 do
game.Players.LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value.Torso.CustomPartic
le:Destroy()
end
end
end)

                      local mouse = game.Players.LocalPlayer:GetMouse()
                mouse.KeyDown:Connect(function(k)
                    if k == "8" then
 if game.Players.LocalPlayer.PlayerGui.UI.Ui.Info.Attack.Text == "Attack:80" then

for i,v in
pairs(getconnections(game:GetService("ReplicatedStorage").Remotes.Effects.OnClientE
vent)) do
v:Fire({"Model","DeltaExplosion",game.Players.LocalPlayer.Character.HumanoidRootPar
t.CFrame})
end
wait(0.7)
for i,v in
pairs(getconnections(game:GetService("ReplicatedStorage").Remotes.Effects.OnClientE
vent)) do
v:Fire({"Model","DeltaExplosion",game.Players.LocalPlayer.Character.HumanoidRootPar
t.CFrame})
end
wait(0.7)
for i,v in
pairs(getconnections(game:GetService("ReplicatedStorage").Remotes.Effects.OnClientE
vent)) do
v:Fire({"Model","DeltaExplosion",game.Players.LocalPlayer.Character.HumanoidRootPar
t.CFrame})
end
wait(0.7)
for i,v in
pairs(getconnections(game:GetService("ReplicatedStorage").Remotes.Effects.OnClientE
vent)) do
v:Fire({"Model","DeltaExplosion",game.Players.LocalPlayer.Character.HumanoidRootPar
t.CFrame})
end
            function getlockchar()
                  local char =
game.Players.LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                  return char
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
getlockchar().HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                   ["CombatInv"] = true,
                                   ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                             {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "-1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079313442"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Normal",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "1",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 5
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5079319635"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.90)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                    ["HitTime"] = 1,
                                    ["Type"] = "Knockback",
                                    ["HitEffect"] = "HeavyHitEffect",
                                    ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt2,
                                    ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.ChaosSaberSlice,
                                    ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "50",
                                    ["CombatInv"] = true,
                                    ["Damage"] = 10
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)

end
end
end)

                    local mouse = game.Players.LocalPlayer:GetMouse()
                mouse.KeyDown:Connect(function(k)
                if k == "r" then
                        local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5411089475"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(0.5)
                wait(0.3)
                char = game.Players.LocalPlayer.Character
                local vel = Instance.new('BodyVelocity',char.HumanoidRootPart)
                vel.Name = 'Client'
                vel.MaxForce = Vector3.new(4000,4000,4000)*math.huge
                vel.P = math.huge
                vel.Velocity =
(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * "12")*5
                wait(1.63)
                vel:Destroy()
                char.HumanoidRootPart.CFrame =
char.HumanoidRootPart.CFrame*CFrame.new(0, 0, 0)
                playerpos = char.HumanoidRootPart.Position + Vector3.new(0, 0, 0)
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://5411089475"
                local k =
game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                k:Play()
                k:AdjustSpeed(1)
                local A_1 = getrenv()._G.Pass
                        local A_2 =
game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
                        local A_3 =
                              {
                                     ["HitTime"] = 1,
                                     ["Type"] = "Normal",
                                     ["HitEffect"] = "KnifeHitEffect",
                                     ["HurtAnimation"] =
game:GetService("ReplicatedStorage").Animations.HurtAnimations.InGround,
                                     ["Sound"] =
game:GetService("ReplicatedStorage").Sounds.Knockback,
                                     ["Velocity"] =
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.1 +
Vector3.new(0,0.1,0),
                                     ["CombatInv"] = true,
                                     ["Damage"] = 1
                              }
                        local Event =
game:GetService("ReplicatedStorage").Remotes.Damage
                        Event:InvokeServer(A_1, A_2, A_3)
                                 end
                                 end)

_G.hidechat = true
local mt = getrawmetatable(game)
    local backup = mt.__namecall
    if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end

    mt.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}

        if tostring(args[1]) == 'SayMessageRequest' and _G.hidechat then
        return
        end
        return backup(...)
    end)

for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do

    if v.Name == "BodyAura" or v.Name == "Trail" then

        v:Destroy()
      end

end

game.Players:Chat(("( A strange light fills the room)"))
wait(4)
game.Players:Chat(("(Twilight is shining through the barrier)"))
wait(5)
game.Players:Chat(("(It seem your journey it's finally over)"))
wait(5)
game.Players:Chat(("( You are filled with Determination)"))
wait(5)
game.Players:Chat(("Human... It was nice to meet you"))

repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health <= 0
wait(2)
game:GetService("TeleportService"):Teleport(3198259055, LocalPlayer)

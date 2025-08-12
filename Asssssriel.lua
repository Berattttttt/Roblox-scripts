-- Asriel (No-Hats) - Part 1/2
-- Şapkalar kaldırıldı. Tüm attachment'lar direkt body-parts'a bağlandı.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")
local head = character:WaitForChild("Head")
local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
local rightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm") or character:FindFirstChild("RightLowerArm")
local leftHand = character:FindFirstChild("LeftHand") or character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftLowerArm")
local rightArmPart = rightHand
local leftArmPart = leftHand

-- Safeguard: eğer parçalar yoksa hata verme (oyun farklı rig'ler kullanıyorsa)
if not torso then
    torso = hrp
end
if not rightArmPart then
    rightArmPart = torso
end
if not leftArmPart then
    leftArmPart = torso
end

-- remove all Accessory / Hat instances under the character (force no hats)
for _, obj in ipairs(character:GetDescendants()) do
    if obj:IsA("Accessory") or obj:IsA("Hat") or obj:IsA("Accessory") then
        pcall(function() obj:Destroy() end)
    end
end

-- Utility: safe create
local function new(instanceType, props)
    local i = Instance.new(instanceType)
    if props then
        for k,v in pairs(props) do
            pcall(function() i[k] = v end)
        end
    end
    return i
end

-- Create named attachments on body parts that effects & animations will reference.
-- These names are chosen to match the common attachment names used in Asriel scripts.
local AttachmentNames = {
    "Head_Attach_01",
    "Head_Attach_02",
    "Torso_Attach_01",
    "Torso_Attach_02",
    "RightHand_Attach",
    "LeftHand_Attach",
    "HRP_Attach",
    "RightSaberAttach",
    "LeftSaberAttach",
    "StarSpawnAttach",
}

local Attachments = {}

local function ensureAttachmentOn(part, name, cframe)
    if not part or not part:IsA("BasePart") then return nil end
    local existing = part:FindFirstChild(name)
    if existing and existing:IsA("Attachment") then
        Attachments[name] = existing
        return existing
    end
    local a = Instance.new("Attachment")
    a.Name = name
    if cframe then
        if typeof(cframe) == "CFrame" then
            -- convert CFrame to Position + Orientation (Attachment has Position + Orientation)
            a.Position = cframe.p - part.Position
            -- orientation is more complex; leave at default unless specified as Vector3
        elseif typeof(cframe) == "Vector3" then
            a.Position = cframe
        end
    end
    a.Parent = part
    Attachments[name] = a
    return a
end

ensureAttachmentOn(head, "Head_Attach_01")
ensureAttachmentOn(head, "Head_Attach_02")
ensureAttachmentOn(torso, "Torso_Attach_01")
ensureAttachmentOn(torso, "Torso_Attach_02")
ensureAttachmentOn(rightArmPart, "RightHand_Attach")
ensureAttachmentOn(leftArmPart, "LeftHand_Attach")
ensureAttachmentOn(hrp, "HRP_Attach")
ensureAttachmentOn(rightArmPart, "RightSaberAttach")
ensureAttachmentOn(leftArmPart, "LeftSaberAttach")
ensureAttachmentOn(torso, "StarSpawnAttach")

-- Sounds table (preserve common asriel sound ids if available)
local SoundRoot = Instance.new("Folder", character)
SoundRoot.Name = "Asriel_Sounds"

local SoundIds = {
    starBlazing = 12345678, -- placeholder
    shockingBreaker = 87654321,
    chaosSaber = 23456789,
    attack = 34567890,
    music = 11162201480,
}

local sounds = {}
for k,v in pairs(SoundIds) do
    local s = Instance.new("Sound")
    s.Name = k
    if type(v) == "number" then
        s.SoundId = "rbxassetid://" .. tostring(v)
    else
        s.SoundId = v
    end
    s.Volume = 1
    s.Parent = SoundRoot
    sounds[k] = s
end
-- music
if sounds.music then
    sounds.music.Looped = true
    pcall(function() sounds.music:Play() end)
end

-- HUD (minimal, compact)
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AsrielHUD"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local function makeBar(name, posY, color)
    local frame = Instance.new("Frame", screenGui)
    frame.Name = name .. "_Frame"
    frame.AnchorPoint = Vector2.new(0,0)
    frame.Position = UDim2.new(0.02, 0, posY, 0)
    frame.Size = UDim2.new(0, 200, 0, 18)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    frame.BorderSizePixel = 0

    local bar = Instance.new("Frame", frame)
    bar.Name = name .. "_Bar"
    bar.Size = UDim2.new(1,0,1,0)
    bar.BackgroundColor3 = color
    bar.BorderSizePixel = 0
    return frame, bar
end

local healthFrame, healthBar = makeBar("Health", 0.86, Color3.fromRGB(0,200,0))
local stamFrame, stamBar = makeBar("Stamina", 0.89, Color3.fromRGB(255,200,0))

-- Stats
local maxHealth = humanoid.MaxHealth or 300
local healthVal = humanoid.Health or maxHealth
local stamina = 100
local maxStamina = 100
local staminaRegen = 12

-- Update loop
spawn(function()
    while true do
        wait(0.1)
        healthVal = humanoid.Health
        if healthVal < 0 then healthVal = 0 end
        healthBar.Size = UDim2.new(math.clamp(healthVal / maxHealth, 0, 1), 0, 1, 0)
        stamina = math.min(maxStamina, stamina + staminaRegen * 0.1)
        stamBar.Size = UDim2.new(math.clamp(stamina / maxStamina, 0, 1), 0, 1, 0)
    end
end)

-- WALK ANIMATION (CFrame-driven, non-hat)
local walkSpeed = 2.4
local walkAmp = 0.35
local walking = false
local walkStep = 0
RunService.Heartbeat:Connect(function(dt)
    local moveDir = humanoid.MoveDirection
    if moveDir.Magnitude > 0.01 and humanoid.MoveSpeed > 0 then
        walking = true
    else
        walking = false
    end
    if walking then
        walkStep = walkStep + dt * walkSpeed
        local rOff = math.sin(walkStep) * walkAmp
        local lOff = math.cos(walkStep) * walkAmp
        if rightArmPart then
            rightArmPart.CFrame = torso.CFrame * CFrame.new(1.2, 0.2 + rOff, 0) * CFrame.Angles(rOff*0.7, 0, 0)
        end
        if leftArmPart then
            leftArmPart.CFrame = torso.CFrame * CFrame.new(-1.2, 0.2 + lOff, 0) * CFrame.Angles(lOff*0.7, 0, 0)
        end
    else
        -- lerp towards idle pose
        if rightArmPart then
            rightArmPart.CFrame = rightArmPart.CFrame:Lerp(torso.CFrame * CFrame.new(1.2, 0, 0), 0.15)
        end
        if leftArmPart then
            leftArmPart.CFrame = leftArmPart.CFrame:Lerp(torso.CFrame * CFrame.new(-1.2, 0, 0), 0.15)
        end
    end
end)

-- Helper: Damage with optional knockback
local function dealDamageToHumanoid(hum, dmg, knockback)
    if not hum or not hum.Parent then return end
    local h = hum
    if h.Health <= 0 then return end
    h:TakeDamage(dmg)
    if knockback and h.Parent:FindFirstChild("HumanoidRootPart") then
        local root = h.Parent.HumanoidRootPart
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = knockback
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
        bv.Parent = root
        Debris:AddItem(bv, 0.2)
    end
end

-- Projectile creation (star)
local function createStarPart(pos, color, size)
    local p = Instance.new("Part")
    p.Shape = Enum.PartType.Ball
    p.Material = Enum.Material.Neon
    p.CanCollide = false
    p.Anchored = false
    p.Size = Vector3.new(size,size,size)
    p.CFrame = CFrame.new(pos)
    p.BrickColor = BrickColor.new(color)
    p.Parent = workspace
    return p
end

local function fireStar(origin, direction, speed, dmg, life, color, size)
    local star = createStarPart(origin, color or "Bright yellow", size or 1)
    local bv = Instance.new("BodyVelocity", star)
    bv.MaxForce = Vector3.new(1e5,1e5,1e5)
    bv.Velocity = direction.Unit * speed
    Debris:AddItem(star, life or 6)
    local conn
    conn = star.Touched:Connect(function(hit)
        if hit:IsDescendantOf(character) then return end
        local hum = hit.Parent:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health > 0 then
            dealDamageToHumanoid(hum, dmg or 20, (direction.Unit * 30) + Vector3.new(0,30,0))
            if conn then conn:Disconnect() end
            pcall(function() star:Destroy() end)
        end
    end)
end

-- STAR BLAZING ability (E)
local starBlazingCooldown = 8
local canStarBlaze = true
local function starBlazing(targetPos)
    if not canStarBlaze or stamina < 30 then return end
    canStarBlaze = false
    stamina = stamina - 30
    if sounds.starBlazing then pcall(function() sounds.starBlazing:Play() end) end
    local origin = (rightArmPart and rightArmPart.Position) or hrp.Position
    local dir = (targetPos - origin).Unit
    for i=1,5 do
        local jitter = Vector3.new(math.random(-5,5)/50, math.random(-5,5)/50, math.random(-5,5)/50)
        fireStar(origin, dir + jitter, 70, 22, 5, "Bright yellow", 0.9)
        wait(0.08)
    end
    delay(starBlazingCooldown, function() canStarBlaze = true end)
end

-- CHAOS SABERS (F) - two sabers welded to hands, oscillating
local chaosSabersActive = false
local chaosSabers = {}
local chaosSabersWelds = {}

local function createSaberModel(parent, color, length)
    local p = Instance.new("Part")
    p.Size = Vector3.new(0.28, length or 3.6, 0.28)
    p.Anchored = false
    p.CanCollide = false
    p.Material = Enum.Material.Neon
    p.BrickColor = BrickColor.new(color or "Medium purple")
    p.Parent = parent
    local mesh = Instance.new("SpecialMesh", p)
    mesh.MeshType = Enum.MeshType.Cylinder
    mesh.Scale = Vector3.new(0.6,1,0.6)
    return p
end

local function activateChaosSabers(duration)
    if chaosSabersActive then return end
    if stamina < 40 then return end
    stamina = stamina - 40
    chaosSabersActive = true
    if sounds.chaosSaber then pcall(function() sounds.chaosSaber:Play() end) end
    local rightSaber = createSaberModel(workspace, "Bright violet", 4)
    local leftSaber = createSaberModel(workspace, "Bright violet", 4)
    chaosSabers = {rightSaber, leftSaber}
    -- weld to hands
    local wr = Instance.new("WeldConstraint", rightSaber)
    wr.Part0 = rightArmPart
    wr.Part1 = rightSaber
    local wl = Instance.new("WeldConstraint", leftSaber)
    wl.Part0 = leftArmPart
    wl.Part1 = leftSaber
    -- position sabers relative to hands
    rightSaber.CFrame = rightArmPart.CFrame * CFrame.new(0, -1.6, 0) * CFrame.Angles(0,0,0)
    leftSaber.CFrame = leftArmPart.CFrame * CFrame.new(0, -1.6, 0) * CFrame.Angles(0,0,0)
    -- animate swing
    spawn(function()
        local t = 0
        while chaosSabersActive do
            t = t + 0.18
            if rightSaber and rightSaber.Parent then
                rightSaber.CFrame = rightArmPart.CFrame * CFrame.Angles(math.sin(t)*0.6, 0, 0) * CFrame.new(0, -1.6, 0)
            end
            if leftSaber and leftSaber.Parent then
                leftSaber.CFrame = leftArmPart.CFrame * CFrame.Angles(-math.sin(t)*0.6, 0, 0) * CFrame.new(0, -1.6, 0)
            end
            wait(0.03)
        end
    end)
    delay(duration or 18, function()
        for _, s in ipairs(chaosSabers) do
            pcall(function() s:Destroy() end)
        end
        chaosSabersActive = false
        chaosSabers = {}
    end)
end

-- STAR ASSAULT (V) - when chaos sabers active, fires violet stars
local starAssaultCooldown = 3
local canStarAssault = true
local function starAssault(targetPos)
    if not chaosSabersActive then return end
    if not canStarAssault or stamina < 20 then return end
    canStarAssault = false
    stamina = stamina - 20
    if sounds.chaosSaber then pcall(function() sounds.chaosSaber:Play() end) end
    local origin = rightArmPart.Position
    local dir = (targetPos - origin).Unit
    for i=1,3 do
        fireStar(origin, dir + Vector3.new(math.random(-5,5)/60, math.random(-5,5)/60, math.random(-5,5)/60), 85, 18, 4, "Medium purple", 0.8)
        wait(0.08)
    end
    delay(starAssaultCooldown, function() canStarAssault = true end)
end

-- SHOCKING BREAKER (R) - rise and lightning strikes around
local shockingCooldown = 12
local canShocking = true
local function createLightningStrike(pos)
    local bolt = Instance.new("Part")
    bolt.Size = Vector3.new(0.4, 10, 0.4)
    bolt.Anchored = true
    bolt.CanCollide = false
    bolt.Material = Enum.Material.Neon
    bolt.Color = Color3.fromRGB(150, 0, 200)
    bolt.CFrame = CFrame.new(pos + Vector3.new(0,5,0))
    bolt.Parent = workspace
    Debris:AddItem(bolt, 0.6)
    -- small explosion effect
    local exp = Instance.new("Part")
    exp.Size = Vector3.new(2,1,2)
    exp.Anchored = true
    exp.CanCollide = false
    exp.Transparency = 1
    exp.CFrame = CFrame.new(pos)
    exp.Parent = workspace
    Debris:AddItem(exp, 0.4)
end

local function shockingBreaker()
    if not canShocking or stamina < 50 then return end
    canShocking = false
    stamina = stamina - 50
    if sounds.shockingBreaker then pcall(function() sounds.shockingBreaker:Play() end) end
    local riseH = 12
    local riseT = 0.55
    local steps = 8
    -- lift
    local start = tick()
    local upPer = riseH / (riseT / 0.05)
    for i = 1, math.ceil(riseT/0.05) do
        hrp.CFrame = hrp.CFrame + Vector3.new(0, upPer*0.05, 0)
        wait(0.05)
    end
    -- create strikes
    for i = 1, steps do
        local tx = hrp.Position + Vector3.new(math.random(-8,8), 0, math.random(-8,8))
        createLightningStrike(tx)
        -- damage nearby
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and (part.Position - tx).Magnitude < 3 then
                local hum = part.Parent:FindFirstChildOfClass("Humanoid")
                if hum and hum ~= humanoid then
                    hum:TakeDamage(20)
                    if part.Parent:FindFirstChild("HumanoidRootPart") then
                        local bv = Instance.new("BodyVelocity", part.Parent.HumanoidRootPart)
                        bv.Velocity = Vector3.new(0,50,0)
                        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
                        Debris:AddItem(bv,0.25)
                    end
                end
            end
        end
        wait(0.25)
    end
    -- descend
    for i = 1, math.ceil(riseT/0.05) do
        hrp.CFrame = hrp.CFrame - Vector3.new(0, upPer*0.05, 0)
        wait(0.05)
    end
    delay(shockingCooldown, function() canShocking = true end)
end

-- DREAM SLICER (B) - teleport and spawn a clone that explodes
local dreamCooldown = 7
local canDream = true
local function createDreamCloneAt(pos)
    local clone = character:Clone()
    clone.Parent = workspace
    -- make clone non-interactable and visual fade
    for _,v in ipairs(clone:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
            v.Anchored = false
            v.Transparency = 0.4
        end
        if v:IsA("Humanoid") then
            v.Health = 0
        end
    end
    clone:SetPrimaryPartCFrame(CFrame.new(pos + Vector3.new(0,1.5,0)))
    Debris:AddItem(clone, 1.5)
    -- small area damage after spawn
    spawn(function()
        wait(0.6)
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and (part.Position - pos).Magnitude < 5 then
                local hum = part.Parent:FindFirstChildOfClass("Humanoid")
                if hum and hum ~= humanoid then
                    hum:TakeDamage(30)
                end
            end
        end
    end)
end

local function dreamSlicer(targetPos)
    if not canDream or stamina < 35 then return end
    if not chaosSabersActive then return end
    canDream = false
    stamina = stamina - 35
    if sounds.chaosSaber then pcall(function() sounds.chaosSaber:Play() end) end
    local start = hrp.Position
    hrp.CFrame = CFrame.new(targetPos + Vector3.new(0,3,0))
    createDreamCloneAt(start)
    delay(dreamCooldown, function() canDream = true end)
end

-- Basic melee combo via CFrame swing (Mouse1)
local comboStep = 0
local comboMax = 3
local lastComboTime = 0
local comboTimeout = 1.2
local canAttack = true
local function performMelee()
    if not canAttack or stamina < 8 then return end
    local now = tick()
    if now - lastComboTime > comboTimeout then
        comboStep = 0
    end
    comboStep = comboStep + 1
    if comboStep > comboMax then comboStep = 1 end
    lastComboTime = now
    stamina = math.max(0, stamina - 8)
    canAttack = false
    local originalR = rightArmPart.CFrame
    local angle = -math.rad(100) + math.rad(20 * comboStep)
    local forward = rightArmPart.CFrame * CFrame.Angles(angle, 0, 0)
    for i = 0, 1, 0.2 do
        rightArmPart.CFrame = rightArmPart.CFrame:Lerp(forward, i)
        wait(0.03)
    end
    for i = 0,1,0.2 do
        rightArmPart.CFrame = rightArmPart.CFrame:Lerp(originalR, i)
        wait(0.03)
    end
    -- hit detection sphere
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and (part.Position - hrp.Position).Magnitude < 4.5 then
            local hum = part.Parent:FindFirstChildOfClass("Humanoid")
            if hum and hum ~= humanoid then
                dealDamageToHumanoid(hum, 12 + 5*comboStep, Vector3.new((part.Position - hrp.Position).Unit.X*40, 60, (part.Position - hrp.Position).Unit.Z*40))
            end
        end
    end
    canAttack = true
end

-- Input hooking (map keys to abilities)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        local kc = input.KeyCode
        if kc == Enum.KeyCode.E then
            local hitPos = player:GetMouse().Hit.p
            starBlazing(hitPos)
        elseif kc == Enum.KeyCode.F then
            if chaosSabersActive then
                chaosSabersActive = false
                for _, s in ipairs(chaosSabers) do pcall(function() s:Destroy() end) end
                chaosSabers = {}
            else
                activateChaosSabers(18)
            end
        elseif kc == Enum.KeyCode.R then
            shockingBreaker()
        elseif kc == Enum.KeyCode.V then
            local hpos = player:GetMouse().Hit.p
            starAssault(hpos)
        elseif kc == Enum.KeyCode.B then
            local hpos = player:GetMouse().Hit.p
            dreamSlicer(hpos)
        end
    end
end)

-- Mouse click melee
player:GetMouse().Button1Down:Connect(function()
    performMelee()
end)

-- End of Part 1/2
-- Asriel (No-Hats) - Part 2/2
-- Kalan özellikler ve cleanup

-- GODLY COUNTER (N) - damage negation + counter blast
local godlyCooldown = 14
local canGodly = true
local function godlyCounter()
    if not canGodly or stamina < 50 then return end
    canGodly = false
    stamina = stamina - 50
    -- brief invulnerability
    local oldHealth = humanoid.Health
    local invConn
    invConn = humanoid.HealthChanged:Connect(function(h)
        if h < oldHealth then
            humanoid.Health = oldHealth
        end
    end)
    -- charge-up visual
    local sphere = Instance.new("Part")
    sphere.Shape = Enum.PartType.Ball
    sphere.Material = Enum.Material.Neon
    sphere.Size = Vector3.new(5,5,5)
    sphere.Color = Color3.fromRGB(255,255,255)
    sphere.CFrame = hrp.CFrame
    sphere.Anchored = true
    sphere.CanCollide = false
    sphere.Parent = workspace
    Debris:AddItem(sphere, 1)
    wait(0.8)
    if invConn then invConn:Disconnect() end
    -- counter blast
    for i = 1, 12 do
        local ang = math.rad(i * (360/12))
        local dir = Vector3.new(math.cos(ang), 0, math.sin(ang))
        fireStar(hrp.Position, dir, 80, 28, 3, "White", 1.1)
    end
    delay(godlyCooldown, function() canGodly = true end)
end

-- TIMELINE PURGING COUNTER (H) - area purge
local purgeCooldown = 20
local canPurge = true
local function timelinePurgingCounter()
    if not canPurge or stamina < 65 then return end
    canPurge = false
    stamina = stamina - 65
    -- visual dome
    local dome = Instance.new("Part")
    dome.Shape = Enum.PartType.Ball
    dome.Size = Vector3.new(0.5,0.5,0.5)
    dome.Material = Enum.Material.ForceField
    dome.CFrame = hrp.CFrame
    dome.Anchored = true
    dome.Transparency = 0.4
    dome.Parent = workspace
    local tween = TweenService:Create(dome, TweenInfo.new(1.2), {Size = Vector3.new(25,25,25)})
    tween:Play()
    spawn(function()
        wait(0.5)
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and (part.Position - hrp.Position).Magnitude < 12 then
                local hum = part.Parent:FindFirstChildOfClass("Humanoid")
                if hum and hum ~= humanoid then
                    hum:TakeDamage(45)
                end
            end
        end
    end)
    Debris:AddItem(dome, 1.5)
    delay(purgeCooldown, function() canPurge = true end)
end

-- FULL BRIGHT toggle (B with starAssault in Part1)
local fbActive = false
local lighting = game:GetService("Lighting")
local function toggleFullBright()
    fbActive = not fbActive
    if fbActive then
        lighting.Brightness = 2
        lighting.ClockTime = 14
        lighting.FogEnd = 1e5
        lighting.GlobalShadows = false
    else
        lighting.Brightness = 1
        lighting.ClockTime = 12
        lighting.FogEnd = 1000
        lighting.GlobalShadows = true
    end
end

-- DAMAGE EVENT HOOK (for debugging)
humanoid.Died:Connect(function()
    print("Asriel (No-Hats) character has died.")
end)

-- INPUT mapping for new abilities
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        local kc = input.KeyCode
        if kc == Enum.KeyCode.N then
            godlyCounter()
        elseif kc == Enum.KeyCode.H then
            timelinePurgingCounter()
        elseif kc == Enum.KeyCode.B then
            toggleFullBright()
        end
    end
end)

-- Simple anti-teleport-cheat check (rudimentary)
local lastPos = hrp.Position
spawn(function()
    while true do
        wait(0.5)
        if (hrp.Position - lastPos).Magnitude > 80 then
            print("Teleport detected")
        end
        lastPos = hrp.Position
    end
end)

-- Debug info
print("Asriel No-Hats script fully loaded.")
print("Controls:")
print("E - Star Blazing")
print("F - Chaos Sabers toggle")
print("V - Star Assault (Sabers only)")
print("B - Dream Slicer (Sabers only) / Full Bright toggle")
print("R - Shocking Breaker")
print("N - Godly Counter")
print("H - Timeline Purging Counter")
print("Mouse1 - Melee combo")

-- Keep music playing if applicable
if sounds.music then
    spawn(function()
        while true do
            if not sounds.music.IsPlaying then
                pcall(function() sounds.music:Play() end)
            end
            wait(5)
        end
    end)
end

-- End of script
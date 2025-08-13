--made by MoonSS
--fixed by ChatGPT
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local char = Instance.new("Model", workspace)
char.Name = "AsrielDreemurr"

local parts = {}

local function createPart(name, size, pos, parent)
    local p = Instance.new("Part")
    p.Name = name
    p.Size = size
    p.Position = pos
    p.Anchored = false
    p.CanCollide = false
    p.Parent = parent
    parts[name] = p
    return p
end

local torso = createPart("Torso", Vector3.new(2,2,1), Vector3.new(0,5,0), char)
local head = createPart("Head", Vector3.new(1.5,1.5,1.5), torso.Position + Vector3.new(0,1.75,0), char)
local leftArm = createPart("LeftArm", Vector3.new(0.5,2,0.5), torso.Position + Vector3.new(-1.25,0.5,0), char)
local rightArm = createPart("RightArm", Vector3.new(0.5,2,0.5), torso.Position + Vector3.new(1.25,0.5,0), char)
local leftLeg = createPart("LeftLeg", Vector3.new(0.5,2,0.5), torso.Position + Vector3.new(-0.5,-2,0), char)
local rightLeg = createPart("RightLeg", Vector3.new(0.5,2,0.5), torso.Position + Vector3.new(0.5,-2,0), char)
local tail = createPart("Tail", Vector3.new(0.5,2,0.5), torso.Position + Vector3.new(0,-1,1), char)
local leftWing = createPart("LeftWing", Vector3.new(0.5,3,0.1), torso.Position + Vector3.new(-1.5,1,0), char)
local rightWing = createPart("RightWing", Vector3.new(0.5,3,0.1), torso.Position + Vector3.new(1.5,1,0), char)

local function weldParts(p0,p1,c0)
    local w = Instance.new("Weld")
    w.Part0 = p0
    w.Part1 = p1
    w.C0 = c0 or CFrame.new()
    w.Parent = p0
end

weldParts(torso, head, CFrame.new(0,1.75,0))
weldParts(torso, leftArm, CFrame.new(-1.25,0.5,0))
weldParts(torso, rightArm, CFrame.new(1.25,0.5,0))
weldParts(torso, leftLeg, CFrame.new(-0.5,-2,0))
weldParts(torso, rightLeg, CFrame.new(0.5,-2,0))
weldParts(torso, tail, CFrame.new(0,-1,1))
weldParts(torso, leftWing, CFrame.new(-1.5,1,0))
weldParts(torso, rightWing, CFrame.new(1.5,1,0))

local idleTweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local function floatingIdle()
    local tweens = {}
    tweens[torso] = TweenService:Create(torso, idleTweenInfo, {CFrame = torso.CFrame * CFrame.new(0,0.2,0)})
    tweens[leftWing] = TweenService:Create(leftWing, idleTweenInfo, {CFrame = leftWing.CFrame * CFrame.Angles(0,0,math.rad(10))})
    tweens[rightWing] = TweenService:Create(rightWing, idleTweenInfo, {CFrame = rightWing.CFrame * CFrame.Angles(0,0,math.rad(-10))})
    for _, t in pairs(tweens) do t:Play() end
end
floatingIdle()

local speed = 0.3
RunService.RenderStepped:Connect(function()
    local move = Vector3.new(0,0,0)
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Vector3.new(0,0,-speed) end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move + Vector3.new(0,0,speed) end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move + Vector3.new(-speed,0,0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Vector3.new(speed,0,0) end
    torso.CFrame = torso.CFrame + move
end)

local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
local hpBar = Instance.new("Frame", ScreenGui)
hpBar.Size = UDim2.new(0.3,0,0.03,0)
hpBar.Position = UDim2.new(0.35,0,0.05,0)
hpBar.BackgroundColor3 = Color3.fromRGB(255,0,0)
local hpBarBG = Instance.new("Frame", ScreenGui)
hpBarBG.Size = UDim2.new(0.32,0,0.05,0)
hpBarBG.Position = UDim2.new(0.34,0,0.045,0)
hpBarBG.BackgroundColor3 = Color3.fromRGB(50,50,50)
hpBarBG.BorderSizePixel = 0

local attackIndicator = Instance.new("Frame", ScreenGui)
attackIndicator.Size = UDim2.new(0.05,0,0.02,0)
attackIndicator.Position = UDim2.new(0.475,0,0.1,0)
attackIndicator.BackgroundColor3 = Color3.fromRGB(0,255,255)
attackIndicator.BorderSizePixel = 0

local function playAttackEffect(attackType)
    if attackType == "StarBlazing" then
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(1,1,1)
        part.Position = torso.Position + torso.CFrame.LookVector*5
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://123456789" -- Star texture
        particle.Rate = 100
        particle.Lifetime = NumberRange.new(0.5,1)
        particle.Speed = NumberRange.new(5,10)
        game.Debris:AddItem(part,2)
    elseif attackType == "ShockingBreaker" then
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(2,2,2)
        part.Position = torso.Position + Vector3.new(0,2,0)
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://987654321" -- Electric texture
        particle.Rate = 150
        particle.Lifetime = NumberRange.new(0.3,0.6)
        particle.Speed = NumberRange.new(10,15)
        game.Debris:AddItem(part,1)
    end
end

local attackKeys = {
    [Enum.KeyCode.E] = "StarBlazing",
    [Enum.KeyCode.Q] = "ShockingBreaker"
}

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    local attackType = attackKeys[input.KeyCode]
    if attackType then
        playAttackEffect(attackType)
    end
end)

-- Wing flap animasyonları için ek hareket
local wingTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local leftWingFlap = TweenService:Create(leftWing, wingTweenInfo, {CFrame = leftWing.CFrame * CFrame.Angles(math.rad(20),0,0)})
local rightWingFlap = TweenService:Create(rightWing, wingTweenInfo, {CFrame = rightWing.CFrame * CFrame.Angles(math.rad(-20),0,0)})
leftWingFlap:Play()
rightWingFlap:Play()
-- Floating side-to-side hareketi
local sideTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local sideMovement = TweenService:Create(torso, sideTweenInfo, {CFrame = torso.CFrame * CFrame.new(0.5,0,0)})
sideMovement:Play()

-- Tail dalgalanması
local tailTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local tailWave = TweenService:Create(tail, tailTweenInfo, {CFrame = tail.CFrame * CFrame.Angles(0,math.rad(15),0)})
tailWave:Play()

-- Head hafif dönüş animasyonu
local headTweenInfo = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local headLook = TweenService:Create(head, headTweenInfo, {CFrame = head.CFrame * CFrame.Angles(0,math.rad(10),0)})
headLook:Play()

-- Kombine hareket ile havada süzülme efekti
RunService.RenderStepped:Connect(function()
    local floatVec = Vector3.new(0, math.sin(tick())*0.05, 0)
    torso.CFrame = torso.CFrame + floatVec
end)

-- Saldırı efektleri için GUI göstergeleri
local ultimateIndicator = Instance.new("Frame", ScreenGui)
ultimateIndicator.Size = UDim2.new(0.1,0,0.02,0)
ultimateIndicator.Position = UDim2.new(0.45,0,0.15,0)
ultimateIndicator.BackgroundColor3 = Color3.fromRGB(255,215,0)
ultimateIndicator.BorderSizePixel = 0
ultimateIndicator.Visible = false

local function triggerUltimate()
    ultimateIndicator.Visible = true
    local tween = TweenService:Create(ultimateIndicator, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 1, true), {Size = UDim2.new(0.12,0,0.03,0)})
    tween:Play()
    wait(1.5)
    ultimateIndicator.Visible = false
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.R then
        triggerUltimate()
    end
end)

-- Kanat ve kuyruk ile birlikte floating idle ve saldırı efektlerini kombine et
RunService.RenderStepped:Connect(function()
    leftWing.CFrame = leftWing.CFrame * CFrame.Angles(0, math.sin(tick()*2)*0.02, 0)
    rightWing.CFrame = rightWing.CFrame * CFrame.Angles(0, math.sin(tick()*2)*-0.02, 0)
    tail.CFrame = tail.CFrame * CFrame.Angles(0, math.sin(tick()*1.5)*0.01, 0)
end)
-- Transformasyon animasyonu (Hyperdeath form)
local hyperForm = Instance.new("Model", workspace)
hyperForm.Name = "AsrielHyperForm"

local hTorso = torso:Clone()
hTorso.Parent = hyperForm
local hHead = head:Clone()
hHead.Parent = hyperForm
local hLeftArm = leftArm:Clone()
hLeftArm.Parent = hyperForm
local hRightArm = rightArm:Clone()
hRightArm.Parent = hyperForm
local hLeftLeg = leftLeg:Clone()
hLeftLeg.Parent = hyperForm
local hRightLeg = rightLeg:Clone()
hRightLeg.Parent = hyperForm
local hTail = tail:Clone()
hTail.Parent = hyperForm
local hLeftWing = leftWing:Clone()
hLeftWing.Parent = hyperForm
local hRightWing = rightWing:Clone()
hRightWing.Parent = hyperForm

hyperForm:SetPrimaryPartCFrame(torso.CFrame + Vector3.new(0,5,0))

-- Glow ve aura efektleri
local function createAura(part, color, size)
    local aura = Instance.new("ParticleEmitter", part)
    aura.Texture = "rbxassetid://137545438" 
    aura.Color = ColorSequence.new(color)
    aura.Lifetime = NumberRange.new(1,2)
    aura.Rate = 200
    aura.Size = NumberSequence.new(size)
    aura.Speed = NumberRange.new(1,3)
    aura.LightEmission = 0.7
    aura.Enabled = false
    return aura
end

local auraParts = {hTorso,hHead,hLeftArm,hRightArm,hLeftLeg,hRightLeg,hTail}
local auras = {}
for _, p in pairs(auraParts) do
    auras[p] = createAura(p, Color3.fromRGB(255,255,255), 1)
end

-- Transformasyon tetikleme
local function triggerHyperdeath()
    char.Parent = nil
    hyperForm.Parent = workspace
    for _, aura in pairs(auras) do
        aura.Enabled = true
    end
    local tween = TweenService:Create(hTorso, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = hTorso.CFrame * CFrame.new(0,3,0)})
    tween:Play()
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.T then
        triggerHyperdeath()
    end
end)
-- Saldırı animasyonları kombosu
local comboState = 0
local comboMax = 5
local comboDelay = 0.3
local lastAttack = 0

local function playComboAttack()
    local now = tick()
    if now - lastAttack > comboDelay then
        comboState = 1
    else
        comboState = math.min(comboState + 1, comboMax)
    end
    lastAttack = now

    if comboState == 1 then
        torso.CFrame = torso.CFrame * CFrame.new(0,0,0.5)
    elseif comboState == 2 then
        torso.CFrame = torso.CFrame * CFrame.new(0,0,1)
    elseif comboState == 3 then
        torso.CFrame = torso.CFrame * CFrame.new(0,0,1.5)
    elseif comboState == 4 then
        torso.CFrame = torso.CFrame * CFrame.new(0,0,2)
    elseif comboState == 5 then
        playAttackEffect("StarBlazing")
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.F then
        playComboAttack()
    end
end)

-- Kanat ve kuyruk ekstra dalgalanma animasyonu
RunService.RenderStepped:Connect(function()
    local t = tick()
    leftWing.CFrame = leftWing.CFrame * CFrame.Angles(math.sin(t*3)*0.05,0,0)
    rightWing.CFrame = rightWing.CFrame * CFrame.Angles(math.sin(t*3)*-0.05,0,0)
    tail.CFrame = tail.CFrame * CFrame.Angles(math.sin(t*2)*0.03,0,0)
end)

-- GUI özel saldırı göstergesi
local specialAttack = Instance.new("Frame", ScreenGui)
specialAttack.Size = UDim2.new(0.08,0,0.02,0)
specialAttack.Position = UDim2.new(0.46,0,0.12,0)
specialAttack.BackgroundColor3 = Color3.fromRGB(255,0,255)
specialAttack.BorderSizePixel = 0
specialAttack.Visible = false

local function triggerSpecial()
    specialAttack.Visible = true
    local tween = TweenService:Create(specialAttack, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 1, true), {Size = UDim2.new(0.1,0,0.03,0)})
    tween:Play()
    wait(1.2)
    specialAttack.Visible = false
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Y then
        triggerSpecial()
        playAttackEffect("ShockingBreaker")
    end
end)
-- Havada ileri-geri ve sağ-sol uçuş animasyonu
local flySpeed = 0.5
local flyVector = Vector3.new(0,0,0)

RunService.RenderStepped:Connect(function()
    flyVector = Vector3.new(0,0,0)
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then flyVector = flyVector + Vector3.new(0,0,-flySpeed) end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then flyVector = flyVector + Vector3.new(0,0,flySpeed) end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then flyVector = flyVector + Vector3.new(-flySpeed,0,0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then flyVector = flyVector + Vector3.new(flySpeed,0,0) end

    torso.CFrame = torso.CFrame + flyVector

    -- Hafif yukarı-aşağı sallanma kombinasyonu
    torso.CFrame = torso.CFrame * CFrame.new(0, math.sin(tick()*2)*0.03, 0)

    -- Kanat ve kuyruk koordinasyonu
    leftWing.CFrame = leftWing.CFrame * CFrame.Angles(0, math.sin(tick()*4)*0.02, 0)
    rightWing.CFrame = rightWing.CFrame * CFrame.Angles(0, math.sin(tick()*4)*-0.02, 0)
    tail.CFrame = tail.CFrame * CFrame.Angles(0, math.sin(tick()*3)*0.02, 0)
end)

-- Animasyon tetikleme sistemi
local attackAnimations = {
    StarBlazing = function()
        playAttackEffect("StarBlazing")
        torso.CFrame = torso.CFrame * CFrame.new(0,0,1)
    end,
    ShockingBreaker = function()
        playAttackEffect("ShockingBreaker")
        torso.CFrame = torso.CFrame * CFrame.new(0,0,0.5)
    end
}

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.E then
        attackAnimations.StarBlazing()
    elseif input.KeyCode == Enum.KeyCode.Q then
        attackAnimations.ShockingBreaker()
    end
end)
-- Hyperdeath aura sürekli animasyonu
RunService.RenderStepped:Connect(function()
    if hyperForm.Parent then
        for _, aura in pairs(auras) do
            aura.Speed = NumberRange.new(2 + math.sin(tick()*5), 4 + math.sin(tick()*5))
            aura.Size = NumberSequence.new(1 + math.sin(tick()*3)*0.3)
        end

        -- Hafif yukarı-aşağı hareket
        hTorso.CFrame = hTorso.CFrame * CFrame.new(0, math.sin(tick()*2)*0.04, 0)

        -- Kanat flapp animasyonu
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(tick()*4)*0.06,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(tick()*4)*-0.06,0,0)

        -- Kuyruk dalgalanması
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(tick()*3)*0.04, 0)
    end
end)

-- Hyperdeath saldırı efektleri
local function hyperAttack(type)
    if type == "ChaosBuster" then
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(3,3,3)
        part.Position = hTorso.Position + hTorso.CFrame.LookVector*6
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://192837465" -- Energy texture
        particle.Rate = 300
        particle.Lifetime = NumberRange.new(0.6,1.2)
        particle.Speed = NumberRange.new(12,20)
        game.Debris:AddItem(part,2)
    elseif type == "Hypergooner" then
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(4,4,4)
        part.Position = hTorso.Position
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://564738291"
        particle.Rate = 250
        particle.Lifetime = NumberRange.new(0.7,1.3)
        particle.Speed = NumberRange.new(10,18)
        game.Debris:AddItem(part,2)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.U then
        hyperAttack("ChaosBuster")
    elseif input.KeyCode == Enum.KeyCode.I then
        hyperAttack("Hypergooner")
    end
end)
-- Hyperdeath form GUI
local hyperGui = Instance.new("ScreenGui", player.PlayerGui)
local hyperHPBG = Instance.new("Frame", hyperGui)
hyperHPBG.Size = UDim2.new(0.34,0,0.05,0)
hyperHPBG.Position = UDim2.new(0.33,0,0.04,0)
hyperHPBG.BackgroundColor3 = Color3.fromRGB(30,30,30)
hyperHPBG.BorderSizePixel = 0

local hyperHP = Instance.new("Frame", hyperHPBG)
hyperHP.Size = UDim2.new(1,0,1,0)
hyperHP.Position = UDim2.new(0,0,0,0)
hyperHP.BackgroundColor3 = Color3.fromRGB(255,100,100)
hyperHP.BorderSizePixel = 0

local hyperUltimate = Instance.new("Frame", hyperGui)
hyperUltimate.Size = UDim2.new(0.12,0,0.02,0)
hyperUltimate.Position = UDim2.new(0.44,0,0.15,0)
hyperUltimate.BackgroundColor3 = Color3.fromRGB(255,215,0)
hyperUltimate.BorderSizePixel = 0
hyperUltimate.Visible = false

local function triggerHyperUltimate()
    hyperUltimate.Visible = true
    local tween = TweenService:Create(hyperUltimate, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 1, true), {Size = UDim2.new(0.14,0,0.03,0)})
    tween:Play()
    wait(1.5)
    hyperUltimate.Visible = false
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.O then
        triggerHyperUltimate()
        hyperAttack("ChaosBuster")
    end
end)

-- Kamera odak ve dramatik efekti
local camera = workspace.CurrentCamera
RunService.RenderStepped:Connect(function()
    if hyperForm.Parent then
        camera.CFrame = CFrame.new(hTorso.Position + Vector3.new(0,5,15), hTorso.Position)
    else
        camera.CFrame = CFrame.new(camera.CFrame.Position, torso.Position)
    end
end)
-- Ekstra particle efektleri: uçuş toz ve enerji
local function createFlightParticles(part)
    local particle = Instance.new("ParticleEmitter", part)
    particle.Texture = "rbxassetid://321654987" -- Dust/Flight texture
    particle.Rate = 150
    particle.Lifetime = NumberRange.new(0.5,1)
    particle.Speed = NumberRange.new(2,5)
    particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5), NumberSequenceKeypoint.new(1,0)})
    particle.Rotation = NumberRange.new(0,360)
    particle.VelocitySpread = 180
    return particle
end

local flightParticles = {}
for _, p in pairs({torso,leftWing,rightWing,tail}) do
    flightParticles[p] = createFlightParticles(p)
end

-- Saldırı ve Hyperdeath efektleri ile senkronizasyon
RunService.RenderStepped:Connect(function()
    local t = tick()
    for part, emitter in pairs(flightParticles) do
        emitter.Speed = NumberRange.new(2 + math.sin(t*3), 5 + math.sin(t*3))
        emitter.Rate = 150 + math.sin(t*4)*30
        emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5+math.sin(t*2)*0.1), NumberSequenceKeypoint.new(1,0)})
    end
end)

-- Saldırı animasyonları sırasında ekstra ışık efektleri
local function attackLightEffect(pos, color, duration)
    local lightPart = Instance.new("Part", workspace)
    lightPart.Anchored = true
    lightPart.CanCollide = false
    lightPart.Size = Vector3.new(2,2,2)
    lightPart.Position = pos
    local light = Instance.new("PointLight", lightPart)
    light.Color = color
    light.Range = 15
    light.Brightness = 3
    game.Debris:AddItem(lightPart, duration)
end

local function playEnhancedAttack(type)
    if type == "StarBlazing" then
        attackLightEffect(torso.Position + torso.CFrame.LookVector*5, Color3.fromRGB(255,255,150), 0.5)
        playAttackEffect("StarBlazing")
    elseif type == "ShockingBreaker" then
        attackLightEffect(torso.Position + Vector3.new(0,2,0), Color3.fromRGB(150,255,255), 0.5)
        playAttackEffect("ShockingBreaker")
    elseif type == "ChaosBuster" then
        attackLightEffect(hTorso.Position + hTorso.CFrame.LookVector*6, Color3.fromRGB(255,0,255), 0.7)
        hyperAttack("ChaosBuster")
    elseif type == "Hypergooner" then
        attackLightEffect(hTorso.Position, Color3.fromRGB(255,50,50), 0.7)
        hyperAttack("Hypergooner")
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.E then
        playEnhancedAttack("StarBlazing")
    elseif input.KeyCode == Enum.KeyCode.Q then
        playEnhancedAttack("ShockingBreaker")
    elseif input.KeyCode == Enum.KeyCode.U then
        playEnhancedAttack("ChaosBuster")
    elseif input.KeyCode == Enum.KeyCode.I then
        playEnhancedAttack("Hypergooner")
    end
end)
-- Kuyruk ve kanat animasyonlarının daha doğal süzülmesi
local function smoothWingTailMotion()
    RunService.RenderStepped:Connect(function()
        local t = tick()
        leftWing.CFrame = leftWing.CFrame:Lerp(leftWing.CFrame * CFrame.Angles(math.sin(t*2)*0.03,0,0), 0.1)
        rightWing.CFrame = rightWing.CFrame:Lerp(rightWing.CFrame * CFrame.Angles(math.sin(t*2)*-0.03,0,0), 0.1)
        tail.CFrame = tail.CFrame:Lerp(tail.CFrame * CFrame.Angles(0, math.sin(t*1.5)*0.02, 0), 0.1)
        
        if hyperForm.Parent then
            hLeftWing.CFrame = hLeftWing.CFrame:Lerp(hLeftWing.CFrame * CFrame.Angles(math.sin(t*3)*0.05,0,0), 0.1)
            hRightWing.CFrame = hRightWing.CFrame:Lerp(hRightWing.CFrame * CFrame.Angles(math.sin(t*3)*-0.05,0,0), 0.1)
            hTail.CFrame = hTail.CFrame:Lerp(hTail.CFrame * CFrame.Angles(0, math.sin(t*2)*0.03,0), 0.1)
        end
    end)
end
smoothWingTailMotion()

-- Idle floating hareketini daha doğal yapma
local function smoothFloating()
    RunService.RenderStepped:Connect(function()
        local t = tick()
        torso.CFrame = torso.CFrame:Lerp(torso.CFrame * CFrame.new(0, math.sin(t*1.5)*0.025,0), 0.05)
        if hyperForm.Parent then
            hTorso.CFrame = hTorso.CFrame:Lerp(hTorso.CFrame * CFrame.new(0, math.sin(t*1.2)*0.035,0), 0.05)
        end
    end)
end
smoothFloating()

-- Combo ve attack animasyonlarıyla uyumlu ışık ve aura senkronizasyonu
RunService.RenderStepped:Connect(function()
    if hyperForm.Parent then
        for _, aura in pairs(auras) do
            aura.Size = NumberSequence.new(1 + math.sin(tick()*2)*0.25)
            aura.Rate = 200 + math.sin(tick()*5)*50
        end
    end
end)

-- GUI efektlerinin yumuşak açılıp kapanması
local function smoothGUIEffect(frame)
    frame.Visible = true
    local tween = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = frame.Size * UDim2.new(1.2,0,1.2,0)})
    tween:Play()
    tween.Completed:Wait()
    local tween2 = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = frame.Size})
    tween2:Play()
end

-- Saldırı sırasında GUI efekt tetikleme
local function attackGUIEffect(keyCode)
    if keyCode == Enum.KeyCode.E then
        smoothGUIEffect(attackIndicator)
    elseif keyCode == Enum.KeyCode.Q then
        smoothGUIEffect(specialAttack)
    elseif keyCode == Enum.KeyCode.U then
        smoothGUIEffect(hyperUltimate)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    attackGUIEffect(input.KeyCode)
end)
-- Hyperdeath form ve normal form geçiş animasyonu
local isHyper = false

local function toggleForm()
    if isHyper then
        hyperForm.Parent = nil
        char.Parent = workspace
        isHyper = false
    else
        char.Parent = nil
        hyperForm.Parent = workspace
        for _, aura in pairs(auras) do
            aura.Enabled = true
        end
        isHyper = true
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.P then
        toggleForm()
    end
end)

-- Hyperdeath uçuş animasyonu gelişmiş kontrol
RunService.RenderStepped:Connect(function()
    if isHyper then
        local moveVec = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + Vector3.new(0,0,-0.6) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec + Vector3.new(0,0,0.6) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec + Vector3.new(-0.6,0,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + Vector3.new(0.6,0,0) end
        hTorso.CFrame = hTorso.CFrame + moveVec
    end
end)

-- Hyperdeath form idle animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(0, math.sin(t*1.3)*0.04, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*3)*0.05,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*3)*-0.05,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*2)*0.03, 0)
    end
end)
-- Hyperdeath form özel saldırı kombosu
local hyperComboState = 0
local hyperComboMax = 4
local hyperComboDelay = 0.35
local lastHyperAttack = 0

local function playHyperCombo()
    local now = tick()
    if now - lastHyperAttack > hyperComboDelay then
        hyperComboState = 1
    else
        hyperComboState = math.min(hyperComboState + 1, hyperComboMax)
    end
    lastHyperAttack = now

    if hyperComboState == 1 then
        hyperAttack("ChaosBuster")
    elseif hyperComboState == 2 then
        hyperAttack("Hypergooner")
    elseif hyperComboState == 3 then
        hyperAttack("ChaosBuster")
    elseif hyperComboState == 4 then
        hyperAttack("Hypergooner")
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.H then
        playHyperCombo()
    end
end)

-- Hyperdeath floating side-to-side ve hafif rotate
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.5)*0.03, 0, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(0,0,math.sin(t*2)*0.03)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(0,0,math.sin(t*2)*-0.03)
    end
end)

-- Hyperdeath özel efektler: aura patlaması
local function hyperAuraBlast()
    for _, aura in pairs(auras) do
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(3,3,3)
        part.Position = aura.Parent.Position
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://876543210"
        particle.Rate = 300
        particle.Lifetime = NumberRange.new(0.5,1)
        particle.Speed = NumberRange.new(10,15)
        game.Debris:AddItem(part,1.5)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.J then
        hyperAuraBlast()
    end
end)
-- Kamera dramatik shake ve zoom efekti
local function cameraShake(intensity, duration)
    local cam = workspace.CurrentCamera
    local startTime = tick()
    local originalCFrame = cam.CFrame
    RunService.RenderStepped:Connect(function()
        local elapsed = tick() - startTime
        if elapsed > duration then return end
        local offset = Vector3.new(
            (math.random()-0.5)*2*intensity,
            (math.random()-0.5)*2*intensity,
            (math.random()-0.5)*2*intensity
        )
        cam.CFrame = originalCFrame + offset
    end)
end

-- Hyperdeath özel saldırılarla senkronize shake
local function playHyperAttackWithCamera(type)
    playEnhancedAttack(type)
    if type == "ChaosBuster" then
        cameraShake(0.3,0.5)
    elseif type == "Hypergooner" then
        cameraShake(0.4,0.6)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.U then
        playHyperAttackWithCamera("ChaosBuster")
    elseif input.KeyCode == Enum.KeyCode.I then
        playHyperAttackWithCamera("Hypergooner")
    end
end)

-- Hyperdeath aura renk değişimi animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        for _, aura in pairs(auras) do
            aura.Color = ColorSequence.new(Color3.fromHSV((t%5)/5,1,1))
        end
    end
end)

-- Floating idle sırasında ufak rotate ekleyelim
RunService.RenderStepped:Connect(function()
    if not isHyper then
        torso.CFrame = torso.CFrame * CFrame.Angles(0, math.sin(tick()*0.5)*0.01, 0)
    else
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(tick()*0.7)*0.015, 0)
    end
end)
-- Hyperdeath form teleport animasyonu
local function hyperTeleport()
    if not isHyper then return end
    local offset = Vector3.new(math.random(-10,10), math.random(0,5), math.random(-10,10))
    local targetPos = hTorso.Position + offset
    local tween = TweenService:Create(hTorso, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(targetPos)})
    tween:Play()
    playEnhancedAttack("ChaosBuster")
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.K then
        hyperTeleport()
    end
end)

-- Hyperdeath form kanat ve kuyruk hızlı flapp animasyonu
local function hyperWingTailFast()
    RunService.RenderStepped:Connect(function()
        if isHyper then
            local t = tick()
            hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.08,0,0)
            hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.08,0,0)
            hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
        end
    end)
end
hyperWingTailFast()

-- Hyperdeath form için enerji patlaması efekti
local function hyperEnergyBurst()
    if not isHyper then return end
    for i = 1,5 do
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(2,2,2)
        part.Position = hTorso.Position + Vector3.new(math.random(-3,3), math.random(-2,2), math.random(-3,3))
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://564738291"
        particle.Rate = 200
        particle.Lifetime = NumberRange.new(0.5,1)
        particle.Speed = NumberRange.new(10,15)
        game.Debris:AddItem(part,1)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.L then
        hyperEnergyBurst()
    end
end)
-- Hyperdeath form lazer saldırısı
local function hyperLazer()
    if not isHyper then return end
    local lazer = Instance.new("Part", workspace)
    lazer.Size = Vector3.new(0.5,0.5,20)
    lazer.CFrame = hTorso.CFrame * CFrame.new(0,0,-10)
    lazer.Anchored = true
    lazer.CanCollide = false
    lazer.BrickColor = BrickColor.new("Bright violet")
    local beam = Instance.new("ParticleEmitter", lazer)
    beam.Texture = "rbxassetid://345678901" -- Lazer texture
    beam.Rate = 500
    beam.Lifetime = NumberRange.new(0.5,1)
    beam.Speed = NumberRange.new(20,25)
    game.Debris:AddItem(lazer,1)
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.M then
        hyperLazer()
    end
end)

-- Hyperdeath form hover ve hover rotate efekti
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        local floatVec = Vector3.new(math.sin(t*2)*0.03, math.sin(t*1.5)*0.04, 0)
        hTorso.CFrame = hTorso.CFrame + floatVec
    end
end)

-- Hyperdeath form özel aura patlaması animasyonu
local function hyperAuraWave()
    if not isHyper then return end
    for i = 1,3 do
        for _, aura in pairs(auras) do
            local part = Instance.new("Part", workspace)
            part.Size = Vector3.new(3,3,3)
            part.Position = aura.Parent.Position
            part.Anchored = true
            part.CanCollide = false
            local particle = Instance.new("ParticleEmitter", part)
            particle.Texture = "rbxassetid://876543210"
            particle.Rate = 300
            particle.Lifetime = NumberRange.new(0.5,1)
            particle.Speed = NumberRange.new(12,18)
            game.Debris:AddItem(part,1.2)
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.N then
        hyperAuraWave()
    end
end)
-- Hyperdeath form renk değişimi ve glow efektleri
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        local hue = (t%6)/6
        local color = Color3.fromHSV(hue,1,1)
        for _, aura in pairs(auras) do
            aura.Color = ColorSequence.new(color)
            aura.LightEmission = 0.7 + math.sin(t*3)*0.2
        end
        hTorso.BrickColor = BrickColor.new(color)
        hHead.BrickColor = BrickColor.new(color)
    end
end)

-- Hyperdeath form uçuş yön kontrolü (WASD)
local function hyperFlightControl()
    RunService.RenderStepped:Connect(function()
        if not isHyper then return end
        local moveVec = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + Vector3.new(0,0,-0.7) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec + Vector3.new(0,0,0.7) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec + Vector3.new(-0.7,0,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + Vector3.new(0.7,0,0) end
        hTorso.CFrame = hTorso.CFrame + moveVec
    end)
end
hyperFlightControl()

-- Hyperdeath form idle kanat ve kuyruk koordinasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*4)*0.06,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*4)*-0.06,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*3)*0.04,0)
    end
end)

-- Hyperdeath form özel saldırı efektleri ile senkronize ışık
local function hyperAttackLight(type)
    if not isHyper then return end
    if type == "ChaosBuster" then
        attackLightEffect(hTorso.Position + hTorso.CFrame.LookVector*6, Color3.fromRGB(255,0,255),0.6)
    elseif type == "Hypergooner" then
        attackLightEffect(hTorso.Position, Color3.fromRGB(255,50,50),0.6)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.U then hyperAttackLight("ChaosBuster") end
    if input.KeyCode == Enum.KeyCode.I then hyperAttackLight("Hypergooner") end
end)
-- Hyperdeath form kombinasyon saldırısı: ışın ve aura birleştirme
local function hyperComboUltimate()
    if not isHyper then return end
    hyperLazer()
    hyperAuraWave()
    hyperEnergyBurst()
    cameraShake(0.5,0.7)
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.O then
        hyperComboUltimate()
    end
end)

-- Hyperdeath uçuş sırasında sürekli aura patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and tick()%2 < 0.03 then
        hyperAuraBlast()
    end
end)

-- Hyperdeath idle hover ve rotate kombinasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.5)*0.03, math.sin(t*1.3)*0.04, 0)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.7)*0.02, 0)
    end
end)

-- Hyperdeath form GUI güncellemeleri
RunService.RenderStepped:Connect(function()
    if isHyper then
        local hpRatio = math.clamp(hTorso.Health/100, 0,1) -- varsayım olarak 100 HP
        hyperHP.Size = UDim2.new(hpRatio,0,1,0)
    end
end)
-- Hyperdeath form için uçuş hızı artırımı ve boost animasyonu
local hyperBoost = false
local boostMultiplier = 2

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.LeftShift then
        hyperBoost = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.LeftShift then
        hyperBoost = false
    end
end)

RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        local speed = hyperBoost and 1.4 or 0.7
        local moveVec = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + Vector3.new(0,0,-speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec + Vector3.new(0,0,speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec + Vector3.new(-speed,0,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + Vector3.new(speed,0,0) end
        hTorso.CFrame = hTorso.CFrame + moveVec
    end
end)

-- Hyperdeath boost sırasında ek partikül ve ışık efekti
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosBuster")
    end
end)
-- Hyperdeath form için rastgele küçük patlamalar ve yıldız efekti
local function randomHyperParticles()
    if not isHyper then return end
    local t = tick()
    if t % 0.5 < 0.03 then
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(1,1,1)
        part.Position = hTorso.Position + Vector3.new(math.random(-3,3), math.random(-2,2), math.random(-3,3))
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://234567890" -- küçük yıldız/energy texture
        particle.Rate = 200
        particle.Lifetime = NumberRange.new(0.3,0.7)
        particle.Speed = NumberRange.new(8,12)
        game.Debris:AddItem(part,1)
    end
end

RunService.RenderStepped:Connect(function()
    randomHyperParticles()
end)

-- Hyperdeath idle esnasında kanat ve kuyruk hafif rotasyon randomizasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*5)*0.05 + math.random()*0.005,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*5)*-0.05 - math.random()*0.005,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*4)*0.035 + math.random()*0.003,0)
    end
end)
-- Hyperdeath form enerji halkası animasyonu
local function energyRingEffect()
    if not isHyper then return end
    local ring = Instance.new("Part", workspace)
    ring.Anchored = true
    ring.CanCollide = false
    ring.Size = Vector3.new(1,1,1)
    ring.Position = hTorso.Position
    local particle = Instance.new("ParticleEmitter", ring)
    particle.Texture = "rbxassetid://987654321" -- enerji halkası texture
    particle.Rate = 300
    particle.Lifetime = NumberRange.new(0.5,1)
    particle.Speed = NumberRange.new(5,10)
    particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5), NumberSequenceKeypoint.new(1,2)})
    game.Debris:AddItem(ring,1)
end

-- Rastgele zaman aralıklarıyla halka efekti
RunService.RenderStepped:Connect(function()
    if isHyper and tick()%1 < 0.02 then
        energyRingEffect()
    end
end)

-- Hyperdeath uçuş yön değişimi esnasında kanat hızlı flapp ve ufak ışık
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.07,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.07,0,0)
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(0.3,0.3,0.3)
        part.Position = hTorso.Position + Vector3.new(math.random(-1,1),math.random(-0.5,0.5),math.random(-1,1))
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://345678123"
        particle.Rate = 100
        particle.Lifetime = NumberRange.new(0.2,0.5)
        particle.Speed = NumberRange.new(5,8)
        game.Debris:AddItem(part,0.6)
    end
end)
-- Hyperdeath form özel aura puls animasyonu
local function hyperAuraPulse()
    if not isHyper then return end
    for _, aura in pairs(auras) do
        local t = tick()
        aura.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8 + math.sin(t*3)*0.2), NumberSequenceKeypoint.new(1,1.2 + math.sin(t*3)*0.2)})
        aura.LightEmission = 0.6 + math.sin(t*4)*0.2
    end
end

RunService.RenderStepped:Connect(function()
    hyperAuraPulse()
end)

-- Hyperdeath form hover esnasında ufak ileri-geri hareket ve rotate
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2)*0.02, math.sin(t*1.5)*0.03, math.sin(t*1.2)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.9)*0.015, 0)
    end
end)

-- Hyperdeath form özel saldırılar sırasında kanat ve kuyruk vuruş animasyonu
local function hyperAttackAnimation(type)
    if not isHyper then return end
    local t = tick()
    if type == "ChaosBuster" then
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(-0.2,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(-0.2,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0,0.1,0)
    elseif type == "Hypergooner" then
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(0.2,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(0.2,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0,-0.1,0)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.U then hyperAttackAnimation("ChaosBuster") end
    if input.KeyCode == Enum.KeyCode.I then hyperAttackAnimation("Hypergooner") end
end)
-- Hyperdeath form arka plan enerji efekti
local function backgroundEnergyEffect()
    if not isHyper then return end
    local bgPart = Instance.new("Part", workspace)
    bgPart.Size = Vector3.new(1,1,1)
    bgPart.Position = hTorso.Position - Vector3.new(0,2,0)
    bgPart.Anchored = true
    bgPart.CanCollide = false
    local particle = Instance.new("ParticleEmitter", bgPart)
    particle.Texture = "rbxassetid://123456789" -- enerji arka plan texture
    particle.Rate = 150
    particle.Lifetime = NumberRange.new(0.8,1.5)
    particle.Speed = NumberRange.new(5,10)
    particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3), NumberSequenceKeypoint.new(1,1)})
    game.Debris:AddItem(bgPart,2)
end

-- Rastgele arka plan enerjisi
RunService.RenderStepped:Connect(function()
    if isHyper and tick()%1 < 0.02 then
        backgroundEnergyEffect()
    end
end)

-- Hyperdeath form için kanat ve kuyruk idle hafif titreşim animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*3)*0.04,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*3)*-0.04,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*2)*0.03,0)
    end
end)

-- Hyperdeath form GUI güç barı puls animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.01,0,0.02 + math.sin(t*4)*0.005,0)
    end
end)
-- Hyperdeath form için hızlı saldırı kombinasyonu animasyonu
local hyperRapidAttackActive = false
local rapidAttackCooldown = 0.2
local lastRapidAttack = 0

local function hyperRapidAttack()
    if not isHyper then return end
    local now = tick()
    if now - lastRapidAttack < rapidAttackCooldown then return end
    lastRapidAttack = now
    playHyperAttackWithCamera("ChaosBuster")
    playHyperAttackWithCamera("Hypergooner")
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.R then
        hyperRapidAttackActive = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.R then
        hyperRapidAttackActive = false
    end
end)

RunService.RenderStepped:Connect(function()
    if hyperRapidAttackActive then
        hyperRapidAttack()
    end
end)

-- Hyperdeath idle hover sırasında küçük enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and tick()%1 < 0.03 then
        hyperEnergyBurst()
    end
end)

-- Hyperdeath form kanat ve kuyruk hızlı dalgalanma idle animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.08,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.08,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)
-- Hyperdeath form için enerji dalgası animasyonu
local function hyperEnergyWave()
    if not isHyper then return end
    for i = 1, 4 do
        local wavePart = Instance.new("Part", workspace)
        wavePart.Size = Vector3.new(1,1,1)
        wavePart.Anchored = true
        wavePart.CanCollide = false
        wavePart.Position = hTorso.Position + Vector3.new(math.random(-4,4), math.random(-2,2), math.random(-4,4))
        local particle = Instance.new("ParticleEmitter", wavePart)
        particle.Texture = "rbxassetid://192837465" -- enerji dalgası texture
        particle.Rate = 250
        particle.Lifetime = NumberRange.new(0.6,1.2)
        particle.Speed = NumberRange.new(10,15)
        particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5), NumberSequenceKeypoint.new(1,1.5)})
        game.Debris:AddItem(wavePart,1.2)
    end
end

-- Rastgele zamanlarda enerji dalgası tetikleme
RunService.RenderStepped:Connect(function()
    if isHyper and tick()%1.5 < 0.03 then
        hyperEnergyWave()
    end
end)

-- Hyperdeath form uçuş yön değişimi sırasında kanat ve kuyruk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*7)*0.09,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*7)*-0.09,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*6)*0.07,0)
    end
end)

-- Hyperdeath form için GUI aura glow animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için teleport sonrası patlama efekti
local function hyperTeleportBurst()
    if not isHyper then return end
    for i = 1,5 do
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(1,1,1)
        part.Position = hTorso.Position + Vector3.new(math.random(-3,3), math.random(-2,2), math.random(-3,3))
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://564738291"
        particle.Rate = 300
        particle.Lifetime = NumberRange.new(0.5,1)
        particle.Speed = NumberRange.new(10,15)
        game.Debris:AddItem(part,1)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.T then
        hyperTeleport()
        hyperTeleportBurst()
    end
end)

-- Hyperdeath idle hover sırasında kanat ve kuyruk hafif titremesi
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*4)*0.05,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*4)*-0.05,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*3)*0.04,0)
    end
end)

-- Hyperdeath form enerji partikülleri rastgele
RunService.RenderStepped:Connect(function()
    if isHyper and tick()%0.7 < 0.03 then
        hyperEnergyBurst()
    end
end)
-- Hyperdeath form için sürekli enerji halo animasyonu
local function hyperEnergyHalo()
    if not isHyper then return end
    local halo = Instance.new("Part", workspace)
    halo.Size = Vector3.new(1,1,1)
    halo.Position = hTorso.Position
    halo.Anchored = true
    halo.CanCollide = false
    local particle = Instance.new("ParticleEmitter", halo)
    particle.Texture = "rbxassetid://876512340" -- halo texture
    particle.Rate = 250
    particle.Lifetime = NumberRange.new(0.5,1)
    particle.Speed = NumberRange.new(8,12)
    particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5), NumberSequenceKeypoint.new(1,1.8)})
    game.Debris:AddItem(halo,1.2)
end

RunService.RenderStepped:Connect(function()
    if isHyper and tick()%1 < 0.03 then
        hyperEnergyHalo()
    end
end)

-- Hyperdeath form uçuş yön kontrolü ve boost kombinasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        local speed = hyperBoost and 1.5 or 0.7
        local moveVec = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + Vector3.new(0,0,-speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec + Vector3.new(0,0,speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec + Vector3.new(-speed,0,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + Vector3.new(speed,0,0) end
        hTorso.CFrame = hTorso.CFrame + moveVec
    end
end)

-- Hyperdeath idle animasyonu: hafif ileri-geri ve yukarı-aşağı dalgalanma
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.2)*0.03, math.sin(t*1.5)*0.04, math.sin(t*1.1)*0.02)
    end
end)
-- Hyperdeath form için özel saldırı zinciri animasyonu
local function hyperChainAttack()
    if not isHyper then return end
    for i = 1,3 do
        delay(i*0.2, function()
            hyperLazer()
            hyperAuraWave()
            hyperAttackFlash()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.P then
        hyperChainAttack()
    end
end)

-- Hyperdeath hover esnasında kanat ve kuyruk koordinasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*5)*0.07,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*5)*-0.07,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*4)*0.06,0)
    end
end)

-- Hyperdeath idle sırasında hafif dönen enerji parçacıkları
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        if t % 1 < 0.03 then
            hyperEnergyBurst()
        end
    end
end)

-- Hyperdeath GUI ultimate bar puls animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*3)*0.013,0,0.02 + math.sin(t*3)*0.007,0)
    end
end)
-- Hyperdeath form için teleport ve lazer kombinasyonu
local function hyperTeleportLazer()
    if not isHyper then return end
    hyperTeleport()
    wait(0.15)
    hyperLazer()
    hyperAuraBlast()
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.G then
        hyperTeleportLazer()
    end
end)

-- Hyperdeath form kanat ve kuyruk idle hafif salınım animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*4)*0.05 + math.random()*0.002,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*4)*-0.05 - math.random()*0.002,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*3)*0.04 + math.random()*0.003,0)
    end
end)

-- Hyperdeath form rastgele enerji halo ve yıldız patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and tick()%0.8 < 0.03 then
        hyperEnergyHalo()
    end
end)

-- Hyperdeath form uçuş esnasında boost efektleri ve partiküller
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosBuster")
    end
end)
-- Hyperdeath form için ultimate zincir saldırısı animasyonu
local function hyperUltimateChain()
    if not isHyper then return end
    for i = 1,5 do
        delay(i*0.15, function()
            hyperLazer()
            hyperAuraWave()
            hyperEnergyBurst()
            hyperAttackFlash()
            cameraShake(0.4,0.5)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.H then
        hyperUltimateChain()
    end
end)

-- Hyperdeath form hover ve idle animasyon kombosu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.5)*0.03, math.sin(t*1.3)*0.035, math.sin(t*1.2)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.8)*0.02, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.08,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.08,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- Hyperdeath form GUI ultimate bar puls ve renk değişimi
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.015,0,0.02 + math.sin(t*4)*0.007,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için rastgele enerji yıldızları ve patlamaları
local function hyperRandomStars()
    if not isHyper then return end
    for i = 1,3 do
        local star = Instance.new("Part", workspace)
        star.Size = Vector3.new(0.5,0.5,0.5)
        star.Position = hTorso.Position + Vector3.new(math.random(-4,4), math.random(-2,2), math.random(-4,4))
        star.Anchored = true
        star.CanCollide = false
        local particle = Instance.new("ParticleEmitter", star)
        particle.Texture = "rbxassetid://345612789"
        particle.Rate = 150
        particle.Lifetime = NumberRange.new(0.4,0.8)
        particle.Speed = NumberRange.new(6,12)
        game.Debris:AddItem(star,1)
    end
end

RunService.RenderStepped:Connect(function()
    if isHyper and tick()%0.6 < 0.03 then
        hyperRandomStars()
    end
end)

-- Hyperdeath form uçuş yön değişimi ve boost kombinasyonu animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        local speed = hyperBoost and 1.6 or 0.7
        local moveVec = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + Vector3.new(0,0,-speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec + Vector3.new(0,0,speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec + Vector3.new(-speed,0,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + Vector3.new(speed,0,0) end
        hTorso.CFrame = hTorso.CFrame + moveVec
    end
end)

-- Hyperdeath form hover sırasında kanat ve kuyruk hafif titreme
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*5)*0.06,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*5)*-0.06,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*4)*0.05,0)
    end
end)
-- Hyperdeath form için enerji dalga zinciri animasyonu
local function hyperWaveChain()
    if not isHyper then return end
    for i = 1,4 do
        delay(i*0.2, function()
            hyperEnergyWave()
            hyperAuraBlast()
            hyperAttackFlash()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.J then
        hyperWaveChain()
    end
end)

-- Hyperdeath idle hover sırasında kanat ve kuyruk dalgalanması
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.07,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.07,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- Hyperdeath form GUI enerji barı puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.014,0,0.02 + math.sin(t*4)*0.007,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)

-- Hyperdeath form rastgele enerji halo animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper and tick()%0.9 < 0.03 then
        hyperEnergyHalo()
    end
end)
-- Hyperdeath form için üst üste lazer ve aura kombinasyonu
local function hyperLazerCombo()
    if not isHyper then return end
    for i = 1,3 do
        delay(i*0.15, function()
            hyperLazer()
            hyperAuraWave()
            hyperAttackFlash()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.K then
        hyperLazerCombo()
    end
end)

-- Hyperdeath hover ve idle animasyonu: hafif ileri-geri, yukarı-aşağı
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.3)*0.03, math.sin(t*1.5)*0.035, math.sin(t*1.2)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.9)*0.02, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*5)*0.08,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*5)*-0.08,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*4)*0.06,0)
    end
end)

-- Hyperdeath form boost esnasında enerji partikül ve ışık efektleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosBuster")
    end
end)

-- Hyperdeath form GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.015,0,0.02 + math.sin(t*4)*0.007,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için rastgele mini enerji patlamaları
local function hyperMiniBursts()
    if not isHyper then return end
    for i = 1,5 do
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(0.3,0.3,0.3)
        part.Position = hTorso.Position + Vector3.new(math.random(-2,2), math.random(-1,1), math.random(-2,2))
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://654321987"
        particle.Rate = 200
        particle.Lifetime = NumberRange.new(0.3,0.6)
        particle.Speed = NumberRange.new(5,10)
        game.Debris:AddItem(part,0.8)
    end
end

RunService.RenderStepped:Connect(function()
    if isHyper and tick()%0.5 < 0.03 then
        hyperMiniBursts()
    end
end)

-- Hyperdeath hover esnasında kanat ve kuyruk dalgalanması
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.07,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.07,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- Hyperdeath form GUI ultimate bar puls animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.013,0,0.02 + math.sin(t*4)*0.006,0)
    end
end)

-- Hyperdeath boost uçuş animasyonu ve partikül efektleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("Hypergooner")
    end
end)
-- Hyperdeath form için teleport zinciri animasyonu
local function hyperTeleportChain()
    if not isHyper then return end
    for i = 1,3 do
        delay(i*0.2, function()
            hyperTeleport()
            hyperEnergyBurst()
            hyperAuraBlast()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.L then
        hyperTeleportChain()
    end
end)

-- Hyperdeath idle hover sırasında kanat ve kuyruk hafif titreşim
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*5)*0.06,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*5)*-0.06,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*4)*0.05,0)
    end
end)

-- Hyperdeath form rastgele enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and tick()%0.7 < 0.03 then
        hyperEnergyBurst()
    end
end)

-- Hyperdeath GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.014,0,0.02 + math.sin(t*4)*0.007,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için enerji halka patlaması animasyonu
local function hyperEnergyRingBurst()
    if not isHyper then return end
    for i = 1,4 do
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(0.7,0.7,0.7)
        part.Position = hTorso.Position + Vector3.new(math.random(-3,3), math.random(-2,2), math.random(-3,3))
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://789654123"
        particle.Rate = 220
        particle.Lifetime = NumberRange.new(0.4,0.9)
        particle.Speed = NumberRange.new(8,14)
        particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,1.6)})
        game.Debris:AddItem(part,1.1)
    end
end

RunService.RenderStepped:Connect(function()
    if isHyper and tick()%1 < 0.03 then
        hyperEnergyRingBurst()
    end
end)

-- Hyperdeath form kanat ve kuyruk uçuş animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.08,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.08,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.07,0)
    end
end)

-- Hyperdeath hover ve idle animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.4)*0.03, math.sin(t*1.6)*0.035, math.sin(t*1.3)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.85)*0.02, 0)
    end
end)

-- Hyperdeath GUI ultimate bar puls animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.015,0,0.02 + math.sin(t*4)*0.007,0)
    end
end)
-- Hyperdeath form için lazer zinciri ve enerji patlaması
local function hyperLazerBurstChain()
    if not isHyper then return end
    for i = 1,4 do
        delay(i*0.18, function()
            hyperLazer()
            hyperEnergyBurst()
            hyperAttackFlash()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.M then
        hyperLazerBurstChain()
    end
end)

-- Hyperdeath hover esnasında kanat ve kuyruk koordinasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.09,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.09,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.07,0)
    end
end)

-- Hyperdeath idle animasyonu: hafif ileri-geri ve yukarı-aşağı dalgalanma
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.5)*0.03, math.sin(t*1.4)*0.035, math.sin(t*1.2)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.9)*0.02, 0)
    end
end)

-- Hyperdeath boost uçuş sırasında partikül ve ışık efektleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosBuster")
    end
end)

-- Hyperdeath GUI ultimate bar puls ve renk değişimi
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.016,0,0.02 + math.sin(t*4)*0.008,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için enerji halo zinciri animasyonu
local function hyperHaloChain()
    if not isHyper then return end
    for i = 1,5 do
        delay(i*0.2, function()
            hyperEnergyHalo()
            hyperAttackFlash()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.N then
        hyperHaloChain()
    end
end)

-- Hover animasyonu: hafif sağ-sol ve yukarı-aşağı salınım
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.6)*0.03, math.sin(t*1.5)*0.035, math.sin(t*1.3)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.85)*0.02, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.08,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.08,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- Hyperdeath boost uçuş animasyonu ve enerji partikülleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("Hypergooner")
    end
end)

-- GUI ultimate bar puls animasyonu ve renk değişimi
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.015,0,0.02 + math.sin(t*4)*0.007,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için rastgele enerji patlamaları ve yıldız animasyonu
local function hyperRandomBurst()
    if not isHyper then return end
    for i = 1,4 do
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(0.5,0.5,0.5)
        part.Position = hTorso.Position + Vector3.new(math.random(-3,3), math.random(-2,2), math.random(-3,3))
        part.Anchored = true
        part.CanCollide = false
        local particle = Instance.new("ParticleEmitter", part)
        particle.Texture = "rbxassetid://987654321"
        particle.Rate = 200
        particle.Lifetime = NumberRange.new(0.4,0.8)
        particle.Speed = NumberRange.new(7,12)
        particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3), NumberSequenceKeypoint.new(1,1.2)})
        game.Debris:AddItem(part,1)
    end
end

RunService.RenderStepped:Connect(function()
    if isHyper and tick()%0.6 < 0.03 then
        hyperRandomBurst()
    end
end)

-- Hyperdeath form uçuş animasyonu: yön ve boost kombinasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        local speed = hyperBoost and 1.7 or 0.7
        local moveVec = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + Vector3.new(0,0,-speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec + Vector3.new(0,0,speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec + Vector3.new(-speed,0,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + Vector3.new(speed,0,0) end
        hTorso.CFrame = hTorso.CFrame + moveVec
    end
end)

-- Hover animasyonu: kanat ve kuyruk dalgalanması
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.07,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.07,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- GUI ultimate bar puls animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.014,0,0.02 + math.sin(t*4)*0.007,0)
    end
end)
-- Hyperdeath form için lazer ve enerji patlama kombinasyonu
local function hyperLazerWave()
    if not isHyper then return end
    for i = 1,3 do
        delay(i*0.2, function()
            hyperLazer()
            hyperEnergyWave()
            hyperAttackFlash()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.O then
        hyperLazerWave()
    end
end)

-- Hover ve idle animasyonu: hafif ileri-geri, yukarı-aşağı
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.5)*0.03, math.sin(t*1.4)*0.035, math.sin(t*1.2)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.85)*0.02, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.08,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.08,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- Boost uçuş animasyonu ve enerji partikülleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("Hypergooner")
    end
end)

-- GUI ultimate bar puls ve renk değişimi
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.016,0,0.02 + math.sin(t*4)*0.008,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için rastgele enerji halo patlamaları
local function hyperRandomHalo()
    if not isHyper then return end
    for i = 1,5 do
        local halo = Instance.new("Part", workspace)
        halo.Size = Vector3.new(0.6,0.6,0.6)
        halo.Position = hTorso.Position + Vector3.new(math.random(-3,3), math.random(-2,2), math.random(-3,3))
        halo.Anchored = true
        halo.CanCollide = false
        local particle = Instance.new("ParticleEmitter", halo)
        particle.Texture = "rbxassetid://123987456"
        particle.Rate = 180
        particle.Lifetime = NumberRange.new(0.4,0.8)
        particle.Speed = NumberRange.new(7,13)
        particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3), NumberSequenceKeypoint.new(1,1.4)})
        game.Debris:AddItem(halo,1)
    end
end

RunService.RenderStepped:Connect(function()
    if isHyper and tick()%0.8 < 0.03 then
        hyperRandomHalo()
    end
end)

-- Hyperdeath hover ve idle animasyonu: kanat ve kuyruk salınımı
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.09,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.09,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.07,0)
    end
end)

-- Hyperdeath uçuş animasyonu: boost ve yön kontrolü
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        local speed = hyperBoost and 1.8 or 0.7
        local moveVec = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + Vector3.new(0,0,-speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec + Vector3.new(0,0,speed) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec + Vector3.new(-speed,0,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + Vector3.new(speed,0,0) end
        hTorso.CFrame = hTorso.CFrame + moveVec
    end
end)

-- GUI ultimate bar puls animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.015,0,0.02 + math.sin(t*4)*0.007,0)
    end
end)
-- Hyperdeath form için enerji halka ve ışık patlamaları kombinasyonu
local function hyperRingLightBurst()
    if not isHyper then return end
    for i = 1,3 do
        delay(i*0.2, function()
            hyperEnergyHalo()
            hyperAttackLight("ChaosWave")
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Q then
        hyperRingLightBurst()
    end
end)

-- Hover animasyonu: hafif sağ-sol ve yukarı-aşağı
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.7)*0.03, math.sin(t*1.5)*0.036, math.sin(t*1.3)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.9)*0.02, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.08,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.08,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- Boost uçuş animasyonu ve enerji partikülleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("Hypergooner")
    end
end)

-- GUI ultimate bar puls ve renk değişimi
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.016,0,0.02 + math.sin(t*4)*0.008,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için rastgele enerji patlaması ve mini lazer zinciri
local function hyperMiniLazerBurst()
    if not isHyper then return end
    for i = 1,4 do
        delay(i*0.15, function()
            hyperEnergyBurst()
            hyperLazer()
            hyperAttackFlash()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.R then
        hyperMiniLazerBurst()
    end
end)

-- Hover animasyonu: torso, kanat ve kuyruk dalgalanması
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.6)*0.03, math.sin(t*1.4)*0.035, math.sin(t*1.3)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.85)*0.02, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.09,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.09,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.07,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık efektleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosBuster")
    end
end)

-- GUI ultimate bar puls ve renk değişimi animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.015,0,0.02 + math.sin(t*4)*0.007,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için enerji dalgası ve ışık patlaması zinciri
local function hyperWaveLightChain()
    if not isHyper then return end
    for i = 1,5 do
        delay(i*0.18, function()
            hyperEnergyWave()
            hyperAttackLight("ChaosWave")
            hyperAttackFlash()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.T then
        hyperWaveLightChain()
    end
end)

-- Hover ve idle animasyonu: hafif sağ-sol ve yukarı-aşağı salınım
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.5)*0.03, math.sin(t*1.4)*0.035, math.sin(t*1.3)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.85)*0.02, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.08,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.08,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- Boost uçuş animasyonu ve enerji partikül efektleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("Hypergooner")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.016,0,0.02 + math.sin(t*4)*0.008,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için rastgele mini enerji halkaları
local function hyperMiniHaloChain()
    if not isHyper then return end
    for i = 1,4 do
        local halo = Instance.new("Part", workspace)
        halo.Size = Vector3.new(0.4,0.4,0.4)
        halo.Position = hTorso.Position + Vector3.new(math.random(-2,2), math.random(-1,1), math.random(-2,2))
        halo.Anchored = true
        halo.CanCollide = false
        local particle = Instance.new("ParticleEmitter", halo)
        particle.Texture = "rbxassetid://321654987"
        particle.Rate = 200
        particle.Lifetime = NumberRange.new(0.3,0.7)
        particle.Speed = NumberRange.new(5,10)
        particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.2), NumberSequenceKeypoint.new(1,1)})
        game.Debris:AddItem(halo,0.9)
    end
end

RunService.RenderStepped:Connect(function()
    if isHyper and tick()%0.5 < 0.03 then
        hyperMiniHaloChain()
    end
end)

-- Hover animasyonu: torso, kanat ve kuyruk hafif dalgalanma
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.4)*0.03, math.sin(t*1.6)*0.034, math.sin(t*1.3)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.9)*0.02, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.07,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.07,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- Boost uçuş animasyonu ve enerji partikülleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosBuster")
    end
end)

-- GUI ultimate bar puls animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.015,0,0.02 + math.sin(t*4)*0.007,0)
    end
end)
-- Hyperdeath form için enerji dalgası ve mini lazer kombinasyonu
local function hyperWaveMiniLazer()
    if not isHyper then return end
    for i = 1,3 do
        delay(i*0.2, function()
            hyperEnergyWave()
            hyperLazer()
            hyperAttackFlash()
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Y then
        hyperWaveMiniLazer()
    end
end)

-- Hover animasyonu: torso, kanat ve kuyruk hafif dalgalanma
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.5)*0.03, math.sin(t*1.4)*0.035, math.sin(t*1.3)*0.02)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.85)*0.02, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6)*0.08,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6)*-0.08,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5)*0.06,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık efektleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("Hypergooner")
    end
end)

-- GUI ultimate bar puls ve renk değişimi
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.12 + math.sin(t*4)*0.016,0,0.02 + math.sin(t*4)*0.008,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%5)/5,1,1)
    end
end)
-- Hyperdeath form için mega enerji patlama zinciri (yukarıdan aşağıya)
local function hyperMegaBurstChain()
    if not isHyper then return end
    for i = 1,6 do
        delay(i*0.12, function()
            local part = Instance.new("Part", workspace)
            part.Size = Vector3.new(1,1,1)
            part.Position = hTorso.Position + Vector3.new(math.random(-4,4), math.random(2,5), math.random(-4,4))
            part.Anchored = true
            part.CanCollide = false
            local particle = Instance.new("ParticleEmitter", part)
            particle.Texture = "rbxassetid://852963741"
            particle.Rate = 250
            particle.Lifetime = NumberRange.new(0.5,1)
            particle.Speed = NumberRange.new(10,18)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5), NumberSequenceKeypoint.new(1,2)})
            game.Debris:AddItem(part,1.2)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.U then
        hyperMegaBurstChain()
    end
end)

-- Hover animasyonu: hafif sağ-sol ve yukarı-aşağı, torso dalgalanması
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.8)*0.035, math.sin(t*1.6)*0.04, math.sin(t*1.4)*0.025)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*0.95)*0.025, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6.5)*0.09,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6.5)*-0.09,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5.5)*0.07,0)
    end
end)

-- Boost uçuş animasyonu: hızlı ileri ve enerji partikülleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("MegaGooner")
    end
end)

-- GUI ultimate bar renk ve puls animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.13 + math.sin(t*4.5)*0.017,0,0.022 + math.sin(t*4.5)*0.009,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%6)/6,1,1)
    end
end)
-- Hyperdeath form için “kaotik yıldız fırtınası” animasyonu
local function hyperChaosStarStorm()
    if not isHyper then return end
    for i = 1,8 do
        delay(i*0.1, function()
            local star = Instance.new("Part", workspace)
            star.Size = Vector3.new(0.5,0.5,0.5)
            star.Position = hTorso.Position + Vector3.new(math.random(-5,5), math.random(3,6), math.random(-5,5))
            star.Anchored = true
            star.CanCollide = false
            local particle = Instance.new("ParticleEmitter", star)
            particle.Texture = "rbxassetid://963258741"
            particle.Rate = 300
            particle.Lifetime = NumberRange.new(0.4,0.9)
            particle.Speed = NumberRange.new(12,20)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3), NumberSequenceKeypoint.new(1,1.8)})
            game.Debris:AddItem(star,1.3)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.I then
        hyperChaosStarStorm()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk hafifçe salınıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*1.9)*0.035, math.sin(t*1.7)*0.042, math.sin(t*1.5)*0.025)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.0)*0.025, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*6.7)*0.095,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*6.7)*-0.095,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*5.7)*0.075,0)
    end
end)

-- Boost uçuş animasyonu: hızlı yönlendirme ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.14 + math.sin(t*5)*0.018,0,0.024 + math.sin(t*5)*0.01,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%7)/7,1,1)
    end
end)
-- Hyperdeath form için “enerji yıldız bombardımanı” animasyonu
local function hyperEnergyStarRain()
    if not isHyper then return end
    for i = 1,10 do
        delay(i*0.08, function()
            local star = Instance.new("Part", workspace)
            star.Size = Vector3.new(0.6,0.6,0.6)
            star.Position = hTorso.Position + Vector3.new(math.random(-6,6), math.random(4,7), math.random(-6,6))
            star.Anchored = true
            star.CanCollide = false
            local particle = Instance.new("ParticleEmitter", star)
            particle.Texture = "rbxassetid://147852369"
            particle.Rate = 280
            particle.Lifetime = NumberRange.new(0.5,1.0)
            particle.Speed = NumberRange.new(14,22)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,2)})
            game.Debris:AddItem(star,1.5)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.P then
        hyperEnergyStarRain()
    end
end)

-- Hover animasyonu: torso ve kanatlar hafifçe dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.0)*0.04, math.sin(t*1.8)*0.045, math.sin(t*1.6)*0.03)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.05)*0.03, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*7.0)*0.1,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*7.0)*-0.1,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*6.0)*0.08,0)
    end
end)

-- Boost uçuş animasyonu: ileri yön ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("StarBlaster")
    end
end)

-- GUI ultimate bar puls ve renk değişimi
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.145 + math.sin(t*5.2)*0.019,0,0.025 + math.sin(t*5.2)*0.011,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%8)/8,1,1)
    end
end)
-- Hyperdeath form için “kaotik lazer fırtınası” animasyonu
local function hyperChaosLazerStorm()
    if not isHyper then return end
    for i = 1,6 do
        delay(i*0.12, function()
            local lazer = Instance.new("Part", workspace)
            lazer.Size = Vector3.new(0.3,0.3,6)
            lazer.CFrame = CFrame.new(hTorso.Position + Vector3.new(math.random(-5,5), math.random(3,6), math.random(-5,5)))
            lazer.Anchored = true
            lazer.CanCollide = false
            local particle = Instance.new("ParticleEmitter", lazer)
            particle.Texture = "rbxassetid://159753486"
            particle.Rate = 220
            particle.Lifetime = NumberRange.new(0.4,0.8)
            particle.Speed = NumberRange.new(12,18)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3), NumberSequenceKeypoint.new(1,1.5)})
            game.Debris:AddItem(lazer,1)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.L then
        hyperChaosLazerStorm()
    end
end)

-- Hover animasyonu: torso ve kanatlar dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.1)*0.04, math.sin(t*1.9)*0.046, math.sin(t*1.7)*0.03)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.1)*0.03, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*7.2)*0.105,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*7.2)*-0.105,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*6.2)*0.085,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık efektleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosGooner")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.15 + math.sin(t*5.5)*0.02,0,0.026 + math.sin(t*5.5)*0.012,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%9)/9,1,1)
    end
end)
-- Hyperdeath form için “enerji patlaması ve spiral lazer” animasyonu
local function hyperSpiralLazerBurst()
    if not isHyper then return end
    for i = 1,7 do
        delay(i*0.1, function()
            local part = Instance.new("Part", workspace)
            part.Size = Vector3.new(0.5,0.5,0.5)
            local angle = i * math.pi/4
            part.Position = hTorso.Position + Vector3.new(math.cos(angle)*3, math.random(2,5), math.sin(angle)*3)
            part.Anchored = true
            part.CanCollide = false
            local particle = Instance.new("ParticleEmitter", part)
            particle.Texture = "rbxassetid://258741369"
            particle.Rate = 240
            particle.Lifetime = NumberRange.new(0.5,1)
            particle.Speed = NumberRange.new(10,18)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,1.6)})
            game.Debris:AddItem(part,1.2)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.K then
        hyperSpiralLazerBurst()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.2)*0.045, math.sin(t*2.0)*0.048, math.sin(t*1.8)*0.032)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.15)*0.035, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*7.5)*0.11,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*7.5)*-0.11,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*6.5)*0.09,0)
    end
end)

-- Boost uçuş animasyonu ve enerji partikülleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("SpiralNova")
    end
end)

-- GUI ultimate bar puls ve renk değişimi
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.155 + math.sin(t*5.8)*0.021,0,0.028 + math.sin(t*5.8)*0.013,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%10)/10,1,1)
    end
end)
-- Hyperdeath form için “çift katmanlı enerji patlaması” animasyonu
local function hyperDoubleLayerBurst()
    if not isHyper then return end
    for i = 1,5 do
        delay(i*0.15, function()
            for j = 1,2 do
                local layerPart = Instance.new("Part", workspace)
                layerPart.Size = Vector3.new(0.6,0.6,0.6)
                layerPart.Position = hTorso.Position + Vector3.new(math.random(-4,4), math.random(2,6), math.random(-4,4))
                layerPart.Anchored = true
                layerPart.CanCollide = false
                local particle = Instance.new("ParticleEmitter", layerPart)
                particle.Texture = j == 1 and "rbxassetid://369258147" or "rbxassetid://741852963"
                particle.Rate = 260
                particle.Lifetime = NumberRange.new(0.4,0.9)
                particle.Speed = NumberRange.new(10,20)
                particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,1.8)})
                game.Debris:AddItem(layerPart,1.4)
            end
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.J then
        hyperDoubleLayerBurst()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk hafifçe salınıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.3)*0.046, math.sin(t*2.1)*0.05, math.sin(t*1.9)*0.033)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.2)*0.035, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*7.8)*0.115,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*7.8)*-0.115,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*6.8)*0.092,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık efektleri
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("DoubleNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.16 + math.sin(t*6)*0.022,0,0.03 + math.sin(t*6)*0.014,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%11)/11,1,1)
    end
end)
-- Hyperdeath form için “spiral enerji bombardımanı” animasyonu
local function hyperSpiralEnergyRain()
    if not isHyper then return end
    for i = 1,9 do
        delay(i*0.1, function()
            local angle = i * math.pi/5
            local spiralPart = Instance.new("Part", workspace)
            spiralPart.Size = Vector3.new(0.5,0.5,0.5)
            spiralPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*4, math.random(3,6), math.sin(angle)*4)
            spiralPart.Anchored = true
            spiralPart.CanCollide = false
            local particle = Instance.new("ParticleEmitter", spiralPart)
            particle.Texture = "rbxassetid://963147852"
            particle.Rate = 300
            particle.Lifetime = NumberRange.new(0.5,1.0)
            particle.Speed = NumberRange.new(12,22)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3), NumberSequenceKeypoint.new(1,1.7)})
            game.Debris:AddItem(spiralPart,1.5)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.O then
        hyperSpiralEnergyRain()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanması
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.4)*0.048, math.sin(t*2.2)*0.052, math.sin(t*2.0)*0.035)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.25)*0.038, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*8.0)*0.12,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*8.0)*-0.12,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*7.0)*0.095,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("SpiralBlaster")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.165 + math.sin(t*6.2)*0.023,0,0.032 + math.sin(t*6.2)*0.015,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%12)/12,1,1)
    end
end)
-- Hyperdeath form için “çift spiral lazer patlaması” animasyonu
local function hyperDoubleSpiralLazer()
    if not isHyper then return end
    for i = 1,8 do
        delay(i*0.12, function()
            local angle = i * math.pi/4
            local lazerPart = Instance.new("Part", workspace)
            lazerPart.Size = Vector3.new(0.4,0.4,5)
            lazerPart.CFrame = CFrame.new(hTorso.Position + Vector3.new(math.cos(angle)*3, math.random(2,5), math.sin(angle)*3))
            lazerPart.Anchored = true
            lazerPart.CanCollide = false
            local particle = Instance.new("ParticleEmitter", lazerPart)
            particle.Texture = "rbxassetid://852147963"
            particle.Rate = 250
            particle.Lifetime = NumberRange.new(0.4,0.9)
            particle.Speed = NumberRange.new(14,20)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3), NumberSequenceKeypoint.new(1,1.6)})
            game.Debris:AddItem(lazerPart,1.2)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.M then
        hyperDoubleSpiralLazer()
    end
end)

-- Hover animasyonu: torso ve kanatlar dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.5)*0.05, math.sin(t*2.3)*0.055, math.sin(t*2.1)*0.037)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.3)*0.04, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*8.2)*0.125,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*8.2)*-0.125,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*7.2)*0.1,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("DoubleSpiralNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.17 + math.sin(t*6.5)*0.024,0,0.034 + math.sin(t*6.5)*0.016,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%13)/13,1,1)
    end
end)
-- Hyperdeath form için “kaotik enerji spiral bombardımanı”
local function hyperChaosSpiralRain()
    if not isHyper then return end
    for i = 1,10 do
        delay(i*0.09, function()
            local angle = i * math.pi/6
            local part = Instance.new("Part", workspace)
            part.Size = Vector3.new(0.5,0.5,0.5)
            part.Position = hTorso.Position + Vector3.new(math.cos(angle)*5, math.random(3,6), math.sin(angle)*5)
            part.Anchored = true
            part.CanCollide = false
            local particle = Instance.new("ParticleEmitter", part)
            particle.Texture = "rbxassetid://741963852"
            particle.Rate = 320
            particle.Lifetime = NumberRange.new(0.4,0.95)
            particle.Speed = NumberRange.new(13,21)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.35), NumberSequenceKeypoint.new(1,1.75)})
            game.Debris:AddItem(part,1.5)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.N then
        hyperChaosSpiralRain()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.6)*0.052, math.sin(t*2.4)*0.057, math.sin(t*2.2)*0.038)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.35)*0.042, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*8.5)*0.13,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*8.5)*-0.13,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*7.5)*0.105,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosSpiralNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.175 + math.sin(t*6.8)*0.025,0,0.036 + math.sin(t*6.8)*0.017,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%14)/14,1,1)
    end
end)
-- Hyperdeath form için “katmanlı enerji patlama ve spiral lazer” animasyonu
local function hyperLayeredSpiralBurst()
    if not isHyper then return end
    for i = 1,7 do
        delay(i*0.11, function()
            for j = 1,3 do
                local part = Instance.new("Part", workspace)
                part.Size = Vector3.new(0.5,0.5,0.5)
                local angle = i * math.pi/5 + j * math.pi/6
                part.Position = hTorso.Position + Vector3.new(math.cos(angle)*4, math.random(2,5), math.sin(angle)*4)
                part.Anchored = true
                part.CanCollide = false
                local particle = Instance.new("ParticleEmitter", part)
                particle.Texture = j == 1 and "rbxassetid://369741852" or (j == 2 and "rbxassetid://147963258" or "rbxassetid://852741963")
                particle.Rate = 280
                particle.Lifetime = NumberRange.new(0.45,1.0)
                particle.Speed = NumberRange.new(12,22)
                particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.35), NumberSequenceKeypoint.new(1,1.7)})
                game.Debris:AddItem(part,1.5)
            end
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.B then
        hyperLayeredSpiralBurst()
    end
end)

-- Hover animasyonu: torso ve kanatlar hafif dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.7)*0.054, math.sin(t*2.5)*0.058, math.sin(t*2.3)*0.04)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.4)*0.045, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*8.8)*0.135,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*8.8)*-0.135,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*7.8)*0.11,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("LayeredSpiralNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.18 + math.sin(t*7)*0.026,0,0.038 + math.sin(t*7)*0.018,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%15)/15,1,1)
    end
end)
-- Hyperdeath form için “enerji dalga ve spiral patlama” animasyonu
local function hyperWaveSpiralExplosion()
    if not isHyper then return end
    for i = 1,9 do
        delay(i*0.1, function()
            local angle = i * math.pi/6
            local wavePart = Instance.new("Part", workspace)
            wavePart.Size = Vector3.new(0.5,0.5,0.5)
            wavePart.Position = hTorso.Position + Vector3.new(math.cos(angle)*5, math.random(3,6), math.sin(angle)*5)
            wavePart.Anchored = true
            wavePart.CanCollide = false
            local particle = Instance.new("ParticleEmitter", wavePart)
            particle.Texture = "rbxassetid://963852741"
            particle.Rate = 310
            particle.Lifetime = NumberRange.new(0.45,1.0)
            particle.Speed = NumberRange.new(14,23)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,1.8)})
            game.Debris:AddItem(wavePart,1.5)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.V then
        hyperWaveSpiralExplosion()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.8)*0.056, math.sin(t*2.6)*0.06, math.sin(t*2.4)*0.042)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.45)*0.048, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*9.0)*0.14,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*9.0)*-0.14,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*8.0)*0.115,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("WaveSpiralNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.185 + math.sin(t*7.2)*0.027,0,0.04 + math.sin(t*7.2)*0.02,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%16)/16,1,1)
    end
end)
-- Hyperdeath form için “çift katmanlı enerji spiral fırtınası”
local function hyperDoubleWaveSpiral()
    if not isHyper then return end
    for i = 1,8 do
        delay(i*0.12, function()
            for j = 1,2 do
                local part = Instance.new("Part", workspace)
                part.Size = Vector3.new(0.5,0.5,0.5)
                local angle = i * math.pi/4 + j * math.pi/5
                part.Position = hTorso.Position + Vector3.new(math.cos(angle)*4, math.random(2,5), math.sin(angle)*4)
                part.Anchored = true
                part.CanCollide = false
                local particle = Instance.new("ParticleEmitter", part)
                particle.Texture = j == 1 and "rbxassetid://258963147" or "rbxassetid://147852963"
                particle.Rate = 300
                particle.Lifetime = NumberRange.new(0.5,1.1)
                particle.Speed = NumberRange.new(12,22)
                particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.35), NumberSequenceKeypoint.new(1,1.75)})
                game.Debris:AddItem(part,1.6)
            end
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.C then
        hyperDoubleWaveSpiral()
    end
end)

-- Hover animasyonu: torso ve kanatlar dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*2.9)*0.058, math.sin(t*2.7)*0.062, math.sin(t*2.5)*0.044)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.5)*0.05, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*9.2)*0.145,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*9.2)*-0.145,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*8.2)*0.12,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("DoubleWaveNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.19 + math.sin(t*7.5)*0.028,0,0.042 + math.sin(t*7.5)*0.021,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%17)/17,1,1)
    end
end)
-- Hyperdeath form için “kaotik enerji vortex patlaması”
local function hyperChaosVortex()
    if not isHyper then return end
    for i = 1,10 do
        delay(i*0.1, function()
            local angle = i * math.pi/5
            local vortexPart = Instance.new("Part", workspace)
            vortexPart.Size = Vector3.new(0.5,0.5,0.5)
            vortexPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*5, math.random(3,6), math.sin(angle)*5)
            vortexPart.Anchored = true
            vortexPart.CanCollide = false
            local particle = Instance.new("ParticleEmitter", vortexPart)
            particle.Texture = "rbxassetid://369258741"
            particle.Rate = 330
            particle.Lifetime = NumberRange.new(0.5,1.05)
            particle.Speed = NumberRange.new(15,24)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,1.85)})
            game.Debris:AddItem(vortexPart,1.6)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.X then
        hyperChaosVortex()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.0)*0.06, math.sin(t*2.8)*0.065, math.sin(t*2.6)*0.046)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.55)*0.052, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*9.5)*0.15,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*9.5)*-0.15,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*8.5)*0.125,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("ChaosVortexNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.195 + math.sin(t*7.8)*0.03,0,0.044 + math.sin(t*7.8)*0.022,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%18)/18,1,1)
    end
end)
-- Hyperdeath form için “enerji halo ve yıldız fırtınası” animasyonu
local function hyperHaloStarStorm()
    if not isHyper then return end
    for i = 1,12 do
        delay(i*0.08, function()
            local angle = i * math.pi/6
            local starPart = Instance.new("Part", workspace)
            starPart.Size = Vector3.new(0.4,0.4,0.4)
            starPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*6, math.random(3,7), math.sin(angle)*6)
            starPart.Anchored = true
            starPart.CanCollide = false
            local particle = Instance.new("ParticleEmitter", starPart)
            particle.Texture = "rbxassetid://147963258"
            particle.Rate = 350
            particle.Lifetime = NumberRange.new(0.5,1.1)
            particle.Speed = NumberRange.new(15,25)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.35), NumberSequenceKeypoint.new(1,2)})
            game.Debris:AddItem(starPart,1.7)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Z then
        hyperHaloStarStorm()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk hafifçe dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.1)*0.062, math.sin(t*2.9)*0.068, math.sin(t*2.7)*0.048)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.6)*0.055, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*9.8)*0.155,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*9.8)*-0.155,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*8.8)*0.13,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("HaloStarNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.2 + math.sin(t*8)*0.032,0,0.046 + math.sin(t*8)*0.024,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%19)/19,1,1)
    end
end)
-- Hyperdeath form için “dönerek enerji patlaması ve ışık kılıcı fırlatması”
local function hyperSpinEnergySlash()
    if not isHyper then return end
    for i = 1,8 do
        delay(i*0.1, function()
            local angle = i * math.pi/4
            local slashPart = Instance.new("Part", workspace)
            slashPart.Size = Vector3.new(0.6,0.6,0.6)
            slashPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*5, math.random(2,5), math.sin(angle)*5)
            slashPart.Anchored = true
            slashPart.CanCollide = false
            local particle = Instance.new("ParticleEmitter", slashPart)
            particle.Texture = "rbxassetid://258147369"
            particle.Rate = 320
            particle.Lifetime = NumberRange.new(0.5,1.1)
            particle.Speed = NumberRange.new(14,24)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,1.8)})
            game.Debris:AddItem(slashPart,1.6)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Q then
        hyperSpinEnergySlash()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.2)*0.064, math.sin(t*3.0)*0.07, math.sin(t*2.8)*0.05)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.65)*0.058, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*10.0)*0.16,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*10.0)*-0.16,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*9.0)*0.135,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("SpinSlashNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.205 + math.sin(t*8.2)*0.034,0,0.048 + math.sin(t*8.2)*0.026,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%20)/20,1,1)
    end
end)
-- Hyperdeath form için “çift katmanlı yıldız ve enerji patlaması”
local function hyperDoubleStarBurst()
    if not isHyper then return end
    for i = 1,10 do
        delay(i*0.09, function()
            for j = 1,2 do
                local angle = i * math.pi/5 + j * math.pi/6
                local starPart = Instance.new("Part", workspace)
                starPart.Size = Vector3.new(0.5,0.5,0.5)
                starPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*5, math.random(2,6), math.sin(angle)*5)
                starPart.Anchored = true
                starPart.CanCollide = false
                local particle = Instance.new("ParticleEmitter", starPart)
                particle.Texture = j == 1 and "rbxassetid://963258741" or "rbxassetid://741369852"
                particle.Rate = 340
                particle.Lifetime = NumberRange.new(0.5,1.2)
                particle.Speed = NumberRange.new(14,25)
                particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,1.9)})
                game.Debris:AddItem(starPart,1.7)
            end
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.E then
        hyperDoubleStarBurst()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.3)*0.066, math.sin(t*3.1)*0.072, math.sin(t*2.9)*0.052)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.7)*0.06, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*10.2)*0.165,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*10.2)*-0.165,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*9.2)*0.14,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("DoubleStarNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.21 + math.sin(t*8.5)*0.036,0,0.05 + math.sin(t*8.5)*0.028,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%21)/21,1,1)
    end
end)
-- Hyperdeath form için “enerji halo ve spiral yıldız fırtınası”
local function hyperHaloSpiralStorm()
    if not isHyper then return end
    for i = 1,12 do
        delay(i*0.08, function()
            local angle = i * math.pi/6
            local haloPart = Instance.new("Part", workspace)
            haloPart.Size = Vector3.new(0.4,0.4,0.4)
            haloPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*6, math.random(3,7), math.sin(angle)*6)
            haloPart.Anchored = true
            haloPart.CanCollide = false
            local particle = Instance.new("ParticleEmitter", haloPart)
            particle.Texture = "rbxassetid://258147963"
            particle.Rate = 360
            particle.Lifetime = NumberRange.new(0.5,1.2)
            particle.Speed = NumberRange.new(15,26)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,2)})
            game.Debris:AddItem(haloPart,1.8)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.R then
        hyperHaloSpiralStorm()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.4)*0.068, math.sin(t*3.2)*0.074, math.sin(t*3.0)*0.054)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.75)*0.062, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*10.5)*0.17,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*10.5)*-0.17,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*9.5)*0.145,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("HaloSpiralNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.215 + math.sin(t*8.8)*0.038,0,0.052 + math.sin(t*8.8)*0.03,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%22)/22,1,1)
    end
end)
-- Hyperdeath form için “katmanlı enerji vortex ve ışık patlaması”
local function hyperLayeredVortex()
    if not isHyper then return end
    for i = 1,10 do
        delay(i*0.1, function()
            for j = 1,2 do
                local angle = i * math.pi/5 + j * math.pi/6
                local vortexPart = Instance.new("Part", workspace)
                vortexPart.Size = Vector3.new(0.5,0.5,0.5)
                vortexPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*5, math.random(2,6), math.sin(angle)*5)
                vortexPart.Anchored = true
                vortexPart.CanCollide = false
                local particle = Instance.new("ParticleEmitter", vortexPart)
                particle.Texture = j == 1 and "rbxassetid://369147258" or "rbxassetid://147258369"
                particle.Rate = 350
                particle.Lifetime = NumberRange.new(0.5,1.2)
                particle.Speed = NumberRange.new(15,25)
                particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,1.85)})
                game.Debris:AddItem(vortexPart,1.8)
            end
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.T then
        hyperLayeredVortex()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk hafifçe dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.5)*0.07, math.sin(t*3.3)*0.076, math.sin(t*3.1)*0.056)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.8)*0.065, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*10.8)*0.175,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*10.8)*-0.175,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*9.8)*0.15,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("LayeredVortexNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.22 + math.sin(t*9)*0.04,0,0.054 + math.sin(t*9)*0.032,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%23)/23,1,1)
    end
end)
-- Hyperdeath form için “spiral enerji ve yıldız bombardımanı”
local function hyperSpiralStarRain()
    if not isHyper then return end
    for i = 1,12 do
        delay(i*0.085, function()
            local angle = i * math.pi/6
            local starPart = Instance.new("Part", workspace)
            starPart.Size = Vector3.new(0.45,0.45,0.45)
            starPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*6, math.random(3,7), math.sin(angle)*6)
            starPart.Anchored = true
            starPart.CanCollide = false
            local particle = Instance.new("ParticleEmitter", starPart)
            particle.Texture = "rbxassetid://963147258"
            particle.Rate = 370
            particle.Lifetime = NumberRange.new(0.5,1.25)
            particle.Speed = NumberRange.new(16,26)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.45), NumberSequenceKeypoint.new(1,2.0)})
            game.Debris:AddItem(starPart,1.9)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Y then
        hyperSpiralStarRain()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.6)*0.072, math.sin(t*3.4)*0.078, math.sin(t*3.2)*0.058)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.85)*0.068, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*11.0)*0.18,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*11.0)*-0.18,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*10.0)*0.155,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("SpiralStarNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.225 + math.sin(t*9.2)*0.042,0,0.056 + math.sin(t*9.2)*0.034,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%24)/24,1,1)
    end
end)
-- Hyperdeath form için “enerji patlaması ve kuyruk spiral saldırısı”
local function hyperTailSpiralBlast()
    if not isHyper then return end
    for i = 1,9 do
        delay(i*0.11, function()
            local angle = i * math.pi/5
            local tailPart = Instance.new("Part", workspace)
            tailPart.Size = Vector3.new(0.5,0.5,0.5)
            tailPart.Position = hTail.Position + Vector3.new(math.cos(angle)*4, math.random(1,4), math.sin(angle)*4)
            tailPart.Anchored = true
            tailPart.CanCollide = false
            local particle = Instance.new("ParticleEmitter", tailPart)
            particle.Texture = "rbxassetid://741258963"
            particle.Rate = 320
            particle.Lifetime = NumberRange.new(0.45,1.05)
            particle.Speed = NumberRange.new(13,23)
            particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.35), NumberSequenceKeypoint.new(1,1.7)})
            game.Debris:AddItem(tailPart,1.6)
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.U then
        hyperTailSpiralBlast()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.7)*0.074, math.sin(t*3.5)*0.08, math.sin(t*3.3)*0.06)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.9)*0.07, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*11.2)*0.185,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*11.2)*-0.185,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*10.2)*0.16,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("TailSpiralNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.23 + math.sin(t*9.4)*0.044,0,0.058 + math.sin(t*9.4)*0.036,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%25)/25,1,1)
    end
end)
-- Hyperdeath form için “çift katmanlı enerji halo ve kuyruk spiral fırtınası”
local function hyperTailHaloSpiral()
    if not isHyper then return end
    for i = 1,10 do
        delay(i*0.09, function()
            for j = 1,2 do
                local angle = i * math.pi/5 + j * math.pi/6
                local part = Instance.new("Part", workspace)
                part.Size = Vector3.new(0.5,0.5,0.5)
                part.Position = hTail.Position + Vector3.new(math.cos(angle)*5, math.random(2,5), math.sin(angle)*5)
                part.Anchored = true
                part.CanCollide = false
                local particle = Instance.new("ParticleEmitter", part)
                particle.Texture = j == 1 and "rbxassetid://369852147" or "rbxassetid://258963741"
                particle.Rate = 360
                particle.Lifetime = NumberRange.new(0.5,1.2)
                particle.Speed = NumberRange.new(15,26)
                particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.4), NumberSequenceKeypoint.new(1,1.9)})
                game.Debris:AddItem(part,1.8)
            end
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.I then
        hyperTailHaloSpiral()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk hafifçe dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.8)*0.076, math.sin(t*3.6)*0.082, math.sin(t*3.4)*0.062)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*1.95)*0.072, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*11.5)*0.19,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*11.5)*-0.19,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*10.5)*0.165,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("TailHaloSpiralNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.235 + math.sin(t*9.6)*0.046,0,0.06 + math.sin(t*9.6)*0.038,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%26)/26,1,1)
    end
end)
-- Hyperdeath form için “çift katmanlı spiral ve enerji patlaması kombinasyonu”
local function hyperDualSpiralBurst()
    if not isHyper then return end
    for i = 1,12 do
        delay(i*0.08, function()
            for j = 1,2 do
                local angle = i * math.pi/6 + j * math.pi/7
                local part = Instance.new("Part", workspace)
                part.Size = Vector3.new(0.45,0.45,0.45)
                part.Position = hTorso.Position + Vector3.new(math.cos(angle)*6, math.random(3,7), math.sin(angle)*6)
                part.Anchored = true
                part.CanCollide = false
                local particle = Instance.new("ParticleEmitter", part)
                particle.Texture = j == 1 and "rbxassetid://147963258" or "rbxassetid://258741369"
                particle.Rate = 370
                particle.Lifetime = NumberRange.new(0.5,1.3)
                particle.Speed = NumberRange.new(16,27)
                particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.45), NumberSequenceKeypoint.new(1,2.0)})
                game.Debris:AddItem(part,1.9)
            end
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode_O then
        hyperDualSpiralBurst()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*3.9)*0.078, math.sin(t*3.7)*0.084, math.sin(t*3.5)*0.064)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*2.0)*0.074, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*11.8)*0.195,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*11.8)*-0.195,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*10.8)*0.17,0)
    end
end)

-- Boost uçuş animasyonu ve enerji ışık patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("DualSpiralNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.24 + math.sin(t*9.8)*0.048,0,0.062 + math.sin(t*9.8)*0.04,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%27)/27,1,1)
    end
end)
-- Hyperdeath form için “enerji halo ve çift katmanlı yıldız fırtınası”
local function hyperHaloDoubleStar()
    if not isHyper then return end
    for i = 1,10 do
        delay(i*0.09, function()
            for j = 1,2 do
                local angle = i * math.pi/5 + j * math.pi/6
                local starPart = Instance.new("Part", workspace)
                starPart.Size = Vector3.new(0.5,0.5,0.5)
                starPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*5, math.random(2,6), math.sin(angle)*5)
                starPart.Anchored = true
                starPart.CanCollide = false
                local particle = Instance.new("ParticleEmitter", starPart)
                particle.Texture = j == 1 and "rbxassetid://369147852" or "rbxassetid://258963147"
                particle.Rate = 380
                particle.Lifetime = NumberRange.new(0.5,1.25)
                particle.Speed = NumberRange.new(16,28)
                particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.45), NumberSequenceKeypoint.new(1,2.0)})
                game.Debris:AddItem(starPart,1.9)
            end
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode_P then
        hyperHaloDoubleStar()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk hafifçe dalgalanıyor
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*4.0)*0.08, math.sin(t*3.8)*0.086, math.sin(t*3.6)*0.066)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*2.05)*0.076, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*12.0)*0.2,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*12.0)*-0.2,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*11.0)*0.175,0)
    end
end)

-- Boost uçuş animasyonu ve enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("HaloDoubleStarNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.245 + math.sin(t*10)*0.05,0,0.064 + math.sin(t*10)*0.042,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%28)/28,1,1)
    end
end)
-- Hyperdeath form için “ultimate enerji fırtınası ve tüm efektlerin birleşimi”
local function hyperUltimateStorm()
    if not isHyper then return end
    for i = 1,12 do
        delay(i*0.075, function()
            for j = 1,3 do
                local angle = i * math.pi/6 + j * math.pi/8
                local stormPart = Instance.new("Part", workspace)
                stormPart.Size = Vector3.new(0.5,0.5,0.5)
                stormPart.Position = hTorso.Position + Vector3.new(math.cos(angle)*6, math.random(3,8), math.sin(angle)*6)
                stormPart.Anchored = true
                stormPart.CanCollide = false
                local particle = Instance.new("ParticleEmitter", stormPart)
                particle.Texture = j == 1 and "rbxassetid://369852147" or (j == 2 and "rbxassetid://147963258" or "rbxassetid://258741369")
                particle.Rate = 400
                particle.Lifetime = NumberRange.new(0.5,1.3)
                particle.Speed = NumberRange.new(17,28)
                particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5), NumberSequenceKeypoint.new(1,2.2)})
                game.Debris:AddItem(stormPart,2)
            end
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Space then
        hyperUltimateStorm()
    end
end)

-- Hover animasyonu: torso, kanatlar ve kuyruk dalgalanıyor, son varyasyon
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hTorso.CFrame = hTorso.CFrame * CFrame.new(math.sin(t*4.2)*0.082, math.sin(t*4.0)*0.088, math.sin(t*3.8)*0.068)
        hTorso.CFrame = hTorso.CFrame * CFrame.Angles(0, math.sin(t*2.1)*0.078, 0)
        hLeftWing.CFrame = hLeftWing.CFrame * CFrame.Angles(math.sin(t*12.5)*0.205,0,0)
        hRightWing.CFrame = hRightWing.CFrame * CFrame.Angles(math.sin(t*12.5)*-0.205,0,0)
        hTail.CFrame = hTail.CFrame * CFrame.Angles(0, math.sin(t*11.5)*0.18,0)
    end
end)

-- Boost uçuş animasyonu ve ultimate enerji patlamaları
RunService.RenderStepped:Connect(function()
    if isHyper and hyperBoost then
        hyperEnergyBurst()
        hyperAttackLight("UltimateStormNova")
    end
end)

-- GUI ultimate bar puls ve renk animasyonu, final varyasyon
RunService.RenderStepped:Connect(function()
    if isHyper then
        local t = tick()
        hyperUltimate.Size = UDim2.new(0.25 + math.sin(t*10.2)*0.052,0,0.066 + math.sin(t*10.2)*0.044,0)
        hyperUltimate.BackgroundColor3 = Color3.fromHSV((t%30)/30,1,1)
    end
end)
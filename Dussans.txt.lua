--[[
	req list
	
	heart control (the force)
	
	teleport
	
	bone zone
	
	throw bones
--]]

--//COMPATIBILITY SCRIPT--
--https://github.com/Mokiros/roblox-FE-compatibility

local Level=666
local function RiseLevel(hum,dmg)
if tonumber(Level)then
if hum.Health>0 and hum.Health-dmg<=0 then Level=Level+1
local s=Instance.new("Sound")end--s. end
else warn'String is not able to level up , or having issure to level.'end
end

local Tired={n=0,m=10000,d=false}local DefAble=true
local p = game:service'Players'.LocalPlayer
local char = p.Character
local mouse = p:GetMouse()
local larm = char["Left Arm"]
local rarm = char["Right Arm"]
local lleg = char["Left Leg"]
local rleg = char["Right Leg"]
local hed = char.Head
local Torso = char.Torso
local hum = char.Humanoid
local cam = workspace.CurrentCamera
local root = char.HumanoidRootPart
local deb = false
local shot = 0
local potential = false
local debris=game:service"Debris"
local l = game:GetService("Lighting")
local rs = game:GetService("RunService").RenderStepped
ptz = {0.8, 0.85, 0.9, 0.95, 1, 1.05, 1.1}
math.randomseed(os.time())
for i,v in pairs(char:children()) do
	if v:IsA("Accessory") then
		v:Destroy()
	end
end
for i,v in pairs (hed:GetChildren()) do
		if v:IsA("Sound") then
				v:Destroy()
		end
end
music = Instance.new("Sound",c)
music2 = Instance.new("Sound",c)
local pl = game:service'Players'.LocalPlayer
local chara = pl.Character
local hum = chara:FindFirstChildOfClass("Humanoid")
hum.MaxHealth = 10000000000000000000
hum.Health = 10000000000000000000
maincol = "White"
increment = 20
if 1 then
	local MovesGui=Instance.new("ScreenGui",p:FindFirstChildOfClass("PlayerGui"))
	local Frm=Instance.new("Frame",MovesGui)Frm.BackgroundColor3=Color3.new()Frm.BorderSizePixel=0
	Frm.BackgroundTransparency=.5 Frm.Size=UDim2.new(.3,0,.5,0)local Show=true Frm.Position=UDim2.new(.7,0,.5,0)
	local idk=Instance.new("TextButton",Frm)idk.Size=UDim2.new(.5,0,.1,0)idk.Position=UDim2.new(-.5,0,.8,0)
	idk.Text="Hide"idk.TextStrokeTransparency=0 idk.BackgroundTransparency=.5 idk.BackgroundColor3=Color3.new()
	idk.BorderSizePixel=0 idk.TextColor3=Color3.new(1,1,1)
	idk.MouseButton1Click:connect(function()Show=not Show idk.Text=Show and "Hide"or"Show"end)
	local normal=Instance.new("TextLabel",Frm)normal.Size=UDim2.new(1,0,1,0)normal.TextStrokeTransparency=0
	normal.BackgroundTransparency=1 normal.TextColor3=Color3.new(1,1,1)
	normal.TextXAlignment="Left"normal.TextYAlignment="Top"
	normal.Text=[[* Able to hold
! It changes function when sprint
----------------------------------
K: Passive
!*Q :Gaster Blaster (quick)
! E  :Gaster Blaster (high damage)
T  :Teleport
F  :Bone Zone
*G :Bone Throw
*C :Heart Control
Shift : Sprint

Hey arthurfoxy i am sebastian :P
]]
	spawn(function()
	while game:service'RunService'.RenderStepped:wait()do
		Frm.Position=Frm.Position:lerp(UDim2.new(not Show and 1 or .7,0,.5,0),.1)
	end end)
end
--------------------------------------------------------
hed.face.Texture = "rbxassetid://871052201"
chara:WaitForChild"Body Colors"
char["Body Colors"].HeadColor = BrickColor.new("Institutional white")
char["Body Colors"].LeftArmColor = BrickColor.new("Institutional white")
char["Body Colors"].RightArmColor = BrickColor.new("Institutional white")
char["Body Colors"].TorsoColor = BrickColor.new("Institutional white")
char["Body Colors"].RightLegColor = BrickColor.new("Institutional white")
char["Body Colors"].LeftLegColor = BrickColor.new("Institutional white")
---------------------------------------
ypcall(function()
shirt = Instance.new("Shirt", char)
shirt.Name = "Shirt"
pants = Instance.new("Pants", char)
pants.Name = "Pants"
char.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=357134154"
char.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=343128365"
end)
--------------------------------------------------------		
KG = Instance.new("Sound", game.Players.LocalPlayer.Character)
KG.Volume = 3
KG.SoundId = "rbxassetid://519341881"
KG.Looped = true
KG:Play()

--------------------------------------------------------
CV="Eggplant"
	p = game.Players.LocalPlayer
	char = p.Character
	local txt = Instance.new("BillboardGui", char)
	txt.Adornee = char .Head
	txt.Name = "_status"
	txt.Size = UDim2.new(2, 0, 1.2, 0)
	txt.StudsOffset = Vector3.new(-9, 8, 0)
	local text = Instance.new("TextLabel", txt)
	text.Size = UDim2.new(10, 0, 7, 0)
	text.FontSize = "Size24"
	text.TextScaled = true
	text.TextTransparency = 0
	text.BackgroundTransparency = 1 
	text.TextTransparency = 0
	text.TextStrokeTransparency = 0
	text.Font = "Arcade"
	text.TextStrokeColor3 = Color3.new(255,255,255)

	v=Instance.new("Part")
	v.Name = "ColorBrick"
	v.Parent=p.Character
	v.FormFactor="Symmetric"
	v.Anchored=true
	v.CanCollide=false
	v.BottomSurface="Smooth"
	v.TopSurface="Smooth"
	v.Size=Vector3.new(10,5,3)
	v.Transparency=1
	v.CFrame=char.Torso.CFrame
	v.BrickColor=BrickColor.new(CV)
	v.Transparency=1
	text.TextColor3 = Color3.new(0,0,0)
	v.Shape="Block"
	wait()
	text.Text = "Do You Wanna Have A Mad Time?"
	wait(2)
	text.Text = "Any last words? Kiddo";
		wait(3)
	text.Text = "Dust!Sans"
--------------------------------------------------------  
		pls = game:GetService'Players'
		rs = game:GetService'RunService'
		uinps = game:GetService'UserInputService'
		lp = pls.LocalPlayer
		mouse = lp:GetMouse()
		c = lp.Character
		human = c.Humanoid
		human.MaxHealth = 1/0
		wait()
		human.Health = 0/0
		c.Health:Destroy()
--------------------------------------------------------
		Hulmet = Instance.new("Part")
		Hulmet.Position = Hulmet.Position + Vector3.new(0,10,0)
		Hulmet.Parent = game.Players.LocalPlayer.Character
		Hulmet.Name = "Helmet"
		Hulmet.Size = Vector3.new(1.643, 1.157, 1.696)
		Hulmet.Material = Enum.Material.Metal
		Hulmet.BrickColor = BrickColor.new("Grey")
		MSHE = Instance.new("SpecialMesh")
		MSHE.Parent = Hulmet
		MSHE.MeshId = "rbxassetid://101203373"
		WULD = Instance.new("Weld")
		WULD.Parent = Hulmet
		WULD.Part0 = Hulmet
		WULD.Part1 = game.Players.LocalPlayer.Character.Head
		WULD.C1 = CFrame.Angles(0,0,0)
		WULD.C0 = CFrame.new(0,0,0)
--------------------------------------------------------

		Debounces = {
				AnimationCycles = 0;
				FPS = 0;
				scalingDamage = false;
				damageLevel = 0;
				attackNumber = 0;
				isAttacking = false;
				isMoving = false;
				isSprinting = false;
				isBoosting = false;
				isPassive = false;
				isTyping = false;
		}

--------------------------------------------------------

		numLerp = function(start, goal, alpha)
				return(((goal - start) * alpha) + start)
		end

		CFrameZero = function()
				return CFrame.new(Vector3.new())
		end

		rad = function(value)
				return math.rad(value)
		end

		CFAngles = function(Vector)
				return CFrame.Angles(rad(Vector.x),rad(Vector.y),rad(Vector.z))
		end

--------------------------------------------------------

		AnimStat = {
				lerpSpeed = .2;
				lerpSpeed2 = .35;
				lerpTween = 0;
		}

		Joints = {
				c.HumanoidRootPart.RootJoint;
				c.Torso.Neck;
				c.Torso['Left Shoulder'];
				c.Torso['Right Shoulder'];
				c.Torso['Left Hip'];
				c.Torso['Right Hip'];
		}

		JointTargets = {
				CFrameZero();
				CFrameZero();
				CFrameZero();
				CFrameZero();
				CFrameZero();
				CFrameZero();
		}

--------------------------------------------------------

		BodyColors = {
				HeadColor = BrickColor.new("Institutional white");
				LeftArmColor = BrickColor.new("Institutional white");
				RightArmColor = BrickColor.new("Institutional white");
				LeftLegColor = BrickColor.new("Institutional white");
				RightLegColor = BrickColor.new("Institutional white");
				TorsoColor = BrickColor.new("Mid gray");
		}

		Customs = {
				Face = "http://www.roblox.com/asset/?id=871052201";
				Shirt = "http://www.roblox.com/asset/?id=357134155";
				Pants = "http://www.roblox.com/asset/?id=343128366";
		}

--------------------------------------------------------

		prepareCharacter = function()
				local transPoints = {
						NumberSequenceKeypoint.new(0,.819,.0375),
						NumberSequenceKeypoint.new(.207,.594,.0187),
						NumberSequenceKeypoint.new(.4,.55,.031),
						NumberSequenceKeypoint.new(.57,.619,.05),
						NumberSequenceKeypoint.new(.76,.8,.0375),
						NumberSequenceKeypoint.new(1,1,0),
				}
				local sizePoints = {
						NumberSequenceKeypoint.new(0,.687,0),
						NumberSequenceKeypoint.new(.111,.875,0),
						NumberSequenceKeypoint.new(.327,1.19,0),
						NumberSequenceKeypoint.new(.646,1.56,0),
						NumberSequenceKeypoint.new(.805,1.37,0),
						NumberSequenceKeypoint.new(.905,1.06,0),
						NumberSequenceKeypoint.new(.968,.938,0),
						NumberSequenceKeypoint.new(.984,1.13,0),
						NumberSequenceKeypoint.new(1,1.62,0),
				}
				local Size = NumberSequence.new(sizePoints)
				local Transparency = NumberSequence.new(transPoints)
				rayModel = Instance.new("Model",c)
				efcModel = Instance.new("Model",c)
				efxBlock = Instance.new("Part",c)
				efxBlock.BrickColor = BrickColor.new("Bright violet")
				efxBlock.Material = "Neon"
				efxBlock.FormFactor = "Custom"
				efxBlock.Transparency = .3
				efxBlock.Size = Vector3.new(.3,.3,.3)
				local mesh = Instance.new("SpecialMesh",efxBlock)
				mesh.MeshType = Enum.MeshType.Sphere
				mesh.Scale = Vector3.new(1,1,1)
				light = Instance.new("PointLight",c.Head)
				light.Range = 10
				light.Color = Color3.new(0,200/255,1)
				light.Shadows = false
				local particles = Instance.new("ParticleEmitter",efxBlock)
				particles.Color = ColorSequence.new(Color3.fromRGB(48,17,109))
				particles.LightEmission = .5
				particles.Size = Size
				particles.Name = "Fire"
				particles.Transparency = Transparency
				particles.LockedToPart = true
				particles.VelocityInheritance = .5
				particles.LockedToPart = true
				particles.Rate = 70
				particles.Texture = "rbxassetid://170478388"
				particles.Lifetime = NumberRange.new(2,2)
				particles.RotSpeed = NumberRange.new(100,100)
				particles.Speed = NumberRange.new(7,7)
				script.Parent = efxBlock
				fire = particles
				local offset = Vector3.new(-0.11, .23, -0.5)
				local weld = Instance.new("Weld",c.Head)
				weld.Part0 = c.Head
				weld.Part1 = efxBlock
				weld.C0 = CFrame.new(offset) * CFrame.Angles(math.rad(-40),math.rad(10),math.rad(40))
				efxBlock.Parent = c
				music.SoundId = "rbxassetid://316012176"
				music.Looped = true
				music.Volume = 0
				fight = music
				music2.SoundId = "rbxassetid://316014309"
				music2.Looped = true
				music2.Volume = 0
				sans = music2
				pointGyro = Instance.new("BodyGyro",c.HumanoidRootPart)
				pointGyro.P = 1e7
				pointGyro.D = 1e3
				pointGyro.MaxTorque = Vector3.new(0,1e7,0)
				animator = c.Humanoid:FindFirstChild("Animator")
				if animator then
						animator:Destroy()
				end
				c.Torso.roblox:Destroy()
				for i,v in pairs (c.Head:children()) do
						if v.ClassName == "Sound" then
								v:Destroy()
						end
				end
				for i = 1,#Joints do
						Joints[i].C1 = CFrame.new(Vector3.new())
				end
				human.WalkSpeed = 0
				human.JumpPower = 0
		end

		uinps.InputBegan:connect(function(InputObject)
				if InputObject.KeyCode == Enum.KeyCode.K and Debounces.isTyping == false then
						Debounces.isPassive = not Debounces.isPassive
				end
		end)

		setJointCFrames = function(table)
				for i = 1,#table do
						JointTargets[i] = table[i]
				end
				AnimationCycles = 0
		end

		setLerp = function(speed)
				AnimStat.lerpSpeed = speed
		end

		setTween = function(tween)
				AnimStat.lerpTween = tween
		end

		takeDamage = function(position,damage,distance,platformStand)
				for i,v in pairs (pls:children()) do
						if v.ClassName == "Player" and v:FindFirstChild("Character") then
								local torso = v.Character:FindFirstChild("Torso")
								if torso and (torso.Position - position).magnitude < distance then
										RiseLevel(v.Character.Humanoid,damage)
										v.Character.Humanoid:TakeDamage(damage)
										if platformStand == true then
												v.Character.PlatformStand = platformStand
										end
								end
						end
				end
		end

--------------------------------------------------------

		prepareCharacter()

--------------------------------------------------------
		hldng={}Player=p
function chatfunc(text)
spawn(function()local function lerp(a,b,t)return a*(1-t)+(b*t)end
	local rs=game:service'RunService'.RenderStepped
	local function sw(n)if n==nil then rs:wait()else for i=1,n do rs:wait()end end return true end
	local Character=game:service'Players'.LocalPlayer.Character local RootPart=Character.HumanoidRootPart
	local se=Instance.new("Sound",root)se.Volume=5 se.SoundId="rbxassetid://417445954"
	if Character:FindFirstChild("cht")then Character.cht:Destroy()end
	local b=Instance.new("BillboardGui",Character)b.AlwaysOnTop=true b.Adornee=RootPart b.StudsOffsetWorldSpace=Vector3.new(0,4,0)b.Name="cht"
	local snum=text:len()b.Size=UDim2.new(snum/1.7,0,2,0)
	local texts={}
	for i=1,snum do
		texts[i]=Instance.new("TextButton",b)
		texts[i].Size=UDim2.new(1/snum,0,1,0)texts[i].Name=text:sub(i,i)--texts[i].TextSize=30
		texts[i].Text=text:sub(i,i)texts[i].Position=UDim2.new((i-1)/snum,0,.3,0)
		texts[i].BackgroundTransparency=1 texts[i].TextColor3=Color3.new(1)
		texts[i].TextStrokeTransparency=1 texts[i].Font="Cartoon"texts[i].TextScaled=1 texts[i].TextTransparency=1
	end
	local DoOpt=function(Set,Val,LerpB)for i=1,#texts do if texts[i].Parent and b.Parent then if LerpB~=nil then
	if typeof(texts[i][Set])=="UDim2"then texts[i][Set]=texts[i][Set]:lerp(Val,LerpB)else texts[i][Set]=lerp(texts[i][Set],Val,LerpB)end
	else texts[i][Set]=Val end end end end
	for i=1,#texts do
		if texts[i].Parent then
			texts[i].TextTransparency=0 texts[i].TextStrokeTransparency=0
		end
		if texts[i].Text~=" "then se.TimePosition=.06 se:Play()end
		sw(3)
	end
	sw(180)
	for i=1,0,-.025 do
		DoOpt("TextTransparency",1-i)--DoOpt("TextStrokeTransparency",1-i)
		sw()
	end
	b:Destroy()
end)
end Player.Chatted:connect(function(m)chatfunc(game:service'Chat':FilterStringAsync(m,Player,Player))end)
		mouse.KeyUp:connect(function(k)
			hldng[k]=nil
		end)
		
		local function doit()
			if DefAble then
				return
			else
				if human.Health~=human.MaxHealth then
				DefAble=false
				human:Destroy()
				human=Instance.new("Humanoid",chara)Instance.new("Model",human).Name="Status"
				human.MaxHealth=1 human.Health=1
				human.HealthChanged:connect(doit)
				root.CFrame=root.CFrame*CFrame.new(0,0,10)
				hldng.r=nil warn"Dodged"
				Tired.n=Tired.n+10
				end
			end
		end
		dodge=human.HealthChanged:connect(doit)
		local sw=function(n)if n then for i=1,n do rs.RenderStepped:wait()end else rs.RenderStepped:wait()end end
		spawn(function()
				local sine = 0
				local idk=Instance.new("ScreenGui",p:FindFirstChildOfClass'PlayerGui')
				local frm=Instance.new("Frame",idk)frm.BorderSizePixel=0
				frm.BackgroundTransparency=.5 frm.Size=UDim2.new(.4,0,.03,0)
				frm.Position=UDim2.new(.3,0,.7,0)
				
				local t=Instance.new("TextLabel",frm)t.Text="wait"t.BorderSizePixel=0
				t.TextColor3=Color3.new(1,1,1)t.TextStrokeTransparency=0-- t.TextScaled=1
				t.BackgroundTransparency=0 t.TextXAlignment="Left" t.BackgroundColor3=Color3.new(1)
				while wait()do
						t.Size=UDim2.new(Tired.n/Tired.m,0,1,0)
						if Tired.n>=Tired.m then
							Tired.n=Tired.m
							Tired.d=true
						end
						if Tired.d then
							Tired.n=Tired.n-5 DefAble=true hldng.r=nil
						end t.Text=tostring(math.floor(Tired.n*10)/10).."/"..tostring(Tired.m)
						if Tired.n<=0 then Tired.n=0 Tired.d=false end
						if DefAble then human.MaxHealth=1 human.Health=1 human.Name="Humanoid"else
						dodge:disconnect()human.MaxHealth=1 human.Health=1 dodge=human.HealthChanged:connect(doit)
						
						end
						
						if hldng.r then DefAble=false else DefAble=1 end
						
						pointGyro.CFrame = CFrame.new(Vector3.new(),(mouse.Hit.p - c.HumanoidRootPart.CFrame.p).unit * 100)
						if Debounces.isAttacking == false and Debounces.isMoving == false and Debounces.isBoosting == false then
								setLerp(.1)
								if Debounces.isPassive == true then --walk
										setJointCFrames({
												CFrame.new(Vector3.new(0, -0.901 + math.sin(tick() * 1.5)/45, 0)) * CFAngles(Vector3.new(-22.001, 0, 0));
												CFrame.new(Vector3.new(-0.001, 1.52 + math.sin(tick() * -1.5)/35, math.sin(tick() * 1.5)/35)) * CFAngles(Vector3.new(-10.861 + math.sin((-tick() + 2) * 1.5) * 5, 13.765, -1.658));
												CFrame.new(Vector3.new(-1.5, -0.1 + math.sin(tick() * 1.5)/15, -0.801)) * CFAngles(Vector3.new(44.999, 0, 0));
												CFrame.new(Vector3.new(1.7, 0.2 + math.sin(tick() * 1.5)/15, 0.199)) * CFAngles(Vector3.new(-15.001, -15.001, 15));
												CFrame.new(Vector3.new(-0.7, -1.8, 0.6)) * CFAngles(Vector3.new(-59.511, 3.84, 0.489));
												CFrame.new(Vector3.new(0.5, -1, -0.801)) * CFAngles(Vector3.new(14.999, -15, -0.001));
										})
								else
										setJointCFrames({
												CFrame.new(Vector3.new(0, 0 + math.sin(tick() * 1.5)/25, 0)) * CFAngles(Vector3.new(0, 0, 0));
												CFrame.new(Vector3.new(0, 1.5 + math.sin(tick() * -1.5)/35, math.sin(tick() * 1.5)/35)) * CFAngles(Vector3.new(1.554 + math.sin((-tick() + 2) * 1.5) * 5, -0.001, -0.001));
												CFrame.new(Vector3.new(-1.06, -0.03 + math.sin(tick() * 1.5)/25, 0.449)) * CFAngles(Vector3.new(-29.511, 0, 29.51));
												CFrame.new(Vector3.new(1.059, -0.031 + math.sin(tick() * 1.5)/25, 0.449)) * CFAngles(Vector3.new(-29.511, -3.842, -29.511));
												CFrame.new(Vector3.new(-0.49, -2, -0.05/1.5)) * CFAngles(Vector3.new(0, 8.885, 0));
												CFrame.new(Vector3.new(0.49, -2, -0.05/1.5)) * CFAngles(Vector3.new(-0.001, -8.886, 0));
										})
								end
						elseif Debounces.isAttacking == false and Debounces.isMoving == true and Debounces.isBoosting == false then
								sine = sine + math.rad(12) --else jump
								human.WalkSpeed = 15
								setLerp(.15)
								setJointCFrames({
										CFrame.new(Vector3.new(0, 0, 0)) * CFAngles(Vector3.new(0, math.sin(sine) * -2.5, 0));
										CFrame.new(Vector3.new(0, 1.499, -0.04)) * CFAngles(Vector3.new(-5.676, -0.001 - math.sin(sine) * 3, -0.001));
										CFrame.new(Vector3.new(-1.97, 0 + math.sin(sine + .5)/20, 0.1 + math.sin(-sine)/2)/1.3) * CFAngles(Vector3.new(-5 + math.sin(sine) * 23, 0, 0));
										CFrame.new(Vector3.new(1.97, 0 - math.sin(sine + .5)/20, 0.1 + math.sin(sine)/2)/1.3) * CFAngles(Vector3.new(-5 + math.sin(-sine) * 23, 0, 0));
										CFrame.new(Vector3.new(-0.5, -1.93 - math.cos(sine)/8.7, 0.2 + math.sin(sine)/2)) * CFAngles(Vector3.new(-15 + math.sin(-sine) * 30, 0, 0));
										CFrame.new(Vector3.new(0.5, -1.93 + math.cos(sine)/8.7, 0.2 + math.sin(-sine)/2)) * CFAngles(Vector3.new(-15 + math.sin(sine) * 30, 0, 0));
								})
						end
						if Debounces.scalingDamage == true then
								takeDamage(c.HumanoidRootPart.Position,Debounces.damageLevel,8,true)
						end
				end
		end)
		human.Changed:connect(function(prop)
				if prop == "MoveDirection" then
						if human.MoveDirection.magnitude > .02 then
								Debounces.isMoving = true
						else
								Debounces.isMoving = false
						end
				end
		end)
		local dunkedon=false
		mouse.KeyDown:connect(function(k)
			hldng[k]=true
			if not Debounces.isAttacking then
				if k=="c"and not Tired.d and Debounces.isPassive then
					local GrabObj=mouse.Target
					local hum=nil
					if GrabObj then
						if not GrabObj.Anchored then
							if GrabObj.Parent then
								if GrabObj.Parent:FindFirstChild'Humanoid'then
									hum=GrabObj.Parent.Humanoid
								end
							end
							local jet=Instance.new("BodyPosition",GrabObj)
							if not hum then jet.D=2000 jet.P=2000 end
							while hldng.c and not Tired.d do
								jet.MaxForce=Vector3.new(10,10,10)*10000000
								jet.Position=mouse.Target~=nil and mouse.Hit.p or jet.Position
								Tired.n=Tired.n+((not hum or hum.Health==0) and 1 or 2)
								local vel=GrabObj.Velocity.x+GrabObj.Velocity.y+GrabObj.Velocity.z
								if hum and vel>20 then RiseLevel(hum,vel/400)hum.Health=hum.Health-vel/400 end
								sw()
							end
							jet:Destroy()
						else
							warn'The object is anchored!'
						end
					end
				end
				if k=="t"and not Tired.d then -- TELEPORT
					if mouse.Target then Debounces.isAttacking=true
					local pos=mouse.Hit KG:Pause()
					root.Anchored=1 root.CFrame=CFrame.new(9999,9999,109999)
					local jam=Instance.new("ScreenGui",p:FindFirstChildOfClass("PlayerGui"))
					jam.DisplayOrder=12 local j=Instance.new("Frame",jam)j.BackgroundColor3=Color3.new()
					j.BorderSizePixel=0 j.Size=UDim2.new(1,0,1,0)
					wait(1)Debounces.isAttacking=false KG:Resume()
					root.CFrame=pos+Vector3.new(0,3,0)
					jam:Destroy()root.Anchored=false
					end
					Tired.n=Tired.n+50
				end
				if k=="f"and not Tired.d and not dunkedon and Debounces.isPassive then
					dunkedon=true local pos=mouse.Hit.p
					Tired.n=Tired.n+100
					local idk=Instance.new("Part",efcModel)
					idk.Size=Vector3.new(2,80,80)local sp=Instance.new("SpecialMesh",idk)idk.Anchored=1 idk.CanCollide=nil
					sp.Scale=idk.Size*20 idk.Size=Vector3.new()idk.Color=Color3.new(1,.1,.1)sp.MeshType="Cylinder"
					idk.Transparency=.5 idk.CFrame=CFrame.new(pos)*CFrame.Angles(0,0,math.rad(90))
					idk.Material="SmoothPlastic"
					idk.Transparency=.5 sw(20)idk:Destroy()
					spawn(function()for i=1,300 do
						local pos=CFrame.new(pos)*CFrame.Angles(0,math.rad(math.random(360)),0)*CFrame.new(0,0,math.random(380)/10)*CFrame.Angles(0,math.rad(math.random(180)),0)+Vector3.new(0,-6,0)
						spawn(function()
							local p=Instance.new("Part",efcModel)
							p.Touched:connect(function(p)if p.Parent:FindFirstChild("Humanoid")then if p.Parent.Humanoid~=human then RiseLevel(p.Parent.Humanoid,1)p.Parent.Humanoid.Health=p.Parent.Humanoid.Health-1 end end end)
							p.Color=Color3.new(1,1,1)p.Size=Vector3.new(10,1,10)p.CFrame=pos
							local j=Instance.new("BodyVelocity",p)j.MaxForce=Vector3.new(1,1,1)/0 j.Velocity=Vector3.new()p.CanCollide=nil
							local m=Instance.new("SpecialMesh",p)m.MeshId="rbxassetid://465130937"
							m.Scale=Vector3.new(.05,.08,.05)/1.2
							spawn(function()
								for i=0,1,.05 do p.CFrame=p.CFrame+Vector3.new(0,.6,0)sw()end
								sw(10)for i=0,1,.05 do p.Transparency=i sw()end p:Destroy()
							end)
						end)
						sw()
					end
					end)
					wait(5)
					
					dunkedon=false
				end
			end
			if Debounces.isPassive and k=="g"then
				while hldng.g and not Tired.d do
					sw(10)
					Tired.n=Tired.n+1
					local pos=CFrame.new((root.CFrame+Vector3.new(0,4,0))*CFrame.new(math.random(-70,70)/10,math.random(-10,10)/10,math.random(-70,70)/10).p,mouse.Hit.p)
					spawn(function()
						local p=Instance.new("Part",efcModel)
						p.Touched:connect(function(p)if p.Parent:FindFirstChild("Humanoid")then if p.Parent.Humanoid~=human then RiseLevel(p.Parent.Humanoid,1)p.Parent.Humanoid.Health=p.Parent.Humanoid.Health-1 end end end)
						p.Color=Color3.new(1,1,1)p.Size=Vector3.new(4,4,4)p.CFrame=pos
						local j=Instance.new("BodyVelocity",p)j.MaxForce=Vector3.new(1,1,1)/0 j.Velocity=Vector3.new()p.CanCollide=nil
						local m=Instance.new("SpecialMesh",p)m.MeshId="rbxassetid://465130937" 
						m.Scale=Vector3.new(.05,.08,.05)/2.5
						spawn(function()
							for i=0,1,.005 do p.CFrame=pos*CFrame.new(0,0,-i*300)*CFrame.Angles(math.rad(90),0,0)sw()end
							sw(10)for i=0,1,.05 do p.Transparency=i sw()end p:Destroy()
						end)
					end)
				end
			end
		
		end)
		uinps.InputBegan:connect(function(InputObject)
				if InputObject.KeyCode == Enum.KeyCode.A and Debounces.isAttacking == false and Debounces.isSprinting == true and Debounces.isBoosting == false and Debounces.isPassive == true and Debounces.isTyping == false then
						Debounces.isBoosting = true
						Debounces.damageLevel = 10
						Debounces.scalingDamage = true
						local vel = Instance.new("BodyVelocity",c.HumanoidRootPart)
						setLerp(.15)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -0.901, 0)) * CFAngles(Vector3.new(-22.001, 0, 20));
								CFrame.new(Vector3.new(-0.001, 1.52, 0)) * CFAngles(Vector3.new(-10.372, 28.758, -1.837));
								CFrame.new(Vector3.new(-0.7, -0.2, -0.801)) * CFAngles(Vector3.new(45, 0, 45));
								CFrame.new(Vector3.new(1.7, 0.2, 0.199)) * CFAngles(Vector3.new(-15.001, -15.001, 45));
								CFrame.new(Vector3.new(-0.3, -2, 0.2)) * CFAngles(Vector3.new(-11.283, -17.801, 19.495));
								CFrame.new(Vector3.new(0.9, -2, -0.201)) * CFAngles(Vector3.new(15, -15, 29.999));
						})
						local boostSpeed = 250
						local efx = Instance.new("Sound",c.Head)
						efx.SoundId = "rbxassetid://200632875"
						efx.Pitch = math.random(1100,1300)/1000
						efx.Volume = .5
						efx:Play()
						spawn(function()
								wait(5)
								efx:Destroy()
						end)
						vel.Velocity = (c.HumanoidRootPart.Position - c.HumanoidRootPart.CFrame:toWorldSpace(CFrame.new(1,0,0)).p).unit * boostSpeed
						vel.P = 1e3
						vel.MaxForce = Vector3.new(math.huge,0,math.huge)
						wait(.15)
						vel.P = 1000
						vel.MaxForce = Vector3.new(3000,0,3000)
						vel.Velocity = Vector3.new()
						wait(.3)
						setLerp(.3)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -0.901, 0)) * CFAngles(Vector3.new(-22.001, 0, 13));
								CFrame.new(Vector3.new(-0.001, 1.52, 0)) * CFAngles(Vector3.new(-30.239, 42.47, 11.879));
								CFrame.new(Vector3.new(-1.9, -0.2, -0.401)) * CFAngles(Vector3.new(44.999, 0, -45));
								CFrame.new(Vector3.new(1.5, 0.4, 0.599)) * CFAngles(Vector3.new(-62.058, -21.088, -15.383));
								CFrame.new(Vector3.new(-0.7, -1.8, 0.6)) * CFAngles(Vector3.new(-59.239, -26.158, -14.457));
								CFrame.new(Vector3.new(0.5, -1, -0.801)) * CFAngles(Vector3.new(-0.505, -14.478, -18.968));
						})
						wait(.2)
						vel:Destroy()
						Debounces.damageLevel = 0
						Debounces.scalingDamage = false
						Debounces.isBoosting = false
				end
		end)

		uinps.InputBegan:connect(function(InputObject)
				if InputObject.KeyCode == Enum.KeyCode.D and Debounces.isAttacking == false and Debounces.isSprinting == true and Debounces.isBoosting == false and Debounces.isPassive == true and Debounces.isTyping == false then
						Debounces.isBoosting = true
						Debounces.damageLevel = 10
						Debounces.scalingDamage = true
						local vel = Instance.new("BodyVelocity",c.HumanoidRootPart)
						setLerp(.15)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -0.901, 0)) * CFAngles(Vector3.new(-22.001, 0, -15));
								CFrame.new(Vector3.new(-0.001, 1.52, 0)) * CFAngles(Vector3.new(-13.603, -45.662, -6.645));
								CFrame.new(Vector3.new(-1.9, 0, -0.201)) * CFAngles(Vector3.new(31.935, -7.436, -60.853));
								CFrame.new(Vector3.new(1.9, 0, 0.399)) * CFAngles(Vector3.new(-3.644, -23.448, 59.102));
								CFrame.new(Vector3.new(-1.1, -1.8, 0)) * CFAngles(Vector3.new(-3.616, -11.936, -29.566));
								CFrame.new(Vector3.new(0.1, -1.6, -0.601)) * CFAngles(Vector3.new(1.943, -7.181, -32.528));
						})
						local boostSpeed = 250
						local efx = Instance.new("Sound",c.Head)
						efx.SoundId = "rbxassetid://200632875"
						efx.Pitch = math.random(1100,1300)/1000
						efx.Volume = .5
						efx:Play()
						spawn(function()
								wait(5)
								efx:Destroy()
						end)
						vel.Velocity = (c.HumanoidRootPart.Position - c.HumanoidRootPart.CFrame:toWorldSpace(CFrame.new(-1,0,0)).p).unit * boostSpeed
						vel.P = 1e3
						vel.MaxForce = Vector3.new(math.huge,0,math.huge)
						wait(.15)
						vel.P = 1000
						vel.MaxForce = Vector3.new(3000,0,3000)
						vel.Velocity = Vector3.new()
						wait(.3)
						setLerp(.3)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -0.901, 0)) * CFAngles(Vector3.new(-22.001, 0, -13));
								CFrame.new(Vector3.new(-0.001, 1.52, 0)) * CFAngles(Vector3.new(-12.936, -46.206, -2.327));
								CFrame.new(Vector3.new(-1.9, 0.2, -0.201)) * CFAngles(Vector3.new(45, 0, -60));
								CFrame.new(Vector3.new(1.7, 0, -0.401)) * CFAngles(Vector3.new(14.035, -5.69, 35.342));
								CFrame.new(Vector3.new(-0.3, -1.8, 0.6)) * CFAngles(Vector3.new(-55.479, -10.612, 15.729));
								CFrame.new(Vector3.new(0.5, -1, -0.801)) * CFAngles(Vector3.new(14.999, -15, 14.999));
						})
						wait(.2)
						vel:Destroy()
						Debounces.damageLevel = 0
						Debounces.scalingDamage = false
						Debounces.isBoosting = false
				end
		end)

		uinps.InputBegan:connect(function(InputObject)
				if InputObject.KeyCode == Enum.KeyCode.W and Debounces.isAttacking == false and Debounces.isSprinting == true and Debounces.isBoosting == false and Debounces.isPassive == true and Debounces.isTyping == false then
						Debounces.isBoosting = true
						Debounces.damageLevel = 10
						Debounces.scalingDamage = true
						local vel = Instance.new("BodyVelocity",c.HumanoidRootPart)
						setLerp(.15)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -0.901, 0)) * CFAngles(Vector3.new(-40.001, 0, 5));
								CFrame.new(Vector3.new(-0.001, 1.429, 0.2)) * CFAngles(Vector3.new(25.141, -8.347, 0.878));
								CFrame.new(Vector3.new(-1.5, 0, .101)) * CFAngles(Vector3.new(14.999, -0.001, 0));
								CFrame.new(Vector3.new(1.7, 0.199, -0.401)) * CFAngles(Vector3.new(28.08, -0.358, 21.087));
								CFrame.new(Vector3.new(-0.5, -1.8, 0.6)) * CFAngles(Vector3.new(-29.448, 3.57, -1.5));
								CFrame.new(Vector3.new(0.499, -1.6, -0.401)) * CFAngles(Vector3.new(-0.505, -14.478, -3.968));
						})
						local boostSpeed = 250
						local efx = Instance.new("Sound",c.Head)
						efx.SoundId = "rbxassetid://200632875"
						efx.Pitch = math.random(1100,1300)/1000
						efx.Volume = .5
						efx:Play()
						spawn(function()
								wait(5)
								efx:Destroy()
						end)
						vel.Velocity = (c.HumanoidRootPart.Position - c.HumanoidRootPart.CFrame:toWorldSpace(CFrame.new(0,0,1)).p).unit * boostSpeed
						vel.P = 1e3
						vel.MaxForce = Vector3.new(math.huge,0,math.huge)
						wait(.15)
						vel.P = 1000
						vel.MaxForce = Vector3.new(3000,0,3000)
						vel.Velocity = Vector3.new()
						wait(.3)
						setLerp(.3)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -0.901, 0)) * CFAngles(Vector3.new(-22.001, 40, -13));
								CFrame.new(Vector3.new(-0.001, 1.52, 0)) * CFAngles(Vector3.new(-12.936, -46.206, -2.327));
								CFrame.new(Vector3.new(-1.9, 0.2, -0.201)) * CFAngles(Vector3.new(45, 0, -60));
								CFrame.new(Vector3.new(1.7, 0, -0.401)) * CFAngles(Vector3.new(14.035, -5.69, 35.342));
								CFrame.new(Vector3.new(-0.3, -1.8, 0.6)) * CFAngles(Vector3.new(-55.479, -10.612, 15.729));
								CFrame.new(Vector3.new(0.5, -1, -0.801)) * CFAngles(Vector3.new(14.999, -15, 14.999));
						})
						wait(.2)
						vel:Destroy()
						Debounces.damageLevel = 0
						Debounces.scalingDamage = false
						Debounces.isBoosting = false
				end
		end)

		uinps.InputBegan:connect(function(InputObject)
				if InputObject.KeyCode == Enum.KeyCode.S and Debounces.isAttacking == false and Debounces.isSprinting == true and Debounces.isBoosting == false and Debounces.isPassive == true and Debounces.isTyping == false then
						Debounces.isBoosting = true
						Debounces.damageLevel = 10
						Debounces.scalingDamage = true
						local vel = Instance.new("BodyVelocity",c.HumanoidRootPart)
						setLerp(.15)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -.3, 0)) * CFAngles(Vector3.new(15, 0, 0));
								CFrame.new(Vector3.new(-0.001, 1.52, -0.03)) * CFAngles(Vector3.new(-5.298, -1.305, -4.093));
								CFrame.new(Vector3.new(-1.7, 0, -0.201)) * CFAngles(Vector3.new(12.112, -6.562, -16.939));
								CFrame.new(Vector3.new(1.7, 0, -0.201)) * CFAngles(Vector3.new(8.817, 8.378, 20.465));
								CFrame.new(Vector3.new(-0.7, -1.8, 0.2)) * CFAngles(Vector3.new(-14.432, 3.06, -2.373));
								CFrame.new(Vector3.new(0.5, -1.8, -0.201)) * CFAngles(Vector3.new(-0.505, -14.478, -3.968));
						})
						local boostSpeed = 150
						local boostSpeed = 250
						local efx = Instance.new("Sound",c.Head)
						efx.SoundId = "rbxassetid://200632875"
						efx.Pitch = math.random(1100,1300)/1000
						efx.Volume = .5
						efx:Play()
						spawn(function()
								wait(5)
								efx:Destroy()
						end)
						vel.Velocity = (c.HumanoidRootPart.Position - c.HumanoidRootPart.CFrame:toWorldSpace(CFrame.new(0,0,-1)).p).unit * boostSpeed
						vel.P = 1e3
						vel.MaxForce = Vector3.new(math.huge,0,math.huge)
						wait(.15)
						vel.P = 1000
						vel.MaxForce = Vector3.new(3000,0,3000)
						vel.Velocity = Vector3.new()
						wait(.3)
						setLerp(.3)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -.5, 0)) * CFAngles(Vector3.new(4, 0, 0));
								CFrame.new(Vector3.new(-0.001, 1.52, -0.03)) * CFAngles(Vector3.new(-20.081, 28.752, 3.598));
								CFrame.new(Vector3.new(-1.7, 0.2, -0.601)) * CFAngles(Vector3.new(59.51, -3.841, -14.511));
								CFrame.new(Vector3.new(1.7, 0.2, 0.399)) * CFAngles(Vector3.new(-47.597, -13.104, 17.887));
								CFrame.new(Vector3.new(-0.7, -1.4, 0.2)) * CFAngles(Vector3.new(-44.477, 3.836, -0.524));
								CFrame.new(Vector3.new(0.5, -1.4, -0.601)) * CFAngles(Vector3.new(-15.868, -12.953, -7.631));
						})
						wait(.2)
						vel:Destroy()
						Debounces.damageLevel = 0
						Debounces.scalingDamage = false
						Debounces.isBoosting = false
				end
		end)

		uinps.InputBegan:connect(function(InputObject)
				if InputObject.KeyCode == Enum.KeyCode.Q and Debounces.isAttacking == false and Debounces.isSprinting == false and Debounces.isPassive == true and Debounces.isTyping == false and not Tired.d then
						local isLooping = true
						uinps.InputEnded:connect(function(InputObject2)
								if InputObject2.KeyCode == Enum.KeyCode.Q then
										isLooping = false
								end
						end)
						while not Tired.d do
								if isLooping == false then
										break
								end
								Debounces.attackNumber = Debounces.attackNumber + 1
								local aimPos = mouse.Hit.p
								local head = Instance.new("Part",c)
								head.Size = Vector3.new(12,.2,12)
								head.CanCollide = false
								head.Anchored = true
								head.Transparency = 1
					   			local mesh=Instance.new("SpecialMesh",head)mesh.MeshType="FileMesh"mesh.MeshId="rbxassetid://431908407"
					   			mesh.Scale=Vector3.new(.05,.05,.05)
								local decal = Instance.new("Decal",head)
								decal.Texture = "rbxassetid://441975828"
								if Debounces.attackNumber%2 == 1 then
										head.CFrame = CFrame.new(c.Torso.CFrame:toWorldSpace(CFrame.new(8,8,.5)).p,aimPos)
								else
										head.CFrame = CFrame.new(c.Torso.CFrame:toWorldSpace(CFrame.new(-8,8,.5)).p,aimPos)
								end head.CFrame=head.CFrame*CFrame.Angles(0,math.rad(180),0)
								spawn(function()
										local timer = 0
										while rs.RenderStepped:wait() do
												if timer >= 1.55 then
														break
												end
												head.CFrame = head.CFrame * CFrame.new(0,0,-timer/10)
												timer = timer + 1/30/(Debounces.FPS/60)
										end
										head.CFrame = CFrame.new(head.CFrame.p,aimPos)
										local ray = Ray.new(head.CFrame.p,(aimPos - head.CFrame.p).unit * 999)
										local hit, pos = workspace:FindPartOnRay(ray,c)
										local dis = (head.CFrame.p - pos).magnitude
										local rayPart = Instance.new("Part",rayModel)
										rayPart.Material = "Neon"
										rayPart.FormFactor = "Custom"
										rayPart.BrickColor = BrickColor.new"Royal purple"
										rayPart.Anchored = true
										rayPart.CanCollide = false
										rayPart.Size = Vector3.new(7,7,dis + 400)
										local rayCFrame = CFrame.new(head.CFrame.p + (aimPos - head.CFrame.p).unit * (dis/2 + 200),head.CFrame.p + (aimPos - head.CFrame.p).unit * dis * 2)
										rayPart.CFrame = rayCFrame
										head:Destroy()
								end)
								wait()
								local s = Instance.new("Sound",head)
								s.Volume = 1
								s.SoundId = "rbxassetid://332223043"
								s:Play()
								wait(.04)
								Tired.n=Tired.n+2
						end
				end
		end)

		uinps.InputBegan:connect(function(InputObj)
				if InputObj.KeyCode == Enum.KeyCode.E and not Debounces.isAttacking and not Debounces.isSprinting and Debounces.isPassive and not Debounces.isTyping and not Tired.d then
						Debounces.isAttacking = true
						local aimPos = c.HumanoidRootPart.CFrame:toWorldSpace(CFrame.new(0,0,-999)).p
						local head = Instance.new("Part",c)
						head.Size = Vector3.new(18,.2,18)
						head.CanCollide = false
						head.Anchored = true
						head.CFrame = CFrame.new(c.HumanoidRootPart.CFrame:toWorldSpace(CFrame.new(0,0,-9)).p,aimPos)
						head.Transparency = 1 head.CFrame=head.CFrame*CFrame.Angles(0,math.rad(180),0)
						local mesh=Instance.new("SpecialMesh",head)mesh.MeshType="FileMesh"mesh.MeshId="rbxassetid://431908407"
						mesh.Scale=Vector3.new(.1,.1,.1)
						local decal = Instance.new("Decal",head)
						decal.Texture = "rbxassetid://441975828"
						setLerp(.1)
						setJointCFrames({
								CFrame.new(Vector3.new(0, 0, 0)) * CFAngles(Vector3.new(0, 0, 0));
								CFrame.new(Vector3.new(0, 1.499, -0.09)) * CFAngles(Vector3.new(-11.676, -0.001, -0.001));
								CFrame.new(Vector3.new(-1.7, 0, 0)) * CFAngles(Vector3.new(-12.808, -28.88, -21.502));
								CFrame.new(Vector3.new(1.699, 1.2, 0.599)) * CFAngles(Vector3.new(-146.606, 16.571, 13.928));
								CFrame.new(Vector3.new(-0.501, -1.601, 0.6)) * CFAngles(Vector3.new(-60, 0, -0.001));
								CFrame.new(Vector3.new(0.5, -1.4, -0.4)) * CFAngles(Vector3.new(-15.001, -15.001, 0));
						})
						spawn(function()
								local timer = 0
								while rs.RenderStepped:wait() do
										if timer >= 1.55/.8 then
												break
										end
										head.CFrame = head.CFrame * CFrame.new(0,0,-timer/10)
										timer = timer + 1/30/(Debounces.FPS/60)
								end
								head.CFrame = CFrame.new(head.CFrame.p,aimPos)
								local ray = Ray.new(head.CFrame.p,(aimPos - head.CFrame.p).unit * 999)
								local hit, pos = workspace:FindPartOnRay(ray,c)
								local dis = (head.CFrame.p - pos).magnitude
								local rayPart = Instance.new("Part",rayModel)
								rayPart.Material = "Neon"
								rayPart.FormFactor = "Custom"
								rayPart.Name = "Punch"
								rayPart.BrickColor = BrickColor.new"Royal purple"
								rayPart.Anchored = true
								rayPart.CanCollide = false
								rayPart.Size = Vector3.new(28,28,dis + 400)
								local rayCFrame = CFrame.new(head.CFrame.p + (aimPos - head.CFrame.p).unit * (dis/2 + 200),head.CFrame.p + (aimPos - head.CFrame.p).unit * dis * 2)
								rayPart.CFrame = rayCFrame
								head:Destroy()
						end)
						wait()
						local s = Instance.new("Sound",head)
						s.Volume = 1
						s.SoundId = "rbxassetid://332223043"
						s.Pitch = .8
						s:Play()
						wait(.75)
						setLerp(.17)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -.5, 0)) * CFAngles(Vector3.new(-20, 15, 0));
								CFrame.new(Vector3.new(0, 1.499, -0.09)) * CFAngles(Vector3.new(-11.676, 14.999, -0.001));
								CFrame.new(Vector3.new(-1.7, 0, 0.2)) * CFAngles(Vector3.new(-33.928, -4.374, -38.76));
								CFrame.new(Vector3.new(1.499, 0.4, -0.601)) * CFAngles(Vector3.new(74.335, 25.091, -6.155));
								CFrame.new(Vector3.new(-0.501, -1.601, 0.6)) * CFAngles(Vector3.new(-45, 0, -0.001));
								CFrame.new(Vector3.new(0.5, -1.8, -0.4)) * CFAngles(Vector3.new(-15, -15, 0));
						})
						Tired.n=Tired.n+15
						wait(.5)
						Debounces.isAttacking = false
				end
		end)
		
		reflect = function(d,n)
				local i, n = -1 * d.unit, n.unit
				local dot = n:Dot(i)
				return 2*dot*n - i
		end

		makeReflectionBeam = function(pos,look,isCrit)
				local ray = Ray.new(pos,look)
				local hit,hitpos,norm = workspace:FindPartOnRay(ray,c)
				local e = Instance.new("Part",rayModel)
				e.Anchored = true
				e.CanCollide = false
				e.BrickColor = BrickColor.new("Bright violet")
				e.Material = "Neon"
				e.FormFactor = "Custom"
				e.Size = Vector3.new(6,6,(pos - hitpos).magnitude)
				if isCrit == true then
						e.Size = Vector3.new(16,16,(pos - hitpos).magnitude)
						e.Name = "Punch"
				end
				e.CFrame = CFrame.new(pos + (hitpos - pos)/2, pos)
				local e = Instance.new("Sound",c)
				if isCrit == true then
						e.Volume = .5
				else
						e.Volume = .3
						e.Pitch = 1.5
				end
				e.SoundId = "rbxassetid://200632875"
				e:Play()
				spawn(function()
						wait(6)
						e:Destroy()
				end)
				wait(.05)
				if hit ~= nil then
						newDir = reflect(look.unit,norm,isCrit)
						makeReflectionBeam(hitpos,newDir * 999,isCrit)
				end
		end

		uinps.InputBegan:connect(function(InputObject)
				if InputObject.KeyCode == Enum.KeyCode.Q and not Debounces.isAttacking and Debounces.isSprinting and Debounces.isPassive and not Debounces.isTyping and not Tired.d then
						local isLooping = true
						uinps.InputEnded:connect(function(InputObject2)
								if InputObject2.KeyCode == Enum.KeyCode.Q then
										isLooping = false
								end
						end)
						while not Tired.d do
								if isLooping == false then
										break
								end
								Debounces.attackNumber = Debounces.attackNumber + 1
								local aimPos = mouse.Hit.p
								local head = Instance.new("Part",c)
								head.Size = Vector3.new(12,.2,12)
								head.CanCollide = false
								head.Anchored = true
								head.Transparency=1
								local mesh=Instance.new("SpecialMesh",head)mesh.MeshType="FileMesh"mesh.MeshId="rbxassetid://431908407"
					  		 	mesh.Scale=Vector3.new(.05,.05,.05)
								local decal = Instance.new("Decal",head)
								decal.Texture = "rbxassetid://441975828"
								
								if Debounces.attackNumber%2 == 1 then
										head.CFrame = CFrame.new(c.Torso.CFrame:toWorldSpace(CFrame.new(8,8,.5)).p,aimPos)
								else
										head.CFrame = CFrame.new(c.Torso.CFrame:toWorldSpace(CFrame.new(-8,8,.5)).p,aimPos)
								end
								head.CFrame=head.CFrame*CFrame.Angles(0,math.rad(180),0)
								spawn(function()
										local timer = 0
										while rs.RenderStepped:wait() do
												if timer >= 1.55 then
														break
												end
												head.CFrame = head.CFrame * CFrame.new(0,0,-timer/10)
												timer = timer + 1/30/(Debounces.FPS/60)
										end
										head.CFrame = CFrame.new(head.CFrame.p,aimPos)
										head:Destroy()
										makeReflectionBeam(head.CFrame.p,(head.CFrame.p - aimPos).unit * -999,false)		
								end)
								
								wait()
								local s = Instance.new("Sound",head)
								s.Volume = 1
								s.SoundId = "rbxassetid://332223043"
								s.Pitch = 1.02
								s:Play()
								Tired.n=Tired.n+15
								wait(.2)
						end
				end
		end)

		uinps.InputBegan:connect(function(InputObj)
				if InputObj.KeyCode == Enum.KeyCode.E and not Debounces.isAttacking and Debounces.isSprinting and Debounces.isPassive and not Debounces.isTyping and not Tired.d then
						Debounces.isAttacking = true
						local aimPos = c.HumanoidRootPart.CFrame:toWorldSpace(CFrame.new(0,0,-999)).p
						local head = Instance.new("Part",c)
						head.Size = Vector3.new(18,.2,18)
						head.CanCollide = false
						head.Anchored = true
						head.CFrame = CFrame.new(c.HumanoidRootPart.CFrame:toWorldSpace(CFrame.new(0,0,-9)).p,aimPos)
						head.Transparency = 1
						local mesh=Instance.new("SpecialMesh",head)mesh.MeshType="FileMesh"mesh.MeshId="rbxassetid://431908407"
					   	mesh.Scale=Vector3.new(.1,.1,.1)
						local decal = Instance.new("Decal",head)
						decal.Texture = "rbxassetid://441975828"
						head.CFrame=head.CFrame*CFrame.Angles(0,math.rad(180),0)
						setLerp(.1)
						setJointCFrames({
								CFrame.new(Vector3.new(0, 0, 0)) * CFAngles(Vector3.new(0, 0, 0));
								CFrame.new(Vector3.new(0, 1.499, -0.09)) * CFAngles(Vector3.new(-11.676, -0.001, -0.001));
								CFrame.new(Vector3.new(-1.7, 0, 0)) * CFAngles(Vector3.new(-12.808, -28.88, -21.502));
								CFrame.new(Vector3.new(1.699, 1.2, 0.599)) * CFAngles(Vector3.new(-146.606, 16.571, 13.928));
								CFrame.new(Vector3.new(-0.501, -1.601, 0.6)) * CFAngles(Vector3.new(-60, 0, -0.001));
								CFrame.new(Vector3.new(0.5, -1.4, -0.4)) * CFAngles(Vector3.new(-15.001, -15.001, 0));
						})
						spawn(function()
								local timer = 0
								while rs.RenderStepped:wait() do
										if timer >= 1.55/.8 then
												break
										end
										head.CFrame = head.CFrame --* CFrame.new(0,0,-timer/10)
										timer = timer + 1/30/(Debounces.FPS/60)
								end
								head.CFrame = CFrame.new(head.CFrame.p,aimPos)
								head:Destroy()
								makeReflectionBeam(head.CFrame.p,(head.CFrame.p - aimPos).unit * -999,true)
						end)
						wait()
						local s = Instance.new("Sound",head)
						s.Volume = 2
						s.SoundId = "rbxassetid://332223043"
						s.Pitch = .8
						s:Play()
						wait(.75)
						setLerp(.17)
						setJointCFrames({
								CFrame.new(Vector3.new(0, -.5, 0)) * CFAngles(Vector3.new(-20, 15, 0));
								CFrame.new(Vector3.new(0, 1.499, -0.09)) * CFAngles(Vector3.new(-11.676, 14.999, -0.001));
								CFrame.new(Vector3.new(-1.7, 0, 0.2)) * CFAngles(Vector3.new(-33.928, -4.374, -38.76));
								CFrame.new(Vector3.new(1.499, 0.4, -0.601)) * CFAngles(Vector3.new(74.335, 25.091, -6.155));
								CFrame.new(Vector3.new(-0.501, -1.601, 0.6)) * CFAngles(Vector3.new(-45, 0, -0.001));
								CFrame.new(Vector3.new(0.5, -1.8, -0.4)) * CFAngles(Vector3.new(-15, -15, 0));
						})
						Tired.n=Tired.n+30
						wait(.5)
						Debounces.isAttacking = false
				end
		end)

		uinps.InputBegan:connect(function(InputObj)
				if InputObj.KeyCode == Enum.KeyCode.Slash then
						local finishEvent = nil
						Debounces.isTyping = true
						finishEvent = uinps.InputBegan:connect(function(InputObj)
								if InputObj.KeyCode == Enum.KeyCode.Return or InputObj.UserInputType == Enum.UserInputType.MouseButton1 then
										Debounces.isTyping = false
										finishEvent:disconnect()
								end
						end)
				end
		end)

		uinps.InputBegan:connect(function(InputObj)
				if InputObj.KeyCode == Enum.KeyCode.LeftShift then
						Debounces.isSprinting = true
				end
		end)

		uinps.InputEnded:connect(function(InputObj)
				if InputObj.KeyCode == Enum.KeyCode.LeftShift then
						Debounces.isSprinting = false
				end
		end)
		uinps.InputBegan:connect(function(InputObj)
			
		end)

		rs.RenderStepped:connect(function()
				Debounces.FPS = 1/rs.RenderStepped:wait()
				local FPSLerp = AnimStat.lerpSpeed/(Debounces.FPS/60)
				if Debounces.isPassive == false then
						fire.Enabled = false
						light.Range = 0
						fight:Pause()
						sans:Resume()
						efxBlock.Transparency = 1
				else
						fire.Enabled = true
						light.Range = 10
						fight:Resume()
						sans:Pause()
						efxBlock.Transparency = 0
				end local tD=3
				for i,v in pairs (rayModel:children()) do
						if v.Transparency >= 1 then
								v:Destroy()
						else
								v.CanCollide = true
								local parts = v:GetTouchingParts()
								v.CanCollide = false
								for i = 1,#parts do
										if parts[i].Parent:FindFirstChild("Humanoid") and parts[i].Parent ~= c and v.Name ~= "Punch" then
												RiseLevel(parts[i].Parent.Humanoid,.5/(Debounces.FPS/60))parts[i].Parent.Humanoid:TakeDamage(.5/(Debounces.FPS/60))
										elseif parts[i].Parent:FindFirstChild("Humanoid") and parts[i].Parent ~= c and v.Name == "Punch" then
											   RiseLevel(parts[i].Parent.Humanoid,3.1/(Debounces.FPS/60))parts[i].Parent.Humanoid:TakeDamage(3.1/(Debounces.FPS/60))
										end
								end
								v.Size = v.Size / Vector3.new(1+(v.Transparency/tD),1+(v.Transparency/tD),1)--- Vector3.new(1/(Debounces.FPS/60),1/(Debounces.FPS/60),0)
								v.Transparency = v.Transparency + .05/(Debounces.FPS/60)
						end
				end
				for i = 1,#Joints do
						Joints[i].C0 = Joints[i].C0:lerp(JointTargets[i], FPSLerp)
				end
				local sineval = math.sin(tick() * 2) * 3
				fire.Acceleration = Vector3.new(sineval,1,sineval)
				light.Brightness = math.sin(math.cos(tick() * 2) * 1.5)
		end)
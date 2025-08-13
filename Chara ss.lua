wait(0.1)
local lovecounter = false
local love = 99
local sprint = false
local done = false
local canheal = false
local deathchat1 = false
local once = true
local breakjoints = true
local dead = false
local candie = true
local deathchat = false
local canattack = true
local colorred = 0
local lala = true
local idleon = true
local walking = true
local idle1 = true
local canchange = false
local idle = true
local p = owner
local player = game.Players.LocalPlayer
local char = player and player.Character
if char then
endlocal mouse = p:GetMouse()
local larm = char["Left Arm"]
local rarm = char["Right Arm"]
local lleg = char["Left Leg"]
local rleg = char["Right Leg"]
local hed = char.Head
local torso = char.Torso
local hum = char.Humanoid

um = Instance.new("Part",char)
um.Name = "Immune"
um.CanCollide = false
um.Anchored = true
um.Transparency = 1
dead = true
local cam = game.Workspace.CurrentCamera
local root = char.HumanoidRootPart
local deb = false
local shot = 0
local debris=game:service"Debris"
local l = game:GetService("Lighting")
local rs = game:GetService("RunService").RenderStepped
local Create = LoadLibrary("RbxUtility").Create
ff = Instance.new("ForceField",char)
ff.Visible = false
ArtificialHB = Create("BindableEvent", script){
    Parent = script,
    Name = "Heartbeat",
}
CFuncs = { 
  
 
    ["Sound"] = {
        Create = function(id, par, vol, pit)
            coroutine.resume(coroutine.create(function()
                local S = Create("Sound"){
                    Volume = vol,
                    Pitch = pit or 1,
                    SoundId = id,
                    Parent = par or workspace,
                }
                wait()
                S:play()
                game:GetService("Debris"):AddItem(S, 6)
            end))
        end;
    };
   
   
 
    CreateTemplate = {
   
    };
}
 function swait(num)
    if num == 0 or num == nil then
        ArtificialHB.Event:wait()
    else
        for i = 0, num do
            ArtificialHB.Event:wait()
        end
    end
end
ptz = {0.8, 0.85, 0.9, 0.95, 1, 1.05, 1.1}
function lerp(a, b, t) -- Linear interpolation
        return a + (b - a)*t
end
 
function slerp(a, b, t) --Spherical interpolation
        dot = a:Dot(b)
        if dot > 0.99999 or dot < -0.99999 then
                return t <= 0.5 and a or b
        else
                r = math.acos(dot)
                return (a*math.sin((1 - t)*r) + b*math.sin(t*r)) / math.sin(r)
        end
end
function matrixInterpolate(a, b, t)
        local ax, ay, az, a00, a01, a02, a10, a11, a12, a20, a21, a22 = a:components()
        local bx, by, bz, b00, b01, b02, b10, b11, b12, b20, b21, b22 = b:components()
        local v0 = lerp(Vector3.new(ax, ay, az), Vector3.new(bx , by , bz), t) -- Position
        local v1 = slerp(Vector3.new(a00, a01, a02), Vector3.new(b00, b01, b02), t) -- Vector  right
        local v2 = slerp(Vector3.new(a10, a11, a12), Vector3.new(b10, b11, b12), t) -- Vector  up
        local v3 = slerp(Vector3.new(a20, a21, a22), Vector3.new(b20, b21, b22), t) -- Vector  back
        local t = v1:Dot(v2)
        if not (t < 0 or t == 0 or t > 0) then         -- Failsafe
                return CFrame.new()
        end
        return CFrame.new(
        v0.x, v0.y, v0.z,
        v1.x, v1.y, v1.z,
        v2.x, v2.y, v2.z,
        v3.x, v3.y, v3.z)
end
----------------------------------------------------
function genWeld(a,b)
    local w = Instance.new("Weld",a)
    w.Part0 = a
    w.Part1 = b
    return w
end
function weld(a, b)
    local weld = Instance.new("Weld")
    weld.Name = "W"
    weld.Part0 = a
    weld.Part1 = b
    weld.C0 = a.CFrame:inverse() * b.CFrame
    weld.Parent = a
    return weld;
end
----------------------------------------------------
function Lerp(c1,c2,al)
local com1 = {c1.X,c1.Y,c1.Z,c1:toEulerAnglesXYZ()}
local com2 = {c2.X,c2.Y,c2.Z,c2:toEulerAnglesXYZ()}
for i,v in pairs(com1) do
com1[i] = v+(com2[i]-v)*al
end
return CFrame.new(com1[1],com1[2],com1[3]) * CFrame.Angles(select(4,unpack(com1)))
end
----------------------------------------------------
newWeld = function(wp0, wp1, wc0x, wc0y, wc0z)
local wld = Instance.new("Weld", wp1)
wld.Part0 = wp0
wld.Part1 = wp1

wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
end
----------------------------------------------------
function weld5(part0, part1, c0, c1)
    weeld=Instance.new("Weld", part0)
    weeld.Part0=part0
    weeld.Part1=part1
    weeld.C0=c0
    weeld.C1=c1
    return weeld
end
----------------------------------------------------
function HasntTouched(plrname)
local ret = true
for _, v in pairs(Touche) do
if v == plrname then
ret = false
end
end
return ret
end
newWeld(torso, larm, -1.5, 0.5, 0)
larm.Weld.C1 = CFrame.new(0, 0.5, 0)
newWeld(torso, rarm, 1.5, 0.5, 0)
rarm.Weld.C1 = CFrame.new(0, 0.5, 0)
newWeld(torso, hed, 0, 1.5, 0)
newWeld(torso, lleg, -0.5, -1, 0)
lleg.Weld.C1 = CFrame.new(0, 1, 0)
newWeld(torso, rleg, 0.5, -1, 0)
rleg.Weld.C1 = CFrame.new(0, 1, 0)
newWeld(root, torso, 0, -1, 0)
torso.Weld.C1 = CFrame.new(0, -1, 0)

function chatfunc(text)
local chat = coroutine.wrap(function()
if char:FindFirstChild("TalkingBillBoard")~= nil then
char:FindFirstChild("TalkingBillBoard"):destroy()
end
local naeeym2 = Instance.new("BillboardGui",char)
naeeym2.Size = UDim2.new(0,100,0,40)
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Adornee = hed
naeeym2.Name = "TalkingBillBoard"
local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = ""
tecks2.Font = "Arcade"
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.new(255,0,0)
tecks2.TextStrokeColor3 = Color3.new(255,0,0)
tecks2.Size = UDim2.new(1,0,0.5,0)

for i = 1,string.len(text),1 do
CFuncs["Sound"].Create("http://www.roblox.com/asset/?id=565939471", hed, 6, .8)
tecks2.Text = string.sub(text,1,i)

wait(0.01)
end
wait(2)
for i = 1, 50 do
swait()
tecks2.Position = tecks2.Position - UDim2.new(math.random(-.4,.4),math.random(-5,5),.05,math.random(-5,5))
tecks2.Rotation = tecks2.Rotation - .8
tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks2.TextTransparency = tecks2.TextTransparency + .04

end
naeeym2:Destroy()
end)
chat()
end
function onChatted(msg)
chatfunc(msg)
end
p.Chatted:connect(onChatted)
 hed.face.Texture = "http://www.roblox.com/asset/?id=381193106"
ypcall(function()
shirt = Instance.new("Shirt", char)
shirt.Name = "Shirt"
pants = Instance.new("Pants", char)
pants.Name = "Pants"
char.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=451644755"
char.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=358183960"
end)
char["Body Colors"].HeadColor = BrickColor.new("Pastel brown")
char["Body Colors"].TorsoColor = BrickColor.new("Pastel brown")
char["Body Colors"].LeftArmColor = BrickColor.new("Pastel brown")
char["Body Colors"].RightArmColor = BrickColor.new("Pastel brown")

  MegaloStrikesBack = Instance.new("Sound",torso)
 MegaloStrikesBack.Looped = true
MegaloStrikesBack.SoundId = "http://www.roblox.com/asset?id=399570826"
MegaloStrikesBack.Volume = 50
MegaloStrikesBack:Play()
for _, v in pairs(char:GetChildren()) do
  if v.ClassName == "Accessory" then
    v:remove()
  end
end
local Hat = char:FindFirstChild("Hat_F") or Instance.new("Hat")
Hat.AttachmentPos = Vector3.new(0, 0.33, 0)
Hat.Name = "Hat_F"
local Handle = Hat:FindFirstChild("Handle") or Instance.new("Part", Hat)
if Handle.Name ~= "Handle" then
  Handle.Size = Vector3.new(1, 1, 1)
end
Handle.BottomSurface = 0
Handle.Name = "Handle"
Handle.TopSurface = 0
Handle.Locked = 1
local Mesh = Hat:FindFirstChild("Mesh") or Instance.new("SpecialMesh", Handle)
Mesh.TextureId = "http://www.roblox.com/asset/?id=75975464"
Mesh.MeshId = "http://www.roblox.com/asset/?id=250264520 "
Mesh.Scale = Vector3.new(1.05, 1.05, 1.05)
Hat.Parent = char

  handle = Instance.new("Part", char)
  handle.TopSurface = "Smooth"
  handle.BottomSurface = "Smooth"
 handle.Material = "Neon"

  handle.Size = Vector3.new(0.2, 0.5, 0.5)
  handle.CanCollide = false

  handle.FormFactor = "Custom"
  local Weldb = Instance.new("Weld", char)
  Weldb.Part0 = char["Right Arm"]
  Weldb.Part1 = handle
  Weldb.C1 = CFrame.new(0, -1.6, 0.8) * CFrame.fromEulerAnglesXYZ(-4.2, 0, 0)
  local KnifeMesh = Instance.new("SpecialMesh", handle)
  KnifeMesh.MeshType = "FileMesh"
  KnifeMesh.MeshId = "http://www.roblox.com/asset/?id=121944778"
KnifeMesh.TextureId = "http://www.roblox.com/asset/?id=121944805"

blackhand = Instance.new("Part",char)
blackhand.Material = "Neon"
blackhand.Transparency = 1
blackhand.BrickColor = BrickColor.new("Really black")
blackhand.Position = Vector3.new(999,999,999)
blackhand.Size = Vector3.new(1.01,1.01,1.01)
blackweld = Instance.new("Weld",blackhand)
blackweld.Part0 = rarm
blackweld.Part1 = blackhand
blackweld.C0 = CFrame.new(0,-0.5,0)

	
CV="Really red"
   
local txt = Instance.new("BillboardGui", char)
txt.Adornee = hed
txt.Name = "_status"
txt.Size = UDim2.new(2, 0, 1.2, 0)
txt.StudsOffset = Vector3.new(-9, 11, 0)
local text = Instance.new("TextLabel", txt)
text.Size = UDim2.new(10, 0, 7, 0)
text.FontSize = "Size24"
text.TextScaled = true
text.TextTransparency = 0
text.BackgroundTransparency = 1
text.TextTransparency = 0
text.TextStrokeTransparency = 0
text.Font = "Arcade"
text.TextStrokeColor3 = Color3.new(255,0,0)
 
v=Instance.new("Part")
v.Name = "ColorBrick"
v.Parent=char
v.FormFactor="Symmetric"
v.Anchored=true
v.CanCollide=false
v.BottomSurface="Smooth"
v.TopSurface="Smooth"
v.Size=Vector3.new(10,5,3)
v.Transparency=1
v.CFrame=torso.CFrame
v.BrickColor=BrickColor.new(CV)
v.Transparency=1
text.TextColor3 = Color3.new(0,0,0)
v.Shape="Block"
text.Text = ""

refused = Instance.new("Sound",larm)
refused.Volume = 100
refused.SoundId = "http://www.roblox.com/asset/?id=400905079"

 game:GetService("RunService").RenderStepped:connect(function()
	
	if lala == true then
		if canchange == true then
			canchange = false
		
		  handle.BrickColor = BrickColor.new("Really red")
		wait(0.01)
		  handle.BrickColor = BrickColor.new("Really blue")
		wait(0.01)
		 handle.BrickColor = BrickColor.new("Bright green")
		wait(0.01)
		  handle.BrickColor = BrickColor.new("Toothpaste")
		wait(0.01)
		 handle.BrickColor = BrickColor.new("New Yeller")
		wait(0.01)
		  handle.BrickColor = BrickColor.new("Magenta")
		wait(0.01)
		 handle.BrickColor = BrickColor.new("Deep orange")
		wait(0.01)
		canchange = true
		end
		end
	if hum.MoveDirection.x == 0 then
		if idle == true then
			if idleon == true then
			idleon = false
	for i = 1,10 do
		wait()
		if hum.MoveDirection.x == 0 then
    torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.3, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.1)
		end
		if hum.MoveDirection.x == 0 then
                   rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(20)), 0.1)
		end
		if hum.MoveDirection.x == 0 then
                    larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(-20)), 0.1)
		end
		if hum.MoveDirection.x == 0 then
                    lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.7, -0.3) * CFrame.Angles(math.rad(5), 0, math.rad(-2)), 0.1)
		end
		if hum.MoveDirection.x == 0 then
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-10), 0, math.rad(2)), 0.1)
		 end
		end
		
		
		
		
		for i = 1,10 do
		wait()
		if hum.MoveDirection.x == 0 then
    torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), 0.1)
		end
		if hum.MoveDirection.x == 0 then
                   rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(-5),math.rad(0),math.rad(20)), 0.1)
		end
		if hum.MoveDirection.x == 0 then
                    larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(-5),math.rad(0),math.rad(-20)), 0.1)
		end
		if hum.MoveDirection.x == 0 then
                    lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, -0.2) * CFrame.Angles(math.rad(5), 0, math.rad(-2)), 0.1)
		end
		if hum.MoveDirection.x == 0 then
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(0), 0, math.rad(2)), 0.1)
		 end
		end
		idleon = true
		end

			
			
		end
	end
	if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
		if walking == true then
			if sprint == false then
		if idle1 == true then
			idle1 = false
	
		idle = false
		 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
		for i = 1,10 do
			wait()
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
			   rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(20)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
                    larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(-20)), 0.1)
end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
                    lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(90), 0, math.rad(-2)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-80), 0, math.rad(2)), 0.1)
end

end
		 end
		 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
		for i = 1,10 do
			wait()
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
			   rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(20)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
                    larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(-20)), 0.1)
end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
                    lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-80), 0, math.rad(-2)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(90), 0, math.rad(2)), 0.1)
end
		end
		end
 if hum.MoveDirection.x == 0 then
	idle = true
end
idle1 = true
		end	
		end
		end
		
	end
	----------------------------------------------------------------------------------
	
	if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
		if walking == true then
			if sprint == true then
		if idle1 == true then
			idle1 = false
	
		idle = false
		 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
		for i = 1,8 do
			wait()
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
			   rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(-60),math.rad(0),math.rad(20)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
                    larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(-40),math.rad(0),math.rad(-20)), 0.1)
end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(0)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
                    lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(90), 0, math.rad(-2)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-120), 0, math.rad(2)), 0.1)
end

end
		 end
		 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
		for i = 1,8 do
			wait()
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
			   rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(-40),math.rad(0),math.rad(20)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
                    larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(-60),math.rad(0),math.rad(-20)), 0.1)
end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(0)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
                    lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-120), 0, math.rad(-2)), 0.1)
			end
			 if hum.MoveDirection.x < 0 or hum.MoveDirection.x > 0 then
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(90), 0, math.rad(2)), 0.1)
			end
			
		end
		end
 if hum.MoveDirection.x == 0 then
	idle = true
end
idle1 = true
	end	
		end
		end
	end
	
	if deathchat1 == true then
		char.Parent = workspace.Camera
		char.Archivable = true
		local c = p.Character:Clone()
		c:MakeJoints()
		for y,t in pairs(c:GetChildren()) do
			if t:IsA("Part") then
				t.CanCollide = false 
				t.Anchored = true 
			t.BrickColor = BrickColor.new("Black")
t.Transparency = 1

				t.TopSurface = "Smooth"
				t.BottomSurface = "Smooth"
				t.RightSurface = "Smooth"
				t.LeftSurface = "Smooth"
				t.FrontSurface = "Smooth"
				t.BackSurface = "Smooth"
				
				
			else 
				t:Remove()
			end
		end
		c.Parent = workspace
		game.Debris:AddItem(c,.05)
	end
	
	hum:SetStateEnabled("Dead",false)
hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
	if hum.Health < 5 and candie == true then
hum.Name = "NOMOREDAMAGE"
canheal = true
		done = false

done = true
		candie = false
		dead = true
MegaloStrikesBack.Volume = 0
		refused:Play()

		deathchat = true
	end
	if deathchat == true then
		deathchat = false
		idle = false

		hed.face.Texture = "0"
		if char:FindFirstChild("TalkingBillBoard")~= nil then
char:FindFirstChild("TalkingBillBoard"):destroy()
		end
		  torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.5, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.1)
		idle1 = false
		canattack = false
		 gothitdecal2 = Instance.new("Decal",torso)
		gothitdecal2.Texture = "http://www.roblox.com/asset/?id=318427241"
		gothitdecal2.Face = "Back"
		gothitdecal1 = Instance.new("Decal",torso)
		gothitdecal1.Texture = "http://www.roblox.com/asset/?id=318427241"
		hed.Transparency = 1
		torso.Transparency = 1
		larm.Transparency = 1
	rarm.Transparency = 1
	lovecounter = false
	   text.Text = ""
		
	lleg.Transparency = 1
	rleg.Transparency = 1
	handle.Transparency = 1
	Handle.Transparency = 1
	blackhand.Transparency = 1
	wait(1)
	refused:Stop()
		wait(2)

chatfunc("But It Refused")
		wait(1.5)
		candie = true
		idle = true
		idle1 = true
		hed.face.Texture = "http://www.roblox.com/asset/?id=946610608"
		canattack = true
		lleg.Anchored = false
	rleg.Anchored = false
	larm.Anchored = false
	rarm.Anchored = false
	hed.Anchored = false
	torso.Anchored = false
		gothitdecal2:Destroy()
		gothitdecal1:Destroy()
		for i = 1,10 do
			wait()
		hed.Transparency = hed.Transparency - 0.1
		torso.Transparency = torso.Transparency - 0.1
		larm.Transparency = larm.Transparency - 0.1
	rarm.Transparency = rarm.Transparency - 0.1
	lleg.Transparency = lleg.Transparency - 0.1
	rleg.Transparency = rleg.Transparency - 0.1
	handle.Transparency = handle.Transparency - 0.1
	Handle.Transparency = Handle.Transparency - 0.1
	blackhand.Transparency = blackhand.Transparency - 0.1
		end
lovecounter = true
			dead = false
			deathchat1 = false
			canheal = false
			hum.Health = 100
			
			MegaloStrikesBack.Volume = 50
			wait(1)
			hum.Name = "Humanoid"
	end
	

	
	

	
	if canheal == true then
	
	hum.Health = math.huge

	end
			
if lovecounter == true then
	text.Text = "Chara LV "..love	
end
end)


hed.Transparency = 0
		torso.Transparency = 0
		larm.Transparency = 0
	rarm.Transparency = 0
	lleg.Transparency = 0
	rleg.Transparency = 0
	handle.Transparency = 0
	Handle.Transparency = 0

	
	idle = false
	walking = false
soul1 = Instance.new("Part",char)
soul1.Shape = "Ball"
soul1.Material = "Neon"
soul1.BrickColor = BrickColor.new("Really blue")
soul1.Size = Vector3.new(1,1,1)
soul1.Transparency = 0.5
soul1weld = Instance.new("Weld",soul1)
soul1weld.Part0 = torso
soul1weld.Part1 = soul1
soul1weld.C0 = CFrame.new(4,2,0)
soul2 = Instance.new("Part",char)
soul2.Shape = "Ball"
soul2.Material = "Neon"
soul2.Transparency = 0.5
soul2.BrickColor = BrickColor.new("Bright green")
soul2.Size = Vector3.new(1,1,1)
soul2weld = Instance.new("Weld",soul2)
soul2weld.Part0 = torso
soul2weld.Part1 = soul2
soul2weld.C0 = CFrame.new(5,2,0)
soul3 = Instance.new("Part",char)
soul3.Shape = "Ball"
soul3.Transparency = 0.5
soul3.Material = "Neon"
soul3.BrickColor = BrickColor.new("Toothpaste")
soul3.Size = Vector3.new(1,1,1)
soul3weld = Instance.new("Weld",soul3)
soul3weld.Part0 = torso
soul3weld.Part1 = soul3
soul3weld.C0 = CFrame.new(6,2,0)
soul4 = Instance.new("Part",char)
soul4.Shape = "Ball"
soul4.Transparency = 0.5
soul4.Material = "Neon"
soul4.BrickColor = BrickColor.new("New Yeller")
soul4.Size = Vector3.new(1,1,1)
soul4weld = Instance.new("Weld",soul4)
soul4weld.Part0 = torso
soul4weld.Part1 = soul4
soul4weld.C0 = CFrame.new(4,-1,0)
soul5 = Instance.new("Part",char)
soul5.Shape = "Ball"
soul5.Material = "Neon"
soul5.Transparency = 0.5
soul5.BrickColor = BrickColor.new("Magenta")
soul5.Size = Vector3.new(1,1,1)
soul5weld = Instance.new("Weld",soul5)
soul5weld.Part0 = torso
soul5weld.Part1 = soul5
soul5weld.C0 = CFrame.new(5,-1,0)
soul6 = Instance.new("Part",char)
soul6.Shape = "Ball"
soul6.Transparency = 0.5
soul6.Material = "Neon"
soul6.BrickColor = BrickColor.new("Deep orange")
soul6.Size = Vector3.new(1,1,1)
soul6weld = Instance.new("Weld",soul6)
soul6weld.Part0 = torso
soul6weld.Part1 = soul6
soul6weld.C0 = CFrame.new(6,-1,0)
soul1s = Instance.new("Part",char)
soul1s.Shape = "Ball"
soul1s.Material = "Neon"
soul1s.BrickColor = BrickColor.new("White")
soul1s.Size = Vector3.new(0.9,0.9,0.9)
soul1s.Transparency = 0.2
soul1sweld = Instance.new("Weld",soul1s)
soul1sweld.Part0 = torso
soul1sweld.Part1 = soul1s
soul1sweld.C0 = CFrame.new(4,2,0)
soul2s = Instance.new("Part",char)
soul2s.Shape = "Ball"
soul2s.Material = "Neon"
soul2s.Transparency = 0.2
soul2s.BrickColor = BrickColor.new("White")
soul2s.Size = Vector3.new(0.9,0.9,0.9)
soul2sweld = Instance.new("Weld",soul2s)
soul2sweld.Part0 = torso
soul2sweld.Part1 = soul2s
soul2sweld.C0 = CFrame.new(5,2,0)
soul3s = Instance.new("Part",char)
soul3s.Shape = "Ball"
soul3s.Material = "Neon"
soul3s.Transparency = 0.2
soul3s.BrickColor = BrickColor.new("White")
soul3s.Size = Vector3.new(0.9,0.9,0.9)
soul3sweld = Instance.new("Weld",soul3s)
soul3sweld.Part0 = torso
soul3sweld.Part1 = soul3s
soul3sweld.C0 = CFrame.new(6,2,0)
soul4s = Instance.new("Part",char)
soul4s.Shape = "Ball"
soul4s.Material = "Neon"
soul4s.Transparency = 0.2
soul4s.BrickColor = BrickColor.new("White")
soul4s.Material = "Neon"
soul4s.Size = Vector3.new(0.9,0.9,0.9)
soul4sweld = Instance.new("Weld",soul4s)
soul4sweld.Part0 = torso
soul4sweld.Part1 = soul4s
soul4sweld.C0 = CFrame.new(4,-1,0)
soul5s = Instance.new("Part",char)
soul5s.Shape = "Ball"
soul5s.Transparency = 0.2
soul5s.BrickColor = BrickColor.new("White")
soul5s.Size = Vector3.new(0.9,0.9,0.9)
soul5s.Material = "Neon"
soul5sweld = Instance.new("Weld",soul5s)
soul5sweld.Part0 = torso
soul5sweld.Part1 = soul5s
soul5sweld.C0 = CFrame.new(5,-1,0)
soul6s = Instance.new("Part",char)
soul6s.Shape = "Ball"
soul6s.Material = "Neon"
soul6s.Transparency = 0.2
soul6s.BrickColor = BrickColor.new("White")
soul6s.Size = Vector3.new(0.9,0.9,0.9)
soul6sweld = Instance.new("Weld",soul6s)
soul6sweld.Part0 = torso
soul6sweld.Part1 = soul6s
soul6sweld.C0 = CFrame.new(6,-1,0)

chatfunc("These Are The Determinations")
wait(2)
chatfunc("I Never Got To Extract")
wait(2)

chatfunc("In The Past Genocides")
Weldb.C1 = CFrame.new(0, -2, 0) * CFrame.fromEulerAnglesXYZ(-3, 0, 0)
for i = 1,100 do
	wait()
    torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.01)
                   rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(-180),math.rad(0),math.rad(-200)), 0.01)
                    larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.01)
                    lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), 0, math.rad(-4)), 0.01)
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(0), 0, math.rad(4)), 0.01)
 
end
chatfunc("Lets See How Long You Survive")

for i = 1,10 do
	wait(0.04)
 soul1weld.C0 = soul1weld.C0 - Vector3.new(0.45,0.14,0)
soul2weld.C0 = soul2weld.C0 - Vector3.new(0.5,0.14,0)
soul3weld.C0 = soul3weld.C0 - Vector3.new(0.6,0.14,0)
soul4weld.C0 = soul4weld.C0 - Vector3.new(0.45,-0.1,0)
soul5weld.C0 = soul5weld.C0 - Vector3.new(0.5,-0.1,0)
soul6weld.C0 = soul6weld.C0 - Vector3.new(0.6,-0.1,0)
 soul1sweld.C0 = soul1sweld.C0 - Vector3.new(0.45,0.14,0)
soul2sweld.C0 = soul2sweld.C0 - Vector3.new(0.5,0.14,0)
soul3sweld.C0 = soul3sweld.C0 - Vector3.new(0.6,0.14,0)
soul4sweld.C0 = soul4sweld.C0 - Vector3.new(0.45,-0.1,0)
soul5sweld.C0 = soul5sweld.C0 - Vector3.new(0.5,-0.1,0)
soul6sweld.C0 = soul6sweld.C0 - Vector3.new(0.6,-0.1,0)
end


soul1d = Instance.new("Part",char)
soul1d.Shape = "Ball"
soul1d.Material = "Neon"
soul1d.BrickColor = BrickColor.new("Really blue")
soul1d.Size = Vector3.new(1,1,1)
soul1d.Transparency = 0.5
soul1dweld = Instance.new("Weld",soul1d)
soul1dweld.Part0 = torso
soul1dweld.Part1 = soul1d
soul1dweld.C0 = CFrame.new(0,0,0)
soul2d = Instance.new("Part",char)
soul2d.Shape = "Ball"
soul2d.Material = "Neon"
soul2d.Transparency = 0.5
soul2d.BrickColor = BrickColor.new("Bright green")
soul2d.Size = Vector3.new(1,1,1)
soul2dweld = Instance.new("Weld",soul2d)
soul2dweld.Part0 = torso
soul2dweld.Part1 = soul2d
soul2dweld.C0 = CFrame.new(0,0,0)
soul3d = Instance.new("Part",char)
soul3d.Shape = "Ball"
soul3d.Transparency = 0.5
soul3d.Material = "Neon"
soul3d.BrickColor = BrickColor.new("Toothpaste")
soul3d.Size = Vector3.new(1,1,1)
soul3dweld = Instance.new("Weld",soul3d)
soul3dweld.Part0 = torso
soul3dweld.Part1 = soul3d
soul3dweld.C0 = CFrame.new(0,0,0)
soul4d = Instance.new("Part",char)
soul4d.Shape = "Ball"
soul4d.Transparency = 0.5
soul4d.Material = "Neon"
soul4d.BrickColor = BrickColor.new("New Yeller")
soul4d.Size = Vector3.new(1,1,1)
soul4dweld = Instance.new("Weld",soul4d)
soul4dweld.Part0 = torso
soul4dweld.Part1 = soul4d
soul4dweld.C0 = CFrame.new(0,0,0)
soul5d = Instance.new("Part",char)
soul5d.Shape = "Ball"
soul5d.Material = "Neon"
soul5d.Transparency = 0.5
soul5d.BrickColor = BrickColor.new("Magenta")
soul5d.Size = Vector3.new(1,1,1)
soul5dweld = Instance.new("Weld",soul5d)
soul5dweld.Part0 = torso
soul5dweld.Part1 = soul5d
soul5dweld.C0 = CFrame.new(0,0,0)
soul6d = Instance.new("Part",char)
soul6d.Shape = "Ball"
soul6d.Transparency = 0.5
soul6d.Material = "Neon"
soul6d.BrickColor = BrickColor.new("Deep orange")
soul6d.Size = Vector3.new(1,1,1)
soul6dweld = Instance.new("Weld",soul6d)
soul6dweld.Part0 = torso
soul6dweld.Part1 = soul6d
soul6dweld.C0 = CFrame.new(0,0,0)
soul1sd = Instance.new("Part",char)
soul1sd.Shape = "Ball"
soul1sd.Material = "Neon"
soul1sd.BrickColor = BrickColor.new("White")
soul1sd.Size = Vector3.new(0.9,0.9,0.9)
soul1sd.Transparency = 0.2
soul1sdweld = Instance.new("Weld",soul1sd)
soul1sdweld.Part0 = torso
soul1sdweld.Part1 = soul1sd
soul1sdweld.C0 = CFrame.new(0,0,0)
soul2sd = Instance.new("Part",char)
soul2sd.Shape = "Ball"
soul2sd.Material = "Neon"
soul2sd.Transparency = 0.2
soul2sd.BrickColor = BrickColor.new("White")
soul2sd.Size = Vector3.new(0.9,0.9,0.9)
soul2sdweld = Instance.new("Weld",soul2sd)
soul2sdweld.Part0 = torso
soul2sdweld.Part1 = soul2sd
soul2sdweld.C0 = CFrame.new(0,0,0)
soul3sd = Instance.new("Part",char)
soul3sd.Shape = "Ball"
soul3sd.Material = "Neon"
soul3sd.Transparency = 0.2
soul3sd.BrickColor = BrickColor.new("White")
soul3sd.Size = Vector3.new(0.9,0.9,0.9)
soul3sdweld = Instance.new("Weld",soul3sd)
soul3sdweld.Part0 = torso
soul3sdweld.Part1 = soul3sd
soul3sdweld.C0 = CFrame.new(0,0,0)
soul4sd = Instance.new("Part",char)
soul4sd.Shape = "Ball"
soul4sd.Material = "Neon"
soul4sd.Transparency = 0.2
soul4sd.BrickColor = BrickColor.new("White")
soul4sd.Material = "Neon"
soul4sd.Size = Vector3.new(0.9,0.9,0.9)
soul4dsweld = Instance.new("Weld",soul4sd)
soul4dsweld.Part0 = torso
soul4dsweld.Part1 = soul4sd
soul4dsweld.C0 = CFrame.new(0,0,0)
soul5sd = Instance.new("Part",char)
soul5sd.Shape = "Ball"
soul5sd.Transparency = 0.2
soul5sd.BrickColor = BrickColor.new("White")
soul5sd.Size = Vector3.new(0.9,0.9,0.9)
soul5sd.Material = "Neon"
soul5sdweld = Instance.new("Weld",soul5sd)
soul5sdweld.Part0 = torso
soul5sdweld.Part1 = soul5sd
soul5sdweld.C0 = CFrame.new(0,0,0)
soul6sd = Instance.new("Part",char)
soul6sd.Shape = "Ball"
soul6sd.Material = "Neon"
soul6sd.Transparency = 0.2
soul6sd.BrickColor = BrickColor.new("White")
soul6sd.Size = Vector3.new(0.9,0.9,0.9)
soul6sdweld = Instance.new("Weld",soul6sd)
soul6sdweld.Part0 = torso
soul6sdweld.Part1 = soul6sd
soul6sdweld.C0 = CFrame.new(0,0,0)


soul1mesh = Instance.new("SpecialMesh",soul1d)
soul2mesh = Instance.new("SpecialMesh",soul2d)
soul3mesh = Instance.new("SpecialMesh",soul3d)
soul4mesh = Instance.new("SpecialMesh",soul4d)
soul5mesh = Instance.new("SpecialMesh",soul5d)
soul6mesh = Instance.new("SpecialMesh",soul6d)
soul1smesh = Instance.new("SpecialMesh",soul1sd)
soul2smesh = Instance.new("SpecialMesh",soul2sd)
soul3smesh = Instance.new("SpecialMesh",soul3sd)
soul4smesh = Instance.new("SpecialMesh",soul4sd)
soul5smesh = Instance.new("SpecialMesh",soul5sd)
soul6smesh = Instance.new("SpecialMesh",soul6sd)
soul1mesh.MeshType = "Sphere"
soul2mesh.MeshType = "Sphere"
soul3mesh.MeshType = "Sphere"
soul4mesh.MeshType = "Sphere"
soul5mesh.MeshType = "Sphere"
soul6mesh.MeshType = "Sphere"
soul1smesh.MeshType = "Sphere"
soul2smesh.MeshType = "Sphere"
soul3smesh.MeshType = "Sphere"
soul4smesh.MeshType = "Sphere"
soul5smesh.MeshType = "Sphere"
soul6smesh.MeshType = "Sphere"
KnifeMesh.TextureId = ""
canchange = true
for i = 1,20 do
	soul1mesh.Scale = soul1mesh.Scale + Vector3.new(0.5,0.5,0.5)
	soul1smesh.Scale = soul1smesh.Scale + Vector3.new(0.5,0.5,0.5)
	soul1d.Transparency = soul1d.Transparency + 0.025	
	soul1sd.Transparency = soul1sd.Transparency + 0.05	
	blackhand.Transparency = blackhand.Transparency - 0.04
	wait()
end
for i = 1,20 do
	soul2mesh.Scale = soul2mesh.Scale + Vector3.new(0.5,0.5,0.5)
	soul2smesh.Scale = soul2smesh.Scale + Vector3.new(0.5,0.5,0.5)	
	soul2d.Transparency = soul2d.Transparency + 0.025	
	soul2sd.Transparency = soul2sd.Transparency + 0.05	
	wait()
end
for i = 1,20 do
	soul3mesh.Scale = soul3mesh.Scale + Vector3.new(0.5,0.5,0.5)
	soul3smesh.Scale = soul3smesh.Scale + Vector3.new(0.5,0.5,0.5)	
	soul3d.Transparency = soul3d.Transparency + 0.025
	soul3sd.Transparency = soul3sd.Transparency + 0.05	
	wait()
end
for i = 1,20 do
	soul4mesh.Scale = soul4mesh.Scale + Vector3.new(0.5,0.5,0.5)
	soul4smesh.Scale = soul4smesh.Scale + Vector3.new(0.5,0.5,0.5)	
	soul4d.Transparency = soul4d.Transparency + 0.025
	soul4sd.Transparency = soul4sd.Transparency + 0.05	
	wait()
end
for i = 1,20 do
	soul5mesh.Scale = soul5mesh.Scale + Vector3.new(0.5,0.5,0.5)
	soul5smesh.Scale = soul5smesh.Scale + Vector3.new(0.5,0.5,0.5)	
	soul5d.Transparency = soul5d.Transparency + 0.025
	soul5sd.Transparency = soul5sd.Transparency + 0.05	
	wait()
end
for i = 1,20 do
	soul6mesh.Scale = soul6mesh.Scale + Vector3.new(0.5,0.5,0.5)
	soul6smesh.Scale = soul6smesh.Scale + Vector3.new(0.5,0.5,0.5)
	soul6d.Transparency = soul6d.Transparency + 0.025	
	soul6sd.Transparency = soul6sd.Transparency + 0.05	
	soul1.Transparency = soul1.Transparency + 0.08
	soul2.Transparency = soul2.Transparency + 0.08
	soul3.Transparency = soul3.Transparency + 0.08
	soul4.Transparency = soul4.Transparency + 0.08
	soul5.Transparency = soul5.Transparency + 0.08
	soul6.Transparency = soul6.Transparency + 0.1
		soul1s.Transparency = soul1.Transparency + 0.1
	soul2s.Transparency = soul2s.Transparency + 0.1
	soul3s.Transparency = soul3s.Transparency + 0.1
	soul4s.Transparency = soul4s.Transparency + 0.1
	soul5s.Transparency = soul5s.Transparency + 0.1
	soul6s.Transparency = soul6s.Transparency + 0.1	
	wait()
end


wait(1)



lala = false
wait(1)
  soul1:Destroy()
soul2:Destroy()
soul3:Destroy()
soul4:Destroy()
soul5:Destroy()
soul6:Destroy()
 soul1s:Destroy()
soul2s:Destroy()
soul3s:Destroy()
soul4s:Destroy()
soul5s:Destroy()
soul6s:Destroy()
 soul1d:Destroy()
soul2d:Destroy()
soul3d:Destroy()
soul4d:Destroy()
soul5d:Destroy()
soul6d:Destroy()
 soul1sd:Destroy()
soul2sd:Destroy()
soul3sd:Destroy()
soul4sd:Destroy()
soul5sd:Destroy()
soul6sd:Destroy()
idle = true
chatfunc("Come =)")
hed.face.Texture = "http://www.roblox.com/asset/?id=946610608"
lovecounter = true
walking = true
  Weldb.C1 = CFrame.new(0, -1.6, 0.8) * CFrame.fromEulerAnglesXYZ(-4.2, 0, 0)
KnifeMesh.TextureId = "http://www.roblox.com/asset/?id=121944805"
mouse.KeyDown:connect(function(key)
	if key == "z" then
		if canattack == true then
			canattack = false
	
		idle = false
		walking = false
		wait(1)

		kill = Instance.new("Part",char)
		kill.Position = torso.Position - Vector3.new(0,2,0)
					kill.Size = Vector3.new(200,0.1,200)
					kill.Name = "Immune"
					kill.CanCollide = false
		kill.Transparency = 1
		kill.Anchored = true
		kill.Material = "Neon"
		kill.BrickColor = BrickColor.new("Really red")
		killmesh = Instance.new("SpecialMesh",kill)
		killmesh.MeshType = "FileMesh"
		killmesh.MeshId = "rbxassetid://465435723"
		killmesh.Scale = Vector3.new(5.2,0.01,5.2)
		Weldb.C1 = CFrame.new(0, -1, -1) * CFrame.fromEulerAnglesXYZ(-2, 0, 0)
		  for i = 1, 20 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(0)), 0.2)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.2)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.2)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(6), math.rad(0), 0), 0.2)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.2)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.2)
           
        end
		  for i = 1, 20 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,-0.3)*CFrame.Angles(math.rad(120),math.rad(0),math.rad(0)), 0.2)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(0)), 0.2)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.2)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.6, 0) * CFrame.Angles( math.rad(-50), math.rad(0), 0), 0.2)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.6, -0.8) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(-2)), 0.2)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, 0, -0.8) * CFrame.Angles(math.rad(40), math.rad(0), math.rad(2)), 0.2)
           
		        end
		part = Instance.new("Part",char)
		part.Size = Vector3.new(0.1,0.1,0.1)
		part.Position = handle.Position
		part1 = Instance.new("Part",char)
		part1.Size = Vector3.new(0.1,0.1,0.1)
		part1.Position = handle.Position
		part2 = Instance.new("Part",char)
		part2.Size = Vector3.new(0.1,0.1,0.1)
		part2.Position = handle.Position
		part3 = Instance.new("Part",char)
		part3.Size = Vector3.new(0.1,0.1,0.1)
		part3.Position = handle.Position
		part4 = Instance.new("Part",char)
		part4.Size = Vector3.new(0.1,0.1,0.1)
		part4.Position = handle.Position
		part5 = Instance.new("Part",char)
		part5.Size = Vector3.new(0.1,0.1,0.1)
		part5.Position = handle.Position
		part6 = Instance.new("Part",char)
		part6.Size = Vector3.new(0.1,0.1,0.1)
		part6.Position = handle.Position
		part7 = Instance.new("Part",char)
		part7.Size = Vector3.new(0.1,0.1,0.1)
		part7.Position = handle.Position
		part8 = Instance.new("Part",char)
		part8.Size = Vector3.new(0.1,0.1,0.1)
		part8.Position = handle.Position
		part9 = Instance.new("Part",char)
		part9.Size = Vector3.new(0.1,0.1,0.1)
		part9.Position = handle.Position
		part10 = Instance.new("Part",char)
		part10.Size = Vector3.new(0.1,0.1,0.1)
		part10.Position = handle.Position
		KnifeMesh.TextureId = ""
		for i = 1,100 do
			wait()
		colorred = colorred + 0.006
		handle.Color = Color3.new(colorred,0,0)
		end
		chatfunc("Welcome To My Special Hell")
		for i = 1,120 do
			wait()
			kill.Transparency = kill.Transparency - 0.005
		end
			
		function onTouched(hit)
			if hit.Parent:FindFirstChild("Immune") == nil then
				if hit.Parent:FindFirstChild("Humanoid") ~= nil then
				hit.Parent:FindFirstChild("Head").Anchored = true

			

hit.Parent:BreakJoints()
				hit.Parent:FindFirstChild("Humanoid").Health = -1
				end
				
			
			
			
			
			end
		end
		kill.Touched:connect(onTouched)
		
			  
		kill1 = Instance.new("Part",char)
		kill1.Position = torso.Position - Vector3.new(0,2,0)
					kill1.Size = Vector3.new(200,300,200)
					kill1.Name = "Immune"
					kill1.CanCollide = false
		kill1.Transparency = 1
		kill1.Anchored = false
		kill1.Material = "Neon"
		kill1.BrickColor = BrickColor.new("Really red")
		
		function onTouched(hit)
			if hit.Parent:FindFirstChild("Immune") == nil then
				if hit.Parent:FindFirstChild("Humanoid") ~= nil then
			hit.Parent:FindFirstChild("Head").Anchored = true
		
			

hit.Parent:FindFirstChild("Humanoid").Health = -1
hit.Parent:BreakJoints()
				end
			
			
			
			end
			
		end
		kill1.Touched:connect(onTouched)
		for i = 1,50 do
			wait()
	killmesh.Scale = killmesh.Scale + Vector3.new(0,0.2,0)
		end
		wait(2)
		kill.Anchored = false
			canattack = true
		idle = true
		walking = true
		if char:FindFirstChild("TalkingBillBoard")~= nil then
char:FindFirstChild("TalkingBillBoard"):destroy()
end
		KnifeMesh.TextureId = "http://www.roblox.com/asset/?id=121944805"
		colorred = 0
		 Weldb.C1 = CFrame.new(0, -1.6, 0.8) * CFrame.fromEulerAnglesXYZ(-4.2, 0, 0)
		end
	end
end)
mouse.KeyDown:connect(function(key)
	if key == "q" then
		if canattack == true then
		canattack = false
		idle = false
		walking = false
		wait(0.5)
		slash = Instance.new("Part",char)
		slash.CanCollide = false
		slash.Transparency = 1
		slash.Size = Vector3.new(5,5,1)
		slashweld = Instance.new("Weld",slash)
		slashweld.Part0 = torso
		slashweld.Part1 = slash
		slashweld.C0 = CFrame.new(0,0,-2)
		slashdecal = Instance.new("Decal",slash)
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941494931"
		
		slashdecal1 = Instance.new("Decal",slash)
		slashdecal1.Face = "Back"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942252949"
			function onTouched(hit)
			if hit.Parent:FindFirstChild("Immune") == nil then
				if hit.Parent:FindFirstChild("Humanoid") ~= nil then
		hit.Parent:FindFirstChild("Head").Anchored = true
					slash.TouchInterest:Destroy()
					wait(1)
				gothit = Instance.new("Part",hit)
		gothit.CanCollide = false
		gothit.Transparency = 1
		gothit.Size = Vector3.new(10,10,1)
		gothitweld1 = Instance.new("Weld",gothit)
		gothitweld1.Part0 = hit.Parent:FindFirstChild("Torso")
	gothitweld1.Part1 = gothit
	
		gothitweld1.C0 = CFrame.new(0,4,0)
		gothitdecal = Instance.new("Decal",gothit)
		gothitdecal.Texture = "http://www.roblox.com/asset/?id=941619213"
					love = love + 1
					gothit = Instance.new("Part",hit)
		gothit.CanCollide = false
		gothit.Transparency = 1
		gothit.Size = Vector3.new(10,10,1)
		gothitweld = Instance.new("Weld",gothit)
		gothitweld.Part0 = hit.Parent:FindFirstChild("Torso")
	gothitweld.Part1 = gothit
		gothitweld.C0 = CFrame.new(0,5,0)

		gothitdecal = Instance.new("Decal",gothit)
		gothitdecal.Texture = "http://www.roblox.com/asset/?id=941619213"
					gothitdecal.Face = "Back"
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					
hit.Parent:FindFirstChild("Humanoid").Health = -1
hit.Parent:BreakJoints()
				else
					if hit.Parent:IsA("Model") then
					wait(1)
				
					hit.Parent:BreakJoints()
					
					
					
					
					
				end	
					if hit:IsA("Part") and hit.Size.X < 500 then
					
					hit.BrickColor = BrickColor.new("Really black")
					for i = 1,20 do
						wait()
					hit.Transparency = hit.Transparency + 0.05
					end
					
					
					
					
				end	
				end
			
			end
			
		end
		slash.Touched:connect(onTouched)
		
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495205"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253050"
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(-30)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-15), math.rad(15), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495475"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253124"
		
		wait(0.1)
		slash:Destroy()
		canattack = true
		idle = true
		walking = true
		end
	end
end)








mouse.KeyDown:connect(function(key)
	if key == "x" then
hed.Transparency = 1
torso.Transparency = 1
larm.Transparency = 1
hed.face.Texture = ""
MegaloStrikesBack.Volume = 0.1
	lovecounter = false
rarm.Transparency = 1	
lleg.Transparency = 1
rleg.Transparency = 1
handle.Transparency = 1
Handle.Transparency = 1
blackhand.Transparency = 1
hum.WalkSpeed = 60
text.Text = ""
if char:FindFirstChild("TalkingBillBoard")~= nil then
char:FindFirstChild("TalkingBillBoard"):destroy()
end
	end
end)
mouse.KeyUp:connect(function(key)
	if key == "x" then
		hed.Transparency = 0
		lovecounter = true
torso.Transparency = 0
larm.Transparency = 0
rarm.Transparency = 0	
MegaloStrikesBack.Volume = 50
lleg.Transparency = 0
rleg.Transparency = 0
handle.Transparency = 0
Handle.Transparency = 0
blackhand.Transparency = 0
hum.WalkSpeed = 16
hed.face.Texture = "http://www.roblox.com/asset/?id=946610608"
	end
end)
mouse.KeyDown:connect(function(Key)
if Key:byte() == 48 then
hum.WalkSpeed = 40
workspace.Camera.FieldOfView = 80
sprint = true
end
end)

mouse.KeyUp:connect(function(Key)
if Key:byte() == 48 then
hum.WalkSpeed = 16
workspace.Camera.FieldOfView = 70
sprint = false
end
end)



mouse.KeyDown:connect(function(key)
	if key == "e" then
		if canattack == true then
		canattack = false
		idle = false
		walking = false
		wait(1)
	
		
	
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(-30)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-15), math.rad(15), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
			slash4 = Instance.new("Part",char)
		slash4.CanCollide = false
		slash4.Transparency = 0
			slash4.Position = Vector3.new(999,999,999)
		slash4.BrickColor = BrickColor.new("Really red")
		slash4.Size = Vector3.new(0.3,9,0.3)
		slashweld4 = Instance.new("Weld",slash4)
		slashweld4.Part0 = torso
		slashweld4.Part1 = slash4
		slashweld4.C0 = CFrame.new(0,0,-3.2) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-80))
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(80),math.rad(0),math.rad(30)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-5), math.rad(15), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slash3 = Instance.new("Part",char)
		slash3.CanCollide = false
		slash3.Transparency = 0
			slash3.Position = Vector3.new(999,999,999)
		slash3.BrickColor = BrickColor.new("Really red")
		slash3.Size = Vector3.new(0.3,9,0.3)
		slashweld3 = Instance.new("Weld",slash3)
		slashweld3.Part0 = torso
		slashweld3.Part1 = slash3
		slashweld3.C0 = CFrame.new(0,0,-3.2) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(40))
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(20),math.rad(0),math.rad(-70)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-7), math.rad(17), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slash2 = Instance.new("Part",char)
		slash2.CanCollide = false
		slash2.Transparency = 0
			slash2.Position = Vector3.new(999,999,999)
		slash2.BrickColor = BrickColor.new("Really red")
		slash2.Size = Vector3.new(0.3,9,0.3)
		slashweld2 = Instance.new("Weld",slash2)
		slashweld2.Part0 = torso
		slashweld2.Part1 = slash2
		slashweld2.C0 = CFrame.new(0,0,-3.2) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(150))
		  for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(-20)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-7), math.rad(17), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slash1 = Instance.new("Part",char)
		slash1.CanCollide = false
		slash1.Transparency = 0
			slash1.Position = Vector3.new(999,999,999)
		slash1.BrickColor = BrickColor.new("Really red")
		slash1.Size = Vector3.new(0.3,9,0.3)
		slashweld1 = Instance.new("Weld",slash1)
		slashweld1.Part0 = torso
		slashweld1.Part1 = slash1
		slashweld1.C0 = CFrame.new(0,0,-3.2) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(78))
		  for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		slash5 = Instance.new("Part",char)
		slash5.CanCollide = true
		slash5.Transparency = 1
		slash5.Position = Vector3.new(999,999,999)
		slash5.BrickColor = BrickColor.new("Really red")
		slash5.Size = Vector3.new(4,3,4)
		slashweld5 = Instance.new("Weld",slash5)
		slashweld5.Part0 = torso
		slashweld5.Part1 = slash5
		slashweld5.C0 = CFrame.new(0,0,-3.2) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(130))
		function onTouched(hit)
			if hit.Parent:FindFirstChild("Immune") == nil then
				if hit.Parent:FindFirstChild("Humanoid") ~= nil  then
		hit.Parent:FindFirstChild("Head").Anchored = true
					
					wait(1)
				gothit = Instance.new("Part",hit)
		gothit.CanCollide = false
		gothit.Transparency = 1
		gothit.Size = Vector3.new(10,10,1)
		gothitweld1 = Instance.new("Weld",gothit)
		gothitweld1.Part0 = hit.Parent:FindFirstChild("Torso")
	gothitweld1.Part1 = gothit
	
		gothitweld1.C0 = CFrame.new(0,4,0)
		gothitdecal = Instance.new("Decal",gothit)
		gothitdecal.Texture = "http://www.roblox.com/asset/?id=941619213"
					love = love + 1
					gothit = Instance.new("Part",hit)
		gothit.CanCollide = false
		gothit.Transparency = 1
		gothit.Size = Vector3.new(10,10,1)
		gothitweld = Instance.new("Weld",gothit)
		gothitweld.Part0 = hit.Parent:FindFirstChild("Torso")
	gothitweld.Part1 = gothit
		gothitweld.C0 = CFrame.new(0,5,0)

		gothitdecal = Instance.new("Decal",gothit)
		gothitdecal.Texture = "http://www.roblox.com/asset/?id=941619213"
					gothitdecal.Face = "Back"
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,3.5,0)
					gothitweld1.C0 = CFrame.new(0,3.5,0)
					wait(0.2)
					gothitweld.C0 = CFrame.new(0,4,0)
					gothitweld1.C0 = CFrame.new(0,4,0)
					wait(0.2)
					
hit.Parent:FindFirstChild("Humanoid").Health = -1
hit.Parent:BreakJoints()
				else
					if hit.Parent:IsA("Model") then
					wait(1)
				
					hit.Parent:BreakJoints()
					
					
					
					
					
				end	
					if hit:IsA("Part") and hit.Size.X < 500 then
					
					hit.BrickColor = BrickColor.new("Really black")
					for i = 1,20 do
						wait()
					hit.Transparency = hit.Transparency + 0.05
					end
					
					
					
					
				end	
				end
			
			end
			
		end
		slash5.Touched:connect(onTouched)
		for i = 1,70 do
			wait()
			
			slashweld1.C0 = slashweld1.C0 - Vector3.new(0,0,4)
			slashweld2.C0 = slashweld2.C0 - Vector3.new(0,0,4)
			slashweld3.C0 = slashweld3.C0 - Vector3.new(0,0,4)
			slashweld4.C0 = slashweld4.C0 - Vector3.new(0,0,4)
			slashweld5.C0 = slashweld5.C0 - Vector3.new(0,0,4)
			
			
			
		end
		slash1:Destroy()
		slash2:Destroy()
		slash3:Destroy()
		slash4:Destroy()
		slash5:Destroy()
		canattack = true
		idle = true
		walking = true
		end
	end
end)


mouse.KeyDown:connect(function(key)
	if key == "r" then
		if canattack == true then
			
		
		
what = Instance.new("Part",char)
what.Size = Vector3.new(60,60,60)
what.Transparency = 1
what.Position = torso.Position
what.CanCollide = false
function onTouched(hit)
			if hit.Parent:FindFirstChild("Immune") == nil then
				if hit.Parent:FindFirstChild("Torso") ~= nil  then
					chatfunc('I Got You')
				
					t = hit.Parent:FindFirstChild("Torso")
					h = hit.Parent:FindFirstChild("Head")
					la = hit.Parent:FindFirstChild("Left Arm")
					ra = hit.Parent:FindFirstChild("Right Arm")
					ll = hit.Parent:FindFirstChild("Left Leg")
					rl = hit.Parent:FindFirstChild("Right Leg")
					
					what:Destroy()
					
					torso.CFrame = t.CFrame * CFrame.Angles(0,math.rad(180),0) + t.CFrame.lookVector * 3 
					h.Anchored = true 
					
					
					
					hed.Anchored = true
					wait(2)
					chatfunc('=)')
					slash = Instance.new("Part",char)
		slash.CanCollide = false
		slash.Transparency = 1
		slash.Size = Vector3.new(5,5,1)
		slashweld = Instance.new("Weld",slash)
		slashweld.Part0 = torso
		slashweld.Part1 = slash
		slashweld.C0 = CFrame.new(0,0,-2)
		slashdecal = Instance.new("Decal",slash)
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941494931"
		
		slashdecal1 = Instance.new("Decal",slash)
		slashdecal1.Face = "Back"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942252949"
					 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495205"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253050"
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(-30)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-15), math.rad(15), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495475"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253124"
		
		wait(0.1)
		slash:Destroy()
	if la ~= nil then
		la.BrickColor = BrickColor.new("Really black")
					for i = 1,20 do
						wait()
					la.Transparency = la.Transparency + 0.05
					end
					la:Destroy()
					end
					slash = Instance.new("Part",char)
		slash.CanCollide = false
		slash.Transparency = 1
		slash.Size = Vector3.new(5,5,1)
		slashweld = Instance.new("Weld",slash)
		slashweld.Part0 = torso
		slashweld.Part1 = slash
		slashweld.C0 = CFrame.new(0,0,-2)
		slashdecal = Instance.new("Decal",slash)
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941494931"
		
		slashdecal1 = Instance.new("Decal",slash)
		slashdecal1.Face = "Back"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942252949"
					 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495205"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253050"
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(-30)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-15), math.rad(15), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495475"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253124"
		
		wait(0.1)
		slash:Destroy()
	if ll ~= nil then
		ll.BrickColor = BrickColor.new("Really black")
					for i = 1,20 do
						wait()
					ll.Transparency = ll.Transparency + 0.05
					end
					ll:Destroy()
					end
					slash = Instance.new("Part",char)
		slash.CanCollide = false
		slash.Transparency = 1
		slash.Size = Vector3.new(5,5,1)
		slashweld = Instance.new("Weld",slash)
		slashweld.Part0 = torso
		slashweld.Part1 = slash
		slashweld.C0 = CFrame.new(0,0,-2)
		slashdecal = Instance.new("Decal",slash)
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941494931"
		
		slashdecal1 = Instance.new("Decal",slash)
		slashdecal1.Face = "Back"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942252949"
					 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495205"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253050"
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(-30)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-15), math.rad(15), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495475"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253124"
		
		wait(0.1)
		slash:Destroy()
	if ra ~= nil then
		ra.BrickColor = BrickColor.new("Really black")
					for i = 1,20 do
						wait()
					ra.Transparency = ra.Transparency + 0.05
					end
					ra:Destroy()
					end
					slash = Instance.new("Part",char)
		slash.CanCollide = false
		slash.Transparency = 1
		slash.Size = Vector3.new(5,5,1)
		slashweld = Instance.new("Weld",slash)
		slashweld.Part0 = torso
		slashweld.Part1 = slash
		slashweld.C0 = CFrame.new(0,0,-2)
		slashdecal = Instance.new("Decal",slash)
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941494931"
		
		slashdecal1 = Instance.new("Decal",slash)
		slashdecal1.Face = "Back"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942252949"
					 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495205"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253050"
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(-30)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-15), math.rad(15), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495475"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253124"
		
		wait(0.1)
		slash:Destroy()
	if rl ~= nil then
		rl.BrickColor = BrickColor.new("Really black")
					for i = 1,20 do
						wait()
					rl.Transparency = rl.Transparency + 0.05
					end
					rl:Destroy()
					end
					slash = Instance.new("Part",char)
		slash.CanCollide = false
		slash.Transparency = 1
		slash.Size = Vector3.new(5,5,1)
		slashweld = Instance.new("Weld",slash)
		slashweld.Part0 = torso
		slashweld.Part1 = slash
		slashweld.C0 = CFrame.new(0,0,-2)
		slashdecal = Instance.new("Decal",slash)
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941494931"
		
		slashdecal1 = Instance.new("Decal",slash)
		slashdecal1.Face = "Back"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942252949"
					 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495205"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253050"
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(-30)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-15), math.rad(15), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495475"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253124"
		
		wait(0.1)
		slash:Destroy()
	
		t.BrickColor = BrickColor.new("Really black")
					for i = 1,20 do
						wait()
					t.Transparency = t.Transparency + 0.05
					end
					t:Destroy()
					slash = Instance.new("Part",char)
		slash.CanCollide = false
		slash.Transparency = 1
		slash.Size = Vector3.new(5,5,1)
		slashweld = Instance.new("Weld",slash)
		slashweld.Part0 = torso
		slashweld.Part1 = slash
		slashweld.C0 = CFrame.new(0,0,-2)
		slashdecal = Instance.new("Decal",slash)
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941494931"
		
		slashdecal1 = Instance.new("Decal",slash)
		slashdecal1.Face = "Back"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942252949"
					 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(50)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(0), math.rad(0), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
		        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495205"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253050"
		 for i = 1, 5 do
			wait()
            rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.2,0.5,-0.8)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(-30)), 0.7)
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)), 0.7)
            hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(0),math.rad(0),0), 0.7)
            torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles( math.rad(-15), math.rad(15), 0), 0.7)
            lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-2)), 0.7)
            rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(2)), 0.7)
           
        end
		slashdecal.Texture = "http://www.roblox.com/asset/?id=941495475"
		slashdecal1.Texture = "http://www.roblox.com/asset/?id=942253124"
		
		wait(0.1)
		slash:Destroy()
	if h ~= nil then
		h.BrickColor = BrickColor.new("Really black")
					for i = 1,20 do
						wait()
					h.Transparency = h.Transparency + 0.05
					end
					h:Destroy()
	end
	hed.Anchored = false
	
				end
			end
end
what.Touched:connect(onTouched)
		end
		end
	end)
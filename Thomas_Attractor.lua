function create_part(x,y,z)
	
	-- Creating the part
	local part = Instance.new("Part")
	part.Anchored = true
	part.CFrame = CFrame.new(x,y,z)
	part.Size = Vector3.new(1, 1, 1)
	part.Transparency = 1 
	part.CanCollide = false
	part.Parent = game.Workspace
	
	-- Creating the Trail
	local trail = Instance.new("Trail")
	local attachment0 = Instance.new("Attachment")
	local attachment1 = Instance.new("Attachment")
	attachment0.Parent = part
	attachment1.Parent = part
	attachment0.CFrame = CFrame.new(0,1,0)
	attachment0.CFrame = CFrame.new(0,-1,0)
	trail.Parent = part
	trail.Attachment0 = attachment0
	trail.Attachment1 = attachment1
	
	-- Configuring Colors and Lighting for the Trail
	trail.Color = ColorSequence.new(Color3.fromRGB(255, 165, 21), Color3.fromRGB(255, 236, 216))
	trail.Brightness = 1
	trail.Lifetime = 18
	trail.Enabled = true
	trail.LightEmission = 1
	trail.FaceCamera = true
	
	return part
end


local parts = {}
local parts_count = 70

local posMinChange = 1000
local posMaxChange = 1040



for i=1,parts_count do
	local p = create_part(
		math.random(posMinChange,posMaxChange),
		math.random(posMinChange,posMaxChange),
		math.random(posMinChange,posMinChange)
	)
	table.insert(parts,p)
end

local function getThomasPos(part)
 
	local b = 0.19
	local scale = 40
	local dt = 0.1
	
	local x = part.Position.X/scale
	local y = part.Position.Y/scale
	local z = part.Position.Z/scale
	
	local dx = (math.sin(y) - b*x)*dt
	local dy = (math.sin(z) - b*y)*dt
	local dz = (math.sin(x) - b*z)*dt
	
	x = x + dx
	y = y + dy
	z = z + dz
	
	part.CFrame = CFrame.new(Vector3.new(x*scale, y*scale, z*scale))
end


workspace.Baseplate.Transparency=1


game:GetService("RunService").Heartbeat:Connect(function(t)
	for _, part in ipairs(parts) do
		getThomasPos(part)
	end
end)

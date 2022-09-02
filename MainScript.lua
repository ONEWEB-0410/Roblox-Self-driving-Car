--[[
//Made by inpad_2

//Original Car code

wait(2)

local speed = 80

Constraints = script.Parent.Parent.Constraints
Right = Constraints.Right 
Left = Constraints.Left

RR = Constraints.RR
RL = Constraints.RL

FR = Constraints.FR
FL = Constraints.FL


game:GetService("RunService").Heartbeat:Connect(function()
	RR.AngularVelocity = speed * -script.Parent.Throttle
	RL.AngularVelocity = speed * -script.Parent.Throttle
	FR.AngularVelocity = speed * -script.Parent.Throttle
	FL.AngularVelocity = speed * -script.Parent.Throttle
	Left.TargetAngle = 15 * -script.Parent.Steer
	Right.TargetAngle = 15 * -script.Parent.Steer
end)


]]--

--================================|               |================================--
----------------------------------|    Settings   |----------------------------------
--================================|               |================================--

wait(2)
local speed = 55
local angle = math.random(45,90)
local dist = Vector3.new(10000,0,0)


Constraints = script.Parent.Parent.Constraints
Right = Constraints.Right 
Left = Constraints.Left

RR = Constraints.RR
RL = Constraints.RL

FR = Constraints.FR
FL = Constraints.FL



--================================|               |================================--
----------------------------------|   Main Code   |----------------------------------
--================================|               |================================--

game:GetService("RunService").Heartbeat:Connect(function()
	RR.AngularVelocity = speed * -1
	RL.AngularVelocity = speed * -1
	FR.AngularVelocity = speed * -1
	FL.AngularVelocity = speed * -1
	--Left.TargetAngle = 15 * -script.Parent.Steer
	--Right.TargetAngle = 15 * -script.Parent.Steer
	
	
	
	local function CastRay(Origin,Direction)
		local Rayinfo = RaycastParams.new()
		Rayinfo.FilterType = Enum.RaycastFilterType.Whitelist
		Rayinfo.FilterDescendantsInstances = {workspace.Folder}
		local Raycast = workspace:Raycast(Origin.Position,Direction,Rayinfo)
		if Raycast then
			if Raycast.Instance then
				local Distance = (Origin.Position-Raycast.Position).Magnitude
				return Distance
			end
		end
	
	end
	
	
	local function Run()
		local ray1 = CastRay(script.Parent.Parent.FL.Steer,dist) 
		local ray2 = CastRay(script.Parent.Parent.FR.Steer,dist)
		--local ray3 = CastRay(script.Parent.Parent.RL.Wheel,dist)
		--local ray4 = CastRay(script.Parent.Parent.RR.Wheel,dist)
		
		--[[
		
		//Turns Right
		Left.TargetAngle = -1 * angle
		Right.TargetAngle = -1 * angle
		
		//Turns Left
		Left.TargetAngle = 1 * angle
		Right.TargetAngle = 1 * angle
		
		
		]]--
		
		
		
		if ray1 and ray2  ~= nil then
			if ray1 > ray2 then
				Left.TargetAngle = 1 * angle
				Right.TargetAngle = 1 * angle
				print(ray1, "(ray1)is bigger than(ray2) ", ray2)
			else if ray2 > ray1 then
					Left.TargetAngle = -1 * angle
					Right.TargetAngle = -1 * angle
					print( ray2, "(ray2) is bigger than(ray1) ", ray1)
				else if ray2 == ray1 then
						local i = 0 -- Nothing
					end
				end
			end
		end
		
		
		angle = math.random(45,90)
	end
	
	
	while wait(0.1) do
		Run()
	end
	
end)

--[[
Kill a player by killing them.
Player is selected by finding their username. Otherwise chooses random option.

Death by orbital laser cannon
]]--

-- var
local TweenService = game:GetService("TweenService")
local Player = game.Players:FindFirstChild("Username") or game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())]
local Character = Player:IsA("Player") and Player.Character or nil

if not Character then error("No character found.") end

-- funcs
local function CreateAsset(Object,Data)
	for i,v in pairs(Data) do
		Object[i] = v
	end
	return Object
end

-- assets

local Assets = {};

Assets.HitPoint = CreateAsset(Instance.new("Attachment"),{
	Visible = game.RunService:IsStudio();
	Parent = workspace.Terrain;
	CFrame = Character.PrimaryPart.CFrame or Character.HumanoidRootPart.CFrame;
})

Assets.Laser = CreateAsset(Instance.new("Part"),{
	Parent = workspace.Terrain;
	Anchored = true;
	CanCollide = false;
	CanTouch = false;
	CanQuery = false;
	Shape = Enum.PartType.Cylinder;
	Size = Vector3.new(200,1,1);
	CFrame = Assets.HitPoint.CFrame;
	Material = Enum.Material.Neon;
	Transparency = 0;
	Color = Color3.fromRGB(255,0,0);
})

TweenService:Create(Assets.Laser,TweenInfo.new(.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = Vector3.new(200,12,12),Transparency = 1}):Play()
Assets.Laser.Orientation += Vector3.new(0,0,90)

Assets.Strike = CreateAsset(Instance.new("Sound"),
	{
		Parent = Assets.HitPoint;
		SoundId = "";
	}
)
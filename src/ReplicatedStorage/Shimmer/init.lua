--!strict

--[[
	Name: GuiShimmerClass
	Description: A class that creates a shimmering effect on a GuiObject.
	By: @WinnersTakesAll on Roblox

	Constructors:
		new(parent: GuiObject)
		new(parent: GuiObject, time: number, style: Enum.EasingStyle, direction: Enum.EasingDirection, repeatCount: number, reverses: boolean, delay: number)
	Properties:
		EasingDirection: Enum.EasingDirection
		Time: number
		DelayTime: number
		RepeatCount: number
		Reverses: boolean
		EasingStyle: Enum.EasingStyle
		IsPlaying: boolean
		IsPaused: boolean
	Methods:
		Play(): void
		Pause(): void
		Cancel(): void
	Events:
		None

]]

local Shimmer = {}
Shimmer.__index = Shimmer

local TweenService = game:GetService("TweenService")

-- Create a shimmer frame and return it
local function createShimmer(parent): Frame
	-- Create a new frame to hold the shimmer
	local frame = Instance.new("Frame")
	frame.Name = "ShimmerFrame"
	frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	frame.BackgroundTransparency = 0.7
	frame.ClipsDescendants = true
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BorderSizePixel = 0
	frame.Visible = false
	frame.ZIndex = 8
	frame.Parent = parent

	-- Create a UICorner to match parent if they have one
	if parent:FindFirstChildOfClass("UICorner") then
		local corner = Instance.new("UICorner")
		corner.CornerRadius = parent.UICorner.CornerRadius
		corner.Parent = frame
	end

	-- Create a new image label we will use to animate the shimmer
	local shimmer = Instance.new("ImageLabel")
	shimmer.Name = "Shimmer"
	shimmer.BackgroundTransparency = 1
	shimmer.Size = UDim2.new(1, 0, 2, 0)
	shimmer.Position = UDim2.new(-1, 0, 0, 0)
	shimmer.Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer_darkTheme.png"
	shimmer.BorderSizePixel = 0
	shimmer.ZIndex = 8
	shimmer.Parent = frame

	return frame
end

-- Playback state of the shimmer
Shimmer.IsPlaying = false
Shimmer.IsPaused = false

-- Create a new Shimmer object
function Shimmer.new(
	parent: GuiObject,
	time: number?,
	style: Enum.EasingStyle?,
	direction: Enum.EasingDirection?,
	repeatCount: number?,
	reverses: boolean?,
	delay: number?
)
	local self = setmetatable({}, Shimmer)

	-- Constants for the shimmer animation
	local EASING_TIME = time or 1 -- Time for shimmer animation
	local EASING_STYLE = style or Enum.EasingStyle.Linear -- Easing style for shimmer animation
	local EASING_DIRECTION = direction or Enum.EasingDirection.InOut -- Easing direction for easing style
	local REPEAT_COUNT = repeatCount or -1 -- Repeat amount for shimmer (negative number means infinite)
	local REVERSES = reverses or false -- Reverse direction of shimmer when it reaches the end
	local DELAY_TIME = delay or 0 -- Delay between each shimmer

	-- Create the shimmer frame and animation
	self._shimmer = createShimmer(parent)

	-- Create the tween
	self._tween = TweenService:Create(
		self._shimmer:WaitForChild("Shimmer"),
		TweenInfo.new(EASING_TIME, EASING_STYLE, EASING_DIRECTION, REPEAT_COUNT, REVERSES, DELAY_TIME),
		{ Position = UDim2.new(1, 0, 0, 0) }
	)

	-- Setup tween completion callback. Under default constants this will never be called as the tween will repeat infinitely
	self._tween.Completed:Connect(function()
		self:_TweenCompleted()
	end)

	return self
end

-- Setup tween completion callback
function Shimmer:_TweenCompleted()
	self.IsPlaying = false
	self.IsPaused = false
	self._shimmer.Visible = false
end

-- Start shimmering
function Shimmer:Play()
	self.IsPlaying = true
	self.IsPaused = false
	self._shimmer.Visible = true
	self._tween:Play()
end

-- Pause shimmering
function Shimmer:Pause()
	self.IsPlaying = false
	self.IsPaused = true
	self._shimmer.Visible = true
	self._tween:Pause()
end

-- Stop shimmering
function Shimmer:Cancel()
	self.IsPlaying = false
	self.IsPaused = false
	self._tween:Cancel()
	self._shimmer.Visible = false
end

return Shimmer

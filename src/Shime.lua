--!strict

--[[
	Name: Shime
	Version: 0.1.0
	Description: A class that creates a shimmering effect on a GuiObject.
	By: @WinnersTakesAll on Roblox & @RyanLua on GitHub

	GitHub: https://github.com/RyanLua/Shime
]]

--[[
	Copyright 2023 RyanLua
	
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
		http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
]]

local Shime = {}
Shime.__index = Shime

local TweenService = game:GetService("TweenService")

-- Create a shimmer frame and return it
local function createShimmer(parent: GuiObject): Frame
	-- Constants for the shimmer frame
	local SHIMMER_IMAGE = "rbxasset://textures/ui/LuaApp/graphic/shimmer_darkTheme.png"
	local BACKGROUND_COLOR = Color3.fromRGB(0, 0, 0)

	-- Create a new frame to hold the shimmer
	local frame = Instance.new("Frame")
	frame.Name = "ShimmerFrame"
	frame.BackgroundColor3 = BACKGROUND_COLOR
	frame.BackgroundTransparency = 0.7
	frame.ClipsDescendants = true
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.BorderSizePixel = 0
	frame.Visible = false
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
	shimmer.Size = UDim2.new(1, 0, 1, 0)
	shimmer.Position = UDim2.new(-1, 0, 0, 0)
	shimmer.Image = SHIMMER_IMAGE
	shimmer.Parent = frame

	return frame
end

-- Playback state of the shimmer
Shime.IsPlaying = false
Shime.IsPaused = false
Shime.IsCompleted = false

-- Create a new Shimmer object
function Shime.new(
	parent: GuiObject,
	time: number?,
	style: Enum.EasingStyle?,
	direction: Enum.EasingDirection?,
	repeatCount: number?,
	reverses: boolean?,
	delayTime: number?
)
	local self = setmetatable({}, Shime)

	-- Constants for the shimmer animation
	local EASING_TIME = time or 1 -- Time for shimmer animation
	local EASING_STYLE = style or Enum.EasingStyle.Linear -- Easing style for shimmer animation
	local EASING_DIRECTION = direction or Enum.EasingDirection.InOut -- Easing direction for easing style
	local REPEAT_COUNT = repeatCount or -1 -- Repeat amount for shimmer (negative number means infinite)
	local REVERSES = reverses or false -- Reverse direction of shimmer when it reaches the end
	local DELAY_TIME = delayTime or 0 -- Delay between each shimmer

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
function Shime:_TweenCompleted()
	self:Stop()
end

-- Start shimmering
function Shime:Play()
	self.IsPlaying = true
	self.IsPaused = false
	self.IsCompleted = false
	self._shimmer.Visible = true
	self._tween:Play()
end

-- Pause shimmering
function Shime:Pause()
	if not self.IsCompleted then
		self.IsPlaying = false
		self.IsPaused = true
		self._shimmer.Visible = true
		self._tween:Pause()
	end
end

-- Stop shimmering
function Shime:Stop()
	self.IsPlaying = false
	self.IsPaused = false
	self.IsCompleted = true
	self._tween:Cancel()
	self._shimmer.Visible = false
end

return Shime

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local shime = require(ReplicatedStorage.Shime)

local isPlaying = false

local guiObject = script.Parent

local shimmer = shime.new(guiObject, 1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0)

local function startShimmer()
	shimmer:Play()
	isPlaying = true
end

local function pauseShimmer()
	shimmer:Pause()
	isPlaying = false
end

local function stopShimmer()
	shimmer:Cancel()
	isPlaying = false
end

startShimmer()

guiObject.MouseButton1Click:Connect(function()
	if isPlaying then
		pauseShimmer()
	else
		startShimmer()
	end
end)
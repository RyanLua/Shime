local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local shimmer = require(ReplicatedStorage.Shimmer)

local isPlaying = false

local guiObject = script.Parent

local shim = shimmer.new(guiObject, 1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0)

local function startShimmer()
	shim:Play()
	isPlaying = true
end

local function pauseShimmer()
	shim:Pause()
	isPlaying = false
end

local function stopShimmer()
	shim:Cancel()
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
local Players = game:GetService("Players")
local shimmer = require(workspace.Shimmer)

local isPlaying = false
local isPaused = false

local screenGui = Players.LocalPlayer.PlayerGui:WaitForChild("TestGui")

local guiObject = screenGui:WaitForChild("TestButton")
guiObject.Text = "Stop Shimmer"
guiObject.Parent = screenGui

local shim = shimmer.new(guiObject, "PrimaryButton")

local function startShimmer()
	shim:Play()
	isPlaying = true
	isPaused = false
	guiObject.Text = "Stop Shimmer"
end

local function pauseShimmer()
	shim:Pause()
	isPlaying = false
	isPaused = true
	guiObject.Text = "Start Shimmer"
end

local function stopShimmer()
	shim:Cancel()
	isPlaying = false
	isPaused = false
	guiObject.Text = "Start Shimmer"
end

startShimmer()

guiObject.MouseButton1Click:Connect(function()
	if isPlaying then
		pauseShimmer()
	else
		startShimmer()
	end
end)
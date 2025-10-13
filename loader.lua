spawn(function()
	local steps = 100
	local totalTime = 270 -- 4.5 minutes in seconds

	for i = 1, steps do
		local pct = i/steps
		Bar2.Size = UDim2.new(pct,0,1,0)
		Percentage.Text = math.floor(pct*100).."%"

		-- Calculate wait time per step so it slows down
		-- Using a simple formula: initial fast, gradually slower
		local minWait = 0.5     -- wait at start (fast)
		local maxWait = 8       -- wait at end (slow)
		local waitTime = minWait + (maxWait - minWait) * (i/steps)
		wait(waitTime)
	end

	-- After finishing, wait 20 seconds then rejoin
	wait(20)
	local TeleportService = game:GetService("TeleportService")
	local player = game.Players.LocalPlayer
	TeleportService:Teleport(game.PlaceId, player)
end)

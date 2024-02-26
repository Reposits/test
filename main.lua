-- Services

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

--Vars
local plr = Players.LocalPlayer
local mouse = plr:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

local Library = {}

function Library:validate(defaults, options)
	options = options or {}
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:new(options)
	options = Library:validate({
		name = "Merge Default"
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
	}
	
	-- Main Frame
	do
		-- StarterGui.MergeLib
		GUI["1"] = Instance.new("ScreenGui", RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		GUI["1"]["Name"] = [[MergeLib]];
		GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
		GUI["1"]["IgnoreGuiInset"] = true;
		-- StarterGui.MergeLib.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 600, 0, 350);
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["Name"] = [[Main]];
		
		-- StarterGui.MergeLib.Main.TopBar
		GUI["3"] = Instance.new("Frame", GUI["2"]);
		GUI["3"]["BorderSizePixel"] = 0;
		GUI["3"]["BackgroundColor3"] = Color3.fromRGB(37, 115, 188);
		GUI["3"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["3"]["Size"] = UDim2.new(1, 0, 0, -39);
		GUI["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["3"]["Name"] = [[TopBar]];

		-- StarterGui.MergeLib.Main.TopBar.TextLabel
		GUI["4"] = Instance.new("TextLabel", GUI["3"]);
		GUI["4"]["ZIndex"] = 2;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI["4"]["TextSize"] = 25;
		GUI["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["4"]["Size"] = UDim2.new(0, 200, 0, 39);
		GUI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4"]["Text"] = options["name"];
		GUI["4"]["Name"] = options["name"];
		GUI["4"]["BackgroundTransparency"] = 1;
		GUI["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.MergeLib.Main.TopBar.closeButton
		GUI["5"] = Instance.new("ImageButton", GUI["3"]);
		GUI["5"]["ZIndex"] = 2;
		GUI["5"]["ResampleMode"] = Enum.ResamplerMode.Pixelated;
		GUI["5"]["LayoutOrder"] = 5;
		GUI["5"]["AnchorPoint"] = Vector2.new(1, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://3926305904]];
		GUI["5"]["ImageRectSize"] = Vector2.new(24, 24);
		GUI["5"]["Size"] = UDim2.new(0, 25, 0, 25);
		GUI["5"]["Name"] = [[closeButton]];
		GUI["5"]["ImageRectOffset"] = Vector2.new(284, 4);
		GUI["5"]["Position"] = UDim2.new(1, -6, 0.5, 0);
		GUI["5"]["BackgroundTransparency"] = 1;
		
		-- StarterGui.MergeLib.Main.cont
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["6"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["6"]["BackgroundTransparency"] = 1;
		GUI["6"]["Size"] = UDim2.new(1, -135, 1, -50);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Position"] = UDim2.new(1, -6, 0, 45);
		GUI["6"]["Name"] = [[cont]];
		
		-- StarterGui.MergeLib.Main.cont.Fade
		GUI["4b"] = Instance.new("Frame", GUI["6"]);
		GUI["4b"]["ZIndex"] = 10;
		GUI["4b"]["BorderSizePixel"] = 0;
		GUI["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["4b"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4b"]["Visible"] = false;
		GUI["4b"]["Name"] = [[Fade]];

		-- StarterGui.MergeLib.Main.cont.Fade.UIGradient
		GUI["4c"] = Instance.new("UIGradient", GUI["4b"]);
		GUI["4c"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(0.337, 0.24400000274181366),NumberSequenceKeypoint.new(1.000, 1)};
		GUI["4c"]["Rotation"] = 90;
		
		-- StarterGui.MergeLibrary.Main.NotifContainer
		GUI["71"] = Instance.new("Frame", GUI["2"]);
		GUI["71"]["BorderSizePixel"] = 0;
		GUI["71"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["71"]["AnchorPoint"] = Vector2.new(1, 0.5);
		GUI["71"]["BackgroundTransparency"] = 1;
		GUI["71"]["Size"] = UDim2.new(0, 300, 0, 552);
		GUI["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["71"]["Position"] = UDim2.new(1, 361, 0, 211);
		GUI["71"]["Name"] = [[NotifContainer]];
	end
	
	-- Navigation
	function GUI:Navigation()
		options = Library:validate({
			username = plr.Name
		}, options or {})
		
		local Navigation = {
			
		}
		
		-- Render
		do
			-- StarterGui.MergeLib.Main.Nav
			Navigation["4d"] = Instance.new("Frame", GUI["2"]);
			Navigation["4d"]["ZIndex"] = 2;
			Navigation["4d"]["BorderSizePixel"] = 0;
			Navigation["4d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Navigation["4d"]["Size"] = UDim2.new(0, 120, 1, -40);
			Navigation["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Navigation["4d"]["Position"] = UDim2.new(0, 0, 0, 40);
			Navigation["4d"]["Name"] = [[Nav]];

			-- StarterGui.MergeLib.Main.Nav.hold
			Navigation["4e"] = Instance.new("Frame", Navigation["4d"]);
			Navigation["4e"]["BorderSizePixel"] = 0;
			Navigation["4e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Navigation["4e"]["BackgroundTransparency"] = 1;
			Navigation["4e"]["Size"] = UDim2.new(1, 0, 0.9035277366638184, 0);
			Navigation["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Navigation["4e"]["Position"] = UDim2.new(0, 0, 0.09647224843502045, 0);
			Navigation["4e"]["Name"] = [[hold]];

			-- StarterGui.MergeLib.Main.Nav.hold.UIPadding
			Navigation["4f"] = Instance.new("UIPadding", Navigation["4e"]);
			Navigation["4f"]["PaddingBottom"] = UDim.new(0, 8);

			-- StarterGui.MergeLib.Main.Nav.hold.UIListLayout
			Navigation["50"] = Instance.new("UIListLayout", Navigation["4e"]);
			Navigation["50"]["Padding"] = UDim.new(0, 1);
			Navigation["50"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

			-- StarterGui.MergeLib.Main.Nav.lineY
			Navigation["57"] = Instance.new("Frame", Navigation["4d"]);
			Navigation["57"]["ZIndex"] = 2;
			Navigation["57"]["BorderSizePixel"] = 0;
			Navigation["57"]["BackgroundColor3"] = Color3.fromRGB(229, 229, 229);
			Navigation["57"]["AnchorPoint"] = Vector2.new(1, 0);
			Navigation["57"]["Size"] = UDim2.new(0, -2, 1, 0);
			Navigation["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Navigation["57"]["Position"] = UDim2.new(1, 0, 0, 0);
			Navigation["57"]["Name"] = [[lineY]];

			-- StarterGui.MergeLib.Main.Nav.lineX
			Navigation["58"] = Instance.new("Frame", Navigation["4d"]);
			Navigation["58"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;
			Navigation["58"]["ZIndex"] = 2;
			Navigation["58"]["BorderSizePixel"] = 0;
			Navigation["58"]["BackgroundColor3"] = Color3.fromRGB(229, 229, 229);
			Navigation["58"]["AnchorPoint"] = Vector2.new(1, 0);
			Navigation["58"]["Size"] = UDim2.new(0.9428571462631226, -2, 0, -2);
			Navigation["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Navigation["58"]["Position"] = UDim2.new(1, 0, 0.09646302461624146, 0);
			Navigation["58"]["Name"] = [[lineX]];

			-- StarterGui.MergeLib.Main.Nav.UserText
			Navigation["59"] = Instance.new("TextLabel", Navigation["4d"]);
			Navigation["59"]["ZIndex"] = 2;
			Navigation["59"]["BorderSizePixel"] = 0;
			Navigation["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Navigation["59"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Navigation["59"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Navigation["59"]["TextSize"] = 20;
			--Navigation["59"]["TextScaled"] = true;
			Navigation["59"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
			Navigation["59"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			Navigation["59"]["Size"] = UDim2.new(1, 0, 0, 28);
			Navigation["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Navigation["59"]["Text"] = options.username;
			Navigation["59"]["BackgroundTransparency"] = 1;
			Navigation["59"]["Name"] = [[UserText]];


			-- StarterGui.MergeLib.Main.Nav.TextLabel.UIPadding
			Navigation["5a"] = Instance.new("UIPadding", Navigation["59"]);
			Navigation["5a"]["PaddingLeft"] = UDim.new(0, 10);

			-- StarterGui.MergeLib.Main.Nav.cfBot
			Navigation["5b"] = Instance.new("Frame", Navigation["4d"]);
			Navigation["5b"]["BorderSizePixel"] = 0;
			Navigation["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Navigation["5b"]["AnchorPoint"] = Vector2.new(1, 0);
			Navigation["5b"]["Size"] = UDim2.new(0, 20, 1, 0);
			Navigation["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Navigation["5b"]["Position"] = UDim2.new(1, 0, 0, 0);
			Navigation["5b"]["Name"] = [[cfBot]];

			-- StarterGui.MergeLib.Main.Nav.cfTop
			Navigation["5c"] = Instance.new("Frame", Navigation["4d"]);
			Navigation["5c"]["BorderSizePixel"] = 0;
			Navigation["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Navigation["5c"]["Size"] = UDim2.new(1, 0, 0, 20);
			Navigation["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Navigation["5c"]["Name"] = [[cfTop]];

			-- StarterGui.MergeLib.Main.Nav.UICorner
			Navigation["5d"] = Instance.new("UICorner", Navigation["4d"]);

			
		end
		
		-- Methods
		function Navigation:SetText(text)
			options.username = text
			Navigation:_update()
		end		
		
		function Navigation:_update()
			Navigation["59"].Text = options.username
		end
		
		Navigation:_update()
		return Navigation
	end
	
	-- Tab
	function GUI:CreateTab(options)
		options = Library:validate({
			name = "New Tab",
			icon = "rbxassetid://8130360540"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		-- Render
		do
			-- StarterGui.MergeLib.Main.Nav.hold.Unopen
			Tab["54"] = Instance.new("TextLabel", GUI["2"].Nav.hold);
			Tab["54"]["BorderSizePixel"] = 0;
			Tab["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["54"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["54"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
			Tab["54"]["TextTransparency"] = 0.5;
			Tab["54"]["TextSize"] = 17;
			Tab["54"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["54"]["Size"] = UDim2.new(1, 0, 0, 30);
			Tab["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["54"]["Text"] = options.name;
			Tab["54"]["Name"] = [[Unopen]];
			Tab["54"]["Position"] = UDim2.new(0.26428571343421936, 0, 0.15841583907604218, 0);

			-- StarterGui.MergeLib.Main.Nav.hold.Unopen.UIPadding
			Tab["55"] = Instance.new("UIPadding", Tab["54"]);
			Tab["55"]["PaddingLeft"] = UDim.new(0, 35);

			-- StarterGui.MergeLib.Main.Nav.hold.Unopen.ImageLabel
			Tab["56"] = Instance.new("ImageLabel", Tab["54"]);
			Tab["56"]["BorderSizePixel"] = 0;
			Tab["56"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["56"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["56"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["56"]["Image"] = options.icon;
			Tab["56"]["Size"] = UDim2.new(0, 24, 0, 24);
			Tab["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["56"]["Position"] = UDim2.new(0, -28, 0.5, 0);

			-- StarterGui.MergeLib.Main.cont.Home
			Tab["7"] = Instance.new("ScrollingFrame", GUI["6"]);
			Tab["7"]["Active"] = true;
			Tab["7"]["BorderSizePixel"] = 0;
			Tab["7"]["CanvasPosition"] = Vector2.new(0, 0);
			Tab["7"]["ScrollBarImageTransparency"] = 1;
			Tab["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["7"]["BackgroundTransparency"] = 1;
			Tab["7"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["7"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["7"]["ScrollBarThickness"] = 0;
			Tab["7"]["Name"] = options.name;
			Tab["7"]["Visible"] = false;
			
			-- StarterGui.MergeLib.Main.cont.Home.UIListLayout
			Tab["f"] = Instance.new("UIListLayout", Tab["7"]);
			Tab["f"]["Padding"] = UDim.new(0, 5);
			Tab["f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			
			-- StarterGui.MergeLib.Main.cont.Home.UIPadding
			Tab["8"] = Instance.new("UIPadding", Tab["7"]);
			Tab["8"]["PaddingTop"] = UDim.new(0, 1);
			Tab["8"]["PaddingRight"] = UDim.new(0, 1);
			Tab["8"]["PaddingBottom"] = UDim.new(0, 1);
			Tab["8"]["PaddingLeft"] = UDim.new(0, 1);
		end
		
		-- Methods
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				
				Tab.Active = true
				Library:tween(Tab["54"], {TextTransparency = 0})
				Library:tween(Tab["56"], {ImageTransparency = 0})
				Tab["7"].Visible = true
				
				GUI.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["54"], {TextTransparency = 0.5})
				Library:tween(Tab["56"], {ImageTransparency = 0.5})
				Tab["7"].Visible = false
			end
		end
		
		-- Logic
		do
			Tab["54"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["54"], {TextTransparency = 0})
					Library:tween(Tab["56"], {ImageTransparency = 0})
				end
			end)

			Tab["54"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Library:tween(Tab["54"], {TextTransparency = 0.5})
					Library:tween(Tab["56"], {ImageTransparency = 0.5})
				end
			end)

			uis.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)


			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:Button(options)
			options = Library:validate({
				name = "New Button",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterGui.MergeLib.Main.cont.Home.Button
				Button["9"] = Instance.new("Frame", Tab["7"]);
				Button["9"]["BorderSizePixel"] = 0;
				Button["9"]["BackgroundColor3"] = Color3.fromRGB(37, 115, 188);
				Button["9"]["Size"] = UDim2.new(1, 0, 0, 40);
				Button["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["9"]["Name"] = [[Button]];

				-- StarterGui.MergeLib.Main.cont.Home.Button.Title
				Button["a"] = Instance.new("TextLabel", Button["9"]);
				Button["a"]["BorderSizePixel"] = 0;
				Button["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["a"]["TextSize"] = 20;
				Button["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["a"]["Size"] = UDim2.new(1, -20, 1, 0);
				Button["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["a"]["Text"] = options.name;
				Button["a"]["Name"] = [[Title]];
				Button["a"]["BackgroundTransparency"] = 1;

				-- StarterGui.MergeLib.Main.cont.Home.Button.Title.UIPadding
				Button["b"] = Instance.new("UIPadding", Button["a"]);
				Button["b"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Button.UIPadding
				Button["c"] = Instance.new("UIPadding", Button["9"]);
				Button["c"]["PaddingTop"] = UDim.new(0, 5);
				Button["c"]["PaddingRight"] = UDim.new(0, 5);
				Button["c"]["PaddingBottom"] = UDim.new(0, 5);
				Button["c"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Button.UICorner
				Button["d"] = Instance.new("UICorner", Button["9"]);


				-- StarterGui.MergeLib.Main.cont.Home.Button.Icon
				Button["e"] = Instance.new("ImageLabel", Button["9"]);
				Button["e"]["BorderSizePixel"] = 0;
				Button["e"]["ScaleType"] = Enum.ScaleType.Fit;
				Button["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["e"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["e"]["Image"] = [[rbxassetid://16081386298]];
				Button["e"]["Size"] = UDim2.new(0, 25, 0, 25);
				Button["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["e"]["Name"] = [[Icon]];
				Button["e"]["BackgroundTransparency"] = 1;
				Button["e"]["Position"] = UDim2.new(1, 0, 0.06666667014360428, 0);
			end
			
			-- Methods
			function Button:SetText(text)
				Button["a"].Text = text
				options.name = text
			end
			
			function Button:SetCallback(fn)
				options.callback = fn
			end
			
			
			-- Logic
			do
				Button["9"].MouseEnter:Connect(function()
					Button.Hover = true
					
					if not Button.MouseDown then
						Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
					end
				end)
				
				Button["9"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
					end
				end)
				
				uis.InputBegan:Connect(function(input)
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
						options.callback()
					end
				end)
				
				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						
						if Button.Hover then
							--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
							Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
						else
							--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
							Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
						end
					end
				end)
				
			end
			
			return Button
		end
		
		function Tab:Warning(options)
			options = Library:validate({
				message = "New Warning",
				callback = function() end
			}, options or {})
			
			local Warning = {}
			
			-- Render
			do
				-- StarterGui.MergeLib.Main.cont.Home.Warning
				Warning["10"] = Instance.new("Frame", Tab["7"]);
				Warning["10"]["BorderSizePixel"] = 0;
				Warning["10"]["BackgroundColor3"] = Color3.fromRGB(242, 138, 21);
				Warning["10"]["Size"] = UDim2.new(1, 0, 0, 30);
				Warning["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["10"]["Name"] = [[Warning]];
				Warning["10"]["ZIndex"] = 5;
				
				-- StarterGui.MergeLib.Main.cont.Home.Warning.Title
				Warning["11"] = Instance.new("TextLabel", Warning["10"]);
				Warning["11"]["BorderSizePixel"] = 0;
				Warning["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Warning["11"]["TextSize"] = 20;
				Warning["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["11"]["Size"] = UDim2.new(1, 0, 1, 0);
				Warning["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["11"]["Text"] = options.message;
				Warning["11"]["Name"] = [[Title]];
				Warning["11"]["BackgroundTransparency"] = 1;
				Warning["11"]["TextWrapped"] = true;
				Warning["11"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Warning["11"]["ZIndex"] = 5;
				
				-- StarterGui.MergeLib.Main.cont.Home.Warning.UIPadding
				Warning["12"] = Instance.new("UIPadding", Warning["10"]);
				Warning["12"]["PaddingTop"] = UDim.new(0, 5);
				Warning["12"]["PaddingRight"] = UDim.new(0, 5);
				Warning["12"]["PaddingBottom"] = UDim.new(0, 5);
				Warning["12"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Warning.UICorner
				Warning["13"] = Instance.new("UICorner", Warning["10"]);
			end
			
			-- Methods
			function Warning:SetText(text)
				options.message = text
				Warning:_update()
			end			
			
			function Warning:_update()
				Warning["11"].Text = options.message
				
				Warning["11"].Size = UDim2.new(Warning["11"].Size.X.Scale, Warning["11"].Size.X.Offset, 0, math.huge)
				Warning["11"].Size = UDim2.new(Warning["11"].Size.X.Scale, Warning["11"].Size.X.Offset, 0, Warning["11"].TextBounds.Y)
				Library:tween(Warning["10"], {Size = UDim2.new(Warning["10"].Size.X.Scale, Warning["10"].Size.X.Offset, 0, Warning["11"].TextBounds.Y + 10)})
			end
			
			Warning:_update()
			return Warning
		end
		
		function Tab:Info(options)
			options = Library:validate({
				message = "New Info",
				callback = function() end
			}, options or {})

			local Info = {}

			-- Render
			do
				-- StarterGui.MergeLib.Main.cont.Home.Info
				Info["14"] = Instance.new("Frame", Tab["7"]);
				Info["14"]["BorderSizePixel"] = 0;
				Info["14"]["BackgroundColor3"] = Color3.fromRGB(213, 105, 105);
				Info["14"]["Size"] = UDim2.new(1, 0, 0, 30);
				Info["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Info["14"]["Name"] = [[Info]];
				Info["14"]["ZIndex"] = 5;

				-- StarterGui.MergeLib.Main.cont.Home.Info.Title
				Info["15"] = Instance.new("TextLabel", Info["14"]);
				Info["15"]["BorderSizePixel"] = 0;
				Info["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Info["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Info["15"]["TextSize"] = 20;
				Info["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Info["15"]["Size"] = UDim2.new(1, 0, 1, 0);
				Info["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Info["15"]["Text"] = options.message;
				Info["15"]["Name"] = [[Title]];
				Info["15"]["BackgroundTransparency"] = 1;
				Info["15"]["TextWrapped"] = true;
				Info["15"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Info["15"]["ZIndex"] = 5;

				-- StarterGui.MergeLib.Main.cont.Home.Info.UIPadding
				Info["16"] = Instance.new("UIPadding", Info["14"]);
				Info["16"]["PaddingTop"] = UDim.new(0, 5);
				Info["16"]["PaddingRight"] = UDim.new(0, 5);
				Info["16"]["PaddingBottom"] = UDim.new(0, 5);
				Info["16"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Info.UICorner
				Info["17"] = Instance.new("UICorner", Info["14"]);
			end

			-- Methods
			function Info:SetText(text)
				options.message = text
				Info:_update()
			end			

			function Info:_update()
				Info["15"].Text = options.message

				Info["15"].Size = UDim2.new(Info["15"].Size.X.Scale, Info["15"].Size.X.Offset, 0, math.huge)
				Info["15"].Size = UDim2.new(Info["15"].Size.X.Scale, Info["15"].Size.X.Offset, 0, Info["15"].TextBounds.Y)
				Library:tween(Info["14"], {Size = UDim2.new(Info["14"].Size.X.Scale, Info["14"].Size.X.Offset, 0, Info["15"].TextBounds.Y + 10)})
			end

			Info:_update()
			return Info
		end
		
		function Tab:Label(options)
			options = Library:validate({
				message = "New Label",
				callback = function() end
			}, options or {})

			local Label = {}

			-- Render
			do
				-- StarterGui.MergeLib.Main.cont.Home.Label
				Label["18"] = Instance.new("Frame", Tab["7"]);
				Label["18"]["BorderSizePixel"] = 0;
				Label["18"]["BackgroundColor3"] = Color3.fromRGB(37, 115, 188);
				Label["18"]["Size"] = UDim2.new(1, 0, 0, 30);
				Label["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["18"]["Name"] = [[Label]];
				Label["18"]["ZIndex"] = 5;

				-- StarterGui.MergeLib.Main.cont.Home.Label.Title
				Label["19"] = Instance.new("TextLabel", Label["18"]);
				Label["19"]["BorderSizePixel"] = 0;
				Label["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Label["19"]["TextSize"] = 20;
				Label["19"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["19"]["Size"] = UDim2.new(1, 0, 1, 0);
				Label["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["19"]["Name"] = options.message;
				Label["19"]["BackgroundTransparency"] = 1;
				Label["19"]["TextWrapped"] = true;
				Label["19"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Label["19"]["ZIndex"] = 5;
				
				-- StarterGui.MergeLib.Main.cont.Home.Label.UIPadding
				Label["1a"] = Instance.new("UIPadding", Label["18"]);
				Label["1a"]["PaddingTop"] = UDim.new(0, 5);
				Label["1a"]["PaddingRight"] = UDim.new(0, 5);
				Label["1a"]["PaddingBottom"] = UDim.new(0, 5);
				Label["1a"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Label.UICorner
				Label["1b"] = Instance.new("UICorner", Label["18"]);
			end

			-- Methods
			function Label:SetText(text)
				options.message = text
				Label:_update()
			end			

			function Label:_update()
				Label["19"].Text = options.message

				Label["19"].Size = UDim2.new(Label["19"].Size.X.Scale, Label["19"].Size.X.Offset, 0, math.huge)
				Label["19"].Size = UDim2.new(Label["19"].Size.X.Scale, Label["19"].Size.X.Offset, 0, Label["19"].TextBounds.Y)
				Library:tween(Label["18"], {Size = UDim2.new(Label["18"].Size.X.Scale, Label["18"].Size.X.Offset, 0, Label["19"].TextBounds.Y + 10)})
			end

			Label:_update()
			return Label
		end
		
		function Tab:Slider(options)
			options = Library:validate({
				title = "New Slider",
				min = "0",
				max = "100",
				default = "50",
				callback = function(v) end
			}, options or {})
			
			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil,
				Options = options
			}
			
			-- Render
			do
				-- StarterGui.MergeLib.Main.cont.Home.Slider
				Slider["1c"] = Instance.new("Frame", Tab["7"]);
				Slider["1c"]["BorderSizePixel"] = 0;
				Slider["1c"]["BackgroundColor3"] = Color3.fromRGB(37, 115, 188);
				Slider["1c"]["Size"] = UDim2.new(1, 0, 0, 42);
				Slider["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["1c"]["Name"] = [[Slider]];

				-- StarterGui.MergeLib.Main.cont.Home.Slider.Title
				Slider["1d"] = Instance.new("TextLabel", Slider["1c"]);
				Slider["1d"]["BorderSizePixel"] = 0;
				Slider["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["1d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["1d"]["TextSize"] = 20;
				Slider["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["1d"]["Size"] = UDim2.new(1, -24, 1, -10);
				Slider["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["1d"]["Text"] = options.title;
				Slider["1d"]["Name"] = [[Title]];
				Slider["1d"]["BackgroundTransparency"] = 1;

				-- StarterGui.MergeLib.Main.cont.Home.Slider.Title.UIPadding
				Slider["1e"] = Instance.new("UIPadding", Slider["1d"]);
				Slider["1e"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Slider.UIPadding
				Slider["1f"] = Instance.new("UIPadding", Slider["1c"]);
				Slider["1f"]["PaddingTop"] = UDim.new(0, 5);
				Slider["1f"]["PaddingRight"] = UDim.new(0, 5);
				Slider["1f"]["PaddingBottom"] = UDim.new(0, 5);
				Slider["1f"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Slider.UICorner
				Slider["20"] = Instance.new("UICorner", Slider["1c"]);


				-- StarterGui.MergeLib.Main.cont.Home.Slider.Value
				Slider["21"] = Instance.new("TextLabel", Slider["1c"]);
				Slider["21"]["BorderSizePixel"] = 0;
				Slider["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["21"]["TextSize"] = 20;
				Slider["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["21"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["21"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["21"]["Text"] = tostring(options.default);
				Slider["21"]["Name"] = [[Value]];
				Slider["21"]["BackgroundTransparency"] = 1;
				Slider["21"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterGui.MergeLib.Main.cont.Home.Slider.Value.UIPadding
				Slider["22"] = Instance.new("UIPadding", Slider["21"]);
				Slider["22"]["PaddingRight"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Slider.SliderBack
				Slider["23"] = Instance.new("Frame", Slider["1c"]);
				Slider["23"]["BackgroundColor3"] = Color3.fromRGB(31, 97, 158);
				Slider["23"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["23"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["23"]["BorderColor3"] = Color3.fromRGB(41, 129, 207);
				Slider["23"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["23"]["Name"] = [[SliderBack]];

				-- StarterGui.MergeLib.Main.cont.Home.Slider.SliderBack.UICorner
				Slider["24"] = Instance.new("UICorner", Slider["23"]);


				-- StarterGui.MergeLib.Main.cont.Home.Slider.SliderBack.UIStroke
				Slider["25"] = Instance.new("UIStroke", Slider["23"]);
				Slider["25"]["Color"] = Color3.fromRGB(49, 153, 244);
				Slider["25"]["Thickness"] = 1.5;
				Slider["25"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.MergeLib.Main.cont.Home.Slider.SliderBack.Drag
				Slider["26"] = Instance.new("Frame", Slider["23"]);
				Slider["26"]["BorderSizePixel"] = 0;
				Slider["26"]["BackgroundColor3"] = Color3.fromRGB(48, 152, 243);
				Slider["26"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["26"]["Name"] = [[Drag]];

				-- StarterGui.MergeLib.Main.cont.Home.Slider.SliderBack.Drag.UICorner
				Slider["27"] = Instance.new("UICorner", Slider["26"]);
			end
			
			-- Methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider["23"].AbsolutePosition.X) / (Slider["1c"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)
					
					Slider["21"].Text = tostring(value)
					Slider["26"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["21"].Text = tostring(v)
					Slider["26"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
				end
				options.callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["21"].Text)
			end
			
			-- Logic
			do
				Slider["1c"].MouseEnter:Connect(function()
					Slider.Hover = true

					if not Slider.MouseDown then
						--Library:tween(Slider["1c"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
						Library:tween(Slider["23"], {BackgroundColor3 = Color3.fromRGB(35, 102, 164)})
						Library:tween(Slider["25"], {Color = Color3.fromRGB(100, 190, 255)})
					end
				end)

				Slider["1c"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:tween(Slider["1c"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
						Library:tween(Slider["23"], {BackgroundColor3 = Color3.fromRGB(30, 96, 157)})
						Library:tween(Slider["25"], {Color = Color3.fromRGB(48, 152, 243)})
					end
				end)

				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["1c"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
						Library:tween(Slider["23"], {BackgroundColor3 = Color3.fromRGB(25, 89, 150)})
						Library:tween(Slider["25"], {Color = Color3.fromRGB(88, 185, 255)})
						
						if not Slider.Connection then
							Slider.Connection = RunService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.Hover then
							--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
							--Library:tween(Slider["1c"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)}) experimental use again if needed
							Library:tween(Slider["1c"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
							Library:tween(Slider["23"], {BackgroundColor3 = Color3.fromRGB(35, 102, 164)})
							Library:tween(Slider["25"], {Color = Color3.fromRGB(100, 190, 255)})
						else
							--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
							Library:tween(Slider["1c"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
							Library:tween(Slider["23"], {BackgroundColor3 = Color3.fromRGB(30, 96, 157)})
							Library:tween(Slider["25"], {Color = Color3.fromRGB(48, 152, 243)})
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end
			
			return Slider
		end
		
		function Tab:Toggle(options)
			options = Library:validate({
				title = "New Toggle",
				callback = function() end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			
			-- Render
			do
				-- StarterGui.MergeLib.Main.cont.Home.ToggleInactive
				Toggle["39"] = Instance.new("Frame", Tab["7"]);
				Toggle["39"]["BorderSizePixel"] = 0;
				Toggle["39"]["BackgroundColor3"] = Color3.fromRGB(37, 115, 188);
				Toggle["39"]["Size"] = UDim2.new(1, 0, 0, 40);
				Toggle["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["39"]["Name"] = [[ToggleInactive]];

				-- StarterGui.MergeLib.Main.cont.Home.ToggleInactive.Title
				Toggle["3a"] = Instance.new("TextLabel", Toggle["39"]);
				Toggle["3a"]["BorderSizePixel"] = 0;
				Toggle["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["3a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["3a"]["TextSize"] = 20;
				Toggle["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["3a"]["Size"] = UDim2.new(1, -26, 1, 0);
				Toggle["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["3a"]["Text"] = options.title;
				Toggle["3a"]["Name"] = [[Title]];
				Toggle["3a"]["BackgroundTransparency"] = 1;

				-- StarterGui.MergeLib.Main.cont.Home.ToggleInactive.Title.UIPadding
				Toggle["3b"] = Instance.new("UIPadding", Toggle["3a"]);
				Toggle["3b"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.ToggleInactive.UIPadding
				Toggle["3c"] = Instance.new("UIPadding", Toggle["39"]);
				Toggle["3c"]["PaddingTop"] = UDim.new(0, 5);
				Toggle["3c"]["PaddingRight"] = UDim.new(0, 5);
				Toggle["3c"]["PaddingBottom"] = UDim.new(0, 5);
				Toggle["3c"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.ToggleInactive.UICorner
				Toggle["3d"] = Instance.new("UICorner", Toggle["39"]);


				-- StarterGui.MergeLib.Main.cont.Home.ToggleInactive.CheckmarkHolder
				Toggle["3e"] = Instance.new("Frame", Toggle["39"]);
				Toggle["3e"]["BorderSizePixel"] = 0;
				Toggle["3e"]["BackgroundColor3"] = Color3.fromRGB(31, 97, 158);
				Toggle["3e"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["3e"]["Size"] = UDim2.new(0, 24, 0, 24);
				Toggle["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["3e"]["Position"] = UDim2.new(1, -3, 0.5, 0);
				Toggle["3e"]["Name"] = [[CheckmarkHolder]];

				-- StarterGui.MergeLib.Main.cont.Home.ToggleInactive.CheckmarkHolder.UICorner
				Toggle["3f"] = Instance.new("UICorner", Toggle["3e"]);
				Toggle["3f"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.MergeLib.Main.cont.Home.ToggleInactive.CheckmarkHolder.UIStroke
				Toggle["40"] = Instance.new("UIStroke", Toggle["3e"]);
				Toggle["40"]["Color"] = Color3.fromRGB(49, 153, 244);
				Toggle["40"]["Thickness"] = 1.5;
				Toggle["40"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.MergeLib.Main.cont.Home.ToggleInactive.CheckmarkHolder.Checkmark
				Toggle["41"] = Instance.new("ImageLabel", Toggle["3e"]);
				Toggle["41"]["BorderSizePixel"] = 0;
				Toggle["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["41"]["ImageTransparency"] = 1;
				Toggle["41"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["41"]["Image"] = [[rbxassetid://11242915823]];
				Toggle["41"]["Size"] = UDim2.new(1, -2, 1, -2);
				Toggle["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["41"]["Name"] = [[Checkmark]];
				Toggle["41"]["BackgroundTransparency"] = 1;
				Toggle["41"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			end			
			

			--  Methods
			do
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b
					end
					
					if Toggle.State then
						Library:tween(Toggle["3e"], {BackgroundColor3 = Color3.fromRGB(115, 191, 92)})
						Library:tween(Toggle["40"], {Color = Color3.fromRGB(20, 172, 89)})
						Library:tween(Toggle["41"], {ImageTransparency = 0})
					else
						Library:tween(Toggle["3e"], {BackgroundColor3 = Color3.fromRGB(31, 97, 158)})
						Library:tween(Toggle["40"], {Color = Color3.fromRGB(48, 152, 243)})
						Library:tween(Toggle["41"], {ImageTransparency = 1})
					end
					
					options.callback(Toggle.State)
				end
			end
			
			-- Logic
			do
				Toggle["39"].MouseEnter:Connect(function()
					Toggle.Hover = true

					if not Toggle.MouseDown then
						Library:tween(Toggle["39"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
						--Library:tween(Toggle["40"], {Color = Color3.fromRGB(36, 114, 187)})
					end
				end)

				Toggle["39"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Library:tween(Toggle["39"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
						--Library:tween(Toggle["40"], {Color = Color3.fromRGB(48, 152, 243)})
					end
				end)

				uis.InputBegan:Connect(function(input)

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["39"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
						--Library:tween(Toggle["40"], {Color = Color3.fromRGB(54, 160, 255)})
						Toggle:Toggle()
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							Library:tween(Toggle["39"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
							--Library:tween(Toggle["40"], {Color = Color3.fromRGB(36, 114, 187)})
						else
							Library:tween(Toggle["39"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
							--Library:tween(Toggle["40"], {Color = Color3.fromRGB(44, 144, 246)})
						end
					end
				end)
			end
			
			return Toggle
		end
		
		function Tab:Dropdown(options)
			options = Library:validate({
				title = "New Dropdown",
				callback = function(v) print(v) end,
				items = {}
			}, options or {})
			
			local Dropdown = {
				Items = {
					["id"] = {
						"value"
					}
				},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false
			}
			
			-- Render
			do
				-- StarterGui.MergeLib.Main.cont.Home.Dropdown
				Dropdown["28"] = Instance.new("Frame", Tab["7"]);
				Dropdown["28"]["BorderSizePixel"] = 0;
				Dropdown["28"]["BackgroundColor3"] = Color3.fromRGB(37, 115, 188);
				Dropdown["28"]["Size"] = UDim2.new(1, 0, 0, 40);
				Dropdown["28"]["ClipsDescendants"] = true;
				Dropdown["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["28"]["Name"] = [[Dropdown]];

				-- StarterGui.MergeLib.Main.cont.Home.Dropdown.Title
				Dropdown["29"] = Instance.new("TextLabel", Dropdown["28"]);
				Dropdown["29"]["BorderSizePixel"] = 0;
				Dropdown["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["29"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown["29"]["TextSize"] = 20;
				Dropdown["29"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["29"]["Size"] = UDim2.new(1, -20, 0, 30);
				Dropdown["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["29"]["Text"] = [[Dropdown]];
				Dropdown["29"]["Name"] = [[Title]];
				Dropdown["29"]["BackgroundTransparency"] = 1;

				-- StarterGui.MergeLib.Main.cont.Home.Dropdown.Title.UIPadding
				Dropdown["2a"] = Instance.new("UIPadding", Dropdown["29"]);
				Dropdown["2a"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Dropdown.UIPadding
				Dropdown["2b"] = Instance.new("UIPadding", Dropdown["28"]);
				Dropdown["2b"]["PaddingTop"] = UDim.new(0, 5);
				Dropdown["2b"]["PaddingRight"] = UDim.new(0, 5);
				Dropdown["2b"]["PaddingBottom"] = UDim.new(0, 5);
				Dropdown["2b"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Dropdown.UICorner
				Dropdown["2c"] = Instance.new("UICorner", Dropdown["28"]);


				-- StarterGui.MergeLib.Main.cont.Home.Dropdown.Icon
				Dropdown["2d"] = Instance.new("ImageLabel", Dropdown["28"]);
				Dropdown["2d"]["BorderSizePixel"] = 0;
				Dropdown["2d"]["ScaleType"] = Enum.ScaleType.Fit;
				Dropdown["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2d"]["AnchorPoint"] = Vector2.new(1, 0);
				Dropdown["2d"]["Image"] = [[rbxassetid://11552476728]];
				Dropdown["2d"]["Size"] = UDim2.new(0, 30, 0, 30);
				Dropdown["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2d"]["Name"] = [[Icon]];
				Dropdown["2d"]["BackgroundTransparency"] = 1;
				Dropdown["2d"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterGui.MergeLib.Main.cont.Home.Dropdown.OptionHolder
				Dropdown["2e"] = Instance.new("Frame", Dropdown["28"]);
				Dropdown["2e"]["BorderSizePixel"] = 0;
				Dropdown["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2e"]["BackgroundTransparency"] = 1;
				Dropdown["2e"]["Size"] = UDim2.new(1, 0, 1, -32);
				Dropdown["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2e"]["Position"] = UDim2.new(0, 0, 0, 32);
				Dropdown["2e"]["Visible"] = false;
				Dropdown["2e"]["Name"] = [[OptionHolder]];

				-- StarterGui.MergeLib.Main.cont.Home.Dropdown.OptionHolder.UIListLayout
				Dropdown["2f"] = Instance.new("UIListLayout", Dropdown["2e"]);
				Dropdown["2f"]["Padding"] = UDim.new(0, 8);
				Dropdown["2f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			end
			
			-- Methods
			do
				function Dropdown:Add(id, value)
					local Item = {
						Hover = false,
						MouseDown = false
					}
					
					if Dropdown.Items[id] ~= nil then
						return
					end
					Dropdown.Items[id] = {
						instance = {},
						value = value
					}
					Dropdown.Items[id].instance = {}
					Dropdown.Items[id].value = value
					-- StarterGui.MergeLib.Main.cont.Home.Dropdown.OptionHolder.InactiveOption
					Dropdown.Items[id].instance["30"] = Instance.new("TextLabel", Dropdown["2e"]);
					Dropdown.Items[id].instance["30"]["BorderSizePixel"] = 0;
					Dropdown.Items[id].instance["30"]["BackgroundColor3"] = Color3.fromRGB(43, 141, 226);
					Dropdown.Items[id].instance["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown.Items[id].instance["30"]["TextSize"] = 16;
					Dropdown.Items[id].instance["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown.Items[id].instance["30"]["Size"] = UDim2.new(1, 0, 0, 22);
					Dropdown.Items[id].instance["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown.Items[id].instance["30"]["Text"] = id;
					Dropdown.Items[id].instance["30"]["Name"] = [[InactiveOption]]

					-- StarterGui.MergeLib.Main.cont.Home.Dropdown.OptionHolder.InactiveOption.UIStroke
					Dropdown.Items[id].instance["31"] = Instance.new("UIStroke", Dropdown.Items[id].instance["30"]);
					Dropdown.Items[id].instance["31"]["Color"] = Color3.fromRGB(49, 153, 244);
					Dropdown.Items[id].instance["31"]["Thickness"] = 1.5;
					Dropdown.Items[id].instance["31"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.MergeLib.Main.cont.Home.Dropdown.OptionHolder.InactiveOption.UICorner
					Dropdown.Items[id].instance["32"] = Instance.new("UICorner", Dropdown.Items[id].instance["30"]);
					Dropdown.Items[id].instance["32"]["CornerRadius"] = UDim.new(0, 2);
					
					--v.instance["31"]

					Dropdown.Items[id].instance["30"].MouseEnter:Connect(function()
						Item.Hover = true
						Dropdown.HoveringItem = true

						if not Item.MouseDown then
							Library:tween(Dropdown.Items[id].instance["30"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
						end
					end)

					Dropdown.Items[id].instance["30"].MouseLeave:Connect(function()
						Item.Hover = false
						Dropdown.HoveringItem = false

						if not Item.MouseDown then
							Library:tween(Dropdown.Items[id].instance["30"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
						end
					end)

					uis.InputBegan:Connect(function(input)
						
						if Dropdown.Items[id] == nil then return end
						
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
							Item.MouseDown = true
							Library:tween(Dropdown.Items[id].instance["30"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
							options.callback(value)
							Dropdown:Toggle()
						end
					end)

					uis.InputEnded:Connect(function(input)
						
						if Dropdown.Items[id] == nil then return end
						
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Item.MouseDown = false

							if Item.Hover then
								--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
								Library:tween(Dropdown.Items[id].instance["30"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
							else
								--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
								Library:tween(Dropdown.Items[id].instance["30"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
							end
						end
					end)
				end

				function Dropdown:Remove(id)
					if #Dropdown.Items[id] ~= nil then
						if Dropdown.Items[id].instance ~= nil then
							for i, v in pairs(Dropdown.Items[id].instance) do
								v:Destroy()
							end
						end
						Dropdown.Items[id] = nil
					end
				end

				function Dropdown:Clear()
					for i, v in pairs(Dropdown.Items) do
						Dropdown:Remove(i)
					end
				end

				function Dropdown:Toggle()
					if Dropdown.Open then
						Library:tween(Dropdown["28"], {Size = UDim2.new(1, 0, 0, 40)}, function()
							Dropdown["2e"].Visible = false
						end)
					else
						local count = 0
						for i, v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end
						
						Dropdown["2e"].Visible = true
						Library:tween(Dropdown["28"], {Size = UDim2.new(1, 0, 0, 40 + (count * 22) + 0)})
					end
					Dropdown.Open = not Dropdown.Open
				end
			end
			
			-- Logic
			do
				Dropdown["28"].MouseEnter:Connect(function()
					Dropdown.Hover = true

					if not Dropdown.MouseDown then
						Library:tween(Dropdown["28"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
					end
				end)

				Dropdown["28"].MouseLeave:Connect(function()
					Dropdown.Hover = false

					if not Dropdown.MouseDown then
						Library:tween(Dropdown["28"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
					end
				end)

				uis.InputBegan:Connect(function(input)

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true
						Library:tween(Dropdown["28"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
						
						if not Dropdown.HoveringItem then
							Dropdown:Toggle()
						end
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.MouseDown = false

						if Dropdown.Hover then
							--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
							Library:tween(Dropdown["28"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
						else
							--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
							Library:tween(Dropdown["28"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
						end
					end
				end)		
			end
			
			
			return Dropdown
		end
		
		function Tab:Textbox(options)
			options = Library:validate({
				title = "New Textbox",
				callback = function(v) end
			}, options or {})
			
			local Textbox = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterGui.MergeLib.Main.cont.Home.Textbox
				Textbox["56"] = Instance.new("Frame", Tab["7"]);
				Textbox["56"]["BorderSizePixel"] = 0;
				Textbox["56"]["BackgroundColor3"] = Color3.fromRGB(37, 115, 188);
				Textbox["56"]["Size"] = UDim2.new(1, 0, 0.03886065259575844, 42);
				Textbox["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Textbox["56"]["Position"] = UDim2.new(0, 0, 0.34228187799453735, 0);
				Textbox["56"]["Name"] = [[Textbox]];

				-- StarterGui.MergeLib.Main.cont.Home.Textbox.Title
				Textbox["57"] = Instance.new("TextLabel", Textbox["56"]);
				Textbox["57"]["BorderSizePixel"] = 0;
				Textbox["57"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Textbox["57"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Textbox["57"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Textbox["57"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Textbox["57"]["TextSize"] = 20;
				Textbox["57"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Textbox["57"]["Size"] = UDim2.new(1, -24, 1, -10);
				Textbox["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Textbox["57"]["Text"] = options.title;
				Textbox["57"]["Name"] = [[Title]];
				Textbox["57"]["BackgroundTransparency"] = 1;

				-- StarterGui.MergeLib.Main.cont.Home.Textbox.Title.UIPadding
				Textbox["58"] = Instance.new("UIPadding", Textbox["57"]);
				Textbox["58"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Textbox.UIPadding
				Textbox["59"] = Instance.new("UIPadding", Textbox["56"]);
				Textbox["59"]["PaddingTop"] = UDim.new(0, 5);
				Textbox["59"]["PaddingRight"] = UDim.new(0, 5);
				Textbox["59"]["PaddingBottom"] = UDim.new(0, 5);
				Textbox["59"]["PaddingLeft"] = UDim.new(0, 5);

				-- StarterGui.MergeLib.Main.cont.Home.Textbox.UICorner
				Textbox["5a"] = Instance.new("UICorner", Textbox["56"]);


				-- StarterGui.MergeLib.Main.cont.Home.Textbox.Box
				Textbox["5b"] = Instance.new("TextBox", Textbox["56"]);
				Textbox["5b"]["CursorPosition"] = -1;
				Textbox["5b"]["ClearTextOnFocus"] = false;
				Textbox["5b"]["BorderSizePixel"] = 0;
				Textbox["5b"]["TextSize"] = 14;
				Textbox["5b"]["TextWrapped"] = true;
				Textbox["5b"]["TextScaled"] = true;
				Textbox["5b"]["BackgroundColor3"] = Color3.fromRGB(31, 97, 158);
				Textbox["5b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Textbox["5b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Textbox["5b"]["Size"] = UDim2.new(0, 453, 0, 30);
				Textbox["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Textbox["5b"]["Text"] = [[]];
				Textbox["5b"]["Position"] = UDim2.new(0, 0, 0.42619556188583374, 0);
				Textbox["5b"]["Name"] = [[Box]];

				-- StarterGui.MergeLib.Main.cont.Home.Textbox.Box.UICorner
				Textbox["5c"] = Instance.new("UICorner", Textbox["5b"]);


				-- StarterGui.MergeLib.Main.cont.Home.Textbox.Box.UIStroke
				Textbox["5d"] = Instance.new("UIStroke", Textbox["5b"]);
				Textbox["5d"]["Color"] = Color3.fromRGB(49, 153, 244);
				Textbox["5d"]["Thickness"] = 1.5;
				Textbox["5d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			end
			
			-- Methods
			function Textbox:SetValue(v)
				options.callback(Textbox:GetValue())
			end
			
			function Textbox:GetValue()
				return Textbox["5b"].Text
			end
			
			-- Logic (please finish this. it looks horrible)
			do
				Textbox["56"].MouseEnter:Connect(function()
					Textbox.Hover = true

					if not Textbox.MouseDown then
						Library:tween(Textbox["56"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
					end
				end)

				Textbox["56"].MouseLeave:Connect(function()
					Textbox.Hover = false

					if not Textbox.MouseDown then
						Library:tween(Textbox["56"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
					end
				end)

				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Textbox.Hover then
						Textbox.MouseDown = true
						Library:tween(Textbox["56"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
						if Textbox["5b"].Focused then
							Textbox:SetValue(Textbox["5b"].Text)
							
						end
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Textbox.MouseDown = false

						if Textbox.Hover then
							--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(49, 155, 255)})
							Library:tween(Textbox["56"], {BackgroundColor3 = Color3.fromRGB(46, 147, 241)})
						else
							--Library:tween(Button["9"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
							Library:tween(Textbox["56"], {BackgroundColor3 = Color3.fromRGB(36, 114, 187)})
						end
						
					end
				end)
			end
			
			return Textbox
		end
		
		return Tab
	end
	
	function GUI:CreateNotification(options)
		options = Library:validate({
			title = "New Notification",
			icon = "rbxassetid://8130360540",
			header = "Header",
			description = "Description",
			duration = 5
		}, options or {})
		
		local Notification = {
			items = {}
		}
		
		-- Logic
		do
		end
		
		-- Render
		do
			-- StarterGui.MergeLibrary.Main.NotifContainer.UIListLayout
			Notification["72"] = Instance.new("UIListLayout", GUI["71"]);
			Notification["72"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
			Notification["72"]["Padding"] = UDim.new(0, 10);
			Notification["72"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

			-- StarterGui.MergeLibrary.Main.NotifContainer.UIPadding
			Notification["73"] = Instance.new("UIPadding", GUI["71"]);
			Notification["73"]["PaddingBottom"] = UDim.new(0, 10);
			Notification["73"]["PaddingLeft"] = UDim.new(0, -5);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification
			Notification["74"] = Instance.new("Frame", GUI["71"]);
			Notification["74"]["BorderSizePixel"] = 0;
			Notification["74"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Notification["74"]["Size"] = UDim2.new(0, 300, 0, 100);
			Notification["74"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["74"]["Position"] = UDim2.new(0, 0, 0.8165137767791748, 0);
			Notification["74"]["Name"] = [[Notification]];

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.UICorner
			Notification["75"] = Instance.new("UICorner", Notification["74"]);


			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.UIStroke
			Notification["76"] = Instance.new("UIStroke", Notification["74"]);
			Notification["76"]["Color"] = Color3.fromRGB(255, 255, 255);
			Notification["76"]["Thickness"] = 3;
			Notification["76"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.UIStroke.UIGradient
			Notification["77"] = Instance.new("UIGradient", Notification["76"]);
			Notification["77"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(1.000, 1),NumberSequenceKeypoint.new(1.000, 1)};
			Notification["77"]["Rotation"] = 90;
			Notification["77"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(37, 115, 188)),ColorSequenceKeypoint.new(0.300, Color3.fromRGB(47, 137, 215)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(71, 197, 255))};

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.TopBar
			Notification["78"] = Instance.new("Frame", Notification["74"]);
			Notification["78"]["BorderSizePixel"] = 0;
			Notification["78"]["BackgroundColor3"] = Color3.fromRGB(37, 115, 188);
			Notification["78"]["AnchorPoint"] = Vector2.new(0.5, 0);
			Notification["78"]["Size"] = UDim2.new(1, 0, 0.20000000298023224, 0);
			Notification["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["78"]["Position"] = UDim2.new(0.5, 0, 0, 0);
			Notification["78"]["Name"] = [[TopBar]];

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.TopBar.UICorner
			Notification["79"] = Instance.new("UICorner", Notification["78"]);
			Notification["79"]["CornerRadius"] = UDim.new(0, 7);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.TopBar.Frame
			Notification["7a"] = Instance.new("Frame", Notification["78"]);
			Notification["7a"]["BorderSizePixel"] = 0;
			Notification["7a"]["BackgroundColor3"] = Color3.fromRGB(37, 115, 188);
			Notification["7a"]["AnchorPoint"] = Vector2.new(0, 1);
			Notification["7a"]["Size"] = UDim2.new(1, 0, 0.5, 0);
			Notification["7a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["7a"]["Position"] = UDim2.new(0, 0, 1, 0);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.TopBar.TextLabel
			Notification["7b"] = Instance.new("TextLabel", Notification["78"]);
			Notification["7b"]["BorderSizePixel"] = 0;
			Notification["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Notification["7b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Notification["7b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Notification["7b"]["TextSize"] = 14;
			Notification["7b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Notification["7b"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Notification["7b"]["Size"] = UDim2.new(0, 200, 1, 0);
			Notification["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["7b"]["Text"] = options.title;
			Notification["7b"]["BackgroundTransparency"] = 1;
			Notification["7b"]["Position"] = UDim2.new(0, 0, 0.5, 0);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.TopBar.TextLabel.UIPadding
			Notification["7c"] = Instance.new("UIPadding", Notification["7b"]);
			Notification["7c"]["PaddingLeft"] = UDim.new(0, 25);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.TopBar.Icon
			Notification["7d"] = Instance.new("ImageLabel", Notification["78"]);
			Notification["7d"]["BorderSizePixel"] = 0;
			Notification["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Notification["7d"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Notification["7d"]["Image"] = [[rbxassetid://12988744896]];
			Notification["7d"]["Size"] = UDim2.new(0, 16, 0, 16);
			Notification["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["7d"]["Name"] = options.icon;
			Notification["7d"]["BackgroundTransparency"] = 1;
			Notification["7d"]["Position"] = UDim2.new(0, 5, 0.5, 0);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.TopBar.Exit
			Notification["7e"] = Instance.new("ImageLabel", Notification["78"]);
			Notification["7e"]["BorderSizePixel"] = 0;
			Notification["7e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Notification["7e"]["AnchorPoint"] = Vector2.new(1, 0.5);
			Notification["7e"]["Image"] = [[rbxassetid://10152135063]];
			Notification["7e"]["Size"] = UDim2.new(0, 16, 0, 16);
			Notification["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["7e"]["Name"] = [[Exit]];
			Notification["7e"]["BackgroundTransparency"] = 1;
			Notification["7e"]["Position"] = UDim2.new(1, -5, 0.5, 0);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.Header
			Notification["7f"] = Instance.new("TextLabel", Notification["74"]);
			Notification["7f"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
			Notification["7f"]["BorderSizePixel"] = 0;
			Notification["7f"]["TextYAlignment"] = Enum.TextYAlignment.Top;
			Notification["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Notification["7f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Notification["7f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Notification["7f"]["TextSize"] = 20;
			Notification["7f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Notification["7f"]["Size"] = UDim2.new(1, 0, 0, 50);
			Notification["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["7f"]["Text"] = options.header;
			Notification["7f"]["Name"] = [[Header]];
			Notification["7f"]["BackgroundTransparency"] = 1;
			Notification["7f"]["Position"] = UDim2.new(0, 3, 0, 20);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.Header.UIPadding
			Notification["80"] = Instance.new("UIPadding", Notification["7f"]);
			Notification["80"]["PaddingTop"] = UDim.new(0, 3);
			Notification["80"]["PaddingLeft"] = UDim.new(0, 5);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.Header.UIGradient
			Notification["81"] = Instance.new("UIGradient", Notification["7f"]);
			Notification["81"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(47, 138, 215)),ColorSequenceKeypoint.new(0.300, Color3.fromRGB(47, 138, 215)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(71, 197, 255))};

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.Description
			Notification["82"] = Instance.new("TextLabel", Notification["74"]);
			Notification["82"]["TextWrapped"] = true;
			Notification["82"]["BorderSizePixel"] = 0;
			Notification["82"]["TextYAlignment"] = Enum.TextYAlignment.Top;
			Notification["82"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Notification["82"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Notification["82"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Notification["82"]["TextSize"] = 15;
			Notification["82"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["82"]["Size"] = UDim2.new(1, 0, 0, 50);
			Notification["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["82"]["Text"] = options.description;
			Notification["82"]["Name"] = [[Description]];
			Notification["82"]["BackgroundTransparency"] = 1;
			Notification["82"]["Position"] = UDim2.new(0, 3, 0, 44);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.Description.UIPadding
			Notification["83"] = Instance.new("UIPadding", Notification["82"]);
			Notification["83"]["PaddingLeft"] = UDim.new(0, 5);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.Frame
			Notification["84"] = Instance.new("Frame", Notification["74"]);
			Notification["84"]["BorderSizePixel"] = 0;
			Notification["84"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Notification["84"]["Size"] = UDim2.new(0, 275, 0, 1);
			Notification["84"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Notification["84"]["Position"] = UDim2.new(0, 7, 0, 43.5);

			-- StarterGui.MergeLibrary.Main.NotifContainer.Notification.Frame.UIGradient
			Notification["85"] = Instance.new("UIGradient", Notification["84"]);
			Notification["85"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(1.000, 1)};
			Notification["85"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(47, 138, 215)),ColorSequenceKeypoint.new(0.300, Color3.fromRGB(47, 138, 215)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(71, 197, 255))};

		end
		
		-- Methods
		function Notification:Remove(id)
			if Notification ~= nil then
					for i, v in pairs(Notification) do
						if v.Name == id and not nil then
						v:Destroy()
						end
					end
				Notification.Items[id] = nil
			end
		end

		function Notification:Clear()
			for i, v in pairs(Notification) do
				if i ~= nil then
					Notification:Remove(i)
				end
			end
		end
		
		-- Logic
		do
			
		end
		
		return Notification
	end
	
	return GUI
end

return Library

-- Ded Hub (полный скрипт с NoClip)
-- Поместите в StarterPlayer > StarterPlayerScripts (LocalScript)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local localPlayer = Players.LocalPlayer

-- GUI элементов (ваш оригинал, немного упорядочил)
local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")
local discordButton = Instance.new("TextButton")

-- NoClip button
local noclipButton = Instance.new("TextButton")

-- Parenting и базовые свойства
main.Name = "main"
main.Parent = localPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

-- Discord button
discordButton.Parent = Frame
discordButton.BackgroundColor3 = Color3.fromRGB(28, 103, 255)
discordButton.Size = UDim2.new(0, 100, 0, 28)
discordButton.Font = Enum.Font.SourceSans
discordButton.Text = "Discord"
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextSize = 14
discordButton.Position = UDim2.new(0.469327301, 0, -0.5, 0)

discordButton.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("https://discord.gg/Wh5uB3v7uT") end)
    StarterGui:SetCore("SendNotification", {
        Title = "Discord Link",
        Text = "Ссылка на Discord скопирована в буфер обмена!",
        Duration = 3
    })
end)

-- NoClip button (встраиваем в Frame)
noclipButton.Parent = Frame
noclipButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
noclipButton.Size = UDim2.new(0, 100, 0, 28)
noclipButton.Font = Enum.Font.SourceSans
noclipButton.Text = "NoClip OFF"
noclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipButton.TextSize = 14
-- Размещаем чуть ниже (если не помещается, можно подвинуть)
noclipButton.Position = UDim2.new(0.0, 0, 1.05, 0)

-- Остальные элементы интерфейса
up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = " Ded Hub 🦜 "
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = Enum.Font.SourceSans
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 20
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = Enum.Font.SourceSans
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 24
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = Enum.Font.SourceSans
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 24
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

-- Переменные
local speeds = 1
local speaker = localPlayer
local nowe = false
local tpwalking = false

StarterGui:SetCore("SendNotification", {
    Title = "Ded Hub🦜";
    Text = "By Ded_Parrot";
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150";
    Duration = 5;
})

Frame.Active = true
Frame.Draggable = true

-- Функция для включения/отключения NoClip
local noclipEnabled = false

local function setCharacterCollision(state)
    local char = localPlayer.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            -- Не трогаем некоторые важные свойства вроде заклиненных частей, но для простоты ставим напрямую
            part.CanCollide = state
        end
    end
end

-- NoClip кнопка + горячая клавиша N
noclipButton.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipButton.Text = noclipEnabled and "NoClip ON" or "NoClip OFF"
    if not noclipEnabled then
        -- восстановим коллизии
        setCharacterCollision(true)
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.N then
        noclipEnabled = not noclipEnabled
        noclipButton.Text = noclipEnabled and "NoClip ON" or "NoClip OFF"
        if not noclipEnabled then
            setCharacterCollision(true)
        end
    end
end)

-- Постоянно применяем NoClip, пока включено (Stepped быстрее/реагативнее)
RunService.Stepped:Connect(function()
    if noclipEnabled then
        local char = localPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    -- Отключаем коллизию
                    if part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end
    end
end)

-- Сохранение поведения при респавне: восстанавливаем значения и сбрасываем состояния
localPlayer.CharacterAdded:Connect(function(char)
    wait(0.7)
    -- восстановим параметры humanoid по умолчанию
    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        humanoid.PlatformStand = false
        -- включаем анимацию
        local animate = char:FindFirstChild("Animate")
        if animate then animate.Disabled = false end
    end
    -- Если NoClip выключен — убедимся что коллизии включены
    if not noclipEnabled then
        setCharacterCollision(true)
    else
        -- Если NoClip включен, сразу отключаем коллизии у вновь созданного персонажа
        setCharacterCollision(false)
    end
end)

-- Оригинальная логика fly/onof (совмещено с вашим кодом)
onof.MouseButton1Down:Connect(function()
    if nowe == true then
        nowe = false

        local char = localPlayer.Character
        local humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
            humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
        end
    else
        nowe = true

        for i = 1, speeds do
            spawn(function()
                local hb = RunService.Heartbeat
                tpwalking = true
                local chr = localPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end

        local Char = localPlayer.Character
        if Char then
            local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
            if Hum then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    v:AdjustSpeed(0)
                end
            end
        end

        local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
            humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        end
    end

    -- Далее — код Fly (R6 / R15) взят из вашего скрипта
    local char = localPlayer.Character
    local humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
    if not char or not humanoid then return end

    if humanoid.RigType == Enum.HumanoidRigType.R6 then
        local plr = localPlayer
        local torso = plr.Character and plr.Character:FindFirstChild("Torso")
        if not torso then return end

        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speedv = 0

        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            humanoid.PlatformStand = true
        end

        while nowe == true and humanoid.Health > 0 do
            RunService.RenderStepped:Wait()

            -- управление (используем UserInputService)
            ctrl.f = (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1) or (UserInputService:IsKeyDown(Enum.KeyCode.S) and -1) or 0
            ctrl.l = (UserInputService:IsKeyDown(Enum.KeyCode.A) and -1) or (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1) or 0
            -- b и r не используются в оригинале — оставляем 0
            ctrl.b = 0
            ctrl.r = 0

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speedv = speedv + .5 + (speedv / maxspeed)
                if speedv > maxspeed then speedv = maxspeed end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speedv ~= 0 then
                speedv = speedv - 1
                if speedv < 0 then speedv = 0 end
            end

            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.LookVector * (ctrl.f+ctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * speedv
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speedv ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.LookVector * (lastctrl.f+lastctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * speedv
            else
                bv.velocity = Vector3.new(0,0,0)
            end

            bg.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speedv/maxspeed),0,0)
        end

        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speedv = 0
        if bg then bg:Destroy() end
        if bv then bv:Destroy() end
        if humanoid then
            humanoid.PlatformStand = false
        end
        tpwalking = false

    else
        -- R15 (UpperTorso)
        local plr = localPlayer
        local UpperTorso = plr.Character and plr.Character:FindFirstChild("UpperTorso")
        if not UpperTorso then return end

        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speedv = 0

        local bg = Instance.new("BodyGyro", UpperTorso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = UpperTorso.CFrame
        local bv = Instance.new("BodyVelocity", UpperTorso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            humanoid.PlatformStand = true
        end

        while nowe == true and humanoid.Health > 0 do
            RunService.RenderStepped:Wait()

            ctrl.f = (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1) or (UserInputService:IsKeyDown(Enum.KeyCode.S) and -1) or 0
            ctrl.l = (UserInputService:IsKeyDown(Enum.KeyCode.A) and -1) or (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1) or 0
            ctrl.b = 0
            ctrl.r = 0

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speedv = speedv + .5 + (speedv / maxspeed)
                if speedv > maxspeed then speedv = maxspeed end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speedv ~= 0 then
                speedv = speedv - 1
                if speedv < 0 then speedv = 0 end
            end

            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.LookVector * (ctrl.f+ctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * speedv
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speedv ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.LookVector * (lastctrl.f+lastctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * speedv
            else
                bv.velocity = Vector3.new(0,0,0)
            end

            bg.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speedv/maxspeed),0,0)
        end

        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speedv = 0
        if bg then bg:Destroy() end
        if bv then bv:Destroy() end
        if humanoid then
            humanoid.PlatformStand = false
        end
        tpwalking = false
    end
end)

-- UP / DOWN кнопки (несколько исправлений логики)
local tis
up.MouseButton1Down:Connect(function()
    tis = up.MouseEnter:Connect(function()
        while tis do
            wait()
            local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = hrp.CFrame * CFrame.new(0,1,0)
            else
                break
            end
        end
    end)
end)

up.MouseLeave:Connect(function()
    if tis then
        tis:Disconnect()
        tis = nil
    end
end)

local dis
down.MouseButton1Down:Connect(function()
    dis = down.MouseEnter:Connect(function()
        while dis do
            wait()
            local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = hrp.CFrame * CFrame.new(0,-1,0)
            else
                break
            end
        end
    end)
end)

down.MouseLeave:Connect(function()
    if dis then
        dis:Disconnect()
        dis = nil
    end
end)

-- plus / mine
plus.MouseButton1Down:Connect(function()
    speeds = speeds + 1
    speed.Text = tostring(speeds)
    if nowe == true then
        tpwalking = false
        for i = 1, speeds do
            spawn(function()
                local hb = RunService.Heartbeat
                tpwalking = true
                local chr = localPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
    end
end)

mine.MouseButton1Down:Connect(function()
    if speeds == 1 then
        speed.Text = 'cannot be less than 1'
        wait(1)
        speed.Text = tostring(speeds)
    else
        speeds = speeds - 1
        speed.Text = tostring(speeds)
        if nowe == true then
            tpwalking = false
            for i = 1, speeds do
                spawn(function()
                    local hb = RunService.Heartbeat
                    tpwalking = true
                    local chr = localPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
                end)
            end
        end
    end
end)

closebutton.MouseButton1Click:Connect(function()
    main:Destroy()
    -- при уничтожении GUI восстановим коллизии чтобы не застрять
    setCharacterCollision(true)
    noclipEnabled = false
end)

mini.MouseButton1Click:Connect(function()
    up.Visible = false
    down.Visible = false
    onof.Visible = false
    plus.Visible = false
    speed.Visible = false
    mine.Visible = false
    mini.Visible = false
    mini2.Visible = true
    Frame.BackgroundTransparency = 1
    closebutton.Position =  UDim2.new(0, 0, -1, 57)
    discordButton.Visible = false
    noclipButton.Visible = false
end)

mini2.MouseButton1Click:Connect(function()
    up.Visible = true
    down.Visible = true
    onof.Visible = true
    plus.Visible = true
    speed.Visible = true
    mine.Visible = true
    mini.Visible = true
    mini2.Visible = false
    Frame.BackgroundTransparency = 0 
    closebutton.Position =  UDim2.new(0, 0, -1, 27)
    discordButton.Visible = true
    noclipButton.Visible = true
end)

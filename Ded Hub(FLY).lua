local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local localPlayer = Players.LocalPlayer

-- === GUI ЭЛЕМЕНТЫ ===
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

-- === Discord button ===
local discordButton = Instance.new("TextButton")
discordButton.Parent = Frame
discordButton.BackgroundColor3 = Color3.fromRGB(28, 103, 255)
discordButton.Size = UDim2.new(0, 100, 0, 28)
discordButton.Font = Enum.Font.SourceSans
discordButton.Text = "Discord"
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextSize = 14
discordButton.Position = UDim2.new(0.469327301, 0, -0.5, 0)
discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/Wh5uB3v7uT")
    StarterGui:SetCore("SendNotification", {
        Title = "Discord Link",
        Text = "Ссылка на Discord скопирована!",
        Duration = 3
    })
end)

-- === Основные элементы ===
main.Name = "main"
main.Parent = localPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.1, 0, 0.38, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.49, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Text = "DOWN"

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.7, 0, 0.49, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Text = "fly"

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.47, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Text = " Ded Hub 🦜 "

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.23, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Text = "+"

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.46, 0, 0.49, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Text = "1"

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.23, 0, 0.49, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Text = "-"

closebutton.Name = "Close"
closebutton.Parent = Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position = UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

-- === ДОБАВЛЕНИЕ Noclip кнопки ===
local noclipButton = Instance.new("TextButton")
noclipButton.Parent = Frame
noclipButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
noclipButton.Size = UDim2.new(0, 100, 0, 28)
noclipButton.Text = "NoClip OFF"
noclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipButton.Position = UDim2.new(0.469, 0, 1.2, 0)

local noclipEnabled = false
noclipButton.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipButton.Text = noclipEnabled and "NoClip ON" or "NoClip OFF"
end)
RunService.Stepped:Connect(function()
    if noclipEnabled and localPlayer.Character then
        for _, part in ipairs(localPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- === ДОБАВЛЕНИЕ GodMode кнопки ===
local godButton = Instance.new("TextButton")
godButton.Parent = Frame
godButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
godButton.Size = UDim2.new(0, 100, 0, 28)
godButton.Text = "GodMode OFF"
godButton.Position = UDim2.new(0, 0, 1.2, 0)

local godEnabled = false
local function enableGod()
    local char = localPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildWhichIsA("Humanoid")
    if hum then
        hum.MaxHealth = math.huge
        hum.Health = hum.MaxHealth
    end
end

godButton.MouseButton1Click:Connect(function()
    godEnabled = not godEnabled
    godButton.Text = godEnabled and "GodMode ON" or "GodMode OFF"
    if godEnabled then enableGod() end
end)

RunService.Heartbeat:Connect(function()
    if godEnabled and localPlayer.Character then
        local hum = localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if hum then
            hum.MaxHealth = math.huge
            hum.Health = hum.MaxHealth
        end
    end
end)

localPlayer.CharacterAdded:Connect(function()
    if godEnabled then
        wait(0.5)
        enableGod()
    end
end)

-- === Остальная логика fly, up/down, +/- и т.п. ===
-- (оставляем твою часть без изменений)

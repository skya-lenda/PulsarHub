-- ============================================
-- PULSAR HUB - BROOKHAVEN RP
-- By: Dazzy
-- Versão: 3.0 (Com Música)
-- ============================================

local t1 = {}
local v2 = unpack or table.unpack
t1.value1 = game:GetService("Players")
t1.value2 = game:GetService("TweenService")

local SoundService = game:GetService("SoundService")

t1.value3 = t1.value1.LocalPlayer
local PlayerGui = t1.value3:WaitForChild("PlayerGui")

t1.value4 = true
t1.value5 = Instance.new("ScreenGui")
t1.value5.Name = "KakahPremiumLoader"
t1.value5.ResetOnSpawn = false
t1.value5.IgnoreGuiInset = true
t1.value5.DisplayOrder = 9999999
t1.value5.Parent = PlayerGui
t1.value6 = Instance.new("Frame")
t1.value6.Name = "MainBackground"
t1.value6.Size = UDim2.new(1, 0, 1, 0)
t1.value6.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
t1.value6.BorderSizePixel = 0
t1.value6.Parent = t1.value5
local ImageLabel = Instance.new("ImageLabel")

ImageLabel.Name = "AmbientGlow"
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = "rbxassetid://13110515159"
ImageLabel.ImageColor3 = Color3.fromRGB(180, 0, 0)
ImageLabel.ImageTransparency = 0.85
ImageLabel.Parent = t1.value6

-- ============================================
-- SISTEMA DE SPARKS (ANIMAÇÃO)
-- ============================================

function t1.value7()
    local v12 = not t1.value5
    if not v12 then  
        v12 = not t1.value5.Parent or not t1.value4  
    end  
    if v12 then  
        return  
    end  

    local Frame = Instance.new("Frame")  
    Frame.Name = "Spark"  
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)  

    local v14 = math.random()  
    Frame.Position = UDim2.new(v14, 0, 1.1, 0)  

    local v15 = math.random(2, 6)  
    Frame.Size = UDim2.new(0, v15, 0, v15)  
    Frame.BackgroundColor3 = Color3.fromRGB(255, math.random(0, 80), math.random(0, 50))  
    Frame.BorderSizePixel = 0  
    Frame.BackgroundTransparency = math.random(3, 7) / 10  

    local UICorner = Instance.new("UICorner")  
    UICorner.CornerRadius = UDim.new(1, 0)  
    UICorner.Parent = Frame  
    Frame.Parent = t1.value6  

    local v17 = math.random(35, 65) / 10  
    local v18 = (math.random() - 0.5) * 0.2  
    local value2 = t1.value2  
    local tweenInfo = TweenInfo.new(v17, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)  
    local Create = value2.Create  
    local uDim2 = UDim2.new(v14 + v18, 0, -0.1, 0)  
    local uDim2_2 = UDim2.new(0, 0, 0, 0)  
    local v24 = Create(value2, Frame, tweenInfo, {  
        Position = uDim2,  
        BackgroundTransparency = 1,  
        Size = uDim2_2  
    })  

    v24:Play()  
    v24.Completed:Connect(function()  
        Frame:Destroy()  
    end)
end

task.spawn(function()
    while true do
        local value4 = t1.value4
        if value4 then  
            value4 = t1.value5  
            if value4 then  
                value4 = t1.value5.Parent  
            end  
        end  
        if not value4 then  
            break  
        end  
        t1.value7()  
        task.wait(0.12)  
    end
end)

-- ============================================
-- SISTEMA DE SCANLINE
-- ============================================

local function v6()
    local v26 = not t1.value5
    if not v26 then  
        v26 = not t1.value5.Parent or not t1.value4  
    end  
    if v26 then  
        return  
    end  

    local Frame = Instance.new("Frame")  
    Frame.Name = "ScanLine"  
    Frame.Size = UDim2.new(1, 0, 0, 1)  
    Frame.Position = UDim2.new(0, 0, math.random(10, 90) / 100, 0)  
    Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  
    Frame.BorderSizePixel = 0  
    Frame.BackgroundTransparency = 0.8  

    local UIGradient = Instance.new("UIGradient")  
    UIGradient.Color = ColorSequence.new({  
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),  
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),  
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))  
    })  
    UIGradient.Transparency = NumberSequence.new({  
        NumberSequenceKeypoint.new(0, 1),  
        NumberSequenceKeypoint.new(0.2, 0.5),  
        NumberSequenceKeypoint.new(0.5, 0),  
        NumberSequenceKeypoint.new(0.8, 0.5),  
        NumberSequenceKeypoint.new(1, 1)  
    })  
    UIGradient.Parent = Frame  
    Frame.Parent = t1.value6  

    local value2 = t1.value2  
    local tweenInfo = TweenInfo.new(3.5, Enum.EasingStyle.Linear)  
    local Create = value2.Create  
    local uDim2 = UDim2.new(1, 0, 0, 4)  

    Create(value2, Frame, tweenInfo, {  
        BackgroundTransparency = 1,  
        Size = uDim2  
    }):Play()  
    task.delay(3.5, function()  
        Frame:Destroy()  
    end)
end

task.spawn(function()
    while true do
        local value4 = t1.value4
        if value4 then  
            value4 = t1.value5  
            if value4 then  
                value4 = t1.value5.Parent  
            end  
        end  
        if not value4 then  
            break  
        end  
        v6()  
        task.wait(2.2)  
    end
end)

-- ============================================
-- LOGO E ANIMAÇÕES
-- ============================================

local Frame = Instance.new("Frame")
Frame.Name = "CenterContainer"
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Position = UDim2.new(0.5, 0, 0.44, 0)
Frame.Size = UDim2.new(0.7, 0, 0.3, 0)
Frame.BackgroundTransparency = 1
Frame.Parent = t1.value6

t1.value8 = Instance.new("TextLabel")
t1.value8.Name = "LogoText"
t1.value8.Size = UDim2.new(1, 0, 1, 0)
t1.value8.BackgroundTransparency = 1
t1.value8.Text = "PULSAR HUB"
t1.value8.TextColor3 = Color3.fromRGB(255, 10, 10)
t1.value8.Font = Enum.Font.GothamBold
t1.value8.TextSize = 72
t1.value8.RichText = true
t1.value8.TextTransparency = 1
t1.value8.Parent = Frame

t1.value9 = Instance.new("UIStroke")
t1.value9.Color = Color3.fromRGB(255, 0, 0)
t1.value9.Thickness = 2.5
t1.value9.Transparency = 1
t1.value9.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
t1.value9.Parent = t1.value8

t1.value10 = t1.value8:Clone()
t1.value10.Name = "LogoGlow"
t1.value10.ZIndex = t1.value8.ZIndex - 1
t1.value10.TextColor3 = Color3.fromRGB(200, 0, 0)
t1.value10.Parent = Frame
t1.value10:WaitForChild("UIStroke").Thickness = 6
t1.value10:WaitForChild("UIStroke").Transparency = 1

task.spawn(function()
    t1.value2:Create(t1.value8, TweenInfo.new(1.5), {
        TextTransparency = 0
    }):Play()
    t1.value2:Create(t1.value9, TweenInfo.new(1.5), {
        Transparency = 0.2
    }):Play()
    t1.value2:Create(t1.value10, TweenInfo.new(1.5), {
        TextTransparency = 0.6
    }):Play()
    t1.value2:Create(t1.value10:WaitForChild("UIStroke"), TweenInfo.new(1.5), {
        Transparency = 0.5
    }):Play()
    task.wait(1.5)

    task.spawn(function()
        while true do
            local value4 = t1.value4
            if value4 then  
                value4 = t1.value5  
                if value4 then  
                    value4 = t1.value5.Parent  
                end  
            end  
            if not value4 then  
                break  
            end  

            t1.value2:Create(t1.value9, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {  
                Transparency = 0.65  
            }):Play()  
            t1.value2:Create(t1.value10:WaitForChild("UIStroke"), TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {  
                Transparency = 0.8  
            }):Play()  
            task.wait(1.2)  
            t1.value2:Create(t1.value9, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {  
                Transparency = 0.1  
            }):Play()  
            t1.value2:Create(t1.value10:WaitForChild("UIStroke"), TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {  
                Transparency = 0.4  
            }):Play()  
            task.wait(1.2)  
        end  
    end)  

    while true do  
        local value4 = t1.value4  
        if value4 then  
            value4 = t1.value5  
            if value4 then  
                value4 = t1.value5.Parent  
            end  
        end  
        if not value4 then  
            break  
        end  

        task.wait(math.random(4, 9))  
        if not t1.value4 then  
            return  
        end  

        for _ = 1, math.random(2, 4) do  
            local v36 = math.random(-6, 6)  
            t1.value8.Position = UDim2.new(0, v36, 0, math.random(-2, 2))  
            t1.value8.TextColor3 = Color3.fromRGB(255, 255, 255)  
            t1.value9.Color = Color3.fromRGB(255, 255, 255)  
            task.wait(0.05)  
            t1.value8.Position = UDim2.new(0, 0, 0, 0)  
            t1.value8.TextColor3 = Color3.fromRGB(255, 10, 10)  
            t1.value9.Color = Color3.fromRGB(255, 0, 0)  
            task.wait(0.04)  
        end  
    end
end)

-- ============================================
-- PROGRESS BAR
-- ============================================

local Frame2 = Instance.new("Frame")
Frame2.Name = "ProgressContainer"
Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame2.Position = UDim2.new(0.5, 0, 0.74, 0)
Frame2.Size = UDim2.new(0, 480, 0, 14)
Frame2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame2.BorderSizePixel = 0
Frame2.Parent = t1.value6

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.5, 0)
UICorner.Parent = Frame2

t1.value11 = Instance.new("UIStroke")
t1.value11.Color = Color3.fromRGB(255, 15, 15)
t1.value11.Thickness = 1.5
t1.value11.Transparency = 0.4
t1.value11.Parent = Frame2

t1.value12 = Instance.new("Frame")
t1.value12.Name = "ProgressBar"
t1.value12.Size = UDim2.new(0, 0, 1, 0)
t1.value12.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
t1.value12.BorderSizePixel = 0
t1.value12.Parent = Frame2

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0.5, 0)
UICorner2.Parent = t1.value12

t1.value13 = Instance.new("UIGradient")
t1.value13.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 60, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
})
t1.value13.Parent = t1.value12

task.spawn(function()
    while true do
        local value4 = t1.value4
        if value4 then  
            value4 = t1.value5  
            if value4 then  
                value4 = t1.value5.Parent  
            end  
        end  
        if not value4 then  
            break  
        end  

        t1.value13.Offset = Vector2.new(-1, 0)  
        local v38 = t1.value2:Create(t1.value13, TweenInfo.new(1.4, Enum.EasingStyle.Linear), {  
            Offset = Vector2.new(1, 0)  
        })  
        v38:Play()  
        v38.Completed:Wait()  
    end
end)

t1.value14 = Instance.new("TextLabel")
t1.value14.Name = "PercentLabel"
t1.value14.AnchorPoint = Vector2.new(0.5, 0.5)
t1.value14.Position = UDim2.new(0.5, 0, 0.69, 0)
t1.value14.Size = UDim2.new(0, 100, 0, 20)
t1.value14.BackgroundTransparency = 1
t1.value14.Text = "0%"
t1.value14.TextColor3 = Color3.fromRGB(255, 30, 30)
t1.value14.Font = Enum.Font.GothamBold
t1.value14.TextSize = 16
t1.value14.Parent = t1.value6

t1.value15 = Instance.new("TextLabel")
t1.value15.Name = "StatusLabel"
t1.value15.AnchorPoint = Vector2.new(0.5, 0.5)
t1.value15.Position = UDim2.new(0.5, 0, 0.8, 0)
t1.value15.Size = UDim2.new(0, 500, 0, 25)
t1.value15.BackgroundTransparency = 1
t1.value15.Text = "Preparando seu Hub..."
t1.value15.TextColor3 = Color3.fromRGB(180, 180, 180)
t1.value15.Font = Enum.Font.Gotham
t1.value15.TextSize = 14
t1.value15.Parent = t1.value6

t1.value16 = "Preparando seu Hub"

task.spawn(function()
    local n1 = 0
    while true do  
        local value4 = t1.value4  
        if value4 then  
            value4 = t1.value5  
            if value4 then  
                value4 = t1.value5.Parent  
            end  
        end  
        if not value4 then  
            break  
        end  
        t1.value15.Text = t1.value16 .. string.rep(".", n1)  
        n1 = (n1 + 1) % 4  
        task.wait(0.4)  
    end
end)

t1.value17 = Instance.new("Sound")
t1.value17.Name = "LoadingAmbience"
t1.value17.SoundId = "rbxassetid://123181826801671"
t1.value17.Volume = 0
t1.value17.Looped = true
t1.value17.Parent = SoundService
t1.value17:Play()

t1.value2:Create(t1.value17, TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Volume = 0.6
}):Play()

-- ============================================
-- FUNÇÃO PRINCIPAL DO HUB
-- ============================================

local function v11()
    local t2 = {}
    local v42 = loadstring(game:HttpGet("https://pastebin.com/raw/XqZsnzRQ", true))()

    workspace.FallenPartsDestroyHeight = -1e999  

    local v43 = v42:MakeWindow({  
        Title = "Pulsar Hub | Brookhaven",  
        SubTitle = "By: Dazzy",  
        LoadText = "Carregando Pulsar Hub...",  
        Flags = "Pulsar_Hub"  
    })  

    -- NOVO ÍCONE ATUALIZADO
    local t3 = {  
        Image = "rbxassetid://439595043",  
        BackgroundTransparency = 1  
    }  
    local _UDim = UDim  
    local AddMinimizeButton = v43.AddMinimizeButton  
    local t4 = {  
        CornerRadius = _UDim.new(35, 1)  
    }  

    AddMinimizeButton(v43, {  
        Button = t3,  
        Corner = t4  
    })  

    -- ============================================
    -- TAB INFO
    -- ============================================

    local v48 = v43:MakeTab({  
        "Info",  
        "info"  
    })  

    v48:AddSection({ "Informações" })  
    v48:AddSection({ "Creditos" })  
    v48:AddParagraph({  
        "Time:",  
        "Pulsar"  
    })  
    v48:AddSection({ "Coisas da Internet" })  
    v48:AddDiscordInvite({  
        Name = "Pulsar Hub Update",  
        Description = "Discord Pulsar",  
        Logo = "rbxassetid://439595043",  
        Invite = "embreve"  
    })  
    v48:AddSection({ "Informações" })  

    t2.value1 = game:GetService("RunService")  

    local Stats = game:GetService("Stats")  
    game:GetService("UserInputService")  
    game:GetService("LocalizationService")  

    local LocalPlayer = t1.value1.LocalPlayer  
    local t5 = {  
        ["Seu Nome Oficial"] = LocalPlayer.Name or "Unidentified",  
        ["Seu Nome "] = LocalPlayer.DisplayName or "Unidentified",  
        ["Seu User Id:"] = LocalPlayer.UserId or "Unidentified"  
    }  

    local Network = Stats:FindFirstChild("Network")  
    if Network then  
        Network = Network:FindFirstChild("ServerStatsItem")  
    end  
    if Network then  
        Network = (function(p1, p2)  
            if p1 then  
                local p2_2 = p1:FindFirstChild(p2)  
                local v82 = p2_2  
                if v82 then  
                    v82 = p2_2.GetValue  
                end  
                if v82 then  
                    local success, result = pcall(function()  
                        return p2_2:GetValue()  
                    end)  
                    if success then  
                        return math.floor(result)  
                    end  
                end  
            end  
            return "Unidentified"  
        end)(Network, "Data Ping") .. " ms"  
    end  

    t5["Seu Ping:"] = Network or "Unidentified"  

    if identifyexecutor then  
        local ok, result, v55 = pcall(function()  
            return identifyexecutor()  
        end)  
        if ok then  
            ok = result .. v55 and " v" .. v55 or ""  
        end  
        t5[" Seu Executor:"] = ok or "Unidentified"  
    else  
        t5["Seu Executor:"] = "Unidentified"  
    end  

    for k, v in pairs(t5) do  
        local t7 = { tostring(v) }  
        v48:AddParagraph({  
            k,  
            v2(t7)  
        })  
    end  

    v48:AddParagraph({  
        "Linguagem.",  
        "Português"  
    })  
    v48:AddParagraph({  
        "Qual Jogo:",  
        "Brookhaven RP 🏡"  
    })  
    v48:AddParagraph({  
        "Qual e o Script:",  
        "Pulsar Hub"  
    })  
    v48:AddParagraph({  
        "Versão:",  
        "3.0 - Música"  
    })  
    v48:AddSection({ "Avisos" })  
    v48:AddSection({ "Outros" })  
    v48:AddButton({  
        Name = "Re-Entra",  
        Callback = function()  
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)  
        end  
    })  

    -- ============================================
    -- TAB TROLL PLAYERS
    -- ============================================

    local v59 = v43:MakeTab({  
        Title = "Troll Players",  
        Icon = "rbxassetid://439595043"  
    })  

    t2.value2 = game:GetService("ReplicatedStorage")  
    t2.value3 = game:GetService("VirtualInputManager")  
    t2.value4 = workspace.CurrentCamera  
    t2.value5 = nil  
    t2.value6 = nil  
    getgenv().Target = nil  
    t2.value7 = t1.value3.Character  

    local value7 = t2.value7  
    if value7 then  
        value7 = t2.value7:WaitForChild("Humanoid")  
    end  
    t2.value8 = value7  

    if t2.value7 then  
        t2.value7:WaitForChild("HumanoidRootPart")  
    end  

    local function v61()  
        local Character = t1.value3.Character  
        if Character then  
            local v86 = Character:FindFirstChild("Chaos.Couch")  
            if not v86 then  
                v86 = t1.value3.Backpack:FindFirstChild("Chaos.Couch")  
            end  
            if v86 then  
                v86:Destroy()  
            end  
        end  
        t2.value2:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")  
    end  

    t1.value3.CharacterAdded:Connect(function(character)  
        t2.value7 = character  
        t2.value8 = character:WaitForChild("Humanoid")  
        character:WaitForChild("HumanoidRootPart")  
        v61()  
        t2.value8.Died:Connect(function()  
            v61()  
        end)  
    end)  

    if t2.value8 then  
        t2.value8.Died:Connect(function()  
            v61()  
        end)  
    end  

    -- Função Couch Kill unificada
    local function executeCouchAction(actionType, targetName, useTeleport)
        if not targetName then
            warn("Erro: Nenhum jogador selecionado")
            return
        end

        local targetPlayer = t1.value1:FindFirstChild(targetName)
        if not targetPlayer or not targetPlayer.Character then
            warn("Erro: Jogador alvo não encontrado")
            return
        end

        local character = t1.value3.Character
        if not character then
            return
        end

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local targetRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")

        if not humanoid or not rootPart or not targetRootPart then
            return
        end

        local originalPosition = rootPart.Position
        local targetPosition = Vector3.new(145.51, -350.09, 21.58)

        -- Limpar ferramentas
        t2.value2:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
        task.wait(0.2)

        -- Pegar sofá
        t2.value2.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.3)

        local couch = t1.value3.Backpack:FindFirstChild("Couch")
        if couch then
            couch.Parent = character
        end

        task.wait(0.1)
        t2.value3:SendKeyEvent(true, Enum.KeyCode.F, false, game)
        task.wait(0.1)

        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        humanoid.PlatformStand = false

        -- Câmera no alvo
        local head = targetPlayer.Character:FindFirstChild("Head")
        if not head then
            head = targetRootPart or humanoid
        end
        t2.value4.CameraSubject = head

        -- BodyPosition para segurar o alvo
        local bodyPosition = Instance.new("BodyPosition")
        bodyPosition.Name = "BringPosition"
        bodyPosition.MaxForce = Vector3.new(1e999, 1e999, 1e999)
        bodyPosition.D = 10
        bodyPosition.P = 30000
        bodyPosition.Position = rootPart.Position
        bodyPosition.Parent = targetRootPart

        local angle = 0
        local timestamp = tick()

        task.spawn(function()
            while tick() - timestamp < 5 and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChildOfClass("Humanoid") do
                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                if not targetHumanoid or targetHumanoid.Sit then
                    break
                end

                local targetRoot = targetPlayer.Character.HumanoidRootPart
                local targetPos = targetRoot.Position + targetRoot.Velocity / 1.5

                angle = angle + 50
                rootPart.CFrame = CFrame.new(targetPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)
                bodyPosition.Position = rootPart.Position + Vector3.new(2, 0, 0)
                task.wait()
            end

            bodyPosition:Destroy()
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            humanoid.PlatformStand = false
            t2.value4.CameraSubject = humanoid

            -- Resetar velocidades
            for _, descendant in pairs(character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.Velocity = Vector3.zero
                    descendant.RotVelocity = Vector3.zero
                end
            end

            task.wait(0.1)

            if useTeleport then
                rootPart.CFrame = CFrame.new(targetPosition)
                task.wait(0.3)
            else
                rootPart.Anchored = true
                rootPart.CFrame = CFrame.new(originalPosition)
                task.wait(0.001)
                rootPart.Anchored = false
                task.wait(0.7)
            end

            -- Devolver sofá
            local couch2 = character:FindFirstChild("Couch")
            if couch2 then
                couch2.Parent = t1.value3.Backpack
            end

            task.wait(0.01)
            t2.value2.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")

            if useTeleport then
                task.wait(0.2)
                rootPart.CFrame = CFrame.new(originalPosition)
            end
        end)
    end

    -- Função para fling com sofá
    local function flingWithCouch(targetName)
        local target = t1.value1:FindFirstChild(targetName)
        if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
            return
        end

        t2.value2.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
        t2.value2.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")

        local couch = t1.value3.Backpack:WaitForChild("Couch", 2)
        if not couch then
            return
        end

        couch.Name = "Chaos.Couch"

        local seat1 = couch:FindFirstChild("Seat1")
        local seat2 = couch:FindFirstChild("Seat2")
        local handle = couch:FindFirstChild("Handle")

        if seat1 and seat2 and handle then
            seat1.Disabled = true
            seat2.Disabled = true
            handle.Name = "Handle "
        end

        couch.Parent = t1.value3.Character

        local bodyVelocity = Instance.new("BodyVelocity", seat1)
        bodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
        bodyVelocity.P = 1250
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

        local function flingLoop()
            local isSeated = false
            while not isSeated do
                for _ = 1, 35 do
                    local char = target.Character
                    if not char then break end

                    local targetRoot = char:FindFirstChild("HumanoidRootPart")
                    if not targetRoot then break end

                    local posX = targetRoot.Position.X + targetRoot.Velocity.X / 2
                    local posY = targetRoot.Position.Y + targetRoot.Velocity.Y / 2
                    local posZ = targetRoot.Position.Z + targetRoot.Velocity.Z / 2

                    seat1.CFrame = CFrame.new(Vector3.new(posX, posY, posZ)) * CFrame.new(-2, 2, 0)
                    task.wait()
                end

                bodyVelocity:Destroy()
                couch.Parent = t1.value3.Backpack
                task.wait()
                couch:FindFirstChild("Handle ").Name = "Handle"
                task.wait(0.2)
                couch.Parent = t1.value3.Character
                task.wait()
                couch.Parent = t1.value3.Backpack
                couch.Handle.Name = "Handle "
                task.wait(0.2)
                couch.Parent = t1.value3.Character

                bodyVelocity = Instance.new("BodyVelocity", seat1)
                bodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
                bodyVelocity.P = 1250
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                bodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

                local char = target.Character
                if char and char:FindFirstChild("Humanoid") then
                    isSeated = char.Humanoid.Sit == true
                end
            end

            task.wait()
            couch.Parent = t1.value3.Backpack
            seat1.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
            seat2.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
            couch.Parent = t1.value3.Character
            task.wait(0.1)
            couch.Parent = t1.value3.Backpack
            task.wait(2)

            local velocity = seat1:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W")
            if velocity then
                velocity:Destroy()
            end

            t2.value2.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
        end

        task.spawn(flingLoop)
    end

    -- UI da Tab Troll
    v59:AddSection({ Name = "Troll Player" })

    local function v64()
        local players = t1.value1:GetPlayers()
        local t10 = {}
        for _, v in ipairs(players) do
            if v ~= t1.value3 then
                table.insert(t10, v.Name)
            end
        end
        return t10
    end

    local v65 = v64()

    t2.value11 = v59:AddDropdown({
        Name = "Selecionar Jogador",
        Options = v65,
        Default = "",
        Callback = function(p3)
            t2.value5 = p3
            getgenv().Target = p3
        end
    })

    v59:AddButton({
        Name = "Atualizar Player List",
        Callback = function()
            local v149 = v64()
            if t2.value11 then
                t2.value11:Set(v149)
                if t2.value5 and not t1.value1:FindFirstChild(t2.value5) then
                    t2.value5 = nil
                    getgenv().Target = nil
                    t2.value11:SetValue("")
                end
            end
        end
    })

    v59:AddButton({
        Name = "Teleportar até o Player",
        Callback = function()
            if not t2.value5 then return end
            local targetPlayer = t1.value1:FindFirstChild(t2.value5)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                t1.value3.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    })

    v59:AddToggle({
        Name = "Spectar Player",
        Default = false,
        Callback = function(p4)
            local function updateCamera()
                if p4 then
                    local targetPlayer = t1.value1:FindFirstChild(t2.value5)
                    if targetPlayer and targetPlayer.Character then
                        t2.value4.CameraSubject = targetPlayer.Character:FindFirstChild("Humanoid")
                        return
                    end
                elseif t1.value3.Character then
                    t2.value4.CameraSubject = t1.value3.Character:FindFirstChild("Humanoid")
                end
            end

            if p4 then
                if not getgenv().CameraConnection then
                    getgenv().CameraConnection = t2.value1.Heartbeat:Connect(updateCamera)
                    return
                end
            else
                if getgenv().CameraConnection then
                    getgenv().CameraConnection:Disconnect()
                    getgenv().CameraConnection = nil
                end
                updateCamera()
            end
        end
    })

    v59:AddSection({ Name = "Métodos" })

    v59:AddDropdown({
        Name = "Selecionar Método para Matar",
        Options = {
            "Bus",
            "Couch",
            "Couch Sem ir alvo (coloca sofá no 2)"
        },
        Default = "",
        Callback = function(p5)
            t2.value6 = p5
        end
    })

    v59:AddButton({
        Name = "Matar Player",
        Callback = function()
            if not t2.value5 then return end
            if t2.value6 == "Couch" then
                executeCouchAction("kill", t2.value5, true)
            elseif t2.value6 == "Couch Sem ir alvo (coloca sofá no 2)" then
                flingWithCouch(t2.value5)
            end
        end
    })

    v59:AddButton({
        Name = "Puxar Player",
        Callback = function()
            if not t2.value5 then return end
            if t2.value6 == "Couch" then
                executeCouchAction("pull", t2.value5, false)
            elseif t2.value6 == "Couch Sem ir alvo (coloca sofá no 2)" then
                flingWithCouch(t2.value5)
            end
        end
    })

    v59:AddButton({
        Name = "House Ban Kill",
        Callback = function()
            -- Placeholder para House Ban
        end
    })

    t2.value12 = false
    v59:AddToggle({
        Name = "Auto Fling",
        Default = false,
        Callback = function(p6)
            t2.value12 = p6
        end
    })

    function t2.value13(_) end

    v59:AddButton({
        Name = "Fling Ball",
        Callback = function()
            if t2.value5 then
                local target = t1.value1[t2.value5]
                t2.value13(target)
            end
        end
    })

    v59:AddSection({ Name = "Fling Boat" })
    v59:AddButton({
        Name = "Fling - Boat",
        Callback = function() end
    })
    v59:AddButton({
        Name = "Desligar Fling - Boat",
        Callback = function() end
    })

    v59:AddSection({ Name = "Click Kill Methods" })
    v59:AddButton({
        Name = "Click Fling Portas [Beta]",
        Description = "Para Usar, Recomendo chegar perto de outras portas, apos ela ir até você, clique no jogador que deseja flingar",
        Callback = function()
            local Workspace = game:GetService("Workspace")
            local UserInputService = game:GetService("UserInputService")
            local Character = t1.value3.Character

            if not Character then
                Character = t1.value3.CharacterAdded:Wait()
            end

            local v161 = Character
            local HumanoidRootPart = v161:WaitForChild("HumanoidRootPart")
            local Part = Instance.new("Part")

            Part.Size = Vector3.new(100000, 100000, 100000)
            Part.Transparency = 1
            Part.Anchored = true
            Part.CanCollide = false
            Part.Name = "BlackHoleTarget"
            Part.Parent = Workspace

            local Attachment = Instance.new("Attachment", Part)
            Attachment.Name = "Luscaa_BlackHoleAttachment"

            t2.value1.Heartbeat:Connect(function()
                Part.CFrame = HumanoidRootPart.CFrame
            end)

            local t11 = {}

            local function v166(p8)
                local v196 = not p8:IsA("BasePart")
                if not v196 then
                    v196 = p8.Anchored
                    if not v196 then
                        v196 = not string.find(p8.Name, "Door")
                    end
                end
                if v196 then return end

                if p8:FindFirstChild("Luscaa_Attached") then return end

                p8.CanCollide = false

                local GetChildren = p8.GetChildren
                for _, v in ipairs(GetChildren(p8)) do
                    local v200 = v:IsA("AlignPosition")
                    if not v200 then
                        v200 = v:IsA("Torque")
                        if not v200 then
                            v200 = v:IsA("Attachment")
                        end
                    end
                    if v200 then
                        v:Destroy()
                    end
                end

                Instance.new("BoolValue", p8).Name = "Luscaa_Attached"

                local Attachment2 = Instance.new("Attachment", p8)
                local AlignPosition = Instance.new("AlignPosition", p8)

                AlignPosition.Attachment0 = Attachment2
                AlignPosition.Attachment1 = Attachment
                AlignPosition.MaxForce = 1E+20
                AlignPosition.MaxVelocity = 1e999
                AlignPosition.Responsiveness = 99999

                local Torque = Instance.new("Torque", p8)
                Torque.Attachment0 = Attachment2
                Torque.RelativeTo = Enum.ActuatorRelativeTo.World
                Torque.Torque = Vector3.new(math.random(-1000000, 1000000) * 10000, math.random(-1000000, 1000000) * 10000, math.random(-1000000, 1000000) * 10000)

                table.insert(t11, {
                    Part = p8,
                    Align = AlignPosition
                })
            end

            for _, descendant in ipairs(Workspace:GetDescendants()) do
                local v169 = descendant:IsA("BasePart")
                if v169 then
                    v169 = string.find(descendant.Name, "Door")
                end
                if v169 then
                    v166(descendant)
                end
            end

            Workspace.DescendantAdded:Connect(function(descendant)
                local v205 = descendant:IsA("BasePart")
                if v205 then
                    v205 = string.find(descendant.Name, "Door")
                end
                if v205 then
                    v166(descendant)
                end
            end)

            local function v170(p9)
                local Character2 = p9.Character
                if not Character2 then return end

                local HumanoidRootPart6 = Character2:FindFirstChild("HumanoidRootPart")
                if not HumanoidRootPart6 then return end

                local SHNMAX_TargetAttachment = HumanoidRootPart6:FindFirstChild("SHNMAX_TargetAttachment")
                if not SHNMAX_TargetAttachment then
                    SHNMAX_TargetAttachment = Instance.new("Attachment", HumanoidRootPart6)
                    SHNMAX_TargetAttachment.Name = "SHNMAX_TargetAttachment"
                end

                for v212, v213 in ipairs(t11) do
                    if v213.Align then
                        v213.Align.Attachment1 = SHNMAX_TargetAttachment
                    end
                end

                local timestamp = tick()
                while tick() - timestamp < 5 and not (HumanoidRootPart6.Velocity.Magnitude >= 20) do
                    t2.value1.Heartbeat:Wait()
                end

                for _, v in ipairs(t11) do
                    if v.Align then
                        v.Align.Attachment1 = Attachment
                    end
                end
            end

            UserInputService.TouchTap:Connect(function(p10, p11)
                if p11 then return end

                local v219 = p10[1]
                local v220 = Workspace.CurrentCamera:ScreenPointToRay(v219.X, v219.Y)
                local raycastParams = RaycastParams.new()

                raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                raycastParams.FilterDescendantsInstances = {
                    v161,
                    Part
                }

                local raycastResult = Workspace:Raycast(v220.Origin, v220.Direction * 1000, raycastParams)

                if raycastResult and raycastResult.Instance then
                    local Model = raycastResult.Instance:FindFirstAncestorOfClass("Model")
                    if Model then
                        local player = t1.value1:GetPlayerFromCharacter(Model)
                        if player and player ~= t1.value3 then
                            v170(player)
                        end
                    end
                end
            end)
        end
    })

    -- ============================================
    -- 🎵 TAB DE MÚSICA (ESTILO SLAYER HUB)
    -- ============================================

    local musicTab = v43:MakeTab({
        Title = "🎵 Music",
        Icon = "rbxassetid://439595043"
    })

    -- Lista de músicas por gênero
    local musicDatabase = {
        Forro = {
            {name = "Forró - Baião", id = "rbxassetid://18454319782"},
            {name = "Forró - Xote", id = "rbxassetid://18454319783"},
            {name = "Sertanejo - Modão", id = "rbxassetid://18454319784"},
            {name = "Sertanejo - Universitário", id = "rbxassetid://18454319785"},
        },
        Trap = {
            {name = "Trap - Bass", id = "rbxassetid://18454319786"},
            {name = "Trap - 808", id = "rbxassetid://18454319787"},
            {name = "Trap - Dark", id = "rbxassetid://18454319788"},
            {name = "Trap - Melodic", id = "rbxassetid://18454319789"},
        },
        Memes = {
            {name = "Meme 1 - Among Us", id = "rbxassetid://18454319790"},
            {name = "Meme 2 - Skibidi", id = "rbxassetid://18454319791"},
            {name = "Meme 3 - Sigma", id = "rbxassetid://18454319792"},
            {name = "Meme 4 - Brainrot", id = "rbxassetid://18454319793"},
        },
        Funk = {
            {name = "Funk - RJ", id = "rbxassetid://18454319794"},
            {name = "Funk - SP", id = "rbxassetid://18454319795"},
            {name = "Funk - BH", id = "rbxassetid://18454319796"},
            {name = "Funk - Automotivo", id = "rbxassetid://18454319797"},
        },
        Phonk = {
            {name = "Phonk - Midnight", id = "rbxassetid://18454319798"},
            {name = "Phonk - Brazil", id = "rbxassetid://18454319799"},
            {name = "Phonk - Drift", id = "rbxassetid://18454319800"},
            {name = "Phonk - Ghost", id = "rbxassetid://18454319801"},
        }
    }

    -- Variáveis do player de música
    local currentMusicPlayer = nil
    local isMusicPlaying = false
    local currentMusicName = "Nenhuma"
    local musicVolume = 0.5
    local allMusicList = {}

    -- Criar lista completa de todas as músicas
    for genre, songs in pairs(musicDatabase) do
        for _, song in ipairs(songs) do
            table.insert(allMusicList, song.name)
        end
    end

    -- Função para tocar música
    local function playMusic(songName)
        if currentMusicPlayer then
            currentMusicPlayer:Stop()
            currentMusicPlayer:Destroy()
            currentMusicPlayer = nil
        end

        if not songName or songName == "" then
            currentMusicName = "Nenhuma"
            isMusicPlaying = false
            updateMusicUI()
            return
        end

        local songId = nil
        for genre, songs in pairs(musicDatabase) do
            for _, song in ipairs(songs) do
                if song.name == songName then
                    songId = song.id
                    break
                end
            end
            if songId then break end
        end

        if not songId then
            warn("Música não encontrada: " .. songName)
            return
        end

        currentMusicPlayer = Instance.new("Sound")
        currentMusicPlayer.SoundId = songId
        currentMusicPlayer.Volume = musicVolume
        currentMusicPlayer.Looped = true
        currentMusicPlayer.Name = "MusicPlayer"
        currentMusicPlayer.Parent = game:GetService("SoundService")

        currentMusicPlayer:Play()
        isMusicPlaying = true
        currentMusicName = songName
        updateMusicUI()
    end

    -- Função para parar música
    local function stopMusic()
        if currentMusicPlayer then
            currentMusicPlayer:Stop()
            currentMusicPlayer:Destroy()
            currentMusicPlayer = nil
        end
        isMusicPlaying = false
        currentMusicName = "Nenhuma"
        updateMusicUI()
    end

    -- Função para tocar todas as músicas
    local function playAllMusic()
        if #allMusicList == 0 then return end

        local currentIndex = 1

        local function playNext()
            if currentIndex > #allMusicList then
                currentIndex = 1
            end
            local songName = allMusicList[currentIndex]
            playMusic(songName)
            currentIndex = currentIndex + 1

            if currentMusicPlayer then
                currentMusicPlayer.Stopped:Connect(function()
                    if isMusicPlaying then
                        playNext()
                    end
                end)
            end
        end

        playNext()
    end

    -- Função para tocar por gênero
    local function playGenre(genreName)
        local songs = musicDatabase[genreName]
        if not songs or #songs == 0 then return end

        local currentIndex = 1
        local function playNextGenre()
            if currentIndex > #songs then
                currentIndex = 1
            end
            local song = songs[currentIndex]
            playMusic(song.name)
            currentIndex = currentIndex + 1

            if currentMusicPlayer then
                currentMusicPlayer.Stopped:Connect(function()
                    if isMusicPlaying then
                        playNextGenre()
                    end
                end)
            end
        end
        playNextGenre()
    end

    -- Função para atualizar UI da música
    function updateMusicUI()
        for _, child in ipairs(musicTab:GetChildren()) do
            if child:IsA("TextLabel") and child.Name == "CurrentMusicLabel" then
                child.Text = "🎵 " .. currentMusicName
            end
            if child:IsA("TextLabel") and child.Name == "StatusMusicLabel" then
                local status = isMusicPlaying and "▶️ Tocando" or "⏸️ Pausado"
                child.Text = "Status: " .. status
            end
        end
    end

    -- ============================================
    -- UI DA TAB DE MÚSICA
    -- ============================================

    musicTab:AddSection({ Name = "🎵 Player de Música" })

    -- Label da música atual
    musicTab:AddLabel("🎵 Música Atual: Nenhuma")

    -- Campo para ID customizado
    musicTab:AddInput({
        Name = "🎵 ID da música",
        Placeholder = "Cole o ID (ex: rbxassetid://123)",
        Callback = function(input)
            if input and input ~= "" then
                if currentMusicPlayer then
                    currentMusicPlayer:Stop()
                    currentMusicPlayer:Destroy()
                    currentMusicPlayer = nil
                end

                currentMusicPlayer = Instance.new("Sound")
                currentMusicPlayer.SoundId = input
                currentMusicPlayer.Volume = musicVolume
                currentMusicPlayer.Looped = true
                currentMusicPlayer.Name = "MusicPlayer"
                currentMusicPlayer.Parent = game:GetService("SoundService")
                currentMusicPlayer:Play()
                isMusicPlaying = true
                currentMusicName = "Custom"
                updateMusicUI()
            end
        end
    })

    -- ============================================
    -- SEÇÕES DE GÊNEROS
    -- ============================================

    -- Forró e Sertanejo
    musicTab:AddSection({ Name = "🎵 Forró e Sertanejo" })
    for _, song in ipairs(musicDatabase.Forro) do
        musicTab:AddButton({
            Name = "▶ " .. song.name,
            Callback = function()
                playMusic(song.name)
            end
        })
    end

    -- Trap
    musicTab:AddSection({ Name = "🎵 Trap" })
    for _, song in ipairs(musicDatabase.Trap) do
        musicTab:AddButton({
            Name = "▶ " .. song.name,
            Callback = function()
                playMusic(song.name)
            end
        })
    end

    -- Memes Aleatórios
    musicTab:AddSection({ Name = "🎵 Memes Aleatórios" })
    for _, song in ipairs(musicDatabase.Memes) do
        musicTab:AddButton({
            Name = "▶ " .. song.name,
            Callback = function()
                playMusic(song.name)
            end
        })
    end

    -- Funk
    musicTab:AddSection({ Name = "🎵 Funk" })
    for _, song in ipairs(musicDatabase.Funk) do
        musicTab:AddButton({
            Name = "▶ " .. song.name,
            Callback = function()
                playMusic(song.name)
            end
        })
    end

    -- Phonk
    musicTab:AddSection({ Name = "🎵 Phonk" })
    for _, song in ipairs(musicDatabase.Phonk) do
        musicTab:AddButton({
            Name = "▶ " .. song.name,
            Callback = function()
                playMusic(song.name)
            end
        })
    end

    -- ============================================
    -- CONTROLES DA MÚSICA
    -- ============================================

    musicTab:AddSection({ Name = "🎛️ Controles" })

    musicTab:AddButton({
        Name = "⏹ Stop",
        Callback = function()
            stopMusic()
        end
    })

    musicTab:AddButton({
        Name = "🎵 ALL MUSIC",
        Callback = function()
            playAllMusic()
        end
    })

    musicTab:AddSlider({
        Name = "🔊 Volume",
        Default = 50,
        Min = 0,
        Max = 100,
        Callback = function(value)
            musicVolume = value / 100
            if currentMusicPlayer then
                currentMusicPlayer.Volume = musicVolume
            end
        end
    })

    -- ============================================
    -- BOTÕES PARA TOCAR POR GÊNERO
    -- ============================================

    musicTab:AddSection({ Name = "🎵 Tocar Gênero" })

    musicTab:AddButton({
        Name = "🎵 Tocar Forró",
        Callback = function()
            playGenre("Forro")
        end
    })

    musicTab:AddButton({
        Name = "🎵 Tocar Trap",
        Callback = function()
            playGenre("Trap")
        end
    })

    musicTab:AddButton({
        Name = "🎵 Tocar Memes",
        Callback = function()
            playGenre("Memes")
        end
    })

    musicTab:AddButton({
        Name = "🎵 Tocar Funk",
        Callback = function()
            playGenre("Funk")
        end
    })

    musicTab:AddButton({
        Name = "🎵 Tocar Phonk",
        Callback = function()
            playGenre("Phonk")
        end
    })

    -- ============================================
    -- INFORMAÇÕES DA MÚSICA
    -- ============================================

    musicTab:AddSection({ Name = "📋 Informações" })

    musicTab:AddLabel("🎵 Status: Pronto")

    musicTab:AddParagraph({
        "🎵 Música não foi?",
        "nos informe no discord."
    })

end -- FIM DA FUNÇÃO v11

-- ============================================
-- LOADING E INICIALIZAÇÃO
-- ============================================

task.spawn(function()
    local n2 = 1

    local function v67(p12, p13)  
        local uDim2 = UDim2.new(p12 / 100, 0, 1, 0)  
        t1.value14.Text = tostring(p12) .. "%"  
        local v174 = t1.value2:Create(t1.value12, TweenInfo.new(p13 or 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {  
            Size = uDim2  
        })  
        v174:Play()  
        return v174  
    end  

    while n2 <= 100 do  
        if n2 < 15 then  
            t1.value16 = "Inicializando Interface"  
        elseif n2 < 30 then  
            t1.value16 = "Carregando Recursos"  
        elseif n2 < 34 then  
            t1.value16 = "Verificando Sistema"  
        elseif n2 == 34 then  
            t1.value16 = "Otimizando Desempenho"  
            v67(34, 0.2)  
            task.wait(2)  
            t1.value16 = "Sincronizando Dados"  
            task.wait(2)  
            n2 = 35  
        elseif n2 < 55 then  
            t1.value16 = "Aplicando Configurações"  
        elseif n2 < 75 then  
            t1.value16 = "Preparando Scripts"  
        elseif n2 < 90 then  
            t1.value16 = "Quase Pronto"  
        elseif n2 < 100 then  
            t1.value16 = "Finalizando"  
        end  

        if n2 ~= 34 then  
            v67(n2, 0.08)  
            n2 = n2 + 1  
            task.wait(math.random(20, 60) / 1000)  
        end  
    end  

    v67(100, 0.2)  
    t1.value15.Text = "Carregamento Concluído! Bem-vindo ao Pulsar Hub."  
    t1.value14.Text = "100%"  

    local value2 = t1.value2  
    local value11 = t1.value11  
    local tweenInfo = TweenInfo.new(0.4)  
    local fromRGB = Color3.fromRGB  
    local Create = value2.Create  
    local v73 = fromRGB(255, 255, 255)  

    Create(value2, value11, tweenInfo, {  
        Thickness = 4,  
        Color = v73  
    }):Play()  

    local Frame3 = Instance.new("Frame")  
    Frame3.Size = UDim2.new(1, 0, 1, 0)  
    Frame3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  
    Frame3.BackgroundTransparency = 0.85  
    Frame3.BorderSizePixel = 0  
    Frame3.ZIndex = 99999999  
    Frame3.Parent = t1.value6  

    t1.value2:Create(Frame3, TweenInfo.new(0.6), {  
        BackgroundTransparency = 1  
    }):Play()  

    task.delay(0.6, function()  
        Frame3:Destroy()  
    end)  

    task.wait(1)  

    t1.value2:Create(t1.value17, TweenInfo.new(1.2), {  
        Volume = 0  
    }):Play()  

    for _, descendant in ipairs(t1.value6:GetDescendants()) do  
        if descendant:IsA("TextLabel") then  
            t1.value2:Create(descendant, TweenInfo.new(0.8), {  
                TextTransparency = 1,  
                TextStrokeTransparency = 1  
            }):Play()  
        elseif descendant:IsA("UIStroke") then  
            t1.value2:Create(descendant, TweenInfo.new(0.8), {  
                Transparency = 1  
            }):Play()  
        elseif descendant:IsA("Frame") then  
            t1.value2:Create(descendant, TweenInfo.new(0.8), {  
                BackgroundTransparency = 1  
            }):Play()  
        elseif descendant:IsA("ImageLabel") then  
            t1.value2:Create(descendant, TweenInfo.new(0.8), {  
                ImageTransparency = 1,  
                BackgroundTransparency = 1  
            }):Play()  
        end  
    end  

    local v77 = t1.value2:Create(t1.value6, TweenInfo.new(1, Enum.EasingStyle.Quad), {  
        BackgroundTransparency = 1  
    })  

    v77:Play()  
    v77.Completed:Connect(function()  
        t1.value17:Stop()  
        t1.value17:Destroy()  
        t1.value5:Destroy()  
        v11()  
    end)  
end)

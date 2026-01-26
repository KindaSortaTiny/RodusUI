local function CreateMain(title)
    local destroyIfExist = game.CoreGui:GetChildren()
    for index, destroyIfExist in pairs(destroyIfExist) do
        if destroyIfExist.Name == title then
            print("Destroyed "..tostring(title)..": Already existed")
            destroyIfExist:Destroy()
        end
    end
    local Rodus = Instance.new("ScreenGui")
    local Top = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Container = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Minimize = Instance.new("TextButton")

    Rodus.Name = tostring(title)
    Rodus.Parent = game:WaitForChild("CoreGui")
    Rodus.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Top.Name = "Top"
    Top.Parent = Rodus
    Top.BackgroundColor3 = Color3.fromRGB(20, 20, 20) 
    Top.BackgroundTransparency = 0.000 
    Top.BorderColor3 = Color3.fromRGB(40, 40, 40) 
    Top.BorderSizePixel = 2
    Top.Position = UDim2.new(0, 15, 0, 15)
    Top.Size = UDim2.new(0, 193, 0, 27)
    Top.Draggable = true

    Title.Name = "Title"
    Title.Parent = Top
    Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25) 
    Title.BackgroundTransparency = 0.000 
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(0, 193, 0, 27)
    Title.Font = Enum.Font.JosefinSans
    Title.Text = " "..title
    Title.TextColor3 = Color3.fromRGB(189, 147, 249) -- Lilac
    Title.TextSize = 14.000
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Active = true 

    Container.Name = "Container"
    Container.Parent = Top
    Container.BackgroundColor3 = Color3.fromRGB(20, 20, 20) 
    Container.BackgroundTransparency = 0.000 
    Container.BorderColor3 = Color3.fromRGB(40, 40, 40) 
    Container.BorderSizePixel = 2
    Container.Position = UDim2.new(0, 0, 1.29629624, 0)
    Container.Size = UDim2.new(0, 193, 0, 24)

    UIListLayout.Parent = Container
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    Minimize.Name = "Minimize"
    Minimize.Parent = Top
    Minimize.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Minimize.BackgroundTransparency = 1.000
    Minimize.Position = UDim2.new(0.906735778, 0, 0.185185179, 0)
    Minimize.Size = UDim2.new(0, 18, 0, 17)
    Minimize.Font = Enum.Font.SourceSans
    Minimize.Text = "-"
    Minimize.TextColor3 = Color3.fromRGB(255,255,255)
    Minimize.TextSize = 14.000
    Minimize.ZIndex = 2
    
    tog_gled = false
    Minimize.MouseButton1Down:Connect(function()
        tog_gled = not tog_gled
        if tog_gled then 
            Minimize.Text = "+" 
            Container.Visible = false 
        else 
            Minimize.Text = "-" 
            Container.Visible = true 
        end
    end)
    
    function onKeyPress(inputObject, gameProcessedEvent)
        if inputObject.KeyCode == Enum.KeyCode.LeftControl then
            if Rodus.Enabled then
                Rodus.Enabled = false
            else
                Rodus.Enabled = true
            end
        end
    end

    game:GetService("UserInputService").InputBegan:connect(onKeyPress)
    
    function CreateTab(text)
        local Tab = Instance.new("TextButton")
        local Arrow = Instance.new("TextLabel")
        Tab.Name = text
        Tab.Parent = Container
        Tab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Tab.BackgroundTransparency = 1.000
        Tab.Size = UDim2.new(0, 193, 0, 24)
        Tab.Font = Enum.Font.JosefinSans
        Tab.Text = " "..text
        Tab.TextColor3 = Color3.fromRGB(255,255,255)
        Tab.TextSize = 14.000
        Tab.TextXAlignment = Enum.TextXAlignment.Left

        Arrow.Name = "Arrow"
        Arrow.Parent = Tab
        Arrow.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Arrow.BackgroundTransparency = 1.000
        Arrow.Position = UDim2.new(0.907, 0, 0, 0)
        Arrow.Size = UDim2.new(0, 18, 0, 21)
        Arrow.Font = Enum.Font.SourceSans
        Arrow.Text = ">>"
        Arrow.TextColor3 = Color3.fromRGB(255,255,255)
        Arrow.TextScaled = true
        Arrow.TextSize = 14.000
        Arrow.TextWrapped = true
        
        Container.Size = UDim2.new(0, UIListLayout.AbsoluteContentSize.X, 0, UIListLayout.AbsoluteContentSize.Y)
        
        local TabContainer = Instance.new("Frame")
        TabContainer.Name = "TabContainer"
        TabContainer.Parent = Tab
        TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20) 
        TabContainer.BackgroundTransparency = 0.000 
        TabContainer.BorderColor3 = Color3.fromRGB(40, 40, 40) 
        TabContainer.BorderSizePixel = 2
        TabContainer.Position = UDim2.new(1.0569948, 0, 0, 0)
        TabContainer.Visible = false
        Tab.MouseButton1Down:Connect(function()
            if TabContainer.Visible == false then
                local allTabs = TabContainer.Parent.Parent:GetDescendants()
                for index, allTabs in pairs(allTabs) do
                    if allTabs.Name == "TabContainer" then
                        allTabs.Visible = false
                        allTabs.Parent.TextColor3 = Color3.new(1, 1, 1)
                        allTabs.Parent.Arrow.TextColor3 = Color3.new(1, 1, 1)
                    end
                end
                TabContainer.Visible = true
                Tab.TextColor3 = Color3.fromRGB(189, 147, 249) 
                Tab.Arrow.TextColor3 = Color3.fromRGB(189, 147, 249) 
            else 
                TabContainer.Visible = false
                Tab.TextColor3 = Color3.new(1, 1, 1)
                Tab.Arrow.TextColor3 = Color3.new(1, 1, 1)
            end
        end)
        local UIListLayout2 = Instance.new("UIListLayout")
        UIListLayout2.Parent = TabContainer
        UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
        
        function CreateButton(parent, buttonText, callback)
            local Button = Instance.new("TextButton")

            Button.Name = buttonText
            Button.Parent = parent.TabContainer
            Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Button.BackgroundTransparency = 1.000
            Button.Size = UDim2.new(0, 193, 0, 24)
            Button.Font = Enum.Font.JosefinSans
            Button.Text = "[ "..buttonText.." ]"
            Button.TextColor3 = Color3.fromRGB(255,255,255)
            Button.TextSize = 14.000
            Button.TextXAlignment = Enum.TextXAlignment.Left
            Button.MouseButton1Down:Connect(function()
                Button.TextColor3 = Color3.fromRGB(189, 147, 249) 
                wait(0.05)
                Button.TextColor3 = Color3.new(1, 1, 1)
                pcall(callback)
            end)
            
            parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
        end
        
        function CreateLabel(parent, labelText, color3)
            local Label = Instance.new("TextLabel")

            Label.Name = labelText
            Label.Parent = parent.TabContainer
            Label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Label.BackgroundTransparency = 1.000
            Label.Size = UDim2.new(0, 193, 0, 24)
            Label.Font = Enum.Font.JosefinSans
            Label.Text = " "..labelText
            Label.TextColor3 = Color3.fromRGB(110, 110, 110) 
            Label.TextSize = 14.000
            Label.TextXAlignment = Enum.TextXAlignment.Left
            
            parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
        end
        
        function CreateToggle(parent, buttonText, callback)
            local Button = Instance.new("TextButton")
            local Toggle = Instance.new("BoolValue")
            
            Button.Name = buttonText
            Button.Parent = parent.TabContainer
            Toggle.Parent = Button
            Toggle.Name = "Toggled"
            Toggle.Value = false
            Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Button.BackgroundTransparency = 1.000
            Button.Size = UDim2.new(0, 193, 0, 24)
            Button.Font = Enum.Font.JosefinSans
            Button.Text = "[ ] "..buttonText
            Button.TextColor3 = Color3.fromRGB(255,255,255)
            Button.TextSize = 14.000
            Button.TextXAlignment = Enum.TextXAlignment.Left
            Button.MouseButton1Down:Connect(function()
                Toggle.Value = not Toggle.Value
                if Toggle.Value then
                    Button.TextColor3 = Color3.fromRGB(189, 147, 249) 
                    Button.Text = "[X] "..buttonText
                else 
                    Button.TextColor3 = Color3.new(1, 1, 1)
                    Button.Text = "[ ] "..buttonText
                end
                pcall(callback)
            end)
            
            parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
        end
        
        function CreateSideDropButton(parent, dropText, list, callback)
            local SideDrop = Instance.new("TextButton")
            local DropContainer = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")

            SideDrop.Name = dropText
            SideDrop.Parent = parent.TabContainer
            SideDrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            SideDrop.BackgroundTransparency = 1.000
            SideDrop.Size = UDim2.new(0, 193, 0, 24)
            SideDrop.Font = Enum.Font.JosefinSans
            SideDrop.Text = ">> "..dropText
            SideDrop.TextColor3 = Color3.fromRGB(255,255,255)
            SideDrop.TextSize = 14.000
            SideDrop.TextXAlignment = Enum.TextXAlignment.Left
            SideDrop.MouseButton1Down:Connect(function()
                if SideDrop.TextColor3 == Color3.fromRGB(189, 147, 249) then
                    SideDrop.TextColor3 = Color3.new(1, 1, 1)
                    DropContainer.Visible = false
                else 
                    local allTabs = game.CoreGui[title].Top.Container:GetDescendants()
                    for index, allTabs in pairs(allTabs) do
                        if allTabs.Name == "DropContainer" then
                            allTabs.Visible = false
                            allTabs.Parent.TextColor3 = Color3.new(1, 1, 1)
                        end
                    end
                    SideDrop.TextColor3 = Color3.fromRGB(189, 147, 249) 
                    DropContainer.Visible = true
                end
            end)

            DropContainer.Name = "DropContainer"
            DropContainer.Parent = SideDrop
            DropContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20) 
            DropContainer.BackgroundTransparency = 0.000 
            DropContainer.BorderColor3 = Color3.fromRGB(40, 40, 40) 
            DropContainer.BorderSizePixel = 2
            DropContainer.Position = UDim2.new(1.08290148, 0, 0, 0)
            DropContainer.Size = UDim2.new(0, 193, 0, 72)
            DropContainer.Visible = false

            UIListLayout.Parent = DropContainer
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            
            for i,v in next, list do
                local Button = Instance.new("TextButton")
                Button.Name = v
                Button.Parent = SideDrop.DropContainer
                Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Button.BackgroundTransparency = 1.000
                Button.Size = UDim2.new(0, 193, 0, 24)
                Button.Font = Enum.Font.JosefinSans
                Button.Text = " "..v
                Button.TextColor3 = Color3.fromRGB(255,255,255)
                Button.TextSize = 14.000
                Button.TextXAlignment = Enum.TextXAlignment.Left
                Button.MouseButton1Down:Connect(function()
                    Button.TextColor3 = Color3.fromRGB(189, 147, 249) 
                    wait(0.05)
                    Button.TextColor3 = Color3.new(1, 1, 1)
                    callback(v)
                end)
                DropContainer.Size = UDim2.new(0, DropContainer.UIListLayout.AbsoluteContentSize.X, 0, DropContainer.UIListLayout.AbsoluteContentSize.Y)
                parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
            end
        end
        
        function CreateSideDropToggle(parent, dropText, list, callback)
            local SideDrop = Instance.new("TextButton")
            local DropContainer = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")

            SideDrop.Name = dropText
            SideDrop.Parent = parent.TabContainer
            SideDrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            SideDrop.BackgroundTransparency = 1.000
            SideDrop.Size = UDim2.new(0, 193, 0, 24)
            SideDrop.Font = Enum.Font.JosefinSans
            SideDrop.Text = ">> "..dropText
            SideDrop.TextColor3 = Color3.fromRGB(255,255,255)
            SideDrop.TextSize = 14.000
            SideDrop.TextXAlignment = Enum.TextXAlignment.Left
            SideDrop.MouseButton1Down:Connect(function()
                if SideDrop.TextColor3 == Color3.fromRGB(189, 147, 249) then
                    SideDrop.TextColor3 = Color3.new(1, 1, 1)
                    DropContainer.Visible = false
                else 
                    local allTabs = game.CoreGui[title].Top.Container:GetDescendants()
                    for index, allTabs in pairs(allTabs) do
                        if allTabs.Name == "DropContainer" then
                            allTabs.Visible = false
                            allTabs.Parent.TextColor3 = Color3.new(1, 1, 1)
                        end
                    end
                    SideDrop.TextColor3 = Color3.fromRGB(189, 147, 249) 
                    DropContainer.Visible = true
                end
            end)

            DropContainer.Name = "DropContainer"
            DropContainer.Parent = SideDrop
            DropContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20) 
            DropContainer.BackgroundTransparency = 0.000 
            DropContainer.BorderColor3 = Color3.fromRGB(40, 40, 40) 
            DropContainer.BorderSizePixel = 2
            DropContainer.Position = UDim2.new(1.08290148, 0, 0, 0)
            DropContainer.Size = UDim2.new(0, 193, 0, 72)
            DropContainer.Visible = false

            UIListLayout.Parent = DropContainer
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

            for i,v in next, list do
                local Button = Instance.new("TextButton")
                Button.Name = v
                Button.Parent = SideDrop.DropContainer
                Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Button.BackgroundTransparency = 1.000
                Button.Size = UDim2.new(0, 193, 0, 24)
                Button.Font = Enum.Font.JosefinSans
                Button.Text = " "..v
                Button.TextColor3 = Color3.fromRGB(255,255,255)
                Button.TextSize = 14.000
                Button.TextXAlignment = Enum.TextXAlignment.Left
                Button.MouseButton1Down:Connect(function()
                    if Button.TextColor3 == Color3.fromRGB(189, 147, 249) then
                    Button.TextColor3 = Color3.new(1, 1, 1)
                    else Button.TextColor3 = Color3.fromRGB(189, 147, 249) end 
                    callback(v)
                end)
                DropContainer.Size = UDim2.new(0, DropContainer.UIListLayout.AbsoluteContentSize.X, 0, DropContainer.UIListLayout.AbsoluteContentSize.Y)
                parent.TabContainer.Size = UDim2.new(0, parent.TabContainer.UIListLayout.AbsoluteContentSize.X, 0, parent.TabContainer.UIListLayout.AbsoluteContentSize.Y)
            end
        end
        
        return {
            Tab = Tab,
            TabContainer = TabContainer,
            CreateButton = CreateButton,
            CreateLabel = CreateLabel,
            CreateToggle = CreateToggle,
            CreateSideDropButton = CreateSideDropButton,
            CreateSideDropToggle = CreateSideDropToggle
        }
    end
    
    return {
        CreateTab = CreateTab
    }
end

return CreateMain
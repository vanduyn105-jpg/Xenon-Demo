loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhDangNhoEm/TuanAnhIOS/refs/heads/main/koby"))()
local Services = setmetatable({}, {__index = function(self, serviceName)
    local service = game:GetService(serviceName)
    rawset(self, serviceName, service)
    return service
end})
local thauan_Hub___Farm_Settings_json = "Thauan Hub | Farm/Settings.json"
if makefolder and not isfolder("Thauan Hub | Farm") then
    makefolder("Thauan Hub | Farm")
end
_G.SaveData = _G.SaveData or {}
function SaveSettings()
    return pcall(function()
    local json = Services.HttpService:JSONEncode(_G.SaveData)
    writefile(thauan_Hub___Farm_Settings_json, json)
end)
end
function LoadSettings()
    local success, _GSaveData = pcall(function()
    local content = readfile(thauan_Hub___Farm_Settings_json)
    return Services.HttpService:JSONDecode(content)
end)
    if success and _GSaveData then
        _G.SaveData = _GSaveData
        return true
    end
    return false
end
function GetSetting(name, default)
    return _G.SaveData[name] ~= nil and _G.SaveData[name] or default
end
LoadSettings()
local players = Services.Players
local collectionService = Services.CollectionService
local replicatedStorage = Services.ReplicatedStorage
local player = Services.Players.LocalPlayer
local commE = Services.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommE")
_G.AutoKen = true
local function HasKen()
    return Services.Players.LocalPlayer.Character and Services.CollectionService:HasTag(Services.Players.LocalPlayer.Character, "Ken")
end
task.spawn(function()
    while true do
        task.wait(0.2)
        if not HasKen() then
            pcall(function()
    commE:FireServer("Ken", true)
end)
        end
    end
end)
if not Services.Players.LocalPlayer.Team or Services.Players.LocalPlayer.Team.Name ~= "Marines" then
    pcall(function()
    Services.ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
end)
end
local lighting = Services.Lighting
Services.Lighting.Ambient = Color3.new(0.695, 0.695, 0.695)
Services.Lighting.ColorShift_Bottom = Color3.new(0.695, 0.695, 0.695)
Services.Lighting.ColorShift_Top = Color3.new(0.695, 0.695, 0.695)
Services.Lighting.Brightness = 2
Services.Lighting.FogEnd = 10000000000
do
    ply = Services.Players
    plr = Services.Players.LocalPlayer
    Root = Services.Players.LocalPlayer.Character.HumanoidRootPart
    replicated = Services.ReplicatedStorage
    Lv = Services.Players.LocalPlayer.Data.Level.Value
    TeleportService = Services.TeleportService
    TW = Services.TweenService
    Services.Lighting = Services.Lighting
    Enemies = workspace.Enemies
    vim1 = Services.VirtualInputManager
    vim2 = Services.VirtualUser
    TeamSelf = Services.Players.LocalPlayer.Team
    RunSer = Services.RunService
    Stats = Services.Stats
    Energy = Services.Players.LocalPlayer.Character.Energy.Value
    Boss = {}
    BringConnections = {}
    MaterialList = {}
    NPCList = {}
    shouldTween = false
    SoulGuitar = false
    KenTest = true
    debug = false
    Brazier1 = false
    Brazier2 = false
    Brazier3 = false
    Sec = 0.1
    ClickState = 0
    Num_self = 25
end
repeat
    local main = plr.PlayerGui:FindFirstChild("Main")
    main = main and main:FindFirstChild("Loading")
    task.wait()
until game:IsLoaded() and not (loading and loading.Visible)
if game.PlaceId == 2753915549 or game.PlaceId == 85211729168715 then
    World1 = true
elseif game.PlaceId == 4442272183 or game.PlaceId == 79091703265657 then
    World2 = true
elseif game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
    World3 = true
else
    plr:Kick("❌ Error Blox Fruits - World not recognized")
end
Sea = World1 or World2 or World3
Marines = function()
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
end
Pirates = function()
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
end
if World1 then
    Boss = {"The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader", "Vice Admiral", "Saber Expert", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Ice Admiral", "Greybeard"}
elseif World2 then
    Boss = {"Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Darkbeard", "Cursed Captain", "Order"}
elseif World3 then
    Boss = {"Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Cake Queen", "Longma", "Soul Reaper"}
end
if World1 then
    MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail"}
elseif World2 then
    MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang"}
elseif World3 then
    MaterialList = {"Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk"}
end
EquipWeapon = function(param1)
    if plr.Backpack:FindFirstChild(param1) then
        plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(param1))
    end
end
weaponSc = function(param2)
    for value1, value2 in pairs(plr.Backpack:GetChildren()) do
        if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Tool") then
            if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).ToolTip == param2 then
                EquipWeapon(({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Name)
            end
        end
    end
end
hookfunction(require(game:GetService "Effect".Container.Death), function()
end)
hookfunction(require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule")).ChangeDisplayedNPC, function()
end)
hookfunction(error, function()
end)
hookfunction(warn, function()
end)
local rocks = workspace:FindFirstChild("Rocks")
if rocks then
    rocks:Destroy()
end
gay = (function()
    local cFrame = game:GetService("Lighting")
    cFrame:FindFirstChild("LightingLayers")
    local value3 = workspace._WorldOrigin["Foam;"]
    if {"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"} and workspace._WorldOrigin["Foam;"] then
        ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):Destroy()
    end
end)()
local items1 = {}
;({}).__index = {}
;({}).Alive = function(param3)
    param3:FindFirstChild("Humanoid")
    return {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} and ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Health > 0
end
;({}).Pos = function(param4, param5)
    return (Root.Position - mode.Position).Magnitude <= {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}
end
;({}).Dist = function(param6, param7)
    return (Root.Position - param6:FindFirstChild "Position").Magnitude <= {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}
end
;({}).DistH = function(param8, param9)
    return (Root.Position - param8:FindFirstChild "Position").Magnitude > {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}
end
_G.MobHeight = _G.MobHeight or 20
;({}).Kill = function(param10, param11)
    local humanoidRootPart = param10:FindFirstChild("HumanoidRootPart")
    if not param10:GetAttribute("Locked") then
        param10:SetAttribute("Locked", humanoidRootPart.CFrame)
    end
    PosMon = param10:GetAttribute "Position"
    _B = true
    BringEnemy()
    EquipWeapon(_G.SelectWeapon)
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    _tp(humanoidRootPart.CFrame * CFrame.new(0, _G.MobHeight, 0))
end
;({}).Kill2 = function(param12, param13)
    if param12 and {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} then
        if not param12:GetAttribute("Locked") then
            param12:SetAttribute("Locked", param12.HumanoidRootPart.CFrame)
        end
        PosMon = param12:GetAttribute "Position"
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local value4 = ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).ToolTip
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).ToolTip == "Blox Fruit" then
            _tp(param12.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.new(0, math.rad(90), 0))
        else
            _tp(param12.HumanoidRootPart.CFrame * CFrame.new(0, 20, 8) * CFrame.new(0, math.rad(180), 0))
        end
        if RandomCFrame then
            wait(0.1)
            _tp(param12.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.1)
            _tp(param12.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
            wait(0.1)
            _tp(param12.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
            wait(0.1)
            _tp(param12.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.1)
            _tp(param12.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end
;({}).KillSea = function(param14, param15)
    if param14 and {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} then
        if not param14:GetAttribute("Locked") then
            param14:SetAttribute("Locked", param14.HumanoidRootPart.CFrame)
        end
        PosMon = param14:GetAttribute "Position"
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local value5 = ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).ToolTip
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).ToolTip == "Blox Fruit" then
            _tp(param14.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.new(0, math.rad(90), 0))
        else
            notween(param14.HumanoidRootPart.CFrame * CFrame.new(0, 50, 8))
            wait(0.85)
            notween(param14.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0))
            wait(1)
        end
    end
end
;({}).Sword = function(param16, param17)
    if param16 and {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} then
        if not param16:GetAttribute("Locked") then
            param16:SetAttribute("Locked", param16.HumanoidRootPart.CFrame)
        end
        PosMon = param16:GetAttribute "Position"
        BringEnemy()
        weaponSc("Sword")
        _tp(param16.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        if RandomCFrame then
            wait(0.1)
            _tp(param16.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.1)
            _tp(param16.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
            wait(0.1)
            _tp(param16.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
            wait(0.1)
            _tp(param16.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            wait(0.1)
            _tp(param16.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end
_G.FruitSkills = {Z = false, X = false, C = false, V = false, F = false}
UseFruitSkills = function()
    weaponSc("Blox Fruit")
    if _G.FruitSkills.Z then
        Useskills("Blox Fruit", "Z")
    end
    if _G.FruitSkills.X then
        Useskills("Blox Fruit", "X")
    end
    if _G.FruitSkills.C then
        Useskills("Blox Fruit", "C")
    end
    if _G.FruitSkills.V then
        Useskills("Blox Fruit", "V")
    end
    if _G.FruitSkills.F then
        vim1:SendKeyEvent(true, "F", false, game)
        vim1:SendKeyEvent(false, "F", false, game)
    end
end
;({}).Mas = function(param18, param19)
    if param18 and {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} then
        if not param18:GetAttribute("Locked") then
            param18:SetAttribute("Locked", param18.HumanoidRootPart.CFrame)
        end
        PosMon = param18:GetAttribute "Position"
        BringEnemy()
        if param18.Humanoid.Health <= HealthM then
            _tp(param18.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
            UseFruitSkills()
        else
            weaponSc("Melee")
            _tp(param18.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        end
    end
end
;({}).Masgun = function(param20, param21)
    if param20 and {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} then
        if not param20:GetAttribute("Locked") then
            param20:SetAttribute("Locked", param20.HumanoidRootPart.CFrame)
        end
        PosMon = param20:GetAttribute "Position"
        BringEnemy()
        if param20.Humanoid.Health <= HealthM then
            _tp(param20.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8))
            Useskills("Gun", "Z")
            Useskills("Gun", "X")
        else
            weaponSc("Melee")
            _tp(param20.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        end
    end
end
statsSetings = function(param22, param23)
    if param22 == "Melee" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Melee", {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"})
        end
    elseif param22 == "Defense" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Defense", {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"})
        end
    elseif param22 == "Sword" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Sword", {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"})
        end
    elseif param22 == "Gun" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Gun", {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"})
        end
    elseif param22 == "Devil" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"})
        end
    end
end
_G = _G or {}
_B = false
PosMon = nil
_G.BringRange = _G.BringRange or 235
_G.MaxBringMobs = _G.MaxBringMobs or 3
_G.FarmPriorityElf = _G.FarmPriorityElf or false
_G.FarmMastery_S = _G.FarmMastery_S or false
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.45, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local function FarmAtivo()
    return _G.StartFarm and (_G.Level or _G.AutoFarm_Bone or _G.AutoFarm_Cake or _G.FarmMastery_Dev or _G.FarmMastery_G or getgenv().AutoMaterial or _G.AutoTyrant or _G.SailBoat_Hydra or _G.WardenBoss or _G.AutoFactory or _G.HighestMirage or _G.HCM or _G.PGB or _G.Leviathan1 or _G.UPGDrago or _G.Complete_Trials or _G.TpDrago_Prehis or _G.BuyDrago or _G.AutoFireFlowers or _G.DT_Uzoth or _G.AutoBerry or _G.Prehis_Find or _G.Prehis_Skills or _G.Prehis_DB or _G.Prehis_DE or _G.FarmBlazeEM or _G.Dojoo or _G.CollectPresent or _G.AutoLawKak or _G.TpLab or _G.AutoPhoenixF or _G.AutoFarmChest or _G.AutoHytHallow or _G.LongsWord or _G.BlackSpikey or _G.AutoHolyTorch or _G.TrainDrago or _G.AutoSaber or _G.FarmMastery_Dev or _G.CitizenQuest or _G.AutoEctoplasm or _G.KeysRen or _G.Auto_Rainbow_Haki or _G.obsFarm or _G.AutoBigmom or _G.Doughv2 or _G.AuraBoss or _G.Raiding or _G.Auto_Cavender or _G.TpPly or _G.Bartilo_Quest or _G.Level or _G.FarmEliteHunt or _G.AutoZou or _G.AutoFarm_Bone or getgenv().AutoMaterial or _G.CraftVM or _G.FrozenTP or _G.TPDoor or _G.AcientOne or _G.AutoFarmNear or _G.AutoRaidCastle or _G.DarkBladev3 or _G.AutoFarmRaid or _G.Auto_Cake_Prince or _G.Addealer or _G.TPNpc or _G.TwinHook or _G.FindMirage or _G.FarmChestM or _G.Shark or _G.TerrorShark or _G.Piranha or _G.MobCrew or _G.SeaBeast1 or _G.FishBoat or _G.Auto or _G.AutoPoleV2 or _G.Auto_SuperHuman or _G.AutoDeathStep or _G.Auto_SharkMan_Karate or _G.Auto_Electric_Claw or _G.AutoDragonTalon or _G.Auto_Def_DarkCoat or _G.Auto_God_Human or _G.Auto_Tushita or _G.AutoMatSoul or _G.AutoKenVTWO or _G.AutoSerpentBow or _G.AutoFMon or _G.Auto_Soul_Guitar or _G.TPGEAR or _G.AutoSaw or _G.AutoTridentW2 or _G.Auto_StartRaid or _G.AutoEvoRace or _G.AutoGetQuestBounty or _G.MarinesCoat or _G.TravelDres or _G.Defeating or _G.DummyMan or _G.Auto_Yama or _G.Auto_SwanGG or _G.SwanCoat or _G.AutoEcBoss or _G.Auto_Mink or _G.Auto_Human or _G.Auto_Skypiea or _G.Auto_Fish or _G.CDK_TS or _G.CDK_YM or _G.CDK or _G.AutoFarmGodChalice or _G.AutoFistDarkness or _G.AutoMiror or _G.Teleport or _G.AutoKilo or _G.AutoGetUsoap or _G.Praying or _G.TryLucky or _G.AutoColShad or _G.AutoUnHaki or _G.Auto_DonAcces or _G.AutoRipIngay or _G.DragoV3 or _G.DragoV1 or _G.SailBoats or NextIs or _G.FarmGodChalice or _G.IceBossRen or senth or senth2 or _G.Lvthan or _G.beasthunter or _G.DangerLV or _G.Relic123 or _G.tweenKitsune or _G.Collect_Ember or _G.AutofindKitIs or _G.snaguine or _G.TwFruits or _G.tweenKitShrine or _G.Tp_LgS or _G.Tp_MasterA or _G.tweenShrine or _G.FarmMastery_G or _G.FarmMastery_S)
end
local function IsRaidMob(mob)
    mob.Name:lower()
    mob:FindFirstChild("Humanoid")
    return false
end
BringEnemy = function()
    local plr = game.Players.LocalPlayer
    local char = game.Players.LocalPlayer.Character
    local logicalResult = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    pcall(function()
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
end)
    local logicalResult1 = nil or logicalResult.Position
    local enemies = workspace.Enemies:GetChildren()
    local num = 0
    for _, mob in ipairs(enemies) do
        if num >= _G.MaxBringMobs then
            break
        end
        local humanoid = mob:FindFirstChild("Humanoid")
        local humanoidRootPart = mob:FindFirstChild("HumanoidRootPart")
        if humanoid and humanoidRootPart and humanoid.Health > 0 and not IsRaidMob(mob) then
            if (humanoidRootPart.Position - logicalResult1).Magnitude <= _G.BringRange and not humanoidRootPart:GetAttribute("Tweening") then
                num = num + 1
                humanoidRootPart:SetAttribute("Tweening", true)
                local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = CFrame.new(logicalResult1)})
                tween:Play()
                tween.Completed:Once(function()
    if humanoidRootPart then
        humanoidRootPart:SetAttribute("Tweening", false)
    end
end)
            end
        end
    end
end
task.spawn(function()
    while task.wait(1) do
        if FarmAtivo() then
            _B = true
            BringEnemy()
            task.wait(3)
            _B = false
            task.wait(5)
        else
            _B = false
            task.wait(1)
        end
    end
end)
Useskills = function(param24, param25)
    if param24 == "Melee" then
        weaponSc("Melee")
        if {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        elseif {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "C" then
            vim1:SendKeyEvent(true, "C", false, game)
            vim1:SendKeyEvent(false, "C", false, game)
        end
    elseif param24 == "Sword" then
        weaponSc("Sword")
        if {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        end
    elseif param24 == "Blox Fruit" then
        weaponSc("Blox Fruit")
        if {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        elseif {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "C" then
            vim1:SendKeyEvent(true, "C", false, game)
            vim1:SendKeyEvent(false, "C", false, game)
        elseif {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "V" then
            vim1:SendKeyEvent(true, "V", false, game)
            vim1:SendKeyEvent(false, "V", false, game)
        end
    elseif param24 == "Gun" then
        weaponSc("Gun")
        if {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        end
    end
    if param24 == "nil" and {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} == "Y" then
        vim1:SendKeyEvent(true, "Y", false, game)
        vim1:SendKeyEvent(false, "Y", false, game)
    end
end
local getrawmetatableResult1 = getrawmetatable(game)
local __namecall = getrawmetatableResult1.__namecall
setreadonly(getrawmetatableResult1, false)
getrawmetatableResult1.__namecall = newcclosure(function(...)
    getnamecallmethod()
    local items2 = {...}
    return getrawmetatableResult1.__namecall(...)
end)
GetConnectionEnemies = function(param26)
    for value6, value7 in pairs(replicated:GetChildren()) do
        if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Model") and (typeof(param26) == "table" and table.find(param26, ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Name) or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Name == param26) and ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):FindFirstChild("Humanoid") and ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Humanoid.Health > 0 then
            return {"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}
        end
    end
    for value8, value9 in next, game.Workspace.Enemies:GetChildren() do
        if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Model") and (typeof(param26) == "table" and table.find(param26, ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Name) or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Name == param26) and ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):FindFirstChild("Humanoid") and ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Humanoid.Health > 0 then
            return {"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}
        end
    end
end
LowCpu = function()
    local workspace = game.Workspace
    local value10 = game.Workspace.Terrain
    game.Workspace.Terrain.WaterWaveSize = 0
    game.Workspace.Terrain.WaterWaveSpeed = 0
    game.Workspace.Terrain.WaterReflectance = 0
    game.Workspace.Terrain.WaterTransparency = 0
    game.Lighting.GlobalShadows = false
    game.Lighting.FogEnd = 9000000000
    game.Lighting.Brightness = 1
    settings().Rendering.QualityLevel = "Level01"
    for value11, value12 in pairs(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):GetDescendants()) do
        if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Part") or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Union") or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("CornerWedgePart") or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("TrussPart") then
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Material = "Plastic"
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Reflectance = 0
        elseif ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Decal") or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Texture") and true then
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Transparency = 1
        elseif ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("ParticleEmitter") or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Trail") then
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Lifetime = NumberRange.new(0)
        elseif ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Explosion") then
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).BlastPressure = 1
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).BlastRadius = 1
        elseif ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Fire") or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("SpotLight") or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Smoke") or ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("Sparkles") then
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Enabled = false
        elseif ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):IsA("MeshPart") then
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Material = "Plastic"
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Reflectance = 0
            ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).TextureID = 10385902758728956
        end
    end
    for value13, value14 in pairs(game.Lighting:GetChildren()) do
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):IsA("BlurEffect") or ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):IsA("SunRaysEffect") or ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):IsA("ColorCorrectionEffect") or ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):IsA("BloomEffect") or ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):IsA("DepthOfFieldEffect") then
            ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Enabled = false
        end
    end
end
CheckF = function()
end
CheckBoat = function()
    for value15, value16 in pairs(workspace.Boats:GetChildren()) do
        if tostring(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Owner.Value) == tostring(plr.Name) then
            return {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}
        end
    end
    return false
end
CheckEnemiesBoat = function()
    for value17, value18 in pairs(workspace.Enemies:GetChildren()) do
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "FishBoat" and ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):FindFirstChild "Value" > 0 then
            return true
        end
    end
    return false
end
CheckPirateGrandBrigade = function()
    for value19, value20 in pairs(workspace.Enemies:GetChildren()) do
        if (({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "PirateGrandBrigade" or ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "PirateBrigade") and ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):FindFirstChild "Value" > 0 then
            return true
        end
    end
    return false
end
CheckShark = function()
    for value21, value22 in pairs(workspace.Enemies:GetChildren()) do
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Shark" and ({}).Alive({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}) then
            return true
        end
    end
    return false
end
CheckTerrorShark = function()
    for value23, value24 in pairs(workspace.Enemies:GetChildren()) do
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Terrorshark" and ({}).Alive({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}) then
            return true
        end
    end
    return false
end
CheckPiranha = function()
    for value25, value26 in pairs(workspace.Enemies:GetChildren()) do
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Piranha" and ({}).Alive({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}) then
            return true
        end
    end
    return false
end
CheckFishCrew = function()
    for value27, value28 in pairs(workspace.Enemies:GetChildren()) do
        if (({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Fish Crew Member" or ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Haunted Crew Member") and ({}).Alive({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}) then
            return true
        end
    end
    return false
end
CheckHauntedCrew = function()
    for value29, value30 in pairs(workspace.Enemies:GetChildren()) do
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Haunted Crew Member" and ({}).Alive({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}) then
            return true
        end
    end
    return false
end
CheckSeaBeast = function()
    return false
end
CheckLeviathan = function()
    return false
end
UpdStFruit = function()
    for value31, value32 in next, plr.Backpack:GetChildren() do
        StoreFruit = ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):FindFirstChild("EatRemote", true)
        if StoreFruit then
            replicated.Remotes.CommF_:InvokeServer("StoreFruit", StoreFruit.Parent:GetAttribute("OriginalName"), plr.Backpack:FindFirstChild(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name))
        end
    end
end
collectFruits = function(param27)
    if param27 then
        for value33, value34 in pairs(workspace:GetChildren()) do
            if string.find(({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Name, "Fruit") then
                ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Handle.CFrame = param27.HumanoidRootPart.CFrame
            end
        end
    end
end
Getmoon = function()
end
DropFruits = function()
    for value35, value36 in next, plr.Backpack:GetChildren() do
        if string.find(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name, "Fruit") then
            EquipWeapon(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name)
            wait(0.1)
            if plr.PlayerGui.Main.Dialogue.Visible == true then
                plr.PlayerGui.Main.Dialogue.Visible = false
            end
            EquipWeapon(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name)
            plr.Character:FindFirstChild(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name).EatRemote:InvokeServer("Drop")
        end
    end
    for value37, value38 in pairs(plr.Character:GetChildren()) do
        if string.find(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name, "Fruit") then
            EquipWeapon(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name)
            wait(0.1)
            if plr.PlayerGui.Main.Dialogue.Visible == true then
                plr.PlayerGui.Main.Dialogue.Visible = false
            end
            EquipWeapon(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name)
            plr.Character:FindFirstChild(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name).EatRemote:InvokeServer("Drop")
        end
    end
end
GetBP = function(param28)
    return plr.Backpack:FindFirstChild(param28) or plr.Character:FindFirstChild(param28)
end
GetIn = function(param29)
    for value39, value40 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
        if type({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}) == "table" then
            if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Name == param29 or plr.Character:FindFirstChild(param29) or plr.Backpack:FindFirstChild(param29) then
                return true
            end
        end
    end
    return false
end
GetM = function(param30)
    for value41, value42 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
        if type({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}) == "table" then
            if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Type == "Material" then
                if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Name == param30 then
                    return ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Count
                end
            end
        end
    end
    return 0
end
GetWP = function(param31)
    for value43, value44 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
        if type({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}) == "table" then
            if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Type == "Sword" then
                if ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).Name == param31 or plr.Character:FindFirstChild(param31) or plr.Backpack:FindFirstChild(param31) then
                    return true
                end
            end
        end
    end
    return false
end
getInfinity_Ability = function(param32, param33)
    if param32 == "Soru" and {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} then
        for value45, value46 in next, getgc() do
            if plr.Character.Soru then
                if typeof({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}) == "function" and getfenv({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).script == plr.Character.Soru then
                    for value47, value48 in next, getupvalues({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}) do
                        if typeof({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}) == "table" then
                            repeat
                                wait(Sec)
                                ;({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}).LastUse = 0
                            until not {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} or plr.Character.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end
    elseif param32 == "Energy" and {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} then
        plr.Character.Energy.Changed:connect(function()
    do
        plr.Character.Energy.Value = Energy
    end
end)
    elseif param32 == "Observation" and {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} then
        local cFrame = plr.VisionRadius
        plr.VisionRadius.Value = math.huge
    end
end
Hop = function()
    pcall(function()
    for value49 = math.random(1, math.random(40, 75)), 100, 1 do
        replicated.__ServerBrowser:InvokeServer(value49)
        for value50, value51 in next, {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} do
            if tonumber(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Count) < 12 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, value50)
            end
        end
    end
end)
end
local part = Instance.new("Part", workspace)
part.Size = Vector3.new(1, 1, 1)
part.Name = "Rip_Indra"
part.Anchored = true
part.CanCollide = false
part.CanTouch = false
part.Transparency = 1
local rip_Indra = workspace:FindFirstChild("Rip_Indra")
if rip_Indra and rip_Indra ~= part then
    rip_Indra:Destroy()
end
task.spawn(function()
    while task.wait() do
        if part and part.Parent == workspace then
            if shouldTween then
                getgenv().OnFarm = true
            else
                getgenv().OnFarm = false
            end
        else
            getgenv().OnFarm = false
        end
    end
end)
task.spawn(function()
    local cFrame = game.Players.LocalPlayer
    repeat
        task.wait()
    until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.PrimaryPart
    part.CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
    while task.wait() do
        pcall(function()
    if getgenv().OnFarm then
        if part and part.Parent == workspace then
            local logicalResult = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.PrimaryPart
            if {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} and (({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Position - part.Position).Magnitude <= 200 then
                ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).CFrame = part.CFrame
            else
                part.CFrame = ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).CFrame
            end
        end
        local value52 = game.Players.LocalPlayer.Character
        if game.Players.LocalPlayer.Character then
            for _, value53 in pairs(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):GetChildren()) do
                if value53:IsA("BasePart") then
                    value53.CanCollide = false
                end
            end
        end
    else
        if game.Players.LocalPlayer.Character then
            for _, value54 in pairs(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):GetChildren()) do
                if value54:IsA("BasePart") then
                    value54.CanCollide = true
                end
            end
        end
    end
end)
    end
end)
getgenv().TweenSpeedFar = 300
getgenv().TweenSpeedNear = 900
_tp = function(param34)
    local character = plr.Character
    local HRP = plr.Character.HumanoidRootPart
    shouldTween = true
    getgenv().OnFarm = false
    if plr.Character.HumanoidRootPart.Anchored then
        plr.Character.HumanoidRootPart.Anchored = false
        task.wait()
    end
    local dist = (param34.Position - plr.Character.HumanoidRootPart.Position).Magnitude
    local logicalResult = (param34.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 90 and (getgenv().TweenSpeedNear or 900) or getgenv().TweenSpeedFar or 300
    local tweenInfo1 = TweenInfo.new((param34.Position - plr.Character.HumanoidRootPart.Position).Magnitude / logicalResult, Enum.EasingStyle.Linear)
    local tween = game:GetService("TweenService"):Create(part, tweenInfo1, {CFrame = param34})
    if plr.Character.Humanoid.Sit == true then
        part.CFrame = CFrame.new(part.Position.X, param34.Y, part.Position.Z)
    end
    tween:Play()
    task.spawn(function()
    while tween.PlaybackState == Enum.PlaybackState.Playing do
        if not shouldTween then
            tween:Cancel()
            break
        end
        task.wait(0.1)
    end
    getgenv().OnFarm = true
end)
end
TeleportToTarget = function(param35)
    _tp(param35)
end
notween = function(param36)
    plr.Character.HumanoidRootPart.CFrame = param36
end
function BTP(param37)
    repeat
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = param37
        game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible = false
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = param37
        end
        task.wait(0.5)
    until (param37.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end
spawn(function()
    while task.wait() do
        pcall(function()
    if _G.SailBoat_Hydra or _G.WardenBoss or _G.AutoFactory or _G.HighestMirage or _G.HCM or _G.PGB or _G.Leviathan1 or _G.UPGDrago or _G.Complete_Trials or _G.TpDrago_Prehis or _G.BuyDrago or _G.AutoFireFlowers or _G.DT_Uzoth or _G.AutoBerry or _G.Prehis_Find or _G.Prehis_Skills or _G.Prehis_DB or _G.Prehis_DE or _G.FarmBlazeEM or _G.Dojoo or _G.CollectPresent or _G.AutoLawKak or _G.TpLab or _G.AutoPhoenixF or _G.AutoFarmChest or _G.AutoHytHallow or _G.LongsWord or _G.BlackSpikey or _G.AutoHolyTorch or _G.TrainDrago or _G.AutoSaber or _G.FarmMastery_Dev or _G.CitizenQuest or _G.AutoEctoplasm or _G.KeysRen or _G.Auto_Rainbow_Haki or _G.obsFarm or _G.AutoBigmom or _G.Doughv2 or _G.AuraBoss or _G.Raiding or _G.Auto_Cavender or _G.TpPly or _G.Bartilo_Quest or _G.Level or _G.FarmEliteHunt or _G.AutoZou or _G.AutoFarm_Bone or getgenv().AutoMaterial or _G.CraftVM or _G.FrozenTP or _G.TPDoor or _G.AcientOne or _G.AutoFarmNear or _G.AutoRaidCastle or _G.DarkBladev3 or _G.AutoFarmRaid or _G.Auto_Cake_Prince or _G.Addealer or _G.TPNpc or _G.TwinHook or _G.FindMirage or _G.FarmChestM or _G.Shark or _G.TerrorShark or _G.Piranha or _G.MobCrew or _G.SeaBeast1 or _G.FishBoat or _G.Auto or _G.AutoPoleV2 or _G.Auto_SuperHuman or _G.AutoDeathStep or _G.Auto_SharkMan_Karate or _G.Auto_Electric_Claw or _G.AutoDragonTalon or _G.Auto_Def_DarkCoat or _G.Auto_God_Human or _G.Auto_Tushita or _G.AutoMatSoul or _G.AutoKenVTWO or _G.AutoSerpentBow or _G.AutoFMon or _G.Auto_Soul_Guitar or _G.TPGEAR or _G.AutoSaw or _G.AutoTridentW2 or _G.Auto_StartRaid or _G.AutoEvoRace or _G.AutoGetQuestBounty or _G.MarinesCoat or _G.TravelDres or _G.Defeating or _G.DummyMan or _G.Auto_Yama or _G.Auto_SwanGG or _G.SwanCoat or _G.AutoEcBoss or _G.Auto_Mink or _G.Auto_Human or _G.Auto_Skypiea or _G.Auto_Fish or _G.CDK_TS or _G.CDK_YM or _G.CDK or _G.AutoFarmGodChalice or _G.AutoFistDarkness or _G.AutoMiror or _G.Teleport or _G.AutoKilo or _G.AutoGetUsoap or _G.Praying or _G.TryLucky or _G.AutoColShad or _G.AutoUnHaki or _G.Auto_DonAcces or _G.AutoRipIngay or _G.DragoV3 or _G.DragoV1 or _G.SailBoats or NextIs or _G.FarmGodChalice or _G.IceBossRen or senth or senth2 or _G.Lvthan or _G.beasthunter or _G.DangerLV or _G.Relic123 or _G.tweenKitsune or _G.Collect_Ember or _G.AutofindKitIs or _G.snaguine or _G.TwFruits or _G.tweenKitShrine or _G.Tp_LgS or _G.Tp_MasterA or _G.tweenShrine or _G.FarmMastery_G or _G.FarmMastery_S then
        shouldTween = true
        if not plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            local cFrame = Instance.new("BodyVelocity")
            cFrame.Name = "BodyClip"
            cFrame.Parent = plr.Character.HumanoidRootPart
            cFrame.MaxForce = Vector3.new(100000, 100000, 100000)
            cFrame.Velocity = Vector3.new(0, 0, 0)
        end
        for value55, value56 in pairs(plr.Character:GetDescendants()) do
            if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):IsA("BasePart") then
                ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).CanCollide = false
            end
        end
    else
        shouldTween = false
        if plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            plr.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        if plr.Character:FindFirstChild("highlight") then
            plr.Character:FindFirstChild("highlight"):Destroy()
        end
    end
end)
    end
end)
QuestB = function()
    if World1 then
        if _G.FindBoss == "The Gorilla King" then
            bMon = "The Gorilla King"
            Qname = "JungleQuest"
            Qdata = 3
            PosQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            PosB = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
        elseif _G.FindBoss == "Bobby" then
            bMon = "Bobby"
            Qname = "BuggyQuest1"
            Qdata = 3
            PosQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            PosB = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
        elseif _G.FindBoss == "The Saw" then
            bMon = "The Saw"
            PosB = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
        elseif _G.FindBoss == "Yeti" then
            bMon = "Yeti"
            Qname = "SnowQuest"
            Qdata = 3
            PosQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            PosB = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif _G.FindBoss == "Mob Leader" then
            bMon = "Mob Leader"
            PosB = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
        elseif _G.FindBoss == "Vice Admiral" then
            bMon = "Vice Admiral"
            Qname = "MarineQuest2"
            Qdata = 2
            PosQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
            PosB = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
        elseif _G.FindBoss == "Saber Expert" then
            bMon = "Saber Expert"
            PosB = CFrame.new(-1458.89502, 29.8870335, -50.633564)
        elseif _G.FindBoss == "Warden" then
            bMon = "Warden"
            Qname = "ImpelQuest"
            Qdata = 1
            PosB = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -0.00000449946401, 0.975376427, -0.0000195412576, 1, 0.00000903162072, -0.975376427, -0.0000210519756, 0.220546961)
            PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif _G.FindBoss == "Chief Warden" then
            bMon = "Chief Warden"
            Qname = "ImpelQuest"
            Qdata = 2
            PosB = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -0.0000280422337, -0.939682961, 0.00181045406, 0.342041939)
            PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif _G.FindBoss == "Swan" then
            bMon = "Swan"
            Qname = "ImpelQuest"
            Qdata = 3
            PosB = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
            PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif _G.FindBoss == "Magma Admiral" then
            bMon = "Magma Admiral"
            Qname = "MagmaQuest"
            Qdata = 3
            PosQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
            PosB = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
        elseif _G.FindBoss == "Fishman Lord" then
            bMon = "Fishman Lord"
            Qname = "FishmanQuest"
            Qdata = 3
            PosQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosB = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
        elseif _G.FindBoss == "Wysper" then
            bMon = "Wysper"
            Qname = "SkyExp1Quest"
            Qdata = 3
            PosQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
            PosB = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
        elseif _G.FindBoss == "Thunder God" then
            bMon = "Thunder God"
            Qname = "SkyExp2Quest"
            Qdata = 3
            PosQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            PosB = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
        elseif _G.FindBoss == "Cyborg" then
            bMon = "Cyborg"
            Qname = "FountainQuest"
            Qdata = 3
            PosQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            PosB = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
        elseif _G.FindBoss == "Ice Admiral" then
            bMon = "Ice Admiral"
            Qdata = nil
            PosQBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
            PosB = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
        elseif _G.FindBoss == "Greybeard" then
            bMon = "Greybeard"
            Qdata = nil
            PosQBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
            PosB = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
        end
    end
    if World2 then
        if _G.FindBoss == "Diamond" then
            bMon = "Diamond"
            Qname = "Area1Quest"
            Qdata = 3
            PosQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
            PosB = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
        elseif _G.FindBoss == "Jeremy" then
            bMon = "Jeremy"
            Qname = "Area2Quest"
            Qdata = 3
            PosQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
            PosB = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
        elseif _G.FindBoss == "Fajita" then
            bMon = "Fajita"
            Qname = "MarineQuest3"
            Qdata = 3
            PosQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
            PosB = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
        elseif _G.FindBoss == "Don Swan" then
            bMon = "Don Swan"
            PosB = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
        elseif _G.FindBoss == "Smoke Admiral" then
            bMon = "Smoke Admiral"
            Qname = "IceSideQuest"
            Qdata = 3
            PosQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            PosB = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
        elseif _G.FindBoss == "Awakened Ice Admiral" then
            bMon = "Awakened Ice Admiral"
            Qname = "FrostQuest"
            Qdata = 3
            PosQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
            PosB = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
        elseif _G.FindBoss == "Tide Keeper" then
            bMon = "Tide Keeper"
            Qname = "ForgottenQuest"
            Qdata = 3
            PosQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
            PosB = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
        elseif _G.FindBoss == "Darkbeard" then
            bMon = "Darkbeard"
            Qdata = nil
            PosQBoss = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
            PosB = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
        elseif _G.FindBoss == "Cursed Captaim" then
            bMon = "Cursed Captain"
            Qdata = nil
            PosQBoss = CFrame.new(916.928589, 181.092773, 33422)
            PosB = CFrame.new(916.928589, 181.092773, 33422)
        elseif _G.FindBoss == "Order" then
            bMon = "Order"
            Qdata = nil
            PosQBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
            PosB = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
        end
    end
    if World3 then
        if _G.FindBoss == "Stone" then
            bMon = "Stone"
            Qname = "PiratePortQuest"
            Qdata = 3
            PosQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            PosB = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
        elseif _G.FindBoss == "Hydra Leader" then
            bMon = "Hydra Leader"
            Qname = "AmazonQuest2"
            Qdata = 3
            PosQBoss = CFrame.new(5821.8979492188, 1019.0950927734, -73.719230651855)
            PosB = CFrame.new(5821.8979492188, 1019.0950927734, -73.719230651855)
        elseif _G.FindBoss == "Kilo Admiral" then
            bMon = "Kilo Admiral"
            Qname = "MarineTreeIsland"
            Qdata = 3
            PosQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
            PosB = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
        elseif _G.FindBoss == "Captain Elephant" then
            bMon = "Captain Elephant"
            Qname = "DeepForestIsland"
            Qdata = 3
            PosQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
            PosB = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
        elseif _G.FindBoss == "Beautiful Pirate" then
            bMon = "Beautiful Pirate"
            Qname = "DeepForestIsland2"
            Qdata = 3
            PosQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            PosB = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
        elseif _G.FindBoss == "Cake Queen" then
            bMon = "Cake Queen"
            Qname = "IceCreamIslandQuest"
            Qdata = 3
            PosQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            PosB = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
        elseif _G.FindBoss == "Longma" then
            bMon = "Longma"
            Qdata = nil
            PosQBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
            PosB = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
        elseif _G.FindBoss == "Soul Reaper" then
            bMon = "Soul Reaper"
            Qdata = nil
            PosQBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
            PosB = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
        end
    end
end
QuestBeta = function()
    QuestB()
    return {[0] = _G.FindBoss, [1] = bMon, [2] = Qdata, [3] = Qname, [4] = PosB}
end
QuestCheck = function()
    local cFrame = game.Players.LocalPlayer.Data.Level.Value
    if World1 and game.Players.LocalPlayer.Data.Level.Value > 699 then
        game.Players.LocalPlayer.Data.Level.Value = 650
    end
    if World2 and game.Players.LocalPlayer.Data.Level.Value > 1499 then
        game.Players.LocalPlayer.Data.Level.Value = 1450
    end
    if World1 then
        if game.Players.LocalPlayer.Data.Level.Value == 1 or game.Players.LocalPlayer.Data.Level.Value <= 9 then
            if tostring(TeamSelf) == "Marines" then
                Mon = "Trainee"
                Qname = "MarineQuest"
                Qdata = 1
                NameMon = "Trainee"
                PosM = CFrame.new(-2709.67944, 24.5206585, 2104.24585)
                PosQ = CFrame.new(-2709.67944, 24.5206585, 2104.24585)
            elseif tostring(TeamSelf) == "Pirates" then
                Mon = "Bandit"
                Qdata = 1
                Qname = "BanditQuest1"
                NameMon = "Bandit"
                PosM = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125)
                PosQ = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125)
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 10 and game.Players.LocalPlayer.Data.Level.Value <= 14 then
            Mon = "Monkey"
            Qdata = 1
            Qname = "JungleQuest"
            NameMon = "Monkey"
            PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            PosM = CFrame.new(-1448.5180664062, 67.853012084961, 11.465796470642)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 15 and game.Players.LocalPlayer.Data.Level.Value <= 29 then
            Mon = "Gorilla"
            Qdata = 2
            Qname = "JungleQuest"
            NameMon = "Gorilla"
            PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            PosM = CFrame.new(-1129.8836669922, 40.46354675293, -525.42370605469)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 30 and game.Players.LocalPlayer.Data.Level.Value <= 39 then
            Mon = "Pirate"
            Qdata = 1
            Qname = "BuggyQuest1"
            NameMon = "Pirate"
            PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            PosM = CFrame.new(-1103.5134277344, 13.752052307129, 3896.0910644531)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 40 and game.Players.LocalPlayer.Data.Level.Value <= 59 then
            Mon = "Brute"
            Qdata = 2
            Qname = "BuggyQuest1"
            NameMon = "Brute"
            PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            PosM = CFrame.new(-1140.0837402344, 14.809885025024, 4322.9213867188)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 60 and game.Players.LocalPlayer.Data.Level.Value <= 74 then
            Mon = "Desert Bandit"
            Qdata = 1
            Qname = "DesertQuest"
            NameMon = "Desert Bandit"
            PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359)
            PosM = CFrame.new(924.7998046875, 6.4486746788025, 4481.5859375)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 75 and game.Players.LocalPlayer.Data.Level.Value <= 89 then
            Mon = "Desert Officer"
            Qdata = 2
            Qname = "DesertQuest"
            NameMon = "Desert Officer"
            PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359)
            PosM = CFrame.new(1608.2822265625, 8.6142244338989, 4371.0073242188)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 90 and game.Players.LocalPlayer.Data.Level.Value <= 99 then
            Mon = "Snow Bandit"
            Qdata = 1
            Qname = "SnowQuest"
            NameMon = "Snow Bandit"
            PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            PosM = CFrame.new(1354.3479003906, 87.272773742676, -1393.9465332031)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 100 and game.Players.LocalPlayer.Data.Level.Value <= 119 then
            Mon = "Snowman"
            Qdata = 2
            Qname = "SnowQuest"
            NameMon = "Snowman"
            PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            PosM = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 120 and game.Players.LocalPlayer.Data.Level.Value <= 149 then
            Mon = "Chief Petty Officer"
            Qdata = 1
            Qname = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            PosQ = CFrame.new(-5039.58643, 27.3500385, 4324.68018)
            PosM = CFrame.new(-4881.2309570312, 22.652044296265, 4273.7524414062)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 150 and game.Players.LocalPlayer.Data.Level.Value <= 174 then
            Mon = "Sky Bandit"
            Qdata = 1
            Qname = "SkyQuest"
            NameMon = "Sky Bandit"
            PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            PosM = CFrame.new(-4953.20703125, 295.74420166016, -2899.2290039062)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 175 and game.Players.LocalPlayer.Data.Level.Value <= 189 then
            Mon = "Dark Master"
            Qdata = 2
            Qname = "SkyQuest"
            NameMon = "Dark Master"
            PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            PosM = CFrame.new(-5259.8447265625, 391.39767456055, -2229.0354003906)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 190 and game.Players.LocalPlayer.Data.Level.Value <= 209 then
            Mon = "Prisoner"
            Qdata = 1
            Qname = "PrisonerQuest"
            NameMon = "Prisoner"
            PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514)
            PosM = CFrame.new(5098.9736328125, -0.3204058110714, 474.23733520508)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 210 and game.Players.LocalPlayer.Data.Level.Value <= 249 then
            Mon = "Dangerous Prisoner"
            Qdata = 2
            Qname = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514)
            PosM = CFrame.new(5654.5634765625, 15.633401870728, 866.29919433594)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 250 and game.Players.LocalPlayer.Data.Level.Value <= 274 then
            Mon = "Toga Warrior"
            Qdata = 1
            Qname = "ColosseumQuest"
            NameMon = "Toga Warrior"
            PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            PosM = CFrame.new(-1820.21484375, 51.683856964111, -2740.6650390625)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 275 and game.Players.LocalPlayer.Data.Level.Value <= 299 then
            Mon = "Gladiator"
            Qdata = 2
            Qname = "ColosseumQuest"
            NameMon = "Gladiator"
            PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            PosM = CFrame.new(-1292.8381347656, 56.380882263184, -3339.0314941406)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 300 and game.Players.LocalPlayer.Data.Level.Value <= 324 then
            Mon = "Military Soldier"
            Qdata = 1
            Qname = "MagmaQuest"
            NameMon = "Military Soldier"
            PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            PosM = CFrame.new(-5411.1645507812, 11.081554412842, 8454.29296875)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 325 and game.Players.LocalPlayer.Data.Level.Value <= 374 then
            Mon = "Military Spy"
            Qdata = 2
            Qname = "MagmaQuest"
            NameMon = "Military Spy"
            PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            PosM = CFrame.new(-5802.8681640625, 86.262413024902, 8828.859375)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 375 and game.Players.LocalPlayer.Data.Level.Value <= 399 then
            Mon = "Fishman Warrior"
            Qdata = 1
            Qname = "FishmanQuest"
            NameMon = "Fishman Warrior"
            PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosM = CFrame.new(60878.30078125, 18.482830047607, 1543.7574462891)
            if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 400 and game.Players.LocalPlayer.Data.Level.Value <= 449 then
            Mon = "Fishman Commando"
            Qdata = 2
            Qname = "FishmanQuest"
            NameMon = "Fishman Commando"
            PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosM = CFrame.new(61922.6328125, 18.482830047607, 1493.9343261719)
            if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 450 and game.Players.LocalPlayer.Data.Level.Value <= 474 then
            Mon = "God's Guard"
            Qdata = 1
            Qname = "SkyExp1Quest"
            NameMon = "God's Guard"
            PosQ = CFrame.new(-4721.88867, 843.874695, -1949.96643)
            PosM = CFrame.new(-4710.04296875, 845.27697753906, -1927.3079833984)
            if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 475 and game.Players.LocalPlayer.Data.Level.Value <= 524 then
            Mon = "Shanda"
            Qdata = 2
            Qname = "SkyExp1Quest"
            NameMon = "Shanda"
            PosQ = CFrame.new(-7859.09814, 5544.19043, -381.476196)
            PosM = CFrame.new(-7678.4897460938, 5566.4038085938, -497.21560668945)
            if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 525 and game.Players.LocalPlayer.Data.Level.Value <= 549 then
            Mon = "Royal Squad"
            Qdata = 1
            Qname = "SkyExp2Quest"
            NameMon = "Royal Squad"
            PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            PosM = CFrame.new(-7624.2524414062, 5658.1333007812, -1467.3542480469)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 550 and game.Players.LocalPlayer.Data.Level.Value <= 624 then
            Mon = "Royal Soldier"
            Qdata = 2
            Qname = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            PosM = CFrame.new(-7836.7534179688, 5645.6640625, -1790.6236572266)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 625 and game.Players.LocalPlayer.Data.Level.Value <= 649 then
            Mon = "Galley Pirate"
            Qdata = 1
            Qname = "FountainQuest"
            NameMon = "Galley Pirate"
            PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            PosM = CFrame.new(5551.0219726562, 78.901351928711, 3930.4128417969)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 650 then
            Mon = "Galley Captain"
            Qdata = 2
            Qname = "FountainQuest"
            NameMon = "Galley Captain"
            PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            PosM = CFrame.new(5441.9516601562, 42.502059936523, 4950.09375)
        end
    elseif World2 then
        if game.Players.LocalPlayer.Data.Level.Value >= 700 and game.Players.LocalPlayer.Data.Level.Value <= 724 then
            Mon = "Raider"
            Qdata = 1
            Qname = "Area1Quest"
            NameMon = "Raider"
            PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            PosM = CFrame.new(-728.32672119141, 52.779319763184, 2345.7705078125)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 725 and game.Players.LocalPlayer.Data.Level.Value <= 774 then
            Mon = "Mercenary"
            Qdata = 2
            Qname = "Area1Quest"
            NameMon = "Mercenary"
            PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            PosM = CFrame.new(-1004.3244018555, 80.158866882324, 1424.6193847656)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 775 and game.Players.LocalPlayer.Data.Level.Value <= 799 then
            Mon = "Swan Pirate"
            Qdata = 1
            Qname = "Area2Quest"
            NameMon = "Swan Pirate"
            PosQ = CFrame.new(638.43811, 71.769989, 918.282898)
            PosM = CFrame.new(1068.6643066406, 137.61428833008, 1322.1060791016)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 800 and game.Players.LocalPlayer.Data.Level.Value <= 874 then
            Mon = "Factory Staff"
            Qname = "Area2Quest"
            Qdata = 2
            NameMon = "Factory Staff"
            PosQ = CFrame.new(632.698608, 73.1055908, 918.666321)
            PosM = CFrame.new(73.078674316406, 81.863441467285, -27.470672607422)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 875 and game.Players.LocalPlayer.Data.Level.Value <= 899 then
            Mon = "Marine Lieutenant"
            Qdata = 1
            Qname = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            PosM = CFrame.new(-2821.3723144531, 75.897277832031, -3070.0891113281)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 900 and game.Players.LocalPlayer.Data.Level.Value <= 949 then
            Mon = "Marine Captain"
            Qdata = 2
            Qname = "MarineQuest3"
            NameMon = "Marine Captain"
            PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            PosM = CFrame.new(-1861.2310791016, 80.176582336426, -3254.6975097656)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 950 and game.Players.LocalPlayer.Data.Level.Value <= 974 then
            Mon = "Zombie"
            Qdata = 1
            Qname = "ZombieQuest"
            NameMon = "Zombie"
            PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            PosM = CFrame.new(-5657.7768554688, 78.969734191895, -928.68701171875)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 975 and game.Players.LocalPlayer.Data.Level.Value <= 999 then
            Mon = "Vampire"
            Qdata = 2
            Qname = "ZombieQuest"
            NameMon = "Vampire"
            PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            PosM = CFrame.new(-6037.66796875, 32.184638977051, -1340.6597900391)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1000 and game.Players.LocalPlayer.Data.Level.Value <= 1049 then
            Mon = "Snow Trooper"
            Qdata = 1
            Qname = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            PosQ = CFrame.new(609.858826, 400.119904, -5372.25928)
            PosM = CFrame.new(549.14733886719, 427.38705444336, -5563.6987304688)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1050 and game.Players.LocalPlayer.Data.Level.Value <= 1099 then
            Mon = "Winter Warrior"
            Qdata = 2
            Qname = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            PosQ = CFrame.new(609.858826, 400.119904, -5372.25928)
            PosM = CFrame.new(1142.7451171875, 475.63980102539, -5199.4165039062)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1100 and game.Players.LocalPlayer.Data.Level.Value <= 1124 then
            Mon = "Lab Subordinate"
            Qdata = 1
            Qname = "IceSideQuest"
            NameMon = "Lab Subordinate"
            PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            PosM = CFrame.new(-5707.4716796875, 15.951709747314, -4513.3920898438)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1125 and game.Players.LocalPlayer.Data.Level.Value <= 1174 then
            Mon = "Horned Warrior"
            Qdata = 2
            Qname = "IceSideQuest"
            NameMon = "Horned Warrior"
            PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            PosM = CFrame.new(-6341.3666992188, 15.951770782471, -5723.162109375)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1175 and game.Players.LocalPlayer.Data.Level.Value <= 1199 then
            Mon = "Magma Ninja"
            Qdata = 1
            Qname = "FireSideQuest"
            NameMon = "Magma Ninja"
            PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
            PosM = CFrame.new(-5449.6728515625, 76.658744812012, -5808.2006835938)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1200 and game.Players.LocalPlayer.Data.Level.Value <= 1249 then
            Mon = "Lava Pirate"
            Qdata = 2
            Qname = "FireSideQuest"
            NameMon = "Lava Pirate"
            PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
            PosM = CFrame.new(-5213.3315429688, 49.737880706787, -4701.451171875)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1250 and game.Players.LocalPlayer.Data.Level.Value <= 1274 then
            Mon = "Ship Deckhand"
            Qdata = 1
            Qname = "ShipQuest1"
            NameMon = "Ship Deckhand"
            PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
            PosM = CFrame.new(1212.0111083984, 150.79205322266, 33059.24609375)
            if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1275 and game.Players.LocalPlayer.Data.Level.Value <= 1299 then
            Mon = "Ship Engineer"
            Qdata = 2
            Qname = "ShipQuest1"
            NameMon = "Ship Engineer"
            PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
            PosM = CFrame.new(919.47863769531, 43.544013977051, 32779.96875)
            if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1300 and game.Players.LocalPlayer.Data.Level.Value <= 1324 then
            Mon = "Ship Steward"
            Qdata = 1
            Qname = "ShipQuest2"
            NameMon = "Ship Steward"
            PosQ = CFrame.new(968.80957, 125.092171, 33244.125)
            PosM = CFrame.new(919.43853759766, 129.55599975586, 33436.03515625)
            if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1325 and game.Players.LocalPlayer.Data.Level.Value <= 1349 then
            Mon = "Ship Officer"
            Qdata = 2
            Qname = "ShipQuest2"
            NameMon = "Ship Officer"
            PosQ = CFrame.new(968.80957, 125.092171, 33244.125)
            PosM = CFrame.new(1036.0179443359, 181.4390411377, 33315.7265625)
            if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1350 and game.Players.LocalPlayer.Data.Level.Value <= 1374 then
            Mon = "Arctic Warrior"
            Qdata = 1
            Qname = "FrostQuest"
            NameMon = "Arctic Warrior"
            PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            PosM = CFrame.new(5966.24609375, 62.970020294189, -6179.3828125)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1375 and game.Players.LocalPlayer.Data.Level.Value <= 1424 then
            Mon = "Snow Lurker"
            Qdata = 2
            Qname = "FrostQuest"
            NameMon = "Snow Lurker"
            PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            PosM = CFrame.new(5407.0737304688, 69.194374084473, -6880.8803710938)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1425 and game.Players.LocalPlayer.Data.Level.Value <= 1449 then
            Mon = "Sea Soldier"
            Qdata = 1
            Qname = "ForgottenQuest"
            NameMon = "Sea Soldier"
            PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193)
            PosM = CFrame.new(-3028.2236328125, 64.674514770508, -9775.4267578125)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 1450 then
            Mon = "Water Fighter"
            Qdata = 2
            Qname = "ForgottenQuest"
            NameMon = "Water Fighter"
            PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193)
            PosM = CFrame.new(-3352.9013671875, 285.01556396484, -10534.841796875)
        end
    elseif World3 then
        if game.Players.LocalPlayer.Data.Level.Value == 1500 or game.Players.LocalPlayer.Data.Level.Value <= 1524 then
            Mon = "Pirate Millionaire"
            Qdata = 1
            Qname = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            PosQ = CFrame.new(-290.07, 42.9, 5581.59)
            PosM = CFrame.new(-246, 47.31, 5584.1)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1525 or game.Players.LocalPlayer.Data.Level.Value <= 1574 then
            Mon = "Pistol Billionaire"
            Qdata = 2
            Qname = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            PosQ = CFrame.new(-290.07, 42.9, 5581.59)
            PosM = CFrame.new(-187.33, 86.24, 6013.51)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1575 or game.Players.LocalPlayer.Data.Level.Value <= 1599 then
            Mon = "Dragon Crew Warrior"
            Qdata = 1
            Qname = "DragonCrewQuest"
            NameMon = "Dragon Crew Warrior"
            PosQ = CFrame.new(6737.06055, 127.417763, -712.300659, -0.463954359, -0.00000000719574755, 0.885859072, 0.0000000769187665, 1, 0.0000000484078626, -0.885859072, 0.0000000905982276, -0.463954359)
            PosM = CFrame.new(6709.76367, 52.3442993, -1139.02966, -0.763515472, 0, 0.645789504, 0, 1, 0, -0.645789504, 0, -0.763515472)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1600 or game.Players.LocalPlayer.Data.Level.Value <= 1624 then
            Mon = "Dragon Crew Archer"
            Qdata = 2
            Qname = "DragonCrewQuest"
            NameMon = "Dragon Crew Archer"
            PosQ = CFrame.new(6737.06055, 127.417763, -712.300659, -0.463954359, -0.00000000719574755, 0.885859072, 0.0000000769187665, 1, 0.0000000484078626, -0.885859072, 0.0000000905982276, -0.463954359)
            PosM = CFrame.new(6668.76172, 481.376923, 329.12207, -0.121787429, 0, -0.992556155, 0, 1, 0, 0.992556155, 0, -0.121787429)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1625 or game.Players.LocalPlayer.Data.Level.Value <= 1649 then
            Mon = "Hydra Enforcer"
            Qname = "VenomCrewQuest"
            Qdata = 1
            NameMon = "Hydra Enforcer"
            PosQ = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            PosM = CFrame.new(4547.11523, 1003.10217, 334.194824, 0.388810456, 0, -0.921317935, 0, 1, 0, 0.921317935, 0, 0.388810456)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1650 or game.Players.LocalPlayer.Data.Level.Value <= 1699 then
            Mon = "Venomous Assailant"
            Qname = "VenomCrewQuest"
            Qdata = 2
            NameMon = "Venomous Assailant"
            PosQ = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            PosM = CFrame.new(4674.92676, 1134.82654, 996.308838, 0.731321394, 0, -0.682033002, 0, 1, 0, 0.682033002, 0, 0.731321394)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1700 or game.Players.LocalPlayer.Data.Level.Value <= 1724 then
            Mon = "Marine Commodore"
            Qdata = 1
            Qname = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            PosQ = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
            PosM = CFrame.new(2286.0078125, 73.133918762207, -7159.8090820312)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1725 or game.Players.LocalPlayer.Data.Level.Value <= 1774 then
            Mon = "Marine Rear Admiral"
            NameMon = "Marine Rear Admiral"
            Qname = "MarineTreeIsland"
            Qdata = 2
            PosQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            PosM = CFrame.new(3656.7736816406, 160.52406311035, -7001.5986328125)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1775 or game.Players.LocalPlayer.Data.Level.Value <= 1799 then
            Mon = "Fishman Raider"
            Qdata = 1
            Qname = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            PosM = CFrame.new(-10407.526367188, 331.76263427734, -8368.5166015625)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1800 or game.Players.LocalPlayer.Data.Level.Value <= 1824 then
            Mon = "Fishman Captain"
            Qdata = 2
            Qname = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            PosM = CFrame.new(-10994.701171875, 352.38140869141, -9002.1103515625)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1825 or game.Players.LocalPlayer.Data.Level.Value <= 1849 then
            Mon = "Forest Pirate"
            Qdata = 1
            Qname = "DeepForestIsland"
            NameMon = "Forest Pirate"
            PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, 0, -0.707079291, 0, 1, 0, 0.707079291, 0, 0.707134247)
            PosM = CFrame.new(-13274.478515625, 332.37814331055, -7769.5805664062)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1850 or game.Players.LocalPlayer.Data.Level.Value <= 1899 then
            Mon = "Mythological Pirate"
            Qdata = 2
            Qname = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, 0, -0.707079291, 0, 1, 0, 0.707079291, 0, 0.707134247)
            PosM = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1900 or game.Players.LocalPlayer.Data.Level.Value <= 1924 then
            Mon = "Jungle Pirate"
            Qdata = 1
            Qname = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            PosM = CFrame.new(-12256.16015625, 331.73828125, -10485.836914062)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1925 or game.Players.LocalPlayer.Data.Level.Value <= 1974 then
            Mon = "Musketeer Pirate"
            Qdata = 2
            Qname = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            PosM = CFrame.new(-13457.904296875, 391.54565429688, -9859.177734375)
        elseif game.Players.LocalPlayer.Data.Level.Value == 1975 or game.Players.LocalPlayer.Data.Level.Value <= 1999 then
            Mon = "Reborn Skeleton"
            Qdata = 1
            Qname = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, 0, -1, 0, 0)
            PosM = CFrame.new(-8763.7236328125, 165.72299194336, 6159.8618164062)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2000 or game.Players.LocalPlayer.Data.Level.Value <= 2024 then
            Mon = "Living Zombie"
            Qdata = 2
            Qname = "HauntedQuest1"
            NameMon = "Living Zombie"
            PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, 0, -1, 0, 0)
            PosM = CFrame.new(-10144.131835938, 138.6266784668, 5838.0888671875)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2025 or game.Players.LocalPlayer.Data.Level.Value <= 2049 then
            Mon = "Demonic Soul"
            Qdata = 1
            Qname = "HauntedQuest2"
            NameMon = "Demonic Soul"
            PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            PosM = CFrame.new(-9505.8720703125, 172.10482788086, 6158.9931640625)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2050 or game.Players.LocalPlayer.Data.Level.Value <= 2074 then
            Mon = "Posessed Mummy"
            Qdata = 2
            Qname = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            PosM = CFrame.new(-9582.0224609375, 6.2515273094177, 6205.478515625)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2075 or game.Players.LocalPlayer.Data.Level.Value <= 2099 then
            Mon = "Peanut Scout"
            Qdata = 1
            Qname = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            PosM = CFrame.new(-2143.2419433594, 47.721984863281, -10029.995117188)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2100 or game.Players.LocalPlayer.Data.Level.Value <= 2124 then
            Mon = "Peanut President"
            Qdata = 2
            Qname = "NutsIslandQuest"
            NameMon = "Peanut President"
            PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            PosM = CFrame.new(-1859.3540039062, 38.103168487549, -10422.4296875)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2125 or game.Players.LocalPlayer.Data.Level.Value <= 2149 then
            Mon = "Ice Cream Chef"
            Qdata = 1
            Qname = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            PosM = CFrame.new(-872.24658203125, 65.81957244873, -10919.95703125)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2150 or game.Players.LocalPlayer.Data.Level.Value <= 2199 then
            Mon = "Ice Cream Commander"
            Qdata = 2
            Qname = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            PosM = CFrame.new(-558.06103515625, 112.04895782471, -11290.774414062)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2200 or game.Players.LocalPlayer.Data.Level.Value <= 2224 then
            Mon = "Cookie Crafter"
            Qdata = 1
            Qname = "CakeQuest1"
            NameMon = "Cookie Crafter"
            PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -0.0000000880302053, 0.288177818, 0.000000069301187, 1, 0.0000000751931211, -0.288177818, -0.000000052032135, 0.957576931)
            PosM = CFrame.new(-2374.13671875, 37.798263549805, -12125.30859375)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2225 or game.Players.LocalPlayer.Data.Level.Value <= 2249 then
            Mon = "Cake Guard"
            Qdata = 2
            Qname = "CakeQuest1"
            NameMon = "Cake Guard"
            PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -0.0000000880302053, 0.288177818, 0.000000069301187, 1, 0.0000000751931211, -0.288177818, -0.000000052032135, 0.957576931)
            PosM = CFrame.new(-1598.3070068359, 43.773197174072, -12244.581054688)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2250 or game.Players.LocalPlayer.Data.Level.Value <= 2274 then
            Mon = "Baking Staff"
            Qdata = 1
            Qname = "CakeQuest2"
            NameMon = "Baking Staff"
            PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 0.0000000422142143, 0.250778586, 0.0000000474911062, 1, 0.0000000149904711, -0.250778586, 0.0000000264211941, -0.96804446)
            PosM = CFrame.new(-1887.8099365234, 77.618507385254, -12998.350585938)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2275 or game.Players.LocalPlayer.Data.Level.Value <= 2299 then
            Mon = "Head Baker"
            Qdata = 2
            Qname = "CakeQuest2"
            NameMon = "Head Baker"
            PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 0.0000000422142143, 0.250778586, 0.0000000474911062, 1, 0.0000000149904711, -0.250778586, 0.0000000264211941, -0.96804446)
            PosM = CFrame.new(-2216.1882324219, 82.884521484375, -12869.293945312)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2300 or game.Players.LocalPlayer.Data.Level.Value <= 2324 then
            Mon = "Cocoa Warrior"
            Qdata = 1
            Qname = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            PosQ = CFrame.new(233.22836303711, 29.876001358032, -12201.233398438)
            PosM = CFrame.new(-21.553283691406, 80.574996948242, -12352.387695312)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2325 or game.Players.LocalPlayer.Data.Level.Value <= 2349 then
            Mon = "Chocolate Bar Battler"
            Qdata = 2
            Qname = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            PosQ = CFrame.new(233.22836303711, 29.876001358032, -12201.233398438)
            PosM = CFrame.new(582.59057617188, 77.188095092773, -12463.162109375)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2350 or game.Players.LocalPlayer.Data.Level.Value <= 2374 then
            Mon = "Sweet Thief"
            Qdata = 1
            Qname = "ChocQuest2"
            NameMon = "Sweet Thief"
            PosQ = CFrame.new(150.50663757324, 30.693693161011, -12774.502929688)
            PosM = CFrame.new(165.1884765625, 76.058853149414, -12600.836914062)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2375 or game.Players.LocalPlayer.Data.Level.Value <= 2399 then
            Mon = "Candy Rebel"
            Qdata = 2
            Qname = "ChocQuest2"
            NameMon = "Candy Rebel"
            PosQ = CFrame.new(150.50663757324, 30.693693161011, -12774.502929688)
            PosM = CFrame.new(134.86563110352, 77.247680664062, -12876.547851562)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2400 or game.Players.LocalPlayer.Data.Level.Value <= 2449 then
            Mon = "Candy Pirate"
            Qdata = 1
            Qname = "CandyQuest1"
            NameMon = "Candy Pirate"
            PosQ = CFrame.new(-1150.0400390625, 20.378934860229, -14446.334960938)
            PosM = CFrame.new(-1310.5003662109, 26.016523361206, -14562.404296875)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2450 or game.Players.LocalPlayer.Data.Level.Value <= 2474 then
            Mon = "Isle Outlaw"
            Qdata = 1
            Qname = "TikiQuest1"
            NameMon = "Isle Outlaw"
            PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566)
            PosM = CFrame.new(-16479.900390625, 226.6117401123, -300.31143188477)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2475 or game.Players.LocalPlayer.Data.Level.Value <= 2499 then
            Mon = "Island Boy"
            Qdata = 2
            Qname = "TikiQuest1"
            NameMon = "Island Boy"
            PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, 0, -0.977032006, 0, 1, 0, 0.977032006, 0, 0.213092566)
            PosM = CFrame.new(-16849.396484375, 192.86505126953, -150.78532409668)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2500 or game.Players.LocalPlayer.Data.Level.Value <= 2524 then
            Mon = "Sun-kissed Warrior"
            Qdata = 1
            Qname = "TikiQuest2"
            NameMon = "kissed Warrior"
            PosM = CFrame.new(-16347, 64, 984)
            PosQ = CFrame.new(-16538, 55, 1049)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2525 or game.Players.LocalPlayer.Data.Level.Value <= 2550 then
            Mon = "Isle Champion"
            Qdata = 2
            Qname = "TikiQuest2"
            NameMon = "Isle Champion"
            PosQ = CFrame.new(-16541.0215, 57.3082275, 1051.46118, 0.0410757065, 0, -0.999156058, 0, 1, 0, 0.999156058, 0, 0.0410757065)
            PosM = CFrame.new(-16602.1015625, 130.38734436035, 1087.2456054688)
        elseif game.Players.LocalPlayer.Data.Level.Value == 2551 or game.Players.LocalPlayer.Data.Level.Value <= 2574 then
            Mon = "Serpent Hunter"
            Qdata = 1
            Qname = "TikiQuest3"
            NameMon = "Serpent Hunter"
            PosQ = CFrame.new(-16668.03, 105.32, 1568.6)
            PosM = CFrame.new(-16645.64, 163.09, 1352.87)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 2575 and game.Players.LocalPlayer.Data.Level.Value <= 2599 then
            Mon = "Skull Slayer"
            Qdata = 2
            Qname = "TikiQuest3"
            NameMon = "Skull Slayer"
            PosQ = CFrame.new(-16668.03, 105.32, 1568.6)
            PosM = CFrame.new(-16709.49, 419.68, 1751.09)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 2600 and game.Players.LocalPlayer.Data.Level.Value <= 2624 then
            PosQ = CFrame.new(10778.875, -2087.72437, 9265.18359, 0.934615612, -0.0000000933109447, -0.355659455, 0.0000000917655143, 1, -0.0000000212154276, 0.355659455, -0.0000000128090019, 0.934615612)
            if (getgenv().AutoFarm or _G.Level) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                _tp(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 0.00000000147309942, -0.0721890926, -0.00000000400651912, 0.99999994, -0.00000000251183763, 0.0721890852, 0.000000000575363091, 0.997390926))
                task.wait(2)
                game:GetService "Modules".Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
                return
            end
            Mon = "Reef Bandit"
            Qdata = 1
            Qname = "SubmergedQuest1"
            NameMon = "Reef Bandit"
            PosM = CFrame.new(11019.1318, -2146.06812, 9342.3916, -0.719955266, -0.0000000174275385, 0.69402045, 0.0000000576556367, 1, 0.0000000849211546, -0.69402045, 0.000000101153624, -0.719955266)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 2625 and game.Players.LocalPlayer.Data.Level.Value <= 2649 then
            PosQ = CFrame.new(10778.875, -2087.72437, 9265.18359, 0.934615612, -0.0000000933109447, -0.355659455, 0.0000000917655143, 1, -0.0000000212154276, 0.355659455, -0.0000000128090019, 0.934615612)
            if (getgenv().AutoFarm or _G.Level) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                _tp(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 0.00000000147309942, -0.0721890926, -0.00000000400651912, 0.99999994, -0.00000000251183763, 0.0721890852, 0.000000000575363091, 0.997390926))
                task.wait(2)
                game:GetService "Modules".Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
                return
            end
            Mon = "Coral Pirate"
            Qdata = 2
            Qname = "SubmergedQuest1"
            NameMon = "Coral Pirate"
            PosM = CFrame.new(10808.6006, -2030.36145, 9364.2334, -0.775185347, -0.0359364748, 0.6307109, 0.0615428537, 0.989336014, 0.132010356, -0.628728986, 0.141148239, -0.764707148)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 2650 and game.Players.LocalPlayer.Data.Level.Value <= 2674 then
            PosQ = CFrame.new(10880.6855, -2086.20044, 10032.624, -0.321384728, 0.0000000987648434, -0.946948707, 0.0000000713271007, 1, 0.0000000800902953, 0.946948707, -0.0000000418033075, -0.321384728)
            if (getgenv().AutoFarm or _G.Level) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                _tp(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 0.00000000147309942, -0.0721890926, -0.00000000400651912, 0.99999994, -0.00000000251183763, 0.0721890852, 0.000000000575363091, 0.997390926))
                task.wait(2)
                game:GetService "Modules".Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
                return
            end
            Mon = "Sea Chanter"
            Qdata = 1
            Qname = "SubmergedQuest2"
            NameMon = "Sea Chanter"
            PosM = CFrame.new(10671.2715, -2057.59155, 10047.2588, -0.846484065, -0.0000000311045447, 0.532414079, -0.0000000555383117, 1, -0.0000000298785316, -0.532414079, -0.0000000548610757, -0.846484065)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 2675 and game.Players.LocalPlayer.Data.Level.Value <= 2699 then
            PosQ = CFrame.new(10880.6855, -2086.20044, 10032.624, -0.321384728, 0.0000000987648434, -0.946948707, 0.0000000713271007, 1, 0.0000000800902953, 0.946948707, -0.0000000418033075, -0.321384728)
            if (getgenv().AutoFarm or _G.Level) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                _tp(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 0.00000000147309942, -0.0721890926, -0.00000000400651912, 0.99999994, -0.00000000251183763, 0.0721890852, 0.000000000575363091, 0.997390926))
                task.wait(2)
                game:GetService "Modules".Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
                return
            end
            Mon = "Ocean Prophet"
            Qdata = 2
            Qname = "SubmergedQuest2"
            NameMon = "Ocean Prophet"
            PosM = CFrame.new(11008.5195, -2007.72839, 10223.0791, -0.688615739, 0.00000000233523378, -0.725126445, 0.00000000299292546, 1, 0.000000000378221315, 0.725126445, -0.00000000190980032, -0.688615739)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 2700 and game.Players.LocalPlayer.Data.Level.Value <= 2724 then
            PosQ = CFrame.new(9640.08789, -1992.44507, 9613.65234, -0.957327187, 0.0000000411991223, 0.289006323, 0.000000015775445, 1, -0.0000000902985846, -0.289006323, -0.0000000818860855, -0.957327187)
            if (getgenv().AutoFarm or _G.Level) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                _tp(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 0.00000000147309942, -0.0721890926, -0.00000000400651912, 0.99999994, -0.00000000251183763, 0.0721890852, 0.000000000575363091, 0.997390926))
                task.wait(2)
                game:GetService "Modules".Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
                return
            end
            Mon = "High Disciple"
            Qdata = 1
            Qname = "SubmergedQuest3"
            NameMon = "High Disciple"
            PosM = CFrame.new(9750.41602, -1966.93884, 9753.36035, -0.749824047, 0.0000000557797613, -0.661637306, 0.0000000203500754, 1, 0.000000061243199, 0.661637306, 0.0000000324572511, -0.749824047)
        elseif game.Players.LocalPlayer.Data.Level.Value >= 2725 then
            PosQ = CFrame.new(9640.08789, -1992.44507, 9613.65234, -0.957327187, 0.0000000411991223, 0.289006323, 0.000000015775445, 1, -0.0000000902985846, -0.289006323, -0.0000000818860855, -0.957327187)
            if (getgenv().AutoFarm or _G.Level) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                _tp(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 0.00000000147309942, -0.0721890926, -0.00000000400651912, 0.99999994, -0.00000000251183763, 0.0721890852, 0.000000000575363091, 0.997390926))
                task.wait(2)
                game:GetService "Modules".Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
                return
            end
            Mon = "Grand Devotee"
            Qdata = 2
            Qname = "SubmergedQuest3"
            NameMon = "Grand Devotee"
            PosM = CFrame.new(9611.70508, -1993.47119, 9882.68848, -0.591375351, 0.0000000414332426, -0.806396425, 0.0000000473774868, 1, 0.0000000166361875, 0.806396425, -0.0000000283668058, -0.591375351)
        end
    end
end
MaterialMon = function()
    local cFrame = game.Players.LocalPlayer
    local logicalResult = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    shouldRequestEntrance = function(param38, param39)
    local value57 = (({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Position - game.Players.LocalPlayer).Magnitude
    if (({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Position - game.Players.LocalPlayer).Magnitude >= {"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"} then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", game.Players.LocalPlayer)
    end
end
    if World1 then
        if SelectMaterial == "Angel Wings" then
            MMon = {"Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God"}
            MPos = CFrame.new(-4698, 845, -1912)
            SP = "Default"
            local cFrame1 = Vector3.new(-4607.82275, 872.54248, -1667.55688)
            shouldRequestEntrance(cFrame1, 10000)
        elseif SelectMaterial == "Leather + Scrap Metal" then
            MMon = {"Brute", "Pirate"}
            MPos = CFrame.new(-1145, 15, 4350)
            SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
            MMon = {"Military Soldier", "Military Spy", "Magma Admiral"}
            MPos = CFrame.new(-5815, 84, 8820)
            SP = "Default"
        elseif SelectMaterial == "Fish Tail" then
            MMon = {"Fishman Warrior", "Fishman Commando", "Fishman Lord"}
            MPos = CFrame.new(61123, 19, 1569)
            SP = "Default"
            local cFrame1 = Vector3.new(61163.8515625, 5.342342376709, 1819.7841796875)
            shouldRequestEntrance(cFrame1, 17000)
        end
    elseif World2 then
        if SelectMaterial == "Leather + Scrap Metal" then
            MMon = {"Marine Captain"}
            MPos = CFrame.new(-2010.5059814453, 73.001159667969, -3326.6208496094)
            SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
            MMon = {"Magma Ninja", "Lava Pirate"}
            MPos = CFrame.new(-5428, 78, -5959)
            SP = "Default"
        elseif SelectMaterial == "Ectoplasm" then
            MMon = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
            MPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625)
            SP = "Default"
            local cFrame1 = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
            shouldRequestEntrance(cFrame1, 1000)
        elseif SelectMaterial == "Mystic Droplet" then
            MMon = {"Water Fighter"}
            MPos = CFrame.new(-3385, 239, -10542)
            SP = "Default"
        elseif SelectMaterial == "Radioactive Material" then
            MMon = {"Factory Staff"}
            MPos = CFrame.new(295, 73, -56)
            SP = "Default"
        elseif SelectMaterial == "Vampire Fang" then
            MMon = {"Vampire"}
            MPos = CFrame.new(-6033, 7, -1317)
            SP = "Default"
        end
    elseif World3 then
        if SelectMaterial == "Scrap Metal" then
            MMon = {"Jungle Pirate", "Forest Pirate"}
            MPos = CFrame.new(-11975.78515625, 331.77340698242, -10620.030273438)
            SP = "Default"
        elseif SelectMaterial == "Fish Tail" then
            MMon = {"Fishman Raider", "Fishman Captain"}
            MPos = CFrame.new(-10993, 332, -8940)
            SP = "Default"
        elseif SelectMaterial == "Conjured Cocoa" then
            MMon = {"Chocolate Bar Battler", "Cocoa Warrior"}
            MPos = CFrame.new(620.63446044922, 78.936447143555, -12581.369140625)
            SP = "Default"
        elseif SelectMaterial == "Dragon Scale" then
            MMon = {"Dragon Crew Archer", "Dragon Crew Warrior"}
            MPos = CFrame.new(6594, 383, 139)
            SP = "Default"
        elseif SelectMaterial == "Gunpowder" then
            MMon = {"Pistol Billionaire"}
            MPos = CFrame.new(-84.855690002441, 85.620613098145, 6132.0087890625)
            SP = "Default"
        elseif SelectMaterial == "Mini Tusk" then
            MMon = {"Mythological Pirate"}
            MPos = CFrame.new(-13545, 470, -6917)
            SP = "Default"
        elseif SelectMaterial == "Demonic Wisp" then
            MMon = {"Demonic Soul"}
            MPos = CFrame.new(-9495.6806640625, 453.58624267578, 5977.3486328125)
            SP = "Default"
        end
    end
end
QuestNeta = function()
    QuestCheck()
    return {[1] = Mon, [2] = Qdata, [3] = Qname, [4] = PosM, [5] = NameMon, [6] = PosQ}
end
_G.Settings = _G.Settings or {}
_G.Settings.AutoClick = true
_G.Settings.FastAttack = true
_G.Settings.FastAttackMode = "Fast Attack"
local localPlayer = players.LocalPlayer
local modules = replicatedStorage:WaitForChild("Modules")
local net = modules:WaitForChild("Net")
local rE_RegisterAttack = net:WaitForChild("RE/RegisterAttack")
local rE_RegisterHit = net:WaitForChild("RE/RegisterHit")
local function IsAlive(character)
    return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
end
local AttackDelays = {["Normal Attack"] = 0.25, ["Fast Attack"] = 0.15, ["Super Attack"] = 0.05, ["Bear Attack"] = 0.1, ["Super Bear Attack"] = 0.01}
local FastAttack1 = {Distance = 100}
do
end
do
end
local FastAttack2 = {Distance = 100}
do
end
do
end
function StartAttacksWithMode(mode)
    local logicalResult = AttackDelays[mode] or 0.15
    _G.Settings.FastAttackMode = mode
    _G.FastAttackLoop1 = task.spawn(function()
    while _G.Settings.FastAttack do
        local char = players.LocalPlayer.Character
        if players.LocalPlayer.Character and IsAlive(players.LocalPlayer.Character) then
            local tool = players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool and tool.ToolTip ~= "Gun" then
                local enemies, basePart = FastAttack1:GetNearestEnemies()
                if #enemies > 0 and basePart then
                    FastAttack1:Attack(basePart, enemies)
                end
            end
        end
        task.wait(logicalResult)
    end
end)
    _G.FastAttackLoop2 = task.spawn(function()
    while _G.Settings.FastAttack do
        local char = players.LocalPlayer.Character
        if players.LocalPlayer.Character and IsAlive(players.LocalPlayer.Character) then
            local tool = players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool and tool.ToolTip ~= "Gun" then
                FastAttack2:AttackNearest()
            end
        end
        task.wait(logicalResult)
    end
end)
    _G.AutoClickLoop = task.spawn(function()
    while _G.Settings.AutoClick do
        local char = players.LocalPlayer.Character
        if players.LocalPlayer.Character and IsAlive(players.LocalPlayer.Character) and players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
        end
        task.wait(0.1)
    end
end)
end
_G.FastAttack = false
local ReplicatedStorage1 = game:GetService("ReplicatedStorage")
local Players1 = game:GetService("Players")
local localPlayer1 = Players1.LocalPlayer
local namedElement = workspace:FindFirstChild("Enemies") or Instance.new("Folder", workspace)
local namedElement1 = workspace:FindFirstChild("Characters") or Instance.new("Folder", workspace)
namedElement.Name = "Enemies"
namedElement1.Name = "Characters"
local modules1 = ReplicatedStorage1:FindFirstChild("Modules")
local logicalResult = modules1 and modules1:FindFirstChild("Net")
local logicalResult1 = logicalResult and logicalResult:FindFirstChild("RE/ShootGunEvent")
local getrawmetatableResult2 = getrawmetatable(game)
setreadonly(getrawmetatableResult2, false)
getrawmetatableResult2.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {...}
    if getgenv().GunAuraSettings and getgenv().GunAuraSettings.Enabled and getgenv().GunAuraSettings.CurrentTarget then
        if method == "FireServer" or method == "InvokeServer" then
            if tostring(args[1]) == "RemoteEvent" or tostring(args[1]):find("Shoot") or tostring(args[1]):find("Attack") then
                if type(args[2]) == "Vector3" then
                    args[2] = getgenv().GunAuraSettings.CurrentTarget.Position
                elseif type(args[3]) == "Vector3" then
                    args[3] = getgenv().GunAuraSettings.CurrentTarget.Position
                end
            end
        end
    end
    return getrawmetatableResult2.__namecall(unpack(args))
end)
setreadonly(getrawmetatableResult2, true)
getgenv().GunAuraSettings = {Enabled = true, GunRange = 500, CurrentTarget = nil, TargetType = "All", GunEnabled = false, FireRate = 0.01}
local function IsAlive(character)
    local humanoid = character:FindFirstChild("Humanoid")
    return humanoid and humanoid.Health > 0
end
local function setSimulationRadius()
    pcall(function()
    sethiddenproperty(Players1.LocalPlayer, "SimulationRadius", 10000)
end)
end
local function findClosestTargetForGun()
    local logicalResult2 = Players1.LocalPlayer.Character and Players1.LocalPlayer.Character:GetPivot().Position
    setSimulationRadius()
    local result = getgenv().GunAuraSettings.GunRange + 1
    local closestTarget = nil
    local closestPart = nil
    local targetType = getgenv().GunAuraSettings.TargetType
    if getgenv().GunAuraSettings.TargetType == "NPC" or getgenv().GunAuraSettings.TargetType == "All" then
        for _, enemy in ipairs(namedElement:GetChildren()) do
            if IsAlive(enemy) and enemy ~= localPlayer1.Character then
                local logicalResult3 = enemy:FindFirstChild("HumanoidRootPart") or enemy:FindFirstChild("Head")
                if logicalResult3 then
                    local dist = (logicalResult3.Position - logicalResult2).Magnitude
                    if dist < result then
                        result = dist
                        closestTarget = enemy
                        closestPart = logicalResult3
                    end
                end
            end
        end
    end
    if getgenv().GunAuraSettings.TargetType == "Player" or getgenv().GunAuraSettings.TargetType == "All" then
        for _, char in ipairs(namedElement1:GetChildren()) do
            if IsAlive(char) and char ~= localPlayer1.Character then
                local logicalResult3 = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
                if logicalResult3 then
                    local dist = (logicalResult3.Position - logicalResult2).Magnitude
                    if dist < result then
                        result = dist
                        closestTarget = char
                        closestPart = logicalResult3
                    end
                end
            end
        end
    end
    return nil, nil
end
local function applyGunDamage()
    if not Players1.LocalPlayer.Character or not IsAlive(Players1.LocalPlayer.Character) then
        getgenv().GunAuraSettings.CurrentTarget = nil
    end
    local target, currentTarget = findClosestTargetForGun()
    if not target or not currentTarget then
        getgenv().GunAuraSettings.CurrentTarget = nil
    end
    getgenv().GunAuraSettings.CurrentTarget = currentTarget
    if logicalResult1 then
        pcall(function()
    for value58 = 1, 3 do
        logicalResult1:FireServer(currentTarget.Position, {currentTarget})
    end
end)
    end
end
getgenv().AutoClickShootSettings = {Enabled = false, ClickDelay = 2, LastClickTime = 0}
local VirtualInputManager = game:GetService("VirtualInputManager")
local function performClick()
    local lastClickTime = tick()
    local vector2 = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, 20)
    VirtualInputManager:SendMouseButtonEvent(vector2.X, vector2.Y, 0, true, game, 0)
    task.wait(0.02)
    VirtualInputManager:SendMouseButtonEvent(vector2.X, vector2.Y, 0, false, game, 0)
    getgenv().AutoClickShootSettings.LastClickTime = lastClickTime
end
local uiLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Myvkhuy/BearLibrary/Bearlib/V8.1.lua"))()
local Window = uiLib:MakeWindow({Title = "Thauan Hub | Farm", SubTitle = "by Quang Huy", SaveFolder = true, Image = "82107905019656"})
task.spawn(function()
    task.wait(2)
    uiLib:Notify({Title = "Thauan Hub", Message = "Script Load Download Completed", Duration = 10})
end)
local v0 = Window:MakeTab({Title = "Info/Group", Icon = "rbxassetid://73132811772878"})
local v1 = Window:MakeTab({Title = "Status/Server", Icon = "rbxassetid://7040410130"})
local v2 = Window:MakeTab({Title = "Farming", Icon = "rbxassetid://10709769508"})
local v3 = Window:MakeTab({Title = "Quests/Other", Icon = "rbxassetid://10734943448"})
local v4 = Window:MakeTab({Title = "Farm settings", Icon = "rbxassetid://10734950020"})
local v5 = Window:MakeTab({Title = "Auto Fishing", Icon = "rbxassetid://127664059821666"})
local v6 = Window:MakeTab({Title = "Sea Event", Icon = "rbxassetid://10747376931"})
local v7 = Window:MakeTab({Title = "Volcano/Dojo", Icon = "rbxassetid://10734897956"})
local v8 = Window:MakeTab({Title = "Mirage/Race", Icon = "rbxassetid://10734920149"})
local v9 = Window:MakeTab({Title = "Fruits/Check Stock", Icon = "rbxassetid://10709790875"})
local result1 = Window:MakeTab({Title = "Raid/Dungoen", Icon = "rbxassetid://10723404337"})
local result2 = Window:MakeTab({Title = "Teleport/World", Icon = "rbxassetid://10734906975"})
local result3 = Window:MakeTab({Title = "PvP/Player", Icon = "rbxassetid://10734975692"})
local result4 = Window:MakeTab({Title = "Esp/Stats", Icon = "rbxassetid://10723346959"})
local result5 = Window:MakeTab({Title = "Shop", Icon = "rbxassetid://10734952479"})
local result6 = Window:MakeTab({Title = "Settings", Icon = "rbxassetid://10734950309"})
v0:AddProfile({Name = "Quang Huy ☑", Bio = "I LOVE VIETNAM'S", Avatar = "rbxassetid://75089236463451", Cover = "rbxassetid://113942234405258", Verified = true})
v0:AddSingleDiscordCard({"Huy Script 🇻🇳", "Follow our TikTok channel for the latest updates!!!", "rbxassetid://75089236463451", "rbxassetid://125520177394706", 2000, 10000, "https://tiktok.me/group/ZSm9FrLKD/"})
v0:AddParagraph({"Th\244ng b\225o", "\226\128\162Thauan Hub\n\226\128\162 Script by Quang Huy\n\226\128\162 Creation Date: 7-6-2026\n\226\128\162 Last updated date: 7-6-2026\n\226\128\162 Aura gun hi\225\187\135n ch\198\176a b\225\186\175n \196\145\198\176\225\187\163c thuy\225\187\129n v\224 leviathan"})
v0:AddDiscordInvite({{"Join the TikTok Group", "Follow our TikTok channel for the latest updates!!!", "rbxassetid://134852113716171", "rbxassetid://84636833673111", 500, 1500, "https://tiktok.me/group/ZSm9FrLKD/"}, {"Join the Discord group", "Join the Discord group to stay updated with the latest announcements.", "rbxassetid://134852113716171", "rbxassetid://123427419242741", 250, 1000, "https://discord.gg/4XtcBYZ89"}})
local Time = v1:AddParagraph({Title = "Time Zone", Desc = ""})
function UpdateOS()
    date = os.date("*t")
    hour = date.hour % 24
    ampm = hour < 12 and "AM" or "PM"
    timezone = string.format("%02i:%02i:%02i %s", (hour - 1) % 12 + 1, date.min, date.sec, ampm)
    datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
    LocalizationService = game:GetService("LocalizationService")
    Players1 = game:GetService("Players")
    Services.Players.LocalPlayer = Players1.LocalPlayer
    name = Services.Players.LocalPlayer.Name
    result, code = pcall(function()
    return LocalizationService:GetCountryRegionForPlayerAsync(Services.Players.LocalPlayer)
end)
    Time:SetDesc(datetime .. " - " .. timezone .. " [ " .. code .. " ]")
end
spawn(function()
    while wait() do
        UpdateOS()
        game:GetService "RenderStepped":Wait()
    end
end)
local Timmessss = v1:AddParagraph({Title = "Time", Desc = ""})
function UpdateTime()
    GameTime = math.floor(workspace.DistributedGameTime + 0.5)
    Hour = math.floor(GameTime / 3600) % 24
    Minute = math.floor(GameTime / 60) % 60
    Second = GameTime % 60
    Timmessss:SetDesc(Hour .. " Hour (h) " .. Minute .. " Minute (m) " .. Second .. " Second (s) ")
end
spawn(function()
    while wait() do
        UpdateTime()
        wait()
    end
end)
local Miragecheck = v1:AddParagraph({Title = "Mirage Island", Desc = "Status: "})
spawn(function()
    pcall(function()
    while wait() do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
            Miragecheck:SetDesc("✅️")
        else
            Miragecheck:SetDesc("❌️")
        end
    end
end)
end)
local Kitsunecheck = v1:AddParagraph({Title = "Kitsune Island", Desc = "Status: "})
spawn(function()
    pcall(function()
    while wait() do
        if game:GetService "Map":FindFirstChild("KitsuneIsland") then
            Kitsunecheck:SetDesc("✅️")
        else
            Kitsunecheck:SetDesc("❌️")
        end
    end
end)
end)
local CPrehistoriccheck = v1:AddParagraph({Title = "Prehistoric Island", Desc = "Status: "})
spawn(function()
    pcall(function()
    while wait() do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
            CPrehistoriccheck:SetDesc("✅️")
        else
            CPrehistoriccheck:SetDesc("❌️")
        end
    end
end)
end)
local FrozenIsland = v1:AddParagraph({Title = "Frozen Dimension", Desc = "Status: "})
spawn(function()
    pcall(function()
    while wait() do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
            FrozenIsland:SetDesc("✅️")
        else
            FrozenIsland:SetDesc("❌️")
        end
    end
end)
end)
local MobCakePrince = v1:AddParagraph({Title = "Dimension Killed", Desc = ""})
spawn(function()
    while wait() do
        pcall(function()
    local response = game:GetService "Remotes".CommF_:InvokeServer("CakePrinceSpawner")
    local len = string.len(response)
    if len == 88 then
        MobCakePrince:SetDesc("Kill : " .. string.sub(response, 39, 41))
    elseif len == 87 then
        MobCakePrince:SetDesc("Kill : " .. string.sub(response, 39, 40))
    elseif len == 86 then
        MobCakePrince:SetDesc("Kill : " .. string.sub(response, 39, 39) .. " ")
    else
        MobCakePrince:SetDesc("Cake Prince : ✅️")
    end
end)
    end
end)
local TyrantStatus = v1:AddParagraph({Title = "Tyrant of the Skies", Desc = "Status: "})
spawn(function()
    pcall(function()
    while wait() do
        if game:GetService "Enemies":FindFirstChild("Tyrant of the Skies") then
            TyrantStatus:SetDesc("Status : ✅️")
        else
            TyrantStatus:SetDesc("Status : ❌️")
        end
    end
end)
end)
local CheckRip = v1:AddParagraph({Title = "Rip_Indra", Desc = "Status: "})
spawn(function()
    while wait() do
        pcall(function()
    if game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game:GetService "Enemies":FindFirstChild("rip_indra") then
        CheckRip:SetDesc("Status : ✅️")
    else
        CheckRip:SetDesc("Status : ❌️")
    end
end)
    end
end)
local CheckDoughKing = v1:AddParagraph({Title = "Dough King", Desc = "Status: "})
spawn(function()
    while wait() do
        pcall(function()
    if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or game:GetService "Enemies":FindFirstChild("Dough King") then
        CheckDoughKing:SetDesc("Status : ✅️")
    else
        CheckDoughKing:SetDesc("Status : ❌️")
    end
end)
    end
end)
local EliteHunter = v1:AddParagraph({Title = "Elite Hunter", Desc = "Status: "})
spawn(function()
    while wait() do
        pcall(function()
    local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
    local value59 = game:GetService "Enemies"
    local progress = ReplicatedStorage2.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
    if ReplicatedStorage2:FindFirstChild("Diablo") or ReplicatedStorage2:FindFirstChild("Deandre") or ReplicatedStorage2:FindFirstChild("Urban") or game:GetService "Enemies":FindFirstChild("Diablo") or game:GetService "Enemies":FindFirstChild("Deandre") or game:GetService "Enemies":FindFirstChild("Urban") then
        EliteHunter:SetDesc("Status : ✅️ | Killed: " .. progress)
    else
        EliteHunter:SetDesc("Status : ❌️ | Killed: " .. progress)
    end
end)
    end
end)
local Pullever = v1:AddParagraph({Title = "Pull Lever", Desc = "Status: "})
spawn(function()
    while wait() do
        pcall(function()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
        Pullever:SetDesc("✅")
    else
        Pullever:SetDesc("❌")
    end
end)
    end
end)
local result7 = v1:AddParagraph({Title = "Full Moon", Desc = ""})
spawn(function()
    while wait() do
        pcall(function()
    local moonId = game:GetService "Sky".MoonTextureId
    if game:GetService "Sky".MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
        result7:SetDesc("Moon: 5/5")
    elseif game:GetService "Sky".MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
        result7:SetDesc("Moon: 4/5")
    elseif game:GetService "Sky".MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
        result7:SetDesc("Moon: 3/5")
    elseif game:GetService "Sky".MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
        result7:SetDesc("Moon: 2/5")
    elseif game:GetService "Sky".MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
        result7:SetDesc("Moon: 1/5")
    else
        result7:SetDesc("Moon: 0/5")
    end
end)
    end
end)
local LegendarySword = v1:AddParagraph({Title = "Legendary Sword", Desc = "Status: "})
spawn(function()
    pcall(function()
    while wait() do
        local value60 = game:GetService "Remotes".CommF_
        if game:GetService "Remotes".CommF_:InvokeServer("LegendarySwordDealer", "1") then
            LegendarySword:SetDesc("Shisui")
        elseif game:GetService "Remotes".CommF_:InvokeServer("LegendarySwordDealer", "2") then
            LegendarySword:SetDesc("Wando")
        elseif game:GetService "Remotes".CommF_:InvokeServer("LegendarySwordDealer", "3") then
            LegendarySword:SetDesc("Saddi")
        else
            LegendarySword:SetDesc("Not Found Legend Swords")
        end
    end
end)
end)
local Bone = v1:AddParagraph({Title = "Bone", Desc = ""})
spawn(function()
    pcall(function()
    while wait() do
        local bones = game:GetService "Remotes".CommF_:InvokeServer("Bones", "Check")
        Bone:SetDesc("You Have : " .. tostring(bones) .. " Bones")
    end
end)
end)
v1:AddTextBox({Name = "Input Job Id", Placeholder = "Job ID", ClearOnFocus = true, Callback = function(Value)
    getgenv().Job = Value
end})
v1:AddToggle({Title = "Spam Join", Default = false, Callback = function(Value)
    getgenv().Join = Value
end})
spawn(function()
    while wait() do
        if getgenv().Join then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job, game.Players.LocalPlayer)
        end
    end
end)
v1:AddButton({Title = "Join Server", Callback = function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job, game.Players.LocalPlayer)
end})
v1:AddButton({Title = "Copy JobId", Callback = function()
    setclipboard(tostring(game.JobId))
end})
v1:AddButton({Title = "Rejoin Server", Callback = function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService "LocalPlayer")
end})
v1:AddButton({Title = "Hop Server", Callback = function()
    Hop()
end})
v1:AddButton({Title = "Hop Server Less People", Callback = function()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local Players2 = game:GetService("Players")
    local localPlayer2 = Players2.LocalPlayer
    local placeId = game.PlaceId
    local concatenated = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local function ListServers(cursor)
        local Raw = game:HttpGet(concatenated .. (cursor and "&cursor=" .. cursor or ""))
        return HttpService:JSONDecode(Raw)
    end
    local Server, Next
    repeat
        local Servers = ListServers(Next)
        Server = Servers.data[1]
        Next = Servers.nextPageCursor
    until Server
    TeleportService:TeleportToPlaceInstance(game.PlaceId, Server.id, Players2.LocalPlayer)
end})
v4:AddDropdown({Name = "Select Attack Mode", Options = {"Normal Attack", "Fast Attack", "Super Attack", "Bear Attack", "Super Bear Attack"}, Default = "Fast Attack", Multi = false, Callback = function(mode)
    StartAttacksWithMode(mode)
end})
v4:AddToggle({Title = "Enable Fast Attack", Default = true, Callback = function(state)
    _G.Settings.FastAttack = state
    if state then
        StartAttacksWithMode(_G.Settings.FastAttackMode)
    else
        StopAllAttacks()
    end
end})
v4:AddToggle({Title = "Enable Auto Click", Default = false, Callback = function(state)
    _G.Settings.AutoClick = state
end})
v4:AddDropdown({Name = "Select target type", Options = {"Player", "NPC", "All"}, Default = "All", Callback = function(type)
    getgenv().GunAuraSettings.TargetType = type
end})
v4:AddSlider({Name = "Gun range", Min = 50, Max = 30000, Default = 500, Increment = 10, Callback = function(val)
    getgenv().GunAuraSettings.GunRange = val
end})
v4:AddToggle({Title = "Auto gun aura", Default = false, Callback = function(val)
    getgenv().GunAuraSettings.GunEnabled = val
end})
v4:AddToggle({Title = "Auto click when holding gun (2s)", Default = false, Callback = function(val)
    getgenv().AutoClickShootSettings.Enabled = val
    if not val then
        getgenv().AutoClickShootSettings.LastClickTime = 0
    end
end})
task.spawn(function()
    while true do
        pcall(performClick)
        task.wait(0.1)
    end
end)
local targetDisplay = v4:AddParagraph({Title = "Current Target", Content = "Searching..."})
task.spawn(function()
    while task.wait(0.5) do
        if getgenv().GunAuraSettings.GunEnabled and getgenv().GunAuraSettings.CurrentTarget then
            local target = getgenv().GunAuraSettings.CurrentTarget.Parent
            if getgenv().GunAuraSettings.CurrentTarget.Parent then
                local nPC = "NPC"
                if namedElement1:FindFirstChild(getgenv().GunAuraSettings.CurrentTarget.Parent.Name) then
                    nPC = "Player"
                elseif namedElement:FindFirstChild(getgenv().GunAuraSettings.CurrentTarget.Parent.Name) then
                    nPC = "NPC"
                end
                local humanoid = getgenv().GunAuraSettings.CurrentTarget.Parent:FindFirstChild("Humanoid")
                local logicalResult2 = humanoid and string.format(" - %.1f/%.1f HP (%.0f%%)", humanoid.Health, humanoid.MaxHealth, humanoid.Health / humanoid.MaxHealth * 100) or ""
                local logicalResult3 = Players1.LocalPlayer.Character and Players1.LocalPlayer.Character:GetPivot().Position
                local targetPos = getgenv().GunAuraSettings.CurrentTarget.Position
                local distText = ""
                if logicalResult3 and getgenv().GunAuraSettings.CurrentTarget.Position then
                    local dist = math.floor((getgenv().GunAuraSettings.CurrentTarget.Position - logicalResult3).Magnitude)
                    distText = string.format(" [%d studs]", dist)
                end
                targetDisplay:SetDesc(string.format(" [%s] %s%s%s", nPC, getgenv().GunAuraSettings.CurrentTarget.Parent.Name, logicalResult2, distText))
            else
                targetDisplay:SetDesc("Searching...")
            end
        else
            targetDisplay:SetDesc("Searching...")
        end
    end
end)
task.spawn(function()
    while true do
        pcall(applyGunDamage)
        task.wait(getgenv().GunAuraSettings.FireRate)
    end
end)
task.spawn(function()
    while task.wait(5) do
        pcall(setSimulationRadius)
    end
end)
v2:AddSection({"Auto Farm main"})
v2:AddDropdown({Name = "Select Weapon", Options = {"Melee", "Sword", "Blox Fruit", "Gun"}, Default = "Melee", Multi = false, Callback = function(param40)
    _G.ChooseWP = param40
end})
spawn(function()
    while wait(Sec) do
        pcall(function()
    for _, value61 in pairs(plr.Backpack:GetChildren()) do
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).ToolTip == _G.ChooseWP then
            if plr.Backpack:FindFirstChild(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name) then
                _G.SelectWeapon = ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name
            end
        end
    end
end)
    end
end)
_G.SelectedFarmMode = "Level"
_G.StartFarm = false
_G.Level = false
_G.AutoFarm_Bone = false
_G.AutoFarm_Cake = false
_G.AutoTyrant = false
_G.AcceptQuest = false
v2:AddDropdown({Name = "Select Farm Mode", Options = {"Level", "Bone", "Cake Prince", "Tyrant Of The Skies"}, Default = GetSetting("SelectedFarmMode_Save", "Level"), Callback = function(param41)
    _G.SelectedFarmMode = param41
    _G.SaveData.SelectedFarmMode_Save = param41
    SaveSettings()
end})
v2:AddToggle({Title = "Start Farm", Callback = function(param42)
    _G.StartFarm = param42
    _G.Level = false
    _G.AutoFarm_Bone = false
    _G.AutoFarm_Cake = false
    _G.AutoTyrant = false
    if param42 then
        do
            _G.Level = true
        end
    end
    _G.SaveData.StartFarm_Save = param42
    SaveSettings()
end})
v2:AddToggle({Title = "Accept Quests", Callback = function(param43)
    _G.AcceptQuest = param43
    _G.SaveData.AcceptQuest_Save = param43
    SaveSettings()
end})
spawn(function()
    game:GetService "Stepped":Connect(function()
end)
end)
spawn(function()
    while task.wait() do
    end
end)
spawn(function()
    while task.wait() do
    end
end)
spawn(function()
    while task.wait() do
    end
end)
spawn(function()
    while task.wait() do
    end
end)
v2:AddSection({"Other"})
_G.MaxFarmDistance = 325
local Players2 = game:GetService("Players")
local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
v2:AddToggle({Title = "Kill Mobs Nearest", Callback = function(param44)
    _G.AutoFarmNear = param44
    _G.SaveData.AutoFarmNear_Save = param44
    SaveSettings()
end})
spawn(function()
    while task.wait() do
        pcall(function()
    if not _G.AutoFarmNear then
        return
    end
    local localPlayer2 = Players2.LocalPlayer
    local logicalResult2 = Players2.LocalPlayer.Character or Players2.LocalPlayer.CharacterAdded:Wait()
    local humanoidRootPart = logicalResult2:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        return
    end
    local ClosestEnemy = nil
    local mathHuge = math.huge
    if workspace:FindFirstChild("Enemies") then
        for _, value62 in pairs(workspace.Enemies:GetChildren()) do
            if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):FindFirstChild("Humanoid") and ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):FindFirstChild("HumanoidRootPart") and ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Humanoid.Health > 0 then
                local dist = (humanoidRootPart.Position - ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).HumanoidRootPart.Position).Magnitude
                if dist < mathHuge then
                    mathHuge = dist
                    ClosestEnemy = {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}
                end
            end
        end
    end
    if ReplicatedStorage2:FindFirstChild("Enemies") then
        for _, value63 in pairs(ReplicatedStorage2.Enemies:GetChildren()) do
            if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):IsA("Model") and ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):FindFirstChild("Humanoid") then
                if not ClosestEnemy then
                    ClosestEnemy = {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}
                end
            end
        end
    end
    if ClosestEnemy and (false or math.huge <= 325) then
        repeat
            task.wait()
            if {} and ({}).Kill then
                ;({}).Kill(ClosestEnemy, _G.AutoFarmNear)
            end
        until not _G.AutoFarmNear or not ClosestEnemy.Parent or ClosestEnemy:FindFirstChild("Humanoid") and ClosestEnemy.Humanoid.Health <= 0 or not humanoidRootPart.Parent
    end
end)
    end
end)
if World2 then
    v2:AddToggle({Title = "Auto Factory Raid", Callback = function(Value)
    _G.AutoFactory = Value
    _G.SaveData.AutoFactory_Save = Value
    SaveSettings()
end})
    spawn(function()
    local cframe = CFrame.new(448.46756, 199.356781, -441.389252)
    while task.wait(0.5) do
        pcall(function()
    if not _G.AutoFactory then
        return
    end
    local Core = GetConnectionEnemies("Core")
    if Core and Core:FindFirstChild("Humanoid") and Core.Humanoid.Health > 0 then
        repeat
            task.wait()
            if not _G.AutoFactory then
                break
            end
            if not Core or not Core.Parent then
                break
            end
            if Core.Humanoid.Health <= 0 then
                break
            end
            if _G.SelectWeapon then
                EquipWeapon(_G.SelectWeapon)
            end
            _tp(cframe)
        until Core.Humanoid.Health <= 0 or _G.AutoFactory == false
    else
        _tp(cframe)
    end
end)
    end
end)
end
if World3 then
    v2:AddToggle({Title = "Auto Pirate Raid", Callback = function(param45)
    _G.AutoRaidCastle = param45
    _G.SaveData.AutoRaidCastle_Save = param45
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        if _G.AutoRaidCastle then
            pcall(function()
    local cframe = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 0.00000000737058015, 0.380223751, 0.000000035881019, 1, -0.000000106665446, -0.380223751, 0.000000112297109, 0.924894512)
    local cframe1 = CFrame.new(-5539.3115234375, 313.80053710938, -2972.3723144531)
    if (cframe1.Position - Root.Position).Magnitude <= 500 then
        for _, value64 in pairs(workspace.Enemies:GetChildren()) do
            if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):FindFirstChild("HumanoidRootPart") and ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):FindFirstChild("Humanoid") and ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Humanoid.Health > 0 then
                if (({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).HumanoidRootPart.Position - Root.Position).Magnitude <= 2000 then
                    repeat
                        wait()
                        ;({}).Kill({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}, _G.AutoRaidCastle)
                    until not _G.AutoRaidCastle or not ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Parent or ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Humanoid.Health <= 0 or not workspace.Enemies:FindFirstChild(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name)
                end
            end
        end
    else
        local EnemyList = {"Galley Pirate", "Galley Captain", "Raider", "Mercenary", "Vampire", "Zombie", "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate", "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior", "Snow Lurker", "Sea Soldier", "Water Fighter"}
        for _, enemyName in pairs(EnemyList) do
            if replicated:FindFirstChild(enemyName) then
                for _, value65 in pairs(replicated:GetChildren()) do
                    if table.find(EnemyList, ({Mob = "Mythological Pirate", Mob2 = "Cursed Skeleton", "Hell's Messenger", Mob3 = "Cursed Skeleton", "Heaven's Guardian"}).Name) then
                        _tp(cframe)
                    end
                end
            end
        end
    end
end)
        end
    end
end)
end
v2:AddSection({"Collect"})
v2:AddToggle({Title = "Auto Collect Chest", Callback = function(param46)
    _G.AutoFarmChest = param46
    _G.SaveData.AutoFarmChest_Save = param46
    SaveSettings()
end})
v2:AddToggle({Title = "Auto Collect Berry", Callback = function(param47)
    _G.AutoBerry = param47
    _G.SaveData.AutoBerry_Save = param47
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        if _G.AutoBerry then
            local cFrame = game:GetService("CollectionService")
            local value66 = ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).LocalPlayer
            cFrame:GetTagged("BerryBush")
            local mathHuge, value67 = math.huge
            for value68 = 1, 0, 1 do
                local value69 = ({Mob = "Mythological Pirate", Mob2 = "Cursed Skeleton", "Hell's Messenger", Mob3 = "Cursed Skeleton", "Heaven's Guardian"})[value68]
                for value70, value71 in pairs(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):GetAttributes()) do
                    if not BerryArray or table.find(BerryArray, {"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}) then
                        _tp(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Parent:GetPivot())
                        for value72 = 1, 0, 1 do
                            local value73 = ({Mob = "Mythological Pirate", Mob2 = "Cursed Skeleton", "Hell's Messenger", Mob3 = "Cursed Skeleton", "Heaven's Guardian"})[value72]
                            for value74, value75 in pairs(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):GetChildren()) do
                                if not BerryArray or table.find(BerryArray, {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}) then
                                    _tp(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).WorldPivot)
                                    fireproximityprompt(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).ProximityPrompt, math.huge)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.AutoFarmChest then
            pcall(function()
    local CollectionService = game:GetService("CollectionService")
    local Players3 = game:GetService("Players")
    local logicalResult2 = Players3.LocalPlayer.Character or Players3.LocalPlayer.CharacterAdded:Wait()
    local value76 = logicalResult2:GetPivot().Position
    local Chests = CollectionService:GetTagged("_ChestTagged")
    local mathHuge, nearestChest = math.huge, nil
    for _, chest in pairs(Chests) do
        local dist = (chest:GetPivot().Position - {"Part", "SpawnLocation", "Terrain", "WedgePart", "MeshPart"}).Magnitude
        if not SelectedIsland or chest:IsDescendantOf(SelectedIsland) then
            if not chest:GetAttribute("IsDisabled") and dist < mathHuge then
                mathHuge = dist
                nearestChest = chest
            end
        end
    end
    if nearestChest then
        _tp(nearestChest:GetPivot())
    end
end)
        end
    end
end)
v2:AddSection({"Material"})
v2:AddDropdown({Name = "Select Material", Options = MaterialList, Default = GetSetting("SelectMaterial_Save", nil), Multi = false, Callback = function(param48)
    getgenv().SelectMaterial = param48
    _G.SaveData.SelectMaterial_Save = param48
    SaveSettings()
end})
v2:AddToggle({Title = "Auto Farm", Callback = function(param49)
    getgenv().AutoMaterial = param49
    _G.SaveData.AutoMaterial_Save = param49
    SaveSettings()
end})
spawn(function()
    local function callback1(param50, param51)
        if param50:FindFirstChild("Humanoid") and param50:FindFirstChild("HumanoidRootPart") and param50.Humanoid.Health > 0 then
            if param50.Name == {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"} then
                repeat
                    wait()
                    ;({}).Kill(param50, getgenv().AutoMaterial)
                until not getgenv().AutoMaterial or not param50.Parent or param50.Humanoid.Health <= 0
            end
        end
    end
    while wait() do
        if getgenv().AutoMaterial then
            pcall(function()
    if getgenv().SelectMaterial then
        MaterialMon(getgenv().SelectMaterial)
        _tp(MPos)
    end
    for value77, value78 in ipairs(MMon) do
        for value79, value80 in pairs(workspace.Enemies:GetChildren()) do
            callback1({Mob = "Mythological Pirate", Mob2 = "Cursed Skeleton", "Hell's Messenger", Mob3 = "Cursed Skeleton", "Heaven's Guardian"}, {"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"})
        end
    end
    ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"})()
end)
        end
    end
end)
if World3 then
    v2:AddSection({"Bones"})
    v2:AddToggle({Title = "Trade Bone", Default = false, Callback = function(Value)
    _G.Rdbone = Value
end})
    spawn(function()
    while wait(0.1) do
        if _G.Rdbone then
            game:GetService "Remotes".CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
    end
end)
    v2:AddToggle({Title = "Auto Soul Reaper", Default = false, Callback = function(param52)
    _G.AutoHytHallow = param52
end})
    spawn(function()
    while wait(0.5) do
        if _G.AutoHytHallow then
            pcall(function()
    local mob = GetConnectionEnemies("Soul Reaper")
    if mob then
        repeat
            task.wait()
            ;({}).Kill(mob, _G.AutoHytHallow)
        until mob.Humanoid.Health <= 0 or not _G.AutoHytHallow
    else
        if not GetBP("Hallow Essence") then
            repeat
                task.wait(0.1)
                replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
            until not _G.AutoHytHallow or GetBP("Hallow Essence")
        else
            local cframe = CFrame.new(-8932.32, 146.83, 6062.55)
            repeat
                task.wait()
                _tp(cframe)
            until not _G.AutoHytHallow or (plr.Character.HumanoidRootPart.Position - cframe.Position).Magnitude <= 5
            EquipWeapon("Hallow Essence")
        end
    end
end)
        end
    end
end)
    local cframe = CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -0.000000000248005533, 0.18326205, -0.00000000178910387, 1, -0.00000000824392288, -0.18326205, -0.00000000843218029, -0.983064115)
    v2:AddToggle({Title = "Auto Pray", Default = false, Callback = function(param53)
    _G.Pray = param53
end})
    spawn(function()
    while wait(0.5) do
        if _G.Pray then
            pcall(function()
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = plr.Character.HumanoidRootPart
        if (plr.Character.HumanoidRootPart.Position - cframe.Position).Magnitude > 5 then
            repeat
                task.wait()
                _tp(cframe)
            until not _G.Pray or (plr.Character.HumanoidRootPart.Position - cframe.Position).Magnitude <= 5
        end
        if (plr.Character.HumanoidRootPart.Position - cframe.Position).Magnitude <= 5 then
            game:GetService "Remotes".CommF_:InvokeServer("gravestoneEvent", 1)
            task.wait(1)
        end
    end
end)
        end
    end
end)
    local cframe1 = CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -0.000000000248005533, 0.18326205, -0.00000000178910387, 1, -0.00000000824392288, -0.18326205, -0.00000000843218029, -0.983064115)
    v2:AddToggle({Title = "Auto Try Luck", Default = false, Callback = function(param54)
    _G.Trylux = param54
end})
    spawn(function()
    while wait(0.5) do
        if _G.Trylux then
            pcall(function()
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = plr.Character.HumanoidRootPart
        if (plr.Character.HumanoidRootPart.Position - cframe1.Position).Magnitude > 5 then
            repeat
                task.wait()
                _tp(cframe1)
            until not _G.Trylux or (plr.Character.HumanoidRootPart.Position - cframe1.Position).Magnitude <= 5
        end
        if (plr.Character.HumanoidRootPart.Position - cframe1.Position).Magnitude <= 5 then
            game:GetService "Remotes".CommF_:InvokeServer("gravestoneEvent", 2)
            task.wait(1)
        end
    end
end)
        end
    end
end)
end
if v2 then
    _G.AutoBoss = false
    _G.FarmAllBoss = false
    _G.AutoAcceptQuest = false
    _G.CurrentTargetBoss = nil
    _G.FindBoss = _G.FindBoss or Boss and "The Gorilla King"
    v2:AddSection({"Boss Farm"})
    local BossStatus = v2:AddParagraph({Title = "Boss Spawn Status", Desc = "Checking..."})
    task.spawn(function()
    while task.wait(1) do
        pcall(function()
    if _G.FindBoss and (game:GetService("ReplicatedStorage"):FindFirstChild(_G.FindBoss) or workspace.Enemies and workspace.Enemies:FindFirstChild(_G.FindBoss) or workspace:FindFirstChild(_G.FindBoss)) then
        BossStatus:SetDesc("✅ Boss Spawned")
    else
        BossStatus:SetDesc("❌ Boss Not Found")
    end
end)
    end
end)
    local BossDropdown = v2:AddDropdown({Name = "Select Boss", Options = Boss, Default = Boss and "The Gorilla King" or "The Gorilla King", Callback = function(param55)
    _G.FindBoss = param55
end})
    v2:AddButton({Title = "Refresh Boss List", Callback = function()
    local LiveBosses = {}
    local flag = false
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:GetAttribute("IsBoss") == true then
            if not table.find(LiveBosses, obj.Name) then
                table.insert(LiveBosses, obj.Name)
            end
        end
    end
    for _, obj in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
        if obj:IsA("Model") and obj:GetAttribute("IsBoss") == true then
            if not table.find(LiveBosses, obj.Name) then
                table.insert(LiveBosses, obj.Name)
            end
        end
    end
    if flag then
        table.sort(LiveBosses)
        BossDropdown:Refresh(LiveBosses, true)
    else
        BossDropdown:Refresh({"No Bosses Found"}, true)
    end
end})
    v2:AddToggle({Title = "Auto Farm Boss Select", Callback = function(param56)
    _G.AutoBoss = param56
    if param56 then
        _G.FarmAllBoss = false
    end
    _G.SaveData.AutoBoss_Save = param56
    SaveSettings()
end})
    v2:AddToggle({Title = "Accept Quest Boss", Callback = function(param57)
    _G.AutoAcceptQuest = param57
    _G.SaveData.AutoAcceptQuestBoss_Save = param57
    SaveSettings()
end})
    v2:AddToggle({Title = "Farm All Bosses", Callback = function(param58)
    _G.FarmAllBoss = param58
    if param58 then
        _G.AutoBoss = false
    end
    _G.CurrentTargetBoss = nil
    _G.SaveData.FarmAllBosses_Save = param58
    SaveSettings()
end})
    local function EquipWeaponBoss()
        local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if _G.SelectWeapon then
            local logicalResult2 = game.Players.LocalPlayer.Backpack:FindFirstChild(_G.SelectWeapon) or game.Players.LocalPlayer.Character:FindFirstChild(_G.SelectWeapon)
            if logicalResult2 and logicalResult2.Parent ~= game.Players.LocalPlayer.Character then
                hum:EquipTool(logicalResult2)
            end
        end
    end
    local function GoToBoss(targetBoss)
        local logicalResult2 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local logicalResult3 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        local logicalResult4 = targetBoss:FindFirstChild("HumanoidRootPart") or targetBoss:FindFirstChild("Torso")
        local result8 = logicalResult4.Position + Vector3.new(0, 22, 0)
        local hrpCFrame = CFrame.new(result8)
        EquipWeaponBoss()
        if (logicalResult2.Position - result8).Magnitude <= 5 then
            logicalResult2.CFrame = hrpCFrame
            logicalResult2.Velocity = Vector3.zero
            logicalResult2.AssemblyLinearVelocity = Vector3.zero
            logicalResult3.AutoRotate = false
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
        else
            if _tp then
                _tp(hrpCFrame)
            else
                logicalResult2.CFrame = hrpCFrame
            end
        end
    end
    task.spawn(function()
    while task.wait() do
        do
            task.wait(0.5)
            continue
        end
        local char = game.Players.LocalPlayer.Character
        local logicalResult2 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not logicalResult2 then
            task.wait(0.5)
            continue
        end
        local potentialBosses = {}
        local flag = false
        local function FastScan(container, isRS)
            for _, value81 in pairs(container:GetDescendants()) do
                if value81:IsA("Model") and value81:GetAttribute("IsBoss") == true then
                    if value81.Name ~= "Cursed Skeleton Boss" then
                        local humanoid = value81:FindFirstChild("Humanoid")
                        local logicalResult3 = value81:FindFirstChild("HumanoidRootPart") or value81:FindFirstChild("Torso")
                        if humanoid and humanoid.Health > 0 and logicalResult3 then
                            local dist = (logicalResult2.Position - logicalResult3.Position).Magnitude
                            if isRS then
                                table.insert(potentialBosses, {Model = value81, Distance = dist + 10000})
                            else
                                table.insert(potentialBosses, {Model = value81, Distance = dist})
                            end
                        end
                    end
                end
            end
        end
        FastScan(workspace, false)
        if not flag then
            FastScan(game:GetService("ReplicatedStorage"), true)
        end
        if #potentialBosses > 0 then
            table.sort(potentialBosses, function(param59, param60)
    return param59.Distance < param60.Distance
end)
            _G.CurrentTargetBoss = potentialBosses[1].Model
        else
            _G.CurrentTargetBoss = nil
        end
        task.wait(0.2)
    end
end)
    task.spawn(function()
    while task.wait() do
        pcall(function()
    if false then
        if QuestB then
            QuestB()
        end
        local flag = false
        local char = game.Players.LocalPlayer.Character
        if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            return
        end
        if flag then
            if (PosQBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                game:GetService "Remotes".CommF_:InvokeServer("StartQuest", Qname, Qdata)
            else
                if _tp then
                    _tp(PosQBoss)
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PosQBoss
                end
            end
            return
        end
        local logicalResult2 = workspace:FindFirstChild("Enemies") and workspace.Enemies:FindFirstChild(_G.FindBoss) or workspace:FindFirstChild(_G.FindBoss)
        if logicalResult2 and logicalResult2:FindFirstChild("Humanoid") and logicalResult2.Humanoid.Health > 0 then
            GoToBoss(logicalResult2)
        elseif PosB then
            if _tp then
                _tp(PosB)
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PosB
            end
        end
    elseif false then
    end
end)
    end
end)
    task.spawn(function()
    while task.wait(0.5) do
        if game.Players.LocalPlayer.Backpack and _G.ChooseWP then
            for _, value82 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).ToolTip == _G.ChooseWP then
                    _G.SelectWeapon = ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name
                end
            end
        end
    end
end)
end
if World3 then
    v2:AddSection({"Farm Mastery"})
    local logicalResult2 = {"Cookie Crafter", "Head Baker", "Baking Staff", "Cake Guard"} or {"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
    local logicalResult3 = {"Reborn Skeleton", "Posessed Mummy", "Demonic Soul", "Living Zombie"} or {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
    _G.SelectedIsland = "Cake"
    local function GetNearestMobFromList(mobList)
        local logicalResult4 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local closestMob, mathHuge = nil, math.huge
        for _, mob in pairs(workspace.Enemies:GetChildren()) do
            if items1.Alive(mob) and table.find(mobList, mob.Name) and mob:FindFirstChild("HumanoidRootPart") then
                local dist = (mob.HumanoidRootPart.Position - logicalResult4.Position).Magnitude
                if dist < mathHuge then
                    mathHuge = dist
                    closestMob = mob
                end
            end
        end
        return nil
    end
    local function HasAliveMob(mobList)
        for _, mob in pairs(workspace.Enemies:GetChildren()) do
            if items1.Alive(mob) and table.find(mobList, mob.Name) then
                return true
            end
        end
        return false
    end
    v2:AddDropdown({Name = "Select Island For Mastery", Options = {"Cake", "Bone"}, Default = GetSetting("SelectedIsland_Save", "Cake"), Callback = function(param61)
    _G.SelectedIsland = param61
    _G.SaveData.SelectedIsland_Save = param61
    SaveSettings()
end})
    v2:AddToggle({Title = "Auto Farm Mastery Fruit", Callback = function(param62)
    _G.FarmMastery_Dev = param62
    _G.SaveData.FarmMastery_Dev_Save = param62
    SaveSettings()
end})
    _G.FruitSkills = _G.FruitSkills or {Z = false, X = false, C = false, V = false, F = false}
    v2:AddToggle({Title = "Use Skill Z (Fruit)", Default = false, Callback = function(param63)
    _G.FruitSkills.Z = param63
end})
    v2:AddToggle({Title = "Use Skill X (Fruit)", Default = false, Callback = function(param64)
    _G.FruitSkills.X = param64
end})
    v2:AddToggle({Title = "Use Skill C (Fruit)", Default = false, Callback = function(param65)
    _G.FruitSkills.C = param65
end})
    v2:AddToggle({Title = "Use Skill V (Fruit)", Default = false, Callback = function(param66)
    _G.FruitSkills.V = param66
end})
    v2:AddToggle({Title = "Use Skill F (Fruit)", Default = false, Callback = function(param67)
    _G.FruitSkills.F = param67
end})
    local function UseFruitSkills()
        weaponSc("Blox Fruit")
        if _G.FruitSkills.Z then
            Useskills("Blox Fruit", "Z")
        end
        if _G.FruitSkills.X then
            Useskills("Blox Fruit", "X")
        end
        if _G.FruitSkills.C then
            Useskills("Blox Fruit", "C")
        end
        if _G.FruitSkills.V then
            Useskills("Blox Fruit", "V")
        end
        if _G.FruitSkills.F then
            vim1:SendKeyEvent(true, "F", false, game)
            vim1:SendKeyEvent(false, "F", false, game)
        end
    end
    spawn(function()
    RunSer.RenderStepped:Connect(function()
    if _G.FarmMastery_Dev then
        pcall(function()
    for _, value83 in pairs(plr.PlayerGui.Notifications:GetChildren()) do
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "NotificationTemplate" and string.find(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Text, "Skill locked!") then
            ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}):Destroy()
        end
    end
end)
    end
end)
end)
    spawn(function()
    while task.wait(0.5) do
        if _G.FarmMastery_Dev then
            pcall(function()
    local logicalResult4 = true and logicalResult2 or logicalResult3
    local mob = GetNearestMobFromList(logicalResult4)
    if mob then
        HealthM = mob.Humanoid.MaxHealth * 0.7
        repeat
            task.wait()
            if not mob.Parent or not mob:FindFirstChild("Humanoid") or mob.Humanoid.Health <= 0 or not mob:FindFirstChild("HumanoidRootPart") then
                mob = GetNearestMobFromList(logicalResult4)
                if not mob then
                    break
                end
            end
            MousePos = mob.HumanoidRootPart.Position
            if not mob:GetAttribute("Locked") then
                mob:SetAttribute("Locked", mob.HumanoidRootPart.CFrame)
            end
            PosMon = mob:GetAttribute "Position"
            BringEnemy()
            EquipWeapon(_G.SelectWeapon)
            if mob.Humanoid.Health <= HealthM then
                _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                UseFruitSkills()
            else
                weaponSc("Melee")
                _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            end
            if not HasAliveMob(logicalResult4) then
                break
            end
        until not _G.FarmMastery_Dev
    else
        do
            _tp(CFrame.new(-1943.6765, 251.5095, -12337.8808))
        end
    end
end)
        end
    end
end)
    v2:AddToggle({Title = "Auto Farm Mastery Gun", Callback = function(param68)
    _G.FarmMastery_G = param68
    _G.SaveData.FarmMastery_G_Save = param68
    SaveSettings()
end})
    spawn(function()
    while task.wait(0.5) do
        if _G.FarmMastery_G then
            pcall(function()
    local logicalResult4 = true and logicalResult2 or logicalResult3
    local mob = GetNearestMobFromList(logicalResult4)
    if mob then
        HealthM = mob.Humanoid.MaxHealth * 0.7
        repeat
            task.wait()
            if not mob.Parent or not mob:FindFirstChild("Humanoid") or mob.Humanoid.Health <= 0 or not mob:FindFirstChild("HumanoidRootPart") then
                mob = GetNearestMobFromList(logicalResult4)
                if not mob then
                    break
                end
            end
            MousePos = mob.HumanoidRootPart.Position
            if not mob:GetAttribute("Locked") then
                mob:SetAttribute("Locked", mob.HumanoidRootPart.CFrame)
            end
            PosMon = mob:GetAttribute "Position"
            BringEnemy()
            EquipWeapon(_G.SelectWeapon)
            if mob.Humanoid.Health <= HealthM then
                _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8))
                Useskills("Gun", "Z")
                Useskills("Gun", "X")
            else
                weaponSc("Melee")
                _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            end
            local modules2 = replicated:FindFirstChild("Modules")
            local logicalResult5 = modules2 and modules2:FindFirstChild("Net")
            local logicalResult6 = {"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"} and ({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"}):FindFirstChild("RE/ShootGunEvent")
            local logicalResult7 = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
            if logicalResult7 and logicalResult7.Name == "Skull Guitar" then
                SoulGuitar = true
                if logicalResult7:FindFirstChild("RemoteEvent") then
                    logicalResult7.RemoteEvent:FireServer("TAP", mob.HumanoidRootPart.Position)
                end
            elseif logicalResult7 and logicalResult6 then
                SoulGuitar = false
                logicalResult6:FireServer(mob.HumanoidRootPart.Position, {mob.HumanoidRootPart})
            end
            if not HasAliveMob(logicalResult4) then
                break
            end
        until not _G.FarmMastery_G
        SoulGuitar = false
    else
        do
            _tp(CFrame.new(-1943.6765, 251.5095, -12337.8808))
        end
    end
end)
        end
    end
end)
    _G.FarmMastery_S = _G.FarmMastery_S or false
    v2:AddToggle({Title = "Auto Farm Mastery All Sword", Callback = function(param69)
    _G.FarmMastery_S = param69
    _G.SaveData.FarmMastery_S_Save = param69
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.FarmMastery_S then
        local mob = GetNearestMobFromList(true and logicalResult2 or logicalResult3)
        local inventory = replicated.Remotes.CommF_:InvokeServer("getInventory")
        for _, item in next, inventory do
            if type(item) == "table" and item.Type == "Sword" then
                local name = item.Name
                if tonumber(item.Mastery) >= 1 and tonumber(item.Mastery) <= 599 then
                    if GetBP(name) then
                        if mob then
                            repeat
                                wait()
                                if not mob:GetAttribute("Locked") then
                                    mob:SetAttribute("Locked", mob.HumanoidRootPart.CFrame)
                                end
                                PosMon = mob:GetAttribute "Position"
                                BringEnemy()
                                weaponSc("Sword")
                                _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                if RandomCFrame then
                                    wait(0.1)
                                    _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
                                    wait(0.1)
                                    _tp(mob.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
                                    wait(0.1)
                                    _tp(mob.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
                                    wait(0.1)
                                    _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
                                    wait(0.1)
                                    _tp(mob.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
                                end
                            until _G.FarmMastery_S == false or not mob.Parent or mob.Humanoid.Health <= 0
                        else
                            if _G.SelectedIsland == "Cake" then
                                _tp(CFrame.new(-1943.6765, 251.5095, -12337.8808))
                            else
                                _tp(CFrame.new(-9495.6806, 453.5862, 5977.3486))
                            end
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer("LoadItem", name)
                    end
                    break
                elseif tonumber(item.Mastery) >= 600 then
                end
                break
            end
        end
    end
end)
    end
end)
end
v4:AddToggle({Title = "Auto Active Haki", Callback = function(param70)
    Boud = param70
    _G.SaveData.AutoHaki_Save = param70
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        pcall(function()
    if Boud then
        if not plr.Character:FindFirstChild("HasBuso") then
            replicated.Remotes.CommF_:InvokeServer("Buso")
        end
    end
end)
    end
end)
v4:AddToggle({Title = "Auto Active V3", Callback = function(param71)
    _G.RaceClickAutov3 = param71
    _G.SaveData.AutoActiveV3_Save = param71
    SaveSettings()
end})
v4:AddToggle({Title = "Auto Active V4", Callback = function(param72)
    _G.RaceClickAutov4 = param72
    _G.SaveData.AutoActiveV4_Save = param72
    SaveSettings()
end})
spawn(function()
    while wait(0.2) do
        pcall(function()
    if _G.RaceClickAutov3 then
        repeat
            replicated.Remotes.CommE:FireServer("ActivateAbility")
            wait(30)
        until not _G.RaceClickAutov3
    end
end)
    end
end)
spawn(function()
    while wait(0.2) do
        pcall(function()
    if _G.RaceClickAutov4 then
        if plr.Character:FindFirstChild("RaceEnergy") then
            if plr.Character:FindFirstChild "Value" == 1 then
                Useskills("nil", "Y")
            end
        end
    end
end)
    end
end)
v4:AddToggle({Title = "Anti AFK", Default = true, Callback = function(param73)
    _G.AntiAFK = param73
end})
plr.Idled:connect(function()
    vim2:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vim2:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
v4:AddToggle({Title = "Disable Notify", Callback = function(param74)
    RemoveDamage = param74
    _G.SaveData.DisableNotify_Save = param74
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        pcall(function()
    if RemoveDamage then
        replicated.Assets.GUI.DamageCounter.Enabled = false
        plr.PlayerGui.Notifications.Enabled = false
    else
        replicated.Assets.GUI.DamageCounter.Enabled = true
        plr.PlayerGui.Notifications.Enabled = true
    end
end)
    end
end)
v4:AddToggle({Title = "Walk on Water", Default = true, Callback = function(param75)
    _G.WalkWater_Part = param75
    local value84 = game:GetService "Map"["WaterBase-Plane"]
    if _G.WalkWater_Part then
        ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Size = Vector3.new(1000, 112, 1000)
    else
        ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Size = Vector3.new(1000, 80, 1000)
    end
end})
v4:AddTextBox({Title = "Bring Mobs Range", PlaceHolder = "235", Default = tostring(_G.BringRange), Callback = function(Value)
    local num = tonumber(Value)
    if num and num > 0 then
        _G.BringRange = num
    end
end})
v4:AddTextBox({Title = "Select Farm Height", PlaceHolder = "20", Default = tostring(_G.MobHeight), Callback = function(Value)
    local num = tonumber(Value)
    if num and num > 0 then
        _G.MobHeight = num
    end
end})
v4:AddTextBox({Title = "Tween Speed", PlaceHolder = "300", Default = "300", Callback = function(param76)
    if tonumber(param76) then
        getgenv().TweenSpeedFar = tonumber(param76)
    end
end})
_G.AutoHopAdmin = _G.AutoHopAdmin or false
local function HopServer()
    if not pcall(function()
    local response = game:HttpGet(string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", game.PlaceId))
    local data = game:GetService("HttpService"):JSONDecode(response)
    if data and data.data then
        for _, server in ipairs(data.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id, game:GetService "LocalPlayer")
                return true
            end
        end
    end
end) then
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService "LocalPlayer")
    end
end
v4:AddToggle({Title = "Auto Hop khi Admin Join", Callback = function(value)
    _G.AutoHopAdmin = value
    _G.SaveData.AutoHopAdmin_Save = value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(2) do
        if _G.AutoHopAdmin then
            pcall(function()
    local Players3 = game:GetService("Players")
    for _, player in ipairs(Players3:GetPlayers()) do
        if player ~= localPlayer and table.find({"red_game43", "rip_indra", "Axiore", "Polkster", "wenlocktoad", "Daigrock", "toilamvidamme", "oofficialnoobie", "Uzoth", "Azarth", "arlthmetic", "Death_King", "Lunoven", "TheGreateAced", "rip_fud", "drip_mama", "layandikit12", "Hingoi"}, player.Name) then
            HopServer()
            break
        end
    end
end)
        end
    end
end)
_G.NoClip = _G.NoClip or false
v4:AddToggle({Title = "No Clip", Callback = function(value)
    _G.NoClip = value
    _G.SaveData.NoClip_Save = value
    SaveSettings()
end})
spawn(function()
    local player = game:GetService "LocalPlayer"
    local RunService = game:GetService("RunService")
    RunService.Stepped:Connect(function()
    pcall(function()
    if game:GetService "LocalPlayer".Character and _G.NoClip then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    elseif game:GetService "LocalPlayer".Character and not _G.NoClip then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)
end)
end)
_G.AutoHopServer = _G.AutoHopServer or false
_G.HopDelay = _G.HopDelay or 1800
v4:AddSection({"Auto Hop"})
v4:AddToggle({Title = "Auto Hop Server", Callback = function(value)
    _G.AutoHopServer = value
    _G.SaveData.AutoHopServer_G_Save = value
    SaveSettings()
    if not value then
        _G.HopTimer = nil
    end
end})
v4:AddSlider({Name = "Hop Delay (Minutes)", Min = 5, Max = 120, Default = GetSetting("HopDelay_G_Save", 30), Increment = 1, Callback = function(value)
    _G.HopDelay = value * 60
    _G.SaveData.HopDelay_G_Save = value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(1) do
        if _G.AutoHopServer then
            pcall(function()
    if not _G.HopTimer then
        _G.HopTimer = tick()
    end
    if tick() - _G.HopTimer >= _G.HopDelay then
        _G.HopTimer = tick()
        Hop()
    end
end)
        else
            _G.HopTimer = nil
        end
    end
end)
v5:AddSection({"Fishing"})
local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
local fishReplicated = ReplicatedStorage3:WaitForChild("FishReplicated")
fishReplicated:WaitForChild("FishingRequest")
require(fishReplicated:WaitForChild("FishingClient"):WaitForChild("Config"))
require(ReplicatedStorage3:WaitForChild("Util"):WaitForChild("GetWaterHeightAtLocation"))
local net1 = ReplicatedStorage3:WaitForChild("Modules"):WaitForChild("Net")
local rF_Craft = net1:WaitForChild("RF/Craft")
local rF_JobsRemoteFunction = net1:WaitForChild("RF/JobsRemoteFunction")
net1:WaitForChild("RF/JobToolAbilities")
_G.SelectedRod = "Fishing Rod"
_G.SelectedBait = "Basic Bait"
_G.AutoBuyBait = false
_G.AutoFishing = false
_G.AutoFishingQuest = false
_G.AutoQuestComplete = false
_G.AutoSellFish = false
_G.AutoSkillZ = false
v5:AddDropdown({Name = "Select Fishing Rod", Options = {"Fishing Rod", "Gold Rod", "Shark Rod", "Shell Rod", "Treasure Rod"}, Default = GetSetting("Fish_SelectedRod", "Fishing Rod"), Callback = function(Value)
    _G.SelectedRod = Value
    _G.SaveData.Fish_SelectedRod = Value
    SaveSettings()
end})
v5:AddDropdown({Name = "Select Bait", Options = {"Basic Bait", "Kelp Bait", "Good Bait", "Abyssal Bait", "Frozen Bait", "Epic Bait", "Carnivore Bait"}, Default = GetSetting("Fish_SelectedBait", "Basic Bait"), Callback = function(Value)
    _G.SelectedBait = Value
    _G.SaveData.Fish_SelectedBait = Value
    SaveSettings()
end})
v5:AddToggle({Title = "Auto Buy Bait", Callback = function(Value)
    _G.AutoBuyBait = Value
    _G.SaveData.Fish_AutoBuyBait = Value
    SaveSettings()
    if Value then
        pcall(function()
    rF_Craft:InvokeServer("Craft", "Basic Bait", {})
end)
    end
end})
task.spawn(function()
    while task.wait(2) do
    end
end)
v5:AddToggle({Title = "Auto Fishing", Callback = function(Value)
    _G.AutoFishing = Value
    _G.SaveData.Fish_AutoFishing = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(0.5) do
    end
end)
if World1 then
    v3:AddSection({"Travel To Sea 2"})
    v3:AddToggle({Title = "Auto Quest Sea 2", Callback = function(Value)
    _G.TravelDres = Value
    _G.SaveData.TravelDres_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.TravelDres then
        if plr.Data.Level.Value >= 700 then
            local logicalResult2 = workspace.Map and workspace.Map:FindFirstChild("Ice") and workspace.Map.Ice:FindFirstChild("Door")
            if logicalResult2 then
                if logicalResult2.CanCollide == true and logicalResult2.Transparency == 0 then
                    replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                    EquipWeapon("Key")
                    repeat
                        wait()
                        _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                    until not _G.TravelDres or (Root.Position - CFrame.new(1347.7124, 37.3751602, -1325.6488).Position).Magnitude <= 5
                elseif logicalResult2.CanCollide == false and logicalResult2.Transparency == 1 then
                    if namedElement:FindFirstChild("Ice Admiral") then
                        for _, value85 in pairs(namedElement:GetChildren()) do
                            if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Ice Admiral" and ({}).Alive({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}) then
                                repeat
                                    task.wait()
                                    ;({}).Kill({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}, _G.TravelDres)
                                until _G.TravelDres == false or ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Humanoid.Health <= 0
                                replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                            end
                        end
                    else
                        _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                    end
                else
                    replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                end
            end
        end
    end
end)
    end
end)
end
if World2 then
    v3:AddSection({"Travel To Sea 3"})
    v3:AddToggle({Title = "Auto Quest Sea 3", Callback = function(Value)
    _G.AutoZou = Value
    _G.SaveData.AutoZou_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.AutoZou then
        if plr.Data.Level.Value >= 1500 then
            local bartiloProgress = replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
            if bartiloProgress == 0 then
                local QuestUI = plr.PlayerGui.Main.Quest
                if not plr.PlayerGui.Main.Quest.Visible then
                    _tp(CFrame.new(-456.28952, 73.0200958, 299.895966))
                    if (Root.Position - CFrame.new(-456.28952, 73.0200958, 299.895966).Position).Magnitude <= 5 then
                        wait(1)
                        replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
                    end
                else
                    if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") then
                        local mob = GetConnectionEnemies("Swan Pirate")
                        if mob then
                            repeat
                                wait()
                                ;({}).Kill(mob, _G.AutoZou)
                            until not _G.AutoZou or not mob.Parent or mob.Humanoid.Health <= 0 or not plr.PlayerGui.Main.Quest.Visible
                        else
                            _tp(CFrame.new(1057.92761, 137.614319, 1242.08069))
                        end
                    end
                end
            elseif bartiloProgress == 1 then
                local mob = GetConnectionEnemies("Jeremy")
                if mob then
                    repeat
                        wait()
                        ;({}).Kill(mob, _G.AutoZou)
                    until not _G.AutoZou or not mob.Parent or mob.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(2099.88159, 448.931, 648.997375))
                end
            elseif bartiloProgress == 2 then
                _tp(CFrame.new(-1836, 11, 1714))
                if (Root.Position - CFrame.new(-1836, 11, 1714).Position).Magnitude <= 10 then
                    wait(0.5)
                    notween(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
                    wait(0.1)
                    notween(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
                    wait(0.1)
                    notween(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
                    wait(0.1)
                    notween(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
                    wait(0.1)
                    notween(CFrame.new(-1869.54224, 15.987854, 1681.00659))
                    wait(0.1)
                    notween(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
                    wait(0.1)
                    notween(CFrame.new(-1819.26343, 14.795166, 1717.90625))
                    wait(0.1)
                    notween(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
                end
            else
                local unlockables = replicated.Remotes.CommF_:InvokeServer("GetUnlockables")
                if unlockables and unlockables.FlamingoAccess == nil then
                    replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "1")
                    wait(0.1)
                    replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "2")
                    wait(0.1)
                    replicated.Remotes.CommF_:InvokeServer("F_", "TalkTrevor", "3")
                else
                    replicated.Remotes.CommF_:InvokeServer("F_", "TravelZou")
                end
            end
        end
    end
end)
    end
end)
end
v5:AddToggle({Title = "Auto Quest Fishing", Callback = function(Value)
    _G.AutoFishingQuest = Value
    _G.SaveData.Fish_AutoQuest = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(1) do
    end
end)
v5:AddToggle({Title = "Auto Complete Quest", Callback = function(Value)
    _G.AutoQuestComplete = Value
    _G.SaveData.Fish_AutoComplete = Value
    SaveSettings()
    if Value then
        pcall(function()
    rF_JobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
end)
    end
end})
task.spawn(function()
    while task.wait(5) do
    end
end)
v5:AddToggle({Title = "Auto Sell Fish", Callback = function(Value)
    _G.AutoSellFish = Value
    _G.SaveData.Fish_AutoSell = Value
    SaveSettings()
    if Value then
        pcall(function()
    rF_JobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
end)
    end
end})
task.spawn(function()
    while task.wait(5) do
    end
end)
v5:AddToggle({Title = "Auto use skill of the rod", Callback = function(Value)
    _G.AutoSkillZ = Value
    _G.SaveData.Fish_AutoSkillZ = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(0.5) do
    end
end)
v3:AddSection({"Quests"})
v3:AddToggle({Title = "Auto Farm Observation", Callback = function(param77)
    _G.obsFarm = param77
    _G.SaveData.AutoObsFarm_Save = param77
    SaveSettings()
end})
spawn(function()
    while wait(0.2) do
        pcall(function()
    if _G.obsFarm then
        replicated.Remotes.CommE:FireServer("Ken", true)
        local dodgesLeft = plr:GetAttribute("KenDodgesLeft")
        if dodgesLeft == 0 then
            KenTest = false
        elseif dodgesLeft and dodgesLeft > 0 then
            replicated.Remotes.CommE:FireServer("Ken", true)
            KenTest = true
        end
    end
end)
    end
end)
spawn(function()
    while wait(0.2) do
        pcall(function()
    if _G.obsFarm then
        local targetEnemy = nil
        local farmPos = nil
        if World1 then
            targetEnemy = workspace.Enemies:FindFirstChild("Galley Captain")
            farmPos = CFrame.new(5533.29785, 88.1079102, 4852.3916)
        elseif World2 then
            targetEnemy = workspace.Enemies:FindFirstChild("Lava Pirate")
            farmPos = CFrame.new(-5478.39209, 15.9775667, -5246.9126)
        elseif World3 then
            targetEnemy = workspace.Enemies:FindFirstChild("Venomous Assailant")
            farmPos = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
        end
        if targetEnemy then
            if KenTest then
                repeat
                    wait()
                    _tp(targetEnemy.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                until _G.obsFarm == false or KenTest == false
            else
                repeat
                    wait()
                    _tp(targetEnemy.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                until _G.obsFarm == false or KenTest
            end
        elseif farmPos then
            _tp(farmPos)
        end
    end
end)
    end
end)
if World3 then
    v3:AddToggle({Title = "Auto Observation V2", Callback = function(param78)
    _G.AutoKenVTWO = param78
    _G.SaveData.AutoKenV2_Save = param78
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        if _G.AutoKenVTWO then
            pcall(function()
    local cFrame = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
    if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates") then
        local cFrame1 = GetConnectionEnemies("Forest Pirate")
        if cFrame1 then
            repeat
                wait()
                ;({}).Kill(cFrame1, _G.AutoKenVTWO)
            until not _G.AutoKenVTWO or cFrame1.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
        else
            _tp({Mob = "Mythological Pirate", Mob2 = "Cursed Skeleton", "Hell's Messenger", Mob3 = "Cursed Skeleton", "Heaven's Guardian"})
        end
    elseif plr.PlayerGui.Main.Quest.Visible == true then
        local cFrame1 = GetConnectionEnemies("Captain Elephant")
        if cFrame1 then
            repeat
                wait()
                ;({}).Kill(cFrame1, _G.AutoKenVTWO)
            until not _G.AutoKenVTWO or cFrame1.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
        else
            _tp({"Part", "SpawnLocation", "Terrain", "WedgePart", "MeshPart"})
        end
    elseif plr.PlayerGui.Main.Quest.Visible == false then
        replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
        wait(0.1)
        replicated.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
    end
    if replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
        _tp(CFrame.new(-12513.51953125, 340.11373901367, -9873.048828125))
    end
    if not plr.Backpack:FindFirstChild("Fruit Bowl") or not plr.Character:FindFirstChild("Fruit Bowl") then
        if not GetBP("Fruit Bowl") then
            if not GetBP("Apple") then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                for value86, value87 in pairs(workspace:GetDescendants()) do
                    if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Apple" then
                        ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                        wait()
                        firetouchinterest(plr.Character.HumanoidRootPart, ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Handle, 0)
                        wait()
                    end
                end
            elseif not GetBP("Banana") then
                _tp(CFrame.new(2286.0078125, 73.133918762207, -7159.8090820312))
                for value88, value89 in pairs(workspace:GetDescendants()) do
                    if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Banana" then
                        ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                        wait()
                        firetouchinterest(plr.Character.HumanoidRootPart, ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Handle, 0)
                        wait()
                    end
                end
            elseif not GetBP("Pineapple") then
                _tp(CFrame.new(-712.82727050781, 98.577049255371, 5711.9541015625))
                for value90, value91 in pairs(workspace:GetDescendants()) do
                    if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Pineapple" then
                        ;({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                        wait()
                        firetouchinterest(plr.Character.HumanoidRootPart, ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Handle, 0)
                        wait()
                    end
                end
            end
        end
        if plr.Backpack:FindFirstChild("Banana") and plr.Backpack:FindFirstChild("Apple") and plr.Backpack:FindFirstChild("Pineapple") or plr:FindFirstChild("Banana") and plr:FindFirstChild("Apple") and plr:FindFirstChild("Pineapple") then
            repeat
                wait()
                _tp(cFrame)
            until _G.AutoKenVTWO or plr.Character.HumanoidRootPart.CFrame == cFrame
            replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
        end
        if plr.Backpack:FindFirstChild("Fruit Bowl") or plr.Character:FindFirstChild("Fruit Bowl") then
            if plr.Character.HumanoidRootPart.CFrame ~= {"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"} then
                _tp({"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"})
            elseif plr.Character.HumanoidRootPart.CFrame == {"Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral"} then
                replicated.Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                wait(0.1)
                replicated.Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
            end
        end
    end
end)
        end
    end
end)
    v3:AddToggle({Title = "Auto Citizen Quest", Default = false, Callback = function(param79)
    _G.CitizenQuest = param79
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.CitizenQuest then
        if Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer "KilledBandits" == false then
            if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
                local cFrame = GetConnectionEnemies("Forest Pirate")
                if cFrame then
                    repeat
                        task.wait()
                        ;({}).Kill(cFrame, _G.CitizenQuest)
                    until _G.CitizenQuest == false or not cFrame.Parent or cFrame.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                else
                    _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                end
            else
                _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - plr.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                    wait(1.5)
                    replicated.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                end
            end
        elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer "KilledBoss" == false then
            local cFrame = GetConnectionEnemies("Captain Elephant")
            if plr.PlayerGui.Main.Quest.Visible and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and plr.PlayerGui.Main.Quest.Visible == true then
                if cFrame then
                    repeat
                        task.wait()
                        ;({}).Kill(cFrame, _G.CitizenQuest)
                    until _G.CitizenQuest == false or cFrame.Humanoid.Health <= 0 or not cFrame.Parent or plr.PlayerGui.Main.Quest.Visible == false
                else
                    _tp(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                end
            else
                _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                    wait(1.5)
                    replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                end
            end
        elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
            _tp(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
        end
    end
end)
    end
end)
    v3:AddSection({"Cursed Swords"})
    local EliteProgressPara = v3:AddParagraph({Title = "Elites Process ", Desc = ""})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    EliteProgressPara:SetDesc("Elite Procress :  " .. replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
end)
    end
end)
    v3:AddToggle({Title = "Auto Elite Quest", Callback = function(param80)
    _G.FarmEliteHunt = param80
    _G.SaveData.AutoEliteQuest_Save = param80
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.FarmEliteHunt then
        if plr.PlayerGui.Main.Quest.Visible == true then
            if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") then
                for value92, value93 in pairs(replicated:GetChildren()) do
                    if string.find(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name, "Diablo") or string.find(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name, "Urban") or string.find(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name, "Deandre") then
                        _tp(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).HumanoidRootPart.CFrame)
                    end
                end
                for value94, value95 in pairs(namedElement:GetChildren()) do
                    if (string.find(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name, "Diablo") or string.find(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name, "Urban") or string.find(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name, "Deandre")) and ({}).Alive({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}) then
                        repeat
                            wait()
                            ;({}).Kill({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}, _G.FarmEliteHunt)
                        until not _G.FarmEliteHunt or plr.PlayerGui.Main.Quest.Visible == false or not ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Parent or ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Humanoid.Health <= 0
                    end
                end
            end
        else
            replicated.Remotes.CommF_:InvokeServer("EliteHunter")
        end
    end
end)
    end
end)
    v3:AddToggle({Title = "Stop when got God's Chalice", Callback = function(param81)
    _G.StopWhenChalice = param81
    _G.SaveData.StopChalice_Save = param81
    SaveSettings()
end})
    spawn(function()
    while wait(0.2) do
        if _G.StopWhenChalice and _G.FarmEliteHunt then
            pcall(function()
    if GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness") then
        _G.FarmEliteHunt = false
    end
end)
        end
    end
end)
    v3:AddToggle({Title = "Auto Tushita Sword", Default = false, Callback = function(param82)
    _G.Auto_Tushita = param82
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.Auto_Tushita then
        if workspace.Map.Turtle:FindFirstChild("TushitaGate") then
            if not GetBP("Holy Torch") then
                _tp(CFrame.new(5148.03613, 162.352493, 910.548218))
                wait(0.7)
            else
                EquipWeapon("Holy Torch")
                task.wait(1)
                repeat
                    task.wait()
                    _tp(CFrame.new(-10752, 417, -9366))
                until not _G.Auto_Tushita or (CFrame.new(-10752, 417, -9366).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                wait(0.7)
                repeat
                    task.wait()
                    _tp(CFrame.new(-11672, 334, -9474))
                until not _G.Auto_Tushita or (CFrame.new(-11672, 334, -9474).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                wait(0.7)
                repeat
                    task.wait()
                    _tp(CFrame.new(-12132, 521, -10655))
                until not _G.Auto_Tushita or (CFrame.new(-12132, 521, -10655).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                wait(0.7)
                repeat
                    task.wait()
                    _tp(CFrame.new(-13336, 486, -6985))
                until not _G.Auto_Tushita or (CFrame.new(-13336, 486, -6985).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                wait(0.7)
                repeat
                    task.wait()
                    _tp(CFrame.new(-13489, 332, -7925))
                until not _G.Auto_Tushita or (CFrame.new(-13489, 332, -7925).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
            end
        else
            local cFrame = GetConnectionEnemies("Longma")
            if cFrame then
                repeat
                    task.wait()
                    ;({}).Kill(cFrame, _G.Auto_Tushita)
                until cFrame.Humanoid.Health <= 0 or not _G.Auto_Tushita or not cFrame.Parent
            else
                if replicated:FindFirstChild("Longma") then
                    _tp(replicated:FindFirstChild "HumanoidRootPart".CFrame * CFrame.new(0, 40, 0))
                end
            end
        end
    end
end)
    end
end)
    v3:AddToggle({Title = "Auto Yama Sword", Callback = function(param83)
    _G.Auto_Yama = param83
    _G.SaveData.AutoYama_Save = param83
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.Auto_Yama then
        if replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then
            _G.FarmEliteHunt = true
        elseif replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") > 30 then
            _G.FarmEliteHunt = false
            if (workspace.Map.Waterfall.SealedKatana.Handle.Position - plr.Character.HumanoidRootPart.Position).Magnitude >= 20 then
                _tp(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
                local cFrame = GetConnectionEnemies("Ghost")
                if cFrame then
                    repeat
                        wait()
                        ;({}).Kill(cFrame, _G.Auto_Yama)
                    until cFrame.Humanoid.Health <= 0 or not cFrame.Parent or not _G.Auto_Yama
                    fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
                end
            end
        end
    end
end)
    end
end)
end
if World2 or World3 then
    v3:AddSection({"Buso/Aura Colours"})
    v3:AddToggle({Title = "Teleport Barista Haki", Callback = function(param84)
    _G.Tp_MasterA = param84
    _G.SaveData.TpBarista_Save = param84
    SaveSettings()
end})
    spawn(function()
    while wait() do
        if _G.Tp_MasterA then
            pcall(function()
    for _, value96 in pairs(replicated.NPCs:GetChildren()) do
        if ({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).Name == "Barista Cousin" then
            _tp(({"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}).HumanoidRootPart.CFrame)
        end
    end
end)
        end
    end
end)
    v3:AddButton({Title = "Buy Buso Colors", Callback = function()
    replicated.Remotes.CommF_:InvokeServer("ColorsDealer", "2")
end})
end
if World3 then
    v3:AddToggle({Title = "Auto Rainbow Haki", Callback = function(param85)
    _G.Auto_Rainbow_Haki = param85
    _G.SaveData.AutoRainbowHaki_Save = param85
    SaveSettings()
end})
    spawn(function()
    pcall(function()
    while wait(0.5) do
    end
end)
end)
end
v3:AddToggle({Title = "Accept Quest Bypass [Risk]", Callback = function(param86)
    _G.GetQFast = param86
    _G.SaveData.BypassQuest_Save = param86
    SaveSettings()
end})
v3:AddSection({"Item"})
if World2 then
    v3:AddToggle({Title = "Auto Dragon Trident", Callback = function(Value)
    _G.AutoTridentW2 = Value
    _G.SaveData.AutoTridentW2_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.AutoTridentW2 then
        local boss = GetConnectionEnemies("Tide Keeper")
        if boss then
            repeat
                task.wait()
                ;({}).Kill(boss, _G.AutoTridentW2)
            until _G.AutoTridentW2 == false or not boss.Parent or boss.Humanoid.Health <= 0
        else
            _tp(CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188))
        end
    end
end)
    end
end)
end
if World1 then
    v3:AddToggle({Title = "Auto Saw Sword", Callback = function(Value)
    _G.AutoSaw = Value
    _G.SaveData.AutoSaw_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.2) do
        pcall(function()
    if _G.AutoSaw then
        local boss = GetConnectionEnemies("The Saw")
        if boss then
            repeat
                task.wait()
                ;({}).Kill(boss, _G.AutoSaw)
            until _G.AutoSaw == false or boss.Humanoid.Health <= 0
        else
            _tp(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))
        end
    end
end)
    end
end)
end
if World2 then
    v3:AddToggle({Title = "Auto Swan Coat", Callback = function(Value)
    _G.SwanCoat = Value
    _G.SaveData.SwanCoat_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.SwanCoat then
        local boss = GetConnectionEnemies("Swan")
        if boss then
            repeat
                wait()
                ;({}).Kill(boss, _G.SwanCoat)
            until _G.SwanCoat == false or not boss.Parent or boss.Humanoid.Health <= 0
        else
            _tp(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))
        end
    end
end)
    end
end)
end
if World1 then
    v3:AddToggle({Title = "Auto Marine Coat", Callback = function(Value)
    _G.MarinesCoat = Value
    _G.SaveData.MarinesCoat_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.MarinesCoat then
        local boss = GetConnectionEnemies("Vice Admiral")
        if boss then
            repeat
                wait()
                ;({}).Kill(boss, _G.MarinesCoat)
            until _G.MarinesCoat == false or not boss.Parent or boss.Humanoid.Health <= 0
        else
            _tp(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))
        end
    end
end)
    end
end)
end
if World1 then
    v3:AddToggle({Title = "Auto Warden Sword", Callback = function(Value)
    _G.WardenBoss = Value
    _G.SaveData.WardenBoss_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.WardenBoss then
        local boss = GetConnectionEnemies("Chief Warden")
        if boss then
            repeat
                wait()
                ;({}).Kill(boss, _G.WardenBoss)
            until _G.WardenBoss == false or not boss.Parent or boss.Humanoid.Health <= 0
        else
            _tp(CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -0.0000280422337, -0.939682961, 0.00181045406, 0.342041939))
        end
    end
end)
    end
end)
end
if World1 then
    v3:AddToggle({Title = "Auto Cyborg Sword", Callback = function(Value)
    _G.AutoColShad = Value
    _G.SaveData.AutoColShad_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.2) do
        if _G.AutoColShad then
            pcall(function()
    local boss = GetConnectionEnemies("Cyborg")
    if boss then
        repeat
            task.wait()
            ;({}).Kill(boss, _G.AutoColShad)
        until _G.AutoColShad == false or not boss.Parent or boss.Humanoid.Health <= 0
    else
        _tp(CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813))
    end
end)
        end
    end
end)
end
if World2 then
    v3:AddToggle({Title = "Auto Midnight Blade", Callback = function(Value)
    _G.AutoEcBoss = Value
    _G.SaveData.AutoEcBoss_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.AutoEcBoss then
        if GetM("Ectoplasm") >= 99 then
            replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
        elseif GetM("Ectoplasm") <= 99 then
            local boss = GetConnectionEnemies("Cursed Captain")
            if boss then
                repeat
                    wait()
                    ;({}).Kill(boss, _G.AutoEcBoss)
                until not _G.AutoEcBoss or not boss.Parent or boss.Humanoid.Health <= 0
            else
                local vector3 = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                if (plr.Character.HumanoidRootPart.Position - vector3).Magnitude > 500 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", vector3)
                end
                wait(0.5)
                _tp(CFrame.new(916.928589, 181.092773, 33422))
            end
        end
    end
end)
    end
end)
end
if World2 then
    v3:AddToggle({Title = "Auto Rengoku Sword", Callback = function(Value)
    _G.IceBossRen = Value
    _G.SaveData.IceBossRen_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.IceBossRen then
        local boss = GetConnectionEnemies("Awakened Ice Admiral")
        if boss then
            repeat
                task.wait()
                ;({}).Kill(boss, _G.IceBossRen)
            until _G.IceBossRen == false or not boss.Parent or boss.Humanoid.Health <= 0
        else
            _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
        end
    end
end)
    end
end)
    v3:AddToggle({Title = "Auto Rengoku Key", Callback = function(Value)
    _G.KeysRen = Value
    _G.SaveData.KeysRen_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.KeysRen then
        if GetBP("Hidden Key") then
            EquipWeapon("Hidden Key")
            wait(0.1)
            _tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
        else
            local mobs = {"Snow Lurker", "Arctic Warrior", "Awakened Ice Admiral"}
            local targetMob = GetConnectionEnemies(mobs)
            if targetMob then
                repeat
                    task.wait()
                    ;({}).Kill(targetMob, _G.KeysRen)
                until GetBP("Hidden Key") or _G.KeysRen == false or not targetMob.Parent or targetMob.Humanoid.Health <= 0
            else
                _tp(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
            end
        end
    end
end)
    end
end)
end
if World2 or World3 then
    v3:AddToggle({Title = "Auto Pole V2 [Beta]", Callback = function(Value)
    _G.AutoPoleV2 = Value
    _G.SaveData.AutoPoleV2_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.AutoPoleV2 then
        if not GetBP("Pole (1st Form)") then
            replicated.Remotes.CommF_:InvokeServer("LoadItem", "Pole (1st Form)")
        end
        if not GetBP("Pole (2nd Form)") then
            replicated.Remotes.CommF_:InvokeServer("LoadItem", "Pole (2nd Form)")
        end
        if GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)"):FindFirstChild("Level") and GetBP("Pole (1st Form)").Level.Value < 180 then
            _G.StartFarm = true
            _G.Level = true
        elseif GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value >= 180 then
            _G.Level = false
            _G.StartFarm = false
        end
        if GetBP("Rumble Fruit") then
            local rumble = GetBP("Rumble Fruit")
            if rumble:FindFirstChild("AwakenedMoves") and rumble.AwakenedMoves:FindFirstChild("Z") and rumble.AwakenedMoves:FindFirstChild("X") and rumble.AwakenedMoves:FindFirstChild("C") and rumble.AwakenedMoves:FindFirstChild("V") and rumble.AwakenedMoves:FindFirstChild("F") then
                if plr.Data.Fragments.Value >= 5000 then
                    replicated.Remotes.CommF_:InvokeServer("Thunder God", "Talk")
                    wait(0.5)
                    replicated.Remotes.CommF_:InvokeServer("Thunder God", "Sure")
                end
            elseif replicated.Remotes.CommF_:InvokeServer("Awakener", "Check") == nil or replicated.Remotes.CommF_:InvokeServer("Awakener", "Check") == 0 then
                _G.SelectChip = "Rumble"
                _G.Raiding = true
                _G.Auto_Awakener = true
            end
        end
    end
end)
    end
end)
end
if World1 then
    v3:AddToggle({Title = "Auto Bisento V2", Callback = function(Value)
    _G.Greybeard = Value
    _G.SaveData.Greybeard_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        if _G.Greybeard then
            pcall(function()
    if not GetWP("Bisento") then
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    elseif GetWP("Bisento") then
        local boss = GetConnectionEnemies("Greybeard")
        if boss then
            repeat
                wait()
                ;({}).Kill(boss, _G.Greybeard)
            until _G.Greybeard == false or not boss.Parent or boss.Humanoid.Health <= 0
        else
            _tp(CFrame.new(-5023.3833007812, 28.652032852173, 4332.3818359375))
        end
    end
end)
        end
    end
end)
end
if World3 then
    v3:AddToggle({Title = "Auto Skull Guitar", Callback = function(Value)
    _G.Auto_Soul_Guitar = Value
    _G.SaveData.Auto_Soul_Guitar_Save = Value
    SaveSettings()
end})
    local SoulGuitarStatus = v3:AddParagraph({Title = "Skull Guitar Quest", Desc = "Inactive"})
    task.spawn(function()
    while task.wait(1) do
        if _G.Auto_Soul_Guitar then
            local questStatus = replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
            if questStatus then
                local unknown = "Unknown"
                if questStatus.Swamp == false then
                    unknown = "Quest 1: Swamp"
                elseif questStatus.Gravestones == false then
                    unknown = "Quest 2: Gravestones"
                elseif questStatus.Ghost == false then
                    unknown = "Quest 3: Ghost"
                elseif questStatus.Trophies == false then
                    unknown = "Quest 4: Trophies"
                elseif questStatus.Pipes == false then
                    unknown = "Quest 5: Pipes"
                else
                    unknown = "Final Step/Complete"
                end
                SoulGuitarStatus:SetDesc(unknown)
            end
        else
            SoulGuitarStatus:SetDesc("Disabled")
        end
    end
end)
end
if World3 then
    v3:AddSection({"Cursed Dual Katana (CDK)"})
    local CDKProgress = v3:AddParagraph({Title = "CDK Progress", Desc = "Check quest progress..."})
    task.spawn(function()
    while task.wait(2) do
        pcall(function()
    local progress = replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
    if progress and type(progress) == "table" then
        CDKProgress:SetDesc(string.format("Good: %s | Evil: %s", tostring(progress.Good or 0), tostring(progress.Evil or 0)))
    end
end)
    end
end)
    v3:AddToggle({Title = "Auto Yama CDK", Callback = function(Value)
    _G.CDK_YM = Value
    _G.SaveData.CDK_YM_Save = Value
    SaveSettings()
end})
    v3:AddToggle({Title = "Auto Tushita CDK", Callback = function(Value)
    _G.CDK_TS = Value
    _G.SaveData.CDK_TS_Save = Value
    SaveSettings()
end})
    v3:AddToggle({Title = "Auto Kill Cursed Skeleton Boss", Callback = function(Value)
    _G.CDK = Value
    _G.SaveData.CDK_Boss_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.CDK then
        local boss = GetConnectionEnemies("Cursed Skeleton Boss")
        if boss then
            repeat
                wait()
                if GetBP("Yama") or GetBP("Tushita") then
                    EquipWeapon(GetBP("Yama") and "Yama" or "Tushita")
                end
                _tp(boss.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                ;({}).Kill(boss, _G.CDK)
            until not _G.CDK or not boss.Parent or boss.Humanoid.Health <= 0
        else
            _tp(CFrame.new(-12318.193359375, 601.95184326172, -6538.662109375))
            wait(0.5)
            _tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
        end
    end
end)
    end
end)
end
if World3 then
    v3:AddSection({"True Triple Katana"})
    v3:AddButton({Title = "Buy Legendary Sword", Callback = function()
    replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
    replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
    replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
end})
    v3:AddButton({Title = "Buy True Triple Katana", Callback = function()
    replicated.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
end})
    v3:AddToggle({Title = "Teleport to Legendary Sword Dealer", Callback = function(Value)
    _G.Tp_LgS = Value
    _G.SaveData.Tp_LgS_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        if _G.Tp_LgS then
            pcall(function()
    for _, npc in pairs(replicated.NPCs:GetChildren()) do
        if npc.Name == "Legendary Sword Dealer" then
            _tp(npc.HumanoidRootPart.CFrame)
        end
    end
end)
        end
    end
end)
end
if World2 then
    v3:AddToggle({Title = "Auto Swan Glasses", Callback = function(Value)
    _G.Auto_SwanGG = Value
    _G.SaveData.Auto_SwanGG_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.2) do
        if _G.Auto_SwanGG then
            pcall(function()
    local boss = GetConnectionEnemies("Don Swan")
    if boss then
        repeat
            wait()
            ;({}).Kill(boss, _G.Auto_SwanGG)
        until _G.Auto_SwanGG == false or not boss.Parent or boss.Humanoid.Health <= 0
    else
        _tp(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
    end
end)
        end
    end
end)
end
if World3 then
    v3:AddToggle({Title = "Auto Canvendish Sword", Callback = function(Value)
    _G.Auto_Cavender = Value
    _G.SaveData.Auto_Cavender_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.Auto_Cavender then
        local boss = GetConnectionEnemies("Beautiful Pirate")
        if boss then
            repeat
                wait()
                ;({}).Kill(boss, _G.Auto_Cavender)
            until not _G.Auto_Cavender or boss.Humanoid.Health <= 0
        else
            _tp(CFrame.new(5283.609375, 22.56223487854, -110.78285217285))
        end
    end
end)
    end
end)
end
if World3 then
    v3:AddToggle({Title = "Auto Bigmom (Cake Queen)", Callback = function(Value)
    _G.AutoBigmom = Value
    _G.SaveData.AutoBigmom_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        if _G.AutoBigmom then
            pcall(function()
    local boss = GetConnectionEnemies("Cake Queen")
    if boss then
        repeat
            task.wait()
            ;({}).Kill(boss, _G.AutoBigmom)
        until not _G.AutoBigmom or not boss.Parent or boss.Humanoid.Health <= 0
    else
        _tp(CFrame.new(-709.31329345703, 381.6005859375, -11011.396484375))
    end
end)
        end
    end
end)
end
if World3 then
    v3:AddToggle({Title = "Auto Training Dummy", Callback = function(Value)
    _G.DummyMan = Value
    _G.SaveData.DummyMan_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.5) do
        if _G.DummyMan then
            pcall(function()
    if plr.PlayerGui.Main.Quest.Visible == false then
        replicated.Remotes.CommF_:InvokeServer("ArenaTrainer")
    else
        local dummy = GetConnectionEnemies("Training Dummy")
        if dummy then
            repeat
                wait()
                ;({}).Kill(dummy, _G.DummyMan)
            until not _G.DummyMan or not dummy.Parent or dummy.Humanoid.Health <= 0
        else
            _tp(CFrame.new(3688.0051269531, 12.746943473816, 170.20953369141))
        end
    end
end)
        end
    end
end)
end
v6:AddSection({"Sea Event / Setting Sail"})
v6:AddDropdown({Name = "Select Boats", Options = {"Guardian", "PirateGrandBrigade", "MarineGrandBrigade", "PirateBrigade", "MarineBrigade", "PirateSloop", "MarineSloop", "Beast Hunter"}, Default = "Guardian", Multi = false, Callback = function(Value)
    _G.SelectedBoat = Value
end})
if World3 then
    v6:AddDropdown({Name = "Select Level Sea", Options = {"Lv 1", "Lv 2", "Lv 3", "Lv 4", "Lv 5", "Lv 6", "Lv Infinite"}, Default = "Lv 1", Multi = false, Callback = function(Value)
    _G.DangerSc = Value
end})
end
v6:AddButton({Title = "Remove Lighting Effect", Callback = function()
    pcall(function()
    local Lighting = game:GetService("Lighting")
    if Lighting:FindFirstChild("BaseAtmosphere") then
        Lighting.BaseAtmosphere:Destroy()
    end
    if Lighting:FindFirstChild("LightingLayers") then
        Lighting.LightingLayers:Destroy()
    end
    if Lighting:FindFirstChild("SeaTerrorCC") then
        Lighting.SeaTerrorCC:Destroy()
    end
    if Lighting:FindFirstChild("FantasySky") then
        Lighting.FantasySky:Destroy()
    end
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9000000000
    Lighting.Brightness = 2
    uiLib:Notify({Title = "Lighting", Message = "Removed fog effects", Duration = 3})
end)
end})
v6:AddButton({Title = "Buy Selected Boat", Callback = function()
    if _G.SelectedBoat then
        pcall(function()
    local cframe = CFrame.new(-16927.451, 9.086, 433.864)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = plr.Character.HumanoidRootPart
        local dist = (plr.Character.HumanoidRootPart.Position - cframe.Position).Magnitude
        if (plr.Character.HumanoidRootPart.Position - cframe.Position).Magnitude > 10 then
            _tp(cframe)
            task.wait(1)
        end
        replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
        uiLib:Notify({Title = "Boat Shop", Message = "Purchased: " .. tostring(_G.SelectedBoat), Duration = 3})
    end
end)
    else
        uiLib:Notify({Title = "Boat Shop", Message = "Please select a boat first", Duration = 3})
    end
end})
_G.AutoPressW = _G.AutoPressW or false
v6:AddToggle({Title = "Auto Press W (Auto Drive)", Callback = function(Value)
    _G.AutoPressW = Value
    _G.SaveData.AutoPressW_Save = Value
    SaveSettings()
end})
_G.NoClipShip = _G.NoClipShip or false
v6:AddToggle({Title = "No Clip Ship", Callback = function(Value)
    _G.NoClipShip = Value
    _G.SaveData.NoClipShip_Save = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait() do
        pcall(function()
    if _G.AutoPressW then
        local char = game.Players.LocalPlayer.Character
        local logicalResult2 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if logicalResult2 and logicalResult2.Sit == true then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
        end
    end
end)
    end
end)
task.spawn(function()
    while task.wait() do
        pcall(function()
    for _, boat in pairs(workspace.Boats:GetChildren()) do
        for _, part in pairs(boat:GetDescendants()) do
            if part:IsA("BasePart") then
                if _G.NoClipShip or _G.SailBoats or _G.Prehis_Find or _G.FindMirage then
                    part.CanCollide = false
                else
                    part.CanCollide = true
                end
            end
        end
    end
end)
    end
end)
_G.SetSpeedBoat = 300
v6:AddToggle({Title = "Activate Boat Speed", Default = false, Callback = function(Value)
    _G.SpeedBoat = Value
end})
v6:AddTextBox({Title = "Boat Speed Value", PlaceHolder = "300", Default = "300", Callback = function(Value)
    local num = tonumber(Value)
    if num and num > 0 then
        _G.SetSpeedBoat = num
    end
end})
task.spawn(function()
    game:GetService "RenderStepped":Connect(function()
    if _G.SpeedBoat then
        pcall(function()
    if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Sit then
        for _, Boat in pairs(workspace.Boats:GetChildren()) do
            local Seat = Boat:FindFirstChildWhichIsA("VehicleSeat")
            if Seat then
                Seat.MaxSpeed = _G.SetSpeedBoat
                Seat.Torque = 0.2
                Seat.TurnSpeed = 5
            end
        end
    end
end)
    end
end)
end)
v6:AddToggle({Title = "Auto Start farm", Default = false, Callback = function(Value)
    _G.SailBoats = Value
end})
v6:AddSection({"Select what you will farm"})
v6:AddToggle({Title = "Auto Attack Sea Beast", Default = false, Callback = function(Value)
    _G.SeaBeast1 = Value
end})
v6:AddToggle({Title = "Auto Attack Pirate GrandBrigade", Default = false, Callback = function(Value)
    _G.PGB = Value
end})
if World2 then
    v6:AddSection({"Go to Sea 3 for more options"})
end
if World1 then
    v6:AddSection({"Go to Sea 3 or Sea 2 for Farm maritime events"})
end
if game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
    v6:AddToggle({Title = "Auto Shark", Default = false, Callback = function(Value)
    _G.Shark = Value
end})
    v6:AddToggle({Title = "Auto Piranha", Default = false, Callback = function(Value)
    _G.Piranha = Value
end})
    v6:AddToggle({Title = "Auto Terror Shark", Default = false, Callback = function(Value)
    _G.TerrorShark = Value
end})
    v6:AddToggle({Title = "Auto Fish Crew Member", Default = false, Callback = function(Value)
    _G.MobCrew = Value
end})
    v6:AddToggle({Title = "Auto Haunted Crew Member", Default = false, Callback = function(Value)
    _G.HCM = Value
end})
    v6:AddToggle({Title = "Auto Attack Fish Boat", Default = false, Callback = function(Value)
    _G.FishBoat = Value
end})
end
if game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
    v6:AddSection({"Frozen Dimension"})
    v6:AddButton({Title = "Buy Spy", Callback = function()
    replicated.Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
end})
    v6:AddToggle({Title = "Teleport Frozen Dimension", Callback = function(Value)
    _G.FrozenTP = Value
    _G.SaveData.FrozenTP_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.1) do
        if _G.FrozenTP then
            pcall(function()
    if workspace.Map:FindFirstChild("LeviathanGate") then
        _tp(workspace.Map.LeviathanGate.CFrame)
        replicated.Remotes.CommF_:InvokeServer("OpenLeviathanGate")
    end
end)
        end
    end
end)
    v6:AddToggle({Title = "Auto Attack Leviathan", Default = false, Callback = function(Value)
    _G.Leviathan1 = Value
end})
    v6:AddSection({"Kitsune Island / Event"})
    v6:AddToggle({Title = "Auto Find Kitsune Island", Callback = function(Value)
    _G.AutofindKitIs = Value
    _G.SaveData.FindKitsune_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait() do
        if _G.AutofindKitIs then
            pcall(function()
    if not workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true) then
        local MyBoat = CheckBoat()
        if not MyBoat then
            local cframe = CFrame.new(-16927.451, 9.086, 433.864)
            TeleportToTarget(cframe)
            if (cframe.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
            end
        else
            if plr.Character.Humanoid.Sit == false then
                local result9 = MyBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                _tp(result9)
            else
                local cframe = CFrame.new(-10000000, 31, 37016.25)
                repeat
                    wait()
                    if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                        _tp(CFrame.new(-10000000, 150, 37016.25))
                    else
                        _tp(CFrame.new(-10000000, 31, 37016.25))
                    end
                until not _G.AutofindKitIs or (cframe.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") or plr.Character.Humanoid.Sit == false
                plr.Character.Humanoid.Sit = false
            end
        end
    else
        _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
    end
end)
        end
    end
end)
    v6:AddToggle({Title = "Auto Teleport to Shrine Actived", Default = false, Callback = function(Value)
    _G.tweenShrine = Value
end})
    spawn(function()
    while wait(0.1) do
        if _G.tweenShrine then
            pcall(function()
    local logicalResult2 = workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
    local shrineActive = logicalResult2:FindFirstChild("ShrineActive")
    if shrineActive then
        for _, Part in next, shrineActive:GetDescendants() do
            if Part:IsA("BasePart") and Part.Name:find("NeonShrinePart") then
                replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
                repeat
                    wait()
                    _tp(Part.CFrame * CFrame.new(0, 2, 0))
                until _G.tweenShrine == false or not logicalResult2
            end
        end
    else
        _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
    end
end)
        end
    end
end)
    v6:AddToggle({Title = "Auto Collect Azure Ember", Callback = function(Value)
    _G.Collect_Ember = Value
    _G.SaveData.CollectAzureEmber_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.1) do
        if _G.Collect_Ember then
            pcall(function()
    if workspace:WaitForChild("AttachedAzureEmber") or workspace:WaitForChild("EmberTemplate") then
        notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
    else
        _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0))
        replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
    end
end)
        end
    end
end)
    v6:AddToggle({Title = "Auto Trade Azure Ember", Callback = function(Value)
    _G.Trade_Ember = Value
    _G.SaveData.TradeAzureEmber_Save = Value
    SaveSettings()
end})
    spawn(function()
    while wait(0.1) do
        if _G.Trade_Ember then
            pcall(function()
    if workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true) then
        replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
    end
end)
        end
    end
end)
    v6:AddButton({Title = "Trade Items Azure", Callback = function()
    replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
end})
    v6:AddButton({Title = "Talk with kitsune statue", Callback = function()
    replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
end})
end
v6:AddSection({"Skill Selection"})
_G.SelectedSkills = _G.SelectedSkills or {Melee = {Z = false, X = false, C = false}, Sword = {Z = false, X = false}, ["Blox Fruit"] = {Z = false, X = false, C = false, V = false, F = false}, Gun = {Z = false, X = false}}
if _G.SaveData and _G.SaveData.SelectedSkills then
    _G.SelectedSkills = _G.SaveData.SelectedSkills
end
v6:AddToggle({Title = "Melee Z", Callback = function(Value)
    _G.SelectedSkills.Melee.Z = Value
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Melee X", Callback = function(Value)
    _G.SelectedSkills.Melee.X = Value
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Melee C", Callback = function(Value)
    _G.SelectedSkills.Melee.C = Value
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Sword Z", Callback = function(Value)
    _G.SelectedSkills.Sword.Z = Value
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Sword X", Callback = function(Value)
    _G.SelectedSkills.Sword.X = Value
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Blox Fruit Z", Callback = function(Value)
    _G.SelectedSkills["Blox Fruit"].Z = Value
    _G.FruitSkills = _G.SelectedSkills["Blox Fruit"]
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Blox Fruit X", Callback = function(Value)
    _G.SelectedSkills["Blox Fruit"].X = Value
    _G.FruitSkills = _G.SelectedSkills["Blox Fruit"]
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Blox Fruit C", Callback = function(Value)
    _G.SelectedSkills["Blox Fruit"].C = Value
    _G.FruitSkills = _G.SelectedSkills["Blox Fruit"]
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Blox Fruit V", Callback = function(Value)
    _G.SelectedSkills["Blox Fruit"].V = Value
    _G.FruitSkills = _G.SelectedSkills["Blox Fruit"]
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Blox Fruit F", Callback = function(Value)
    _G.SelectedSkills["Blox Fruit"].F = Value
    _G.FruitSkills = _G.SelectedSkills["Blox Fruit"]
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Gun Z", Callback = function(Value)
    _G.SelectedSkills.Gun.Z = Value
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v6:AddToggle({Title = "Gun X", Callback = function(Value)
    _G.SelectedSkills.Gun.X = Value
    _G.SaveData.SelectedSkills = _G.SelectedSkills
    SaveSettings()
end})
v7:AddSection({"Prehistoric Island"})
local PrehistoricStatus = v7:AddParagraph({Title = "Prehistoric Island Status", Desc = "Checking..."})
task.spawn(function()
    while task.wait(2) do
        pcall(function()
    if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
        PrehistoricStatus:SetDesc("✅ Island Active")
    else
        PrehistoricStatus:SetDesc("❌ Not Found")
    end
end)
    end
end)
v7:AddSection({"Skill Selection (Prehistoric)"})
_G.PrehistoricSkills = _G.PrehistoricSkills or {Melee = {Z = true, X = true, C = true}, Sword = {Z = true, X = true}, ["Blox Fruit"] = {Z = true, X = true, C = true, V = false, F = false}, Gun = {Z = true, X = true}}
if _G.SaveData and _G.SaveData.PrehistoricSkills then
    _G.PrehistoricSkills = _G.SaveData.PrehistoricSkills
end
local function UsePrehistoricSkills()
    if _G.PrehistoricSkills.Melee.Z then
        Useskills("Melee", "Z")
    end
    if _G.PrehistoricSkills.Melee.X then
        Useskills("Melee", "X")
    end
    if _G.PrehistoricSkills.Melee.C then
        Useskills("Melee", "C")
    end
    task.wait(0.2)
    if _G.PrehistoricSkills.Sword.Z then
        Useskills("Sword", "Z")
    end
    if _G.PrehistoricSkills.Sword.X then
        Useskills("Sword", "X")
    end
    task.wait(0.2)
    if _G.PrehistoricSkills["Blox Fruit"].Z then
        Useskills("Blox Fruit", "Z")
    end
    if _G.PrehistoricSkills["Blox Fruit"].X then
        Useskills("Blox Fruit", "X")
    end
    if _G.PrehistoricSkills["Blox Fruit"].C then
        Useskills("Blox Fruit", "C")
    end
    if _G.PrehistoricSkills["Blox Fruit"].V then
        Useskills("Blox Fruit", "V")
    end
    if _G.PrehistoricSkills["Blox Fruit"].F then
        vim1:SendKeyEvent(true, "F", false, game)
        vim1:SendKeyEvent(false, "F", false, game)
    end
    task.wait(0.2)
    if _G.PrehistoricSkills.Gun.Z then
        Useskills("Gun", "Z")
    end
    if _G.PrehistoricSkills.Gun.X then
        Useskills("Gun", "X")
    end
end
v7:AddToggle({Title = "Prehistoric - Melee Z", Callback = function(Value)
    _G.PrehistoricSkills.Melee.Z = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Melee X", Callback = function(Value)
    _G.PrehistoricSkills.Melee.X = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Melee C", Callback = function(Value)
    _G.PrehistoricSkills.Melee.C = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Sword Z", Callback = function(Value)
    _G.PrehistoricSkills.Sword.Z = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Sword X", Callback = function(Value)
    _G.PrehistoricSkills.Sword.X = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Fruit Z", Callback = function(Value)
    _G.PrehistoricSkills["Blox Fruit"].Z = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Fruit X", Callback = function(Value)
    _G.PrehistoricSkills["Blox Fruit"].X = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Fruit C", Callback = function(Value)
    _G.PrehistoricSkills["Blox Fruit"].C = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Fruit V", Callback = function(Value)
    _G.PrehistoricSkills["Blox Fruit"].V = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Fruit F", Callback = function(Value)
    _G.PrehistoricSkills["Blox Fruit"].F = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Gun Z", Callback = function(Value)
    _G.PrehistoricSkills.Gun.Z = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddToggle({Title = "Prehistoric - Gun X", Callback = function(Value)
    _G.PrehistoricSkills.Gun.X = Value
    _G.SaveData.PrehistoricSkills = _G.PrehistoricSkills
    SaveSettings()
end})
v7:AddSection({"Main Prehistoric Options"})
v7:AddToggle({Title = "Auto Find Prehistoric Island", Callback = function(Value)
    _G.Prehis_Find = Value
    _G.SaveData.Prehis_Find_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Start Prehistoric Event", Callback = function(Value)
    _G.AutoStartPrehistoric = Value
    _G.SaveData.AutoStartPrehistoric_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Patch (Remove Lava)", Callback = function(Value)
    _G.Prehis_Skills = Value
    _G.SaveData.Prehis_Skills_Save = Value
    SaveSettings()
end})
_G.KillAura = GetSetting("KillAura_Save", false)
v7:AddToggle({Title = "Kill Aura", Callback = function(Value)
    _G.KillAura = Value
    _G.SaveData.KillAura_Save = Value
    SaveSettings()
end})
local num = 0
local KillAuraDisplay = v7:AddParagraph({Title = "Kill Aura Stats", Desc = "Killed: 0"})
task.spawn(function()
    while task.wait(1) do
        if _G.KillAura then
            KillAuraDisplay:SetDesc("Killed: 0")
        else
            KillAuraDisplay:SetDesc("Killed: 0 | Disabled")
        end
    end
end)
local function GetHRP()
    return game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end
task.spawn(function()
    while task.wait(2) do
        if _G.KillAura then
            pcall(function()
    local hrp = GetHRP()
    if not hrp then
        return
    end
    pcall(function()
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
end)
    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        local humanoid = enemy:FindFirstChild("Humanoid")
        local humanoidRootPart = enemy:FindFirstChild("HumanoidRootPart")
        if humanoid and humanoidRootPart and humanoid.Health > 0 then
            if (humanoidRootPart.Position - hrp.Position).Magnitude <= 1000 then
                humanoid.Health = 0
                humanoidRootPart.CanCollide = false
                enemy:BreakJoints()
                num = 1
            end
        end
    end
end)
        end
    end
end)
v7:AddButton({Title = "Reset Kill Counter", Callback = function()
    num = 0
end})
v7:AddToggle({Title = "Auto Kill Lava Golem", Callback = function(Value)
    _G.Prehis_KillGolem = Value
    _G.SaveData.Prehis_KillGolem_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Collect Dino Bones", Callback = function(Value)
    _G.Prehis_DB = Value
    _G.SaveData.Prehis_DB_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Collect Dragon Eggs", Callback = function(Value)
    _G.Prehis_DE = Value
    _G.SaveData.Prehis_DE_Save = Value
    SaveSettings()
end})
local PrehisFindBoat = nil
spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.Prehis_Find then
        local character = plr.Character
        if not plr.Character then
            return
        end
        local humanoidRootPart = plr.Character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then
            return
        end
        local prehistoric_Island = workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true)
        if not prehistoric_Island then
            local MyBoat = CheckBoat()
            if not MyBoat then
                local cframe = CFrame.new(-16927.451, 9.086, 433.864)
                TeleportToTarget(cframe)
                if (cframe.Position - humanoidRootPart.Position).Magnitude <= 10 then
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat or "Guardian")
                end
                return
            end
            if plr.Character.Humanoid.Sit == false then
                local result10 = MyBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                _tp(result10)
                return
            end
            PrehisFindBoat = CFrame.new(-10000000, 31, 37016.25)
            if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                _tp(CFrame.new(-10000000, 150, 37016.25))
            else
                _tp(nil)
            end
        else
            local logicalResult2 = prehistoric_Island:FindFirstChild("HeadTeleport", true) or prehistoric_Island:FindFirstChild("Teleport_Head", true) or prehistoric_Island:FindFirstChild("Head", true)
            if logicalResult2 then
                local result11 = logicalResult2.CFrame.Position - logicalResult2.CFrame.LookVector * 40 + Vector3.new(0, 20, 0)
                if (result11 - humanoidRootPart.Position).Magnitude > 30 then
                    _tp(CFrame.new(result11))
                end
            else
                local CenterPos = prehistoric_Island.CFrame.Position
                local DirToIsland = (prehistoric_Island.CFrame.Position - humanoidRootPart.Position).Unit
                local result12 = prehistoric_Island.CFrame.Position - (prehistoric_Island.CFrame.Position - humanoidRootPart.Position).Unit * 250 + Vector3.new(0, 60, 0)
                _tp(CFrame.new(result12))
            end
        end
    end
end)
    end
end)
spawn(function()
    while wait() do
        if _G.AutoStartPrehistoric then
            pcall(function()
    local prehistoric_Island = workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true)
    if prehistoric_Island then
        if workspace.Map:FindFirstChild("PrehistoricIsland", true) then
            local activationPrompt = workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt", true)
            if activationPrompt and activationPrompt:FindFirstChild("ProximityPrompt") then
                if plr:DistanceFromCharacter(activationPrompt.CFrame.Position) <= 150 then
                    fireproximityprompt(activationPrompt.ProximityPrompt, math.huge)
                    vim1:SendKeyEvent(true, "E", false, game)
                    wait(1.5)
                    vim1:SendKeyEvent(false, "E", false, game)
                end
                _tp(activationPrompt.CFrame)
            end
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.3) do
        if _G.Prehis_Skills then
            pcall(function()
    local prehistoricIsland = workspace.Map:FindFirstChild("PrehistoricIsland")
    if not prehistoricIsland then
        return
    end
    for _, obj in pairs(prehistoricIsland:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and obj.Name:lower():find("lava") then
            obj:Destroy()
        end
    end
    local core = prehistoricIsland:FindFirstChild("Core")
    if core then
        local interiorLava = core:FindFirstChild("InteriorLava")
        if interiorLava then
            interiorLava:Destroy()
        end
    end
    local trialTeleport = prehistoricIsland:FindFirstChild("TrialTeleport")
    for _, obj in pairs(prehistoricIsland:GetDescendants()) do
        if obj.Name == "TouchInterest" and not (trialTeleport and obj:IsDescendantOf(trialTeleport)) then
            obj.Parent:Destroy()
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.Prehis_KillGolem then
            pcall(function()
    local golem = GetConnectionEnemies("Lava Golem")
    if golem and golem:FindFirstChild("Humanoid") then
        repeat
            wait(0.1)
            _tp(golem.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            UsePrehistoricSkills()
            golem.Humanoid:ChangeState(15)
        until not _G.Prehis_KillGolem or not golem.Parent or golem.Humanoid.Health <= 0
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.Prehis_DB then
            pcall(function()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == "DinoBone" then
            _tp(obj.CFrame)
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.Prehis_DE then
            pcall(function()
    local prehistoricIsland = workspace.Map:FindFirstChild("PrehistoricIsland")
    if prehistoricIsland then
        local core = prehistoricIsland:FindFirstChild("Core")
        if core then
            local spawnedDragonEggs = core:FindFirstChild("SpawnedDragonEggs")
            if spawnedDragonEggs then
                local dragonEgg = spawnedDragonEggs:FindFirstChild("DragonEgg")
                if dragonEgg and dragonEgg:FindFirstChild("Molten") then
                    _tp(dragonEgg.Molten.CFrame)
                    fireproximityprompt(dragonEgg.Molten.ProximityPrompt, 30)
                end
            end
        end
    end
end)
        end
    end
end)
v7:AddSection({"Volcanic Crafting"})
v7:AddButton({Title = "Craft Volcanic Magnet (Manual)", Callback = function()
    pcall(function()
    replicated.Modules.Net["RF/Craft"]:InvokeServer("PossibleHardcode", "Volcanic Magnet")
    uiLib:Notify({Title = "Crafting", Message = "Attempted to craft Volcanic Magnet", Duration = 3})
end)
end})
_G.AutoCraftVolcanic = _G.AutoCraftVolcanic or false
v7:AddToggle({Title = "Auto Craft Volcanic Magnet", Callback = function(Value)
    _G.AutoCraftVolcanic = Value
    _G.SaveData.AutoCraftVolcanic_Save = Value
    SaveSettings()
end})
task.spawn(function()
    local CraftRemote = replicated.Modules.Net["RF/Craft"]
    while task.wait(30) do
        if _G.AutoCraftVolcanic then
            pcall(function()
    CraftRemote:InvokeServer("PossibleHardcode", "Volcanic Magnet")
end)
        end
    end
end)
v7:AddSection({"Drago Trials"})
v7:AddToggle({Title = "Tween To Upgrade Drago Trial", Callback = function(Value)
    _G.UPGDrago = Value
    _G.SaveData.UPGDrago_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Drago (V1) - Get Dragon Egg", Callback = function(Value)
    _G.DragoV1 = Value
    _G.SaveData.DragoV1_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Drago (V2) - Fire Flowers", Callback = function(Value)
    _G.AutoFireFlowers = Value
    _G.SaveData.AutoFireFlowers_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Drago (V3) - Terror Shark/Sea Beast", Callback = function(Value)
    _G.DragoV3 = Value
    _G.SaveData.DragoV3_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Relic Drago Trial [Beta]", Callback = function(Value)
    _G.Relic123 = Value
    _G.SaveData.Relic123_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Train Drago v4", Callback = function(Value)
    _G.TrainDrago = Value
    _G.SaveData.TrainDrago_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Tween to Drago Trials (Inside Volcano)", Callback = function(Value)
    _G.TpDrago_Prehis = Value
    _G.SaveData.TpDrago_Prehis_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Swap Drago Race (Buy)", Callback = function(Value)
    _G.BuyDrago = Value
    _G.SaveData.BuyDrago_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Upgrade Dragon Talon With Uzoth", Callback = function(Value)
    _G.DT_Uzoth = Value
    _G.SaveData.DT_Uzoth_Save = Value
    SaveSettings()
end})
v7:AddSection({"Dojo Quest"})
v7:AddButton({Title = "Teleport To Dragon Dojo", Callback = function()
    pcall(function()
    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773, -334.96499633789))
    _tp(CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609))
end)
end})
v7:AddToggle({Title = "Auto Dojo Trainer (Complete Quests)", Callback = function(Value)
    _G.Dojoo = Value
    _G.SaveData.Dojoo_Save = Value
    SaveSettings()
end})
v7:AddToggle({Title = "Auto Dragon Hunter (Hydra/Venomous)", Callback = function(Value)
    _G.FarmBlazeEM = Value
    _G.SaveData.FarmBlazeEM_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        if _G.UPGDrago then
            pcall(function()
    local cframe = CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609)
    if (cframe.Position - Root.Position).Magnitude >= 300 then
        _tp(cframe)
    else
        _tp(cframe)
        replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer({NPC = "Dragon Wizard", Command = "Upgrade"})
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.DragoV1 then
            pcall(function()
    if GetM("Dragon Egg") <= 0 then
        repeat
            wait()
            _G.Prehis_Find = true
            _G.Prehis_Skills = true
            _G.Prehis_DE = true
        until not _G.DragoV1 or GetM("Dragon Egg") >= 1
        _G.Prehis_Find = false
        _G.Prehis_Skills = false
        _G.Prehis_DE = false
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.AutoFireFlowers then
            pcall(function()
    local fireFlowers = workspace:FindFirstChild("FireFlowers")
    local ForestPirate = GetConnectionEnemies("Forest Pirate")
    if ForestPirate then
        repeat
            wait()
            ;({}).Kill(ForestPirate, _G.AutoFireFlowers)
        until not _G.AutoFireFlowers or not ForestPirate.Parent or ForestPirate.Humanoid.Health <= 0 or fireFlowers
    else
        _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
    end
    if fireFlowers then
        for _, flower in pairs(fireFlowers:GetChildren()) do
            if flower:IsA("Model") and flower.PrimaryPart then
                if (flower.PrimaryPart.Position - Root.Position).Magnitude <= 100 then
                    vim1:SendKeyEvent(true, "E", false, game)
                    wait(1.5)
                    vim1:SendKeyEvent(false, "E", false, game)
                else
                    _tp(CFrame.new(flower.PrimaryPart.Position))
                end
            end
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.DragoV3 then
            pcall(function()
    repeat
        wait()
        _G.DangerSc = "Lv Infinite"
        _G.SailBoats = true
        _G.TerrorShark = true
    until not _G.DragoV3
    _G.DangerSc = "Lv 1"
    _G.SailBoats = false
    _G.TerrorShark = false
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.Relic123 then
            pcall(function()
    if workspace.Map:FindFirstChild("DracoTrial") then
        replicated.Remotes.DracoTrial:InvokeServer()
        wait(0.5)
        local RelicSpots = {CFrame.new(-39934.9765625, 10685.359375, 22999.34375), CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625), CFrame.new(-39914.65625, 10685.384765625, 23000.177734375), CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375), CFrame.new(-39908.5, 10685.405273438, 22990.04296875), CFrame.new(-39609.5, 9376.400390625, 23472.94335975)}
        for _, spot in ipairs(RelicSpots) do
            repeat
                wait()
                _tp(spot)
            until not _G.Relic123 or (spot.Position - Root.Position).Magnitude <= 10
            wait(2.5)
        end
    else
        local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
        if trialTeleport and trialTeleport:IsA("Part") then
            _tp(CFrame.new(trialTeleport.Position))
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.TrainDrago then
            pcall(function()
    local logicalResult2 = plr.Character and plr.Character:FindFirstChild("RaceEnergy")
    if logicalResult2 and logicalResult2.Value == 1 then
        vim1:SendKeyEvent(true, "Y", false, game)
        replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy", 2)
        _tp(CFrame.new(4620.6157226562, 1002.2954711914, 399.08688354492))
    elseif plr.Character:FindFirstChild("RaceTransformed") and plr.Character.RaceTransformed.Value == false then
        local mob = GetConnectionEnemies(DragonMobs)
        if mob then
            repeat
                wait()
                ;({}).Kill(mob, _G.TrainDrago)
            until _G.TrainDrago == false or mob.Humanoid.Health <= 0 or not mob.Parent
        else
            _tp(CFrame.new(4620.6157226562, 1002.2954711914, 399.08688354492))
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.TpDrago_Prehis then
            pcall(function()
    local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
    if trialTeleport and trialTeleport:IsA("Part") then
        _tp(CFrame.new(trialTeleport.Position))
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.BuyDrago then
            pcall(function()
    local cframe = CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609)
    if (cframe.Position - Root.Position).Magnitude >= 300 then
        _tp(cframe)
    else
        _tp(cframe)
        replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer({NPC = "Dragon Wizard", Command = "DragonRace"})
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.DT_Uzoth then
            pcall(function()
    local cframe = CFrame.new(5661.89014, 1211.31909, 864.836731)
    _tp(cframe)
    if (cframe.Position - Root.Position).Magnitude <= 25 then
        replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer({NPC = "Uzoth", Command = "Upgrade"})
    end
end)
        end
    end
end)
local function checkDragonHunterQuest()
    local success, _GSaveData = pcall(function()
    return replicated.Modules.Net["RF/DragonHunter"]:InvokeServer({Context = "Check"})
end)
    if success and _GSaveData and _GSaveData.Text then
        if string.find(_GSaveData.Text, "Defeat") then
            local mobName = nil
            if string.find(_GSaveData.Text, "Hydra Enforcer") then
                mobName = "Hydra Enforcer"
            end
            if string.find(_GSaveData.Text, "Venomous Assailant") then
                mobName = "Venomous Assailant"
            end
            return "kill", nil
        end
    end
    return nil, nil
end
local function backToDojo()
    for _, notif in pairs(plr.PlayerGui.Notifications:GetChildren()) do
        if notif.Name == "NotificationTemplate" and string.find(notif.Text, "Head back to the Dojo") then
            return true
        end
    end
    return false
end
spawn(function()
    while wait() do
        if _G.FarmBlazeEM then
            pcall(function()
    local questType, mobName = checkDragonHunterQuest()
    if questType and not backToDojo() then
        if questType == "kill" and mobName then
            local mob = GetConnectionEnemies(mobName)
            if mob then
                repeat
                    wait()
                    if mob and mob:FindFirstChild("HumanoidRootPart") then
                        _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        ;({}).Kill(mob, _G.FarmBlazeEM)
                    end
                until not _G.FarmBlazeEM or not mob or not mob.Parent or mob.Humanoid.Health <= 0 or backToDojo()
            else
                local logicalResult2 = mobName == "Hydra Enforcer" and CFrame.new(4620.6157226562, 1002.2954711914, 399.08688354492) or CFrame.new(4674.92676, 1134.82654, 996.308838)
                _tp(logicalResult2)
            end
        elseif questType == "destroy" then
            local meshes_bambootree = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true)
            if meshes_bambootree then
                repeat
                    wait()
                    _tp(meshes_bambootree.CFrame * CFrame.new(4, 0, 0))
                    if (meshes_bambootree.Position - Root.Position).Magnitude <= 200 then
                        MousePos = meshes_bambootree.Position
                        UsePrehistoricSkills()
                    end
                until not _G.FarmBlazeEM or not questType or backToDojo()
            end
        end
    else
        _tp(CFrame.new(5813, 1208, 884))
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.1) do
        if _G.FarmBlazeEM then
            pcall(function()
    if workspace:FindFirstChild("EmberTemplate") and workspace.EmberTemplate:FindFirstChild("Part") then
        _tp(workspace.EmberTemplate.Part.CFrame)
    end
end)
        end
    end
end)
v8:AddSection({"Mirage Island / Full Moon"})
local FullMoonStatus = v8:AddParagraph({Title = "Full Moon Status", Desc = "Checking..."})
local MirageIslandStatus = v8:AddParagraph({Title = "Mirage Island Status", Desc = "Checking..."})
task.spawn(function()
    while task.wait(1) do
        pcall(function()
    local moonId = Getmoon()
    local moonPhases = {["http://www.roblox.com/asset/?id=9709135895"] = "Moon: 0/8", ["http://www.roblox.com/asset/?id=9709139597"] = "Moon: 1/8", ["http://www.roblox.com/asset/?id=9709143733"] = "Moon: 2/8", ["http://www.roblox.com/asset/?id=9709149052"] = "Moon: 3/8 [Next Night]", ["http://www.roblox.com/asset/?id=9709149431"] = "Moon: 4/8 [Full Moon]", ["http://www.roblox.com/asset/?id=9709149680"] = "Moon: 5/8 [Last Night]", ["http://www.roblox.com/asset/?id=9709150086"] = "Moon: 6/8", ["http://www.roblox.com/asset/?id=9709150401"] = "Moon: 7/8"}
    FullMoonStatus:SetDesc(moonPhases[moonId] or "Moon: 0/8")
end)
    end
end)
task.spawn(function()
    while task.wait(1) do
        pcall(function()
    if workspace.Map:FindFirstChild("MysticIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
        MirageIslandStatus:SetDesc("✅ Mirage Island Active")
    else
        MirageIslandStatus:SetDesc("❌ Not Found")
    end
end)
    end
end)
v8:AddSection({"Mirage Island Features"})
v8:AddToggle({Title = "Auto Find Mirage Island", Callback = function(Value)
    _G.FindMirage = Value
    _G.SaveData.FindMirage_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Tween To Mirage Island", Callback = function(Value)
    _G.AutoMysticIsland = Value
    _G.SaveData.AutoMysticIsland_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Tween To Highest Point", Callback = function(Value)
    _G.HighestMirage = Value
    _G.SaveData.HighestMirage_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Esp Mirage Island", Callback = function(Value)
    MirageIslandESP = Value
    _G.SaveData.MirageIslandESP_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Collect Mirage Chest", Callback = function(Value)
    _G.FarmChestM = Value
    _G.SaveData.FarmChestM_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Change Transparency (See Mirage)", Callback = function(Value)
    _G.can = Value
    _G.SaveData.MirageSeeThrough_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Collect Gear", Callback = function(Value)
    _G.TPGEAR = Value
    _G.SaveData.TPGEAR_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait() do
        if _G.FindMirage then
            pcall(function()
    if not workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true) then
        local MyBoat = CheckBoat()
        if not MyBoat then
            local cframe = CFrame.new(-16927.451, 9.086, 433.864)
            TeleportToTarget(cframe)
            if (cframe.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat or "Guardian")
            end
        else
            if plr.Character.Humanoid.Sit == false then
                local result13 = MyBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                _tp(result13)
            else
                local cframe = CFrame.new(-10000000, 31, 37016.25)
                repeat
                    wait()
                    if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                        _tp(CFrame.new(-10000000, 150, 37016.25))
                    else
                        _tp(CFrame.new(-10000000, 31, 37016.25))
                    end
                until not _G.FindMirage or (cframe.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") or plr.Character.Humanoid.Sit == false
                plr.Character.Humanoid.Sit = false
            end
        end
    else
        _tp(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 300, 0))
    end
end)
        end
    end
end)
spawn(function()
    while task.wait(0.1) do
        pcall(function()
    if _G.AutoMysticIsland then
        for _, loc in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
            if loc.Name == "Mirage Island" then
                _tp(loc.CFrame * CFrame.new(0, 333, 0))
            end
        end
    end
end)
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.HighestMirage then
            pcall(function()
    if workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true) then
        _tp(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 400, 0))
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.can then
            pcall(function()
    local mysticIsland = workspace.Map:FindFirstChild("MysticIsland")
    if mysticIsland then
        for _, part in pairs(mysticIsland:GetChildren()) do
            if part.Name == "Part" then
                if part.ClassName == "MeshPart" then
                    part.Transparency = 0
                else
                    part.Transparency = 1
                end
            end
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.1) do
        if _G.TPGEAR then
            pcall(function()
    local mysticIsland = workspace.Map:FindFirstChild("MysticIsland")
    if mysticIsland then
        for _, part in pairs(mysticIsland:GetChildren()) do
            if part.Name == "Part" and part.ClassName == "MeshPart" then
                _tp(part.CFrame)
            end
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.2) do
        if _G.FarmChestM then
            pcall(function()
    local mysticIsland = workspace.Map:FindFirstChild("MysticIsland")
    if mysticIsland and mysticIsland:FindFirstChild("Chests") then
        if mysticIsland.Chests:FindFirstChild("DiamondChest") or mysticIsland.Chests:FindFirstChild("FragChest") then
            local CollectionService = game:GetService("CollectionService")
            local Chests = CollectionService:GetTagged("_ChestTagged")
            local mathHuge, nearestChest = math.huge, nil
            local logicalResult2 = plr.Character and plr.Character:GetPivot().Position
            if logicalResult2 then
                for _, chest in pairs(Chests) do
                    local dist = (chest:GetPivot().Position - logicalResult2).Magnitude
                    if not chest:GetAttribute("IsDisabled") and dist < mathHuge then
                        mathHuge = dist
                        nearestChest = chest
                    end
                end
            end
            if nearestChest then
                _tp(nearestChest:GetPivot())
            end
        end
    end
end)
        end
    end
end)
v8:AddSection({"Advanced Fruit Dealer"})
v8:AddToggle({Title = "Auto Tween Advanced Fruit Dealer", Callback = function(Value)
    _G.Addealer = Value
    _G.SaveData.Addealer_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait() do
        if _G.Addealer then
            pcall(function()
    for _, npc in pairs(replicated.NPCs:GetChildren()) do
        if npc.Name == "Advanced Fruit Dealer" then
            _tp(npc.HumanoidRootPart.CFrame)
        end
    end
end)
        end
    end
end)
v8:AddSection({"Race V4 / Temple of Time"})
v8:AddButton({Title = "Teleport to Temple of Time", Callback = function()
    pcall(function()
    local cframe = CFrame.new(28286.35546875, 14895.301757812, 102.62469482422)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        plr.Character.HumanoidRootPart.CFrame = cframe
    end
    if not workspace.Map:FindFirstChild("Temple of Time") and World3 then
        local mapStash = replicated:FindFirstChild("MapStash")
        if mapStash and mapStash:FindFirstChild("Temple of Time") then
            mapStash["Temple of Time"].Parent = workspace.Map
        end
    end
end)
end})
v8:AddButton({Title = "Teleport to Ancient One", Callback = function()
    pcall(function()
    local cframe = CFrame.new(28286.35546875, 14895.301757812, 102.62469482422)
    local cframe1 = CFrame.new(28981.552734375, 14888.426757812, -120.24584960938)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        plr.Character.HumanoidRootPart.CFrame = cframe
    end
    if not workspace.Map:FindFirstChild("Temple of Time") and World3 then
        local mapStash = replicated:FindFirstChild("MapStash")
        if mapStash and mapStash:FindFirstChild("Temple of Time") then
            mapStash["Temple of Time"].Parent = workspace.Map
        end
    end
    task.wait(2)
    _tp(cframe1)
end)
end})
v8:AddButton({Title = "Teleport to Ancient Clock", Callback = function()
    pcall(function()
    local cframe = CFrame.new(28286.35546875, 14895.301757812, 102.62469482422)
    local cframe1 = CFrame.new(29549, 15069, -88)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        plr.Character.HumanoidRootPart.CFrame = cframe
    end
    if not workspace.Map:FindFirstChild("Temple of Time") and World3 then
        local mapStash = replicated:FindFirstChild("MapStash")
        if mapStash and mapStash:FindFirstChild("Temple of Time") then
            mapStash["Temple of Time"].Parent = workspace.Map
        end
    end
    task.delay(2, function()
    _tp(cframe1)
end)
end)
end})
v8:AddButton({Title = "Talk With Stone", Callback = function()
    pcall(function()
    replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
    replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
    replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
    replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
    uiLib:Notify({Title = "Race V4", Message = "Talked with Stone", Duration = 3})
end)
end})
local TiersStatus = v8:AddParagraph({Title = "Tiers V4 Status", Desc = "Checking..."})
task.spawn(function()
    while task.wait(1) do
        pcall(function()
    if plr.Data and plr.Data.Race and plr.Data.Race:FindFirstChild("C") then
        TiersStatus:SetDesc("Tiers - V4: " .. tostring(plr.Data.Race.C.Value))
    else
        TiersStatus:SetDesc("Tiers - V4: 0")
    end
end)
    end
end)
v8:AddSection({"Trials Quest V4"})
v8:AddToggle({Title = "Auto Pull Lever", Callback = function(Value)
    _G.Lver = Value
    _G.SaveData.Lver_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Train V4", Callback = function(Value)
    _G.AcientOne = Value
    _G.SaveData.AcientOne_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Teleport to Race Doors", Callback = function(Value)
    _G.TPDoor = Value
    _G.SaveData.TPDoor_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Complete Trials", Callback = function(Value)
    _G.Complete_Trials = Value
    _G.SaveData.Complete_Trials_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Kill Player After Trial", Callback = function(Value)
    _G.Defeating = Value
    _G.SaveData.Defeating_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        if _G.Lver then
            pcall(function()
    local temple_of_Time = workspace.Map:FindFirstChild("Temple of Time")
    if temple_of_Time then
        for _, obj in pairs(temple_of_Time:GetDescendants()) do
            if obj.Name == "ProximityPrompt" then
                fireproximityprompt(obj, math.huge)
            end
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.AcientOne then
            pcall(function()
    local BoneMobs = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
    local logicalResult2 = plr.Character and plr.Character:FindFirstChild("RaceEnergy")
    local logicalResult3 = plr.Character and plr.Character:FindFirstChild("RaceTransformed")
    if logicalResult2 and logicalResult2.Value == 1 then
        vim1:SendKeyEvent(true, "Y", false, game)
        replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
        _tp(CFrame.new(-8987.041015625, 215.86206054688, 5886.7104492188))
    elseif logicalResult3 and logicalResult3.Value == false then
        local mob = GetConnectionEnemies(BoneMobs)
        if mob then
            repeat
                wait()
                ;({}).Kill(mob, _G.AcientOne)
            until _G.AcientOne == false or mob.Humanoid.Health <= 0 or not mob.Parent
        else
            _tp(CFrame.new(-9495.6806640625, 453.58624267578, 5977.3486328125))
        end
    end
end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if _G.TPDoor then
            pcall(function()
    local race = tostring(plr.Data.Race.Value)
    local doorPositions = {Mink = CFrame.new(29020.66015625, 14889.426757812, -379.2682800293), Fishman = CFrame.new(28224.056640625, 14889.426757812, -210.58720397949), Cyborg = CFrame.new(28492.4140625, 14894.426757812, -422.11001586914), Skypiea = CFrame.new(28967.408203125, 14918.075195312, 234.31198120117), Ghoul = CFrame.new(28672.720703125, 14889.127929688, 454.59616088867), Human = CFrame.new(29237.294921875, 14889.426757812, -206.94955444336)}
    if doorPositions[race] then
        _tp(doorPositions[race])
    end
end)
        end
    end
end)
local function GetSeaBeastTrial()
    local trial_of_Water = workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water")
    if trial_of_Water then
        for _, beast in pairs(workspace.SeaBeasts:GetChildren()) do
            if beast:FindFirstChild("HumanoidRootPart") and beast:FindFirstChild("Health") and beast.Health.Value > 0 then
                if (beast.HumanoidRootPart.Position - trial_of_Water.Position).Magnitude <= 1500 then
                    return beast
                end
            end
        end
    end
    return nil
end
spawn(function()
    while wait(0.5) do
        if _G.Complete_Trials then
            pcall(function()
    local race = tostring(plr.Data.Race.Value)
    if race == "Mink" then
        notween(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0, -20, 0))
    elseif race == "Fishman" then
        local beast = GetSeaBeastTrial()
        if beast then
            repeat
                task.wait()
                _tp(CFrame.new(beast.HumanoidRootPart.Position.X, workspace.Map["WaterBase-Plane"].Position.Y + 300, beast.HumanoidRootPart.Position.Z))
                MousePos = beast.HumanoidRootPart.Position
                Useskills("Melee", "Z")
                Useskills("Melee", "X")
                Useskills("Melee", "C")
                wait(0.1)
                Useskills("Sword", "Z")
                Useskills("Sword", "X")
                wait(0.1)
                Useskills("Blox Fruit", "Z")
                Useskills("Blox Fruit", "X")
                Useskills("Blox Fruit", "C")
                wait(0.1)
                Useskills("Gun", "Z")
                Useskills("Gun", "X")
            until _G.Complete_Trials == false or not beast or not beast.Parent or beast.Health.Value <= 0
        end
    elseif race == "Cyborg" then
        _tp(workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0, 500, 0))
    elseif race == "Skypiea" then
        notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
    elseif race == "Human" or race == "Ghoul" then
        local mob = GetConnectionEnemies({"Ancient Vampire", "Ancient Zombie"})
        if mob then
            repeat
                wait()
                ;({}).Kill(mob, _G.Complete_Trials)
            until _G.Complete_Trials == false or not mob.Parent or mob.Humanoid.Health <= 0
        end
    end
end)
        end
    end
end)
spawn(function()
    while task.wait(0.5) do
        if _G.Defeating then
            pcall(function()
    for _, player in pairs(workspace.Characters:GetChildren()) do
        if player.Name ~= plr.Name then
            if player:FindFirstChild("Humanoid") and player.Humanoid.Health > 0 and player:FindFirstChild("HumanoidRootPart") then
                if (Root.Position - player.HumanoidRootPart.Position).Magnitude <= 250 then
                    repeat
                        task.wait()
                        EquipWeapon(_G.SelectWeapon)
                        _tp(player.HumanoidRootPart.CFrame * CFrame.new(0, 0, 15))
                        sethiddenproperty(plr, "SimulationRadius", math.huge)
                    until _G.Defeating == false or player.Humanoid.Health <= 0 or not player.Parent
                end
            end
        end
    end
end)
        end
    end
end)
v8:AddSection({"Moon / Race Abilities"})
v8:AddToggle({Title = "Auto Look At Moon", Callback = function(Value)
    LookM = Value
    _G.SaveData.LookM_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Look Moon + Auto V3", Callback = function(Value)
    LookMV3 = Value
    _G.SaveData.LookMV3_Save = Value
    SaveSettings()
end})
local function MoveCamToMoon()
    local moonDir = Services.Lighting:GetMoonDirection()
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + moonDir)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position, plr.Character.HumanoidRootPart.Position + moonDir)
    end
end
task.spawn(function()
    while task.wait(0.1) do
        if LookM then
            MoveCamToMoon()
            wait(0.1)
            replicated.Remotes.CommE:FireServer("ActivateAbility")
        end
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        if LookMV3 then
            MoveCamToMoon()
            replicated.Remotes.CommE:FireServer("ActivateAbility")
            vim1:SendKeyEvent(true, "T", false, game)
            wait(0.5)
            vim1:SendKeyEvent(false, "T", false, game)
        end
    end
end)
v8:AddSection({"Upgrade Races V2 And V3"})
v8:AddToggle({Title = "Auto Upgrade Mink", Callback = function(Value)
    _G.Auto_Mink = Value
    _G.SaveData.Auto_Mink_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Upgrade Human", Callback = function(Value)
    _G.Auto_Human = Value
    _G.SaveData.Auto_Human_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Upgrade Angel", Callback = function(Value)
    _G.Auto_Skypiea = Value
    _G.SaveData.Auto_Skypiea_Save = Value
    SaveSettings()
end})
v8:AddToggle({Title = "Auto Upgrade Fishman", Callback = function(Value)
    _G.Auto_Fish = Value
    _G.SaveData.Auto_Fish_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.Auto_Mink then
        local alchemist = replicated.Remotes.CommF_:InvokeServer("Alchemist", "1")
        if alchemist ~= 2 then
            if alchemist == 0 then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
            elseif alchemist == 1 then
                if not GetBP("Flower 1") then
                    _tp(workspace.Flower1.CFrame)
                elseif not GetBP("Flower 2") then
                    _tp(workspace.Flower2.CFrame)
                elseif not GetBP("Flower 3") then
                    local mob = GetConnectionEnemies("Swan Pirate")
                    if mob then
                        repeat
                            wait()
                            ;({}).Kill(mob, _G.Auto_Mink)
                        until GetBP("Flower 3") or not mob.Parent or mob.Humanoid.Health <= 0 or _G.Auto_Mink == false
                    else
                        _tp(CFrame.new(980.09851074219, 121.33129882812, 1287.2093505859))
                    end
                end
            elseif alchemist == 2 then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
            end
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
            replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
            _G.AutoFarmChest = true
        else
            _G.AutoFarmChest = false
        end
    end
end)
    end
end)
spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.Auto_Human then
        local alchemist = replicated.Remotes.CommF_:InvokeServer("Alchemist", "1")
        if alchemist ~= -2 then
            if alchemist == 0 then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
            elseif alchemist == 1 then
                if not GetBP("Flower 1") then
                    _tp(workspace.Flower1.CFrame)
                elseif not GetBP("Flower 2") then
                    _tp(workspace.Flower2.CFrame)
                elseif not GetBP("Flower 3") then
                    local mob = GetConnectionEnemies("Swan Pirate")
                    if mob then
                        repeat
                            wait()
                            ;({}).Kill(mob, _G.Auto_Human)
                        until GetBP("Flower 3") or not mob.Parent or mob.Humanoid.Health <= 0 or _G.Auto_Human == false
                    else
                        _tp(CFrame.new(980.09851074219, 121.33129882812, 1287.2093505859))
                    end
                end
            elseif alchemist == 2 then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
            end
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
            replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
            local bosses = {"Fajita", "Jeremy", "Diamond"}
            for _, bossName in ipairs(bosses) do
                local boss = GetConnectionEnemies(bossName)
                if boss then
                    repeat
                        wait()
                        ;({}).Kill(boss, _G.Auto_Human)
                    until boss.Humanoid.Health <= 0 or not boss.Parent or not _G.Auto_Human
                else
                    local bossPositions = {Fajita = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625), Jeremy = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109), Diamond = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)}
                    _tp(bossPositions[bossName])
                end
            end
        end
    end
end)
    end
end)
spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.Auto_Skypiea then
        local alchemist = replicated.Remotes.CommF_:InvokeServer("Alchemist", "1")
        if alchemist ~= -2 then
            if alchemist == 0 then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
            elseif alchemist == 1 then
                if not GetBP("Flower 1") then
                    _tp(workspace.Flower1.CFrame)
                elseif not GetBP("Flower 2") then
                    _tp(workspace.Flower2.CFrame)
                elseif not GetBP("Flower 3") then
                    local mob = GetConnectionEnemies("Swan Pirate")
                    if mob then
                        repeat
                            wait()
                            ;({}).Kill(mob, _G.Auto_Skypiea)
                        until GetBP("Flower 3") or not mob.Parent or mob.Humanoid.Health <= 0 or _G.Auto_Skypiea == false
                    else
                        _tp(CFrame.new(980.09851074219, 121.33129882812, 1287.2093505859))
                    end
                end
            elseif alchemist == 2 then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
            end
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
            replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
            for _, player in pairs(game.Players:GetChildren()) do
                if player.Name ~= plr.Name and tostring(player.Data.Race.Value) == "Skypiea" then
                    repeat
                        task.wait()
                        _tp(player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-45), 0, 0))
                    until player.Character.Humanoid.Health <= 0 or _G.Auto_Skypiea == false
                end
            end
        end
    end
end)
    end
end)
spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.Auto_Fish then
        local alchemist = replicated.Remotes.CommF_:InvokeServer("Alchemist", "1")
        if alchemist ~= -2 then
            if alchemist == 0 then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
            elseif alchemist == 1 then
                if not GetBP("Flower 1") then
                    _tp(workspace.Flower1.CFrame)
                elseif not GetBP("Flower 2") then
                    _tp(workspace.Flower2.CFrame)
                elseif not GetBP("Flower 3") then
                    local mob = GetConnectionEnemies("Swan Pirate")
                    if mob then
                        repeat
                            wait()
                            ;({}).Kill(mob, _G.Auto_Fish)
                        until GetBP("Flower 3") or not mob.Parent or mob.Humanoid.Health <= 0 or _G.Auto_Fish == false
                    else
                        _tp(CFrame.new(980.09851074219, 121.33129882812, 1287.2093505859))
                    end
                end
            elseif alchemist == 2 then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
            end
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
            replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
            warn("Sea Beast Soon")
        end
    end
end)
    end
end)
v9:AddSection({"Fruits Options"})
local function formatNumber(num)
    local formatted = tostring(num)
    return formatted
end
local function GetFruitStock()
    local _GSaveData = "Advance Fruit Stock\n"
    local success, advancedStock = pcall(function()
    return replicated.Remotes.CommF_:InvokeServer("GetFruits", true)
end)
    if success and advancedStock then
        for _, fruit in pairs(advancedStock) do
            if fruit.OnSale then
                _GSaveData = "Advance Fruit Stock\n" .. fruit.Name .. " - $" .. formatNumber(fruit.Price) .. "\n"
            end
        end
        do
            _GSaveData = "Advance Fruit Stock\n- No fruit in stock.\n"
        end
    else
        _GSaveData = "Advance Fruit Stock\n- Error retrieving data.\n"
    end
    _GSaveData = "Advance Fruit Stock\n\nNormal Fruit Stock\n"
    local success2, normalStock = pcall(function()
    return replicated.Remotes.CommF_:InvokeServer("GetFruits")
end)
    if success2 and normalStock then
        for _, fruit in pairs(normalStock) do
            if fruit.OnSale then
                _GSaveData = "Advance Fruit Stock\n\nNormal Fruit Stock\n" .. fruit.Name .. " - $" .. formatNumber(fruit.Price) .. "\n"
            end
        end
        do
            _GSaveData = "Advance Fruit Stock\n\nNormal Fruit Stock\n- No fruit in stock.\n"
        end
    else
        _GSaveData = "Advance Fruit Stock\n\nNormal Fruit Stock\n- Error retrieving data.\n"
    end
    return "Advance Fruit Stock\n\nNormal Fruit Stock\n"
end
local StockParagraph = v9:AddParagraph({Title = "Fruit Stock", Desc = "Loading..."})
task.spawn(function()
    pcall(function()
    StockParagraph:SetDesc(GetFruitStock())
end)
    while task.wait(60) do
        pcall(function()
    StockParagraph:SetDesc(GetFruitStock())
end)
    end
end)
v9:AddButton({Title = "Refresh Stock Now", Callback = function()
    pcall(function()
    StockParagraph:SetDesc(GetFruitStock())
    uiLib:Notify({Title = "Fruit Stock", Message = "Stock refreshed", Duration = 2})
end)
end})
v9:AddSection({"Fruit Auto Functions"})
v9:AddToggle({Title = "Auto Random Fruit", Callback = function(Value)
    _G.Random_Auto = Value
    _G.SaveData.Random_Auto_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        pcall(function()
    if _G.Random_Auto then
        replicated.Remotes.CommF_:InvokeServer("Cousin", "Buy")
    end
end)
    end
end)
v9:AddToggle({Title = "Auto Drop Fruit", Callback = function(Value)
    _G.DropFruit = Value
    _G.SaveData.DropFruit_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        if _G.DropFruit then
            pcall(function()
    DropFruits()
end)
        end
    end
end)
v9:AddToggle({Title = "Auto Store Fruit", Callback = function(Value)
    _G.StoreF = Value
    _G.SaveData.StoreF_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        if _G.StoreF then
            pcall(function()
    UpdStFruit()
end)
        end
    end
end)
v9:AddToggle({Title = "Auto Tween to Fruit", Callback = function(Value)
    _G.TwFruits = Value
    _G.SaveData.TwFruits_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        if _G.TwFruits then
            pcall(function()
    for _, obj in pairs(workspace:GetChildren()) do
        if string.find(obj.Name, "Fruit") then
            _tp(obj.Handle.CFrame)
        end
    end
end)
        end
    end
end)
v9:AddToggle({Title = "Auto Collect Fruit", Callback = function(Value)
    _G.InstanceF = Value
    _G.SaveData.InstanceF_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.5) do
        if _G.InstanceF then
            pcall(function()
    collectFruits(_G.InstanceF)
end)
        end
    end
end)
v9:AddSection({"Fruit Shop Sniper"})
v9:AddDropdown({Name = "Select Fruit to Buy", Options = {"Rocket-Rocket", "Spin-Spin", "Blade-Blade", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Ice-Ice", "Sand-Sand", "Dark-Dark", "Eagle-Eagle", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Ghost-Ghost", "Magma-Magma", "Quake-Quake", "Buddha-Buddha", "Love-Love", "Creation-Creation", "Spider-Spider", "Sound-Sound", "Phoenix-Phoenix", "Portal-Portal", "Lightning-Lightning", "Pain-Pain", "Blizzard-Blizzard", "Gravity-Gravity", "T-Rex-T-Rex", "Mammoth-Mammoth", "Dough-Dough", "Shadow-Shadow", "Venom-Venom", "Gas-Gas", "Control-Control", "Spirit-Spirit", "Leopard-Leopard", "Yeti-Yeti", "Kitsune-Kitsune", "Dragon-Dragon"}, Default = GetSetting("SelectFruit_Save", "Dough-Dough"), Multi = false, Callback = function(Value)
    getgenv().SelectFruit = Value
    _G.SaveData.SelectFruit_Save = Value
    SaveSettings()
end})
v9:AddToggle({Title = "Auto Buy Fruit (Shop Sniper)", Callback = function(Value)
    getgenv().AutoBuyFruitSniper = Value
    _G.SaveData.AutoBuyFruitSniper_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(1) do
        pcall(function()
    if getgenv().AutoBuyFruitSniper and getgenv().SelectFruit then
        replicated.Remotes.CommF_:InvokeServer("GetFruits")
        replicated.Remotes.CommF_:InvokeServer("PurchaseRawFruit", getgenv().SelectFruit)
    end
end)
    end
end)
v9:AddSection({"Fruit Stock Checker"})
local function CheckSpecificFruit(fruitName)
    local success, stock = pcall(function()
    return replicated.Remotes.CommF_:InvokeServer("GetFruits", true)
end)
    if success and stock then
        for _, fruit in pairs(stock) do
            if fruit.Name == fruitName and fruit.OnSale then
                return true, fruit.Price
            end
        end
    end
    local success2, normalStock = pcall(function()
    return replicated.Remotes.CommF_:InvokeServer("GetFruits")
end)
    if success2 and normalStock then
        for _, fruit in pairs(normalStock) do
            if fruit.Name == fruitName and fruit.OnSale then
                return true, fruit.Price
            end
        end
    end
    return false, nil
end
v9:AddDropdown({Name = "Select Fruit to Check", Options = {"Rocket-Rocket", "Spin-Spin", "Blade-Blade", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Ice-Ice", "Sand-Sand", "Dark-Dark", "Eagle-Eagle", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Ghost-Ghost", "Magma-Magma", "Quake-Quake", "Buddha-Buddha", "Love-Love", "Creation-Creation", "Spider-Spider", "Sound-Sound", "Phoenix-Phoenix", "Portal-Portal", "Lightning-Lightning", "Pain-Pain", "Blizzard-Blizzard", "Gravity-Gravity", "T-Rex-T-Rex", "Mammoth-Mammoth", "Dough-Dough", "Shadow-Shadow", "Venom-Venom", "Gas-Gas", "Control-Control", "Spirit-Spirit", "Leopard-Leopard", "Yeti-Yeti", "Kitsune-Kitsune", "Dragon-Dragon"}, Default = "Dough-Dough", Multi = false, Callback = function(Value)
    _G.CheckFruit = Value
end})
local FruitCheckResult = v9:AddParagraph({Title = "Fruit Status", Desc = "Select a fruit to check"})
v9:AddButton({Title = "Check Selected Fruit", Callback = function()
    if not _G.CheckFruit then
        FruitCheckResult:SetDesc("Please select a fruit first")
        return
    end
    pcall(function()
    local inStock, price = CheckSpecificFruit(_G.CheckFruit)
    if inStock then
        FruitCheckResult:SetDesc("✅ " .. _G.CheckFruit .. " is in stock!\nPrice: $" .. formatNumber(price))
        uiLib:Notify({Title = "Fruit Stock", Message = _G.CheckFruit .. " is in stock!", Duration = 5})
    else
        FruitCheckResult:SetDesc("❌ " .. _G.CheckFruit .. " is not in stock")
    end
end)
end})
v9:AddToggle({Title = "Auto Notify when Fruit in Stock", Callback = function(Value)
    _G.AutoNotifyFruit = Value
    _G.SaveData.AutoNotifyFruit_Save = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(30) do
        if _G.AutoNotifyFruit and _G.CheckFruit then
            pcall(function()
    local inStock, price = CheckSpecificFruit(_G.CheckFruit)
    if inStock then
        FruitCheckResult:SetDesc("✅ " .. _G.CheckFruit .. " is in stock!\nPrice: $" .. formatNumber(price))
        uiLib:Notify({Title = "Fruit Stock Alert!", Message = _G.CheckFruit .. " is now in stock!\nPrice: $" .. formatNumber(price), Duration = 10})
    end
end)
        end
    end
end)
result1:AddSection({"Raid Status"})
local RaidTimerStatus = result1:AddParagraph({Title = "Raid Timer", Desc = "Not in raid"})
local RaidIslandStatus = result1:AddParagraph({Title = "Current Island", Desc = "None"})
local RaidMobsStatus = result1:AddParagraph({Title = "Mobs Remaining", Desc = "0"})
task.spawn(function()
    while task.wait(1) do
        pcall(function()
    local timer = plr.PlayerGui.Main.TopHUDList.RaidTimer
    if plr.PlayerGui.Main.TopHUDList.RaidTimer and plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
        RaidTimerStatus:SetDesc("Active - " .. plr.PlayerGui.Main.TopHUDList.RaidTimer.Text)
    else
        RaidTimerStatus:SetDesc("Not in raid")
    end
end)
    end
end)
result1:AddSection({"Chip Selection"})
_G.SelectChip = _G.SelectChip or "Flame"
result1:AddDropdown({Name = "Select Chip", Options = {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"}, Default = GetSetting("Raid_SelectChip", "Flame"), Multi = false, Callback = function(Value)
    _G.SelectChip = Value
    _G.SaveData.Raid_SelectChip = Value
    SaveSettings()
end})
result1:AddSection({"Buy Chip"})
result1:AddButton({Title = "Buy Chip with Beli", Callback = function()
    if not GetBP("Special Microchip") and _G.SelectChip then
        pcall(function()
    replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
end)
    end
end})
result1:AddButton({Title = "Buy Chip with Fruit", Callback = function()
    if GetBP("Special Microchip") then
        return
    end
    pcall(function()
    local fruits = replicated.Remotes.CommF_:InvokeServer("GetFruits")
    for _, fruit in pairs(fruits) do
        if fruit.Price <= 490000 then
            replicated.Remotes.CommF_:InvokeServer("LoadFruit", fruit.Name)
            task.wait(0.5)
            replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
            break
        end
    end
end)
end})
_G.AutoChipBeli = GetSetting("Raid_AutoChipBeli", false)
result1:AddToggle({Title = "Auto Buy Chip (Beli)", Callback = function(Value)
    _G.AutoChipBeli = Value
    _G.SaveData.Raid_AutoChipBeli = Value
    SaveSettings()
end})
_G.AutoChipFruit = GetSetting("Raid_AutoChipFruit", false)
result1:AddToggle({Title = "Auto Buy Chip (Fruit)", Callback = function(Value)
    _G.AutoChipFruit = Value
    _G.SaveData.Raid_AutoChipFruit = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(5) do
        if _G.AutoChipBeli and _G.SelectChip then
            pcall(function()
    if not GetBP("Special Microchip") then
        replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
    end
end)
        end
    end
end)
task.spawn(function()
    while task.wait(5) do
        if _G.AutoChipFruit and _G.SelectChip then
            pcall(function()
    if not GetBP("Special Microchip") then
        local fruits = replicated.Remotes.CommF_:InvokeServer("GetFruits")
        for _, fruit in pairs(fruits) do
            if fruit.Price <= 490000 then
                replicated.Remotes.CommF_:InvokeServer("LoadFruit", fruit.Name)
                task.wait(0.5)
                replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                break
            end
        end
    end
end)
        end
    end
end)
result1:AddToggle({Title = "Get Fruit Inventory Below 1M", Callback = function(Value)
    getgenv().AutoGetFruit = Value
    _G.SaveData.AutoGetFruit_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(1) do
        pcall(function()
    if getgenv().AutoGetFruit then
        local cheapFruits = {"Rocket-Rocket", "Spin-Spin", "Chop-Chop", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Falcon-Falcon", "Ice-Ice", "Sand-Sand", "Dark-Dark", "Ghost-Ghost", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Barrier-Barrier"}
        for _, fruit in ipairs(cheapFruits) do
            replicated.Remotes.CommF_:InvokeServer("LoadFruit", fruit)
        end
    end
end)
    end
end)
result1:AddSection({"Raid Controls"})
_G.AutoStartRaid = GetSetting("Raid_AutoStartRaid", false)
result1:AddToggle({Title = "Auto Start Raid", Callback = function(Value)
    _G.AutoStartRaid = Value
    _G.SaveData.Raid_AutoStartRaid = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(1) do
        if _G.AutoStartRaid then
            pcall(function()
    local timer = plr.PlayerGui.Main.TopHUDList.RaidTimer
    if plr.PlayerGui.Main.TopHUDList.RaidTimer and plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
        return
    end
    if not GetBP("Special Microchip") then
        return
    end
    if World2 then
        local btn = workspace.Map.CircleIsland.RaidSummon2.Button.Main
        if workspace.Map.CircleIsland.RaidSummon2.Button.Main then
            if workspace.Map.CircleIsland.RaidSummon2.Button.Main:FindFirstChild("ProximityPrompt") then
                fireproximityprompt(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ProximityPrompt)
            elseif workspace.Map.CircleIsland.RaidSummon2.Button.Main:FindFirstChild("ClickDetector") then
                fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
            end
        end
    elseif World3 then
        local btn = workspace.Map["Boat Castle"].RaidSummon2.Button.Main
        if workspace.Map["Boat Castle"].RaidSummon2.Button.Main then
            if workspace.Map["Boat Castle"].RaidSummon2.Button.Main:FindFirstChild("ProximityPrompt") then
                fireproximityprompt(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ProximityPrompt)
            elseif workspace.Map["Boat Castle"].RaidSummon2.Button.Main:FindFirstChild("ClickDetector") then
                fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
            end
        end
    end
end)
        end
    end
end)
result1:AddSection({"Auto Farm Dungeon"})
local RaidIslands = {"Island 1", "Island 2", "Island 3", "Island 4", "Island 5"}
local function GetHRP()
    return plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
end
local function GetCurrentIsland()
    local hrp = GetHRP()
    local mathHuge = math.huge
    local _GSaveData = nil
    for _, name in ipairs(RaidIslands) do
        local island = locations:FindFirstChild(name)
        if island then
            local dist = (hrp.Position - island.Position).Magnitude
            if dist < mathHuge then
                mathHuge = dist
                _GSaveData = name
            end
        end
    end
    return nil, math.huge
end
local function HasMobsInIsland(islandName)
    local island = workspace._WorldOrigin.Locations:FindFirstChild(islandName)
    for _, mob in pairs(workspace.Enemies:GetChildren()) do
        local humanoid = mob:FindFirstChild("Humanoid")
        local humanoidRootPart = mob:FindFirstChild("HumanoidRootPart")
        if humanoid and humanoidRootPart and humanoid.Health > 0 then
            if (humanoidRootPart.Position - island.Position).Magnitude < 450 then
                return true
            end
        end
    end
    return false
end
local function GetNearestMob()
    local hrp = GetHRP()
    local currentIsland = GetCurrentIsland()
    local island = workspace._WorldOrigin.Locations:FindFirstChild(currentIsland)
    local closest = nil
    local mathHuge = math.huge
    for _, mob in pairs(workspace.Enemies:GetChildren()) do
        local humanoid = mob:FindFirstChild("Humanoid")
        local humanoidRootPart = mob:FindFirstChild("HumanoidRootPart")
        if humanoid and humanoidRootPart and humanoid.Health > 0 then
            if (humanoidRootPart.Position - island.Position).Magnitude < 450 then
                local dist = (humanoidRootPart.Position - hrp.Position).Magnitude
                if dist < mathHuge then
                    mathHuge = dist
                    closest = mob
                end
            end
        end
    end
    return nil
end
local function MoveToNextIsland()
    local current = GetCurrentIsland()
    local idx = table.find(RaidIslands, current)
    local nextName = RaidIslands[idx + 1]
    local nextIsland = workspace._WorldOrigin.Locations:FindFirstChild(nextName)
    if nextIsland then
        _tp(nextIsland.CFrame * CFrame.new(0, 45, 120))
        CurrentTargetIsland = nextName
        return true
    end
    return false
end
_G.AutoDungeonFarm = GetSetting("Raid_AutoDungeonFarm", false)
result1:AddToggle({Title = "Auto Farm Dungeon + Next Floor", Callback = function(Value)
    _G.AutoDungeonFarm = Value
    _G.SaveData.Raid_AutoDungeonFarm = Value
    if not Value then
        CurrentTargetIsland = nil
    end
end})
task.spawn(function()
    while task.wait(0.3) do
        if not _G.AutoDungeonFarm then
            RaidIslandStatus:SetDesc("None")
            RaidMobsStatus:SetDesc("0")
            continue
        end
        pcall(function()
    local timer = plr.PlayerGui.Main.TopHUDList.RaidTimer
    if not plr.PlayerGui.Main.TopHUDList.RaidTimer or not plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
        RaidIslandStatus:SetDesc("Not in raid")
        RaidMobsStatus:SetDesc("0")
        return
    end
    local hrp = GetHRP()
    if not hrp then
        return
    end
    local currentIsland, dist = GetCurrentIsland()
    if currentIsland then
        RaidIslandStatus:SetDesc(currentIsland .. " (" .. math.floor(dist) .. " studs)")
    end
    local num1 = 0
    for _ in pairs(workspace.Enemies:GetChildren()) do
        num1 = num1 + 1
    end
    RaidMobsStatus:SetDesc(tostring(num1))
    local mob = GetNearestMob()
    if mob then
        local humanoidRootPart = mob:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            if (hrp.Position - humanoidRootPart.Position).Magnitude > 15 then
                _tp(humanoidRootPart.CFrame * CFrame.new(0, 20, 0))
            end
            if _G.SelectWeapon then
                EquipWeapon(_G.SelectWeapon)
            end
            if {} and ({}).Kill then
                ;({}).Kill(mob, true)
            end
        end
    else
        if currentIsland and not HasMobsInIsland(currentIsland) then
            MoveToNextIsland()
            task.wait(1)
        end
    end
end)
    end
end)
result1:AddSection({"Teleport Floors"})
result1:AddButton({Title = "TP to Floor 1 Start", Callback = function()
    if World2 then
        _tp(CFrame.new(-4995.0678710938, 315.38330078125, -2955.3999023438))
    elseif World3 then
        _tp(CFrame.new(-5017.40869, 314.844055, -2823.0127))
    end
end})
result1:AddButton({Title = "TP to Floor 2 Start", Callback = function()
    if World2 then
        _tp(CFrame.new(-5134.9584960938, 314.50729370117, -3004.6711425781))
    elseif World3 then
        _tp(CFrame.new(-5156.72607, 313.655548, -2865.62402))
    end
end})
result1:AddButton({Title = "TP to Floor 3 Start", Callback = function()
    if World2 then
        _tp(CFrame.new(-5271.7846679688, 314.50729370117, -3022.3569335938))
    elseif World3 then
        _tp(CFrame.new(-5292.91455, 313.655548, -2887.93799))
    end
end})
result1:AddButton({Title = "TP to Floor 4 Start", Callback = function()
    if World2 then
        _tp(CFrame.new(-5407.0478515625, 314.50729370117, -3003.6403808594))
    elseif World3 then
        _tp(CFrame.new(-5429.59473, 313.655548, -2866.41577))
    end
end})
result1:AddButton({Title = "TP to Floor 5 Start", Callback = function()
    if World2 then
        _tp(CFrame.new(-5528.6049804688, 315.62127685547, -2955.0756835938))
    elseif World3 then
        _tp(CFrame.new(-5550.41895, 314.770203, -2816.70508))
    end
end})
result1:AddSection({"Awakening"})
_G.AutoAwaken = GetSetting("Raid_AutoAwaken", false)
result1:AddToggle({Title = "Auto Awakening", Callback = function(Value)
    _G.AutoAwaken = Value
    _G.SaveData.Raid_AutoAwaken = Value
    SaveSettings()
end})
task.spawn(function()
    while wait(2) do
        if _G.AutoAwaken then
            pcall(function()
    replicated.Remotes.CommF_:InvokeServer("Awakener", "Check")
    replicated.Remotes.CommF_:InvokeServer("Awakener", "Awaken")
end)
        end
    end
end)
result1:AddSection({"Law/Order Raid"})
result1:AddButton({Title = "Buy Law Microchip", Callback = function()
    replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
end})
result1:AddButton({Title = "Start Law Raid", Callback = function()
    if World2 then
        pcall(function()
    fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
end)
    end
end})
_G.AutoBuyLawChip = GetSetting("Raid_AutoBuyLawChip", false)
result1:AddToggle({Title = "Auto Buy Law Chip", Callback = function(Value)
    _G.AutoBuyLawChip = Value
    _G.SaveData.Raid_AutoBuyLawChip = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(5) do
        if _G.AutoBuyLawChip then
            pcall(function()
    replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
end)
        end
    end
end)
_G.AutoStartLawRaid = GetSetting("Raid_AutoStartLawRaid", false)
result1:AddToggle({Title = "Auto Start Law Raid", Callback = function(Value)
    _G.AutoStartLawRaid = Value
    _G.SaveData.Raid_AutoStartLawRaid = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(5) do
        if _G.AutoStartLawRaid and World2 then
            pcall(function()
    fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
end)
        end
    end
end)
_G.AutoKillOrder = GetSetting("Raid_AutoKillOrder", false)
result1:AddToggle({Title = "Auto Kill Order", Callback = function(Value)
    _G.AutoKillOrder = Value
    _G.SaveData.Raid_AutoKillOrder = Value
    SaveSettings()
end})
task.spawn(function()
    while wait(1) do
        if _G.AutoKillOrder then
            pcall(function()
    local boss = GetConnectionEnemies("Order")
    if boss then
        repeat
            task.wait()
            if {} and ({}).Kill then
                ;({}).Kill(boss, true)
            end
        until not boss.Parent or boss.Humanoid.Health <= 0
    else
        _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
    end
end)
        end
    end
end)
result1:AddSection({"Teleport"})
_G.TpLab = GetSetting("Raid_TpLab", false)
result1:AddToggle({Title = "Auto Teleport to Lab", Callback = function(Value)
    _G.TpLab = Value
    _G.SaveData.Raid_TpLab = Value
    SaveSettings()
end})
task.spawn(function()
    while wait(0.1) do
        if _G.TpLab then
            if World2 then
                _tp(CFrame.new(-6438.73535, 250.645355, -4501.50684))
            elseif World3 then
                _tp(CFrame.new(-5017.40869, 314.844055, -2823.0127))
            end
        end
    end
end)
result1:AddSection({"Kill Aura"})
_G.KillAura = GetSetting("Raid_KillAura", false)
_G.KillAuraRange = GetSetting("Raid_KillAuraRange", 500)
_G.KillAuraDelay = GetSetting("Raid_KillAuraDelay", 2)
result1:AddToggle({Title = "Kill Aura", Callback = function(Value)
    _G.KillAura = Value
    _G.SaveData.Raid_KillAura = Value
    SaveSettings()
end})
result1:AddTextBox({Title = "Kill Aura Range", PlaceHolder = "500", Default = tostring(_G.KillAuraRange), Callback = function(Value)
    if 0 and 0 > 0 then
        _G.KillAuraRange = 0
        _G.SaveData.Raid_KillAuraRange = 0
        SaveSettings()
    end
end})
result1:AddTextBox({Title = "Kill Aura Delay (s)", PlaceHolder = "2", Default = tostring(_G.KillAuraDelay), Callback = function(Value)
    if 0 and 0 > 0 then
        _G.KillAuraDelay = 0
        _G.SaveData.Raid_KillAuraDelay = 0
        SaveSettings()
    end
end})
local num1 = 0
local KillAuraDisplay = result1:AddParagraph({Title = "Kill Aura Stats", Desc = "Killed: 0"})
task.spawn(function()
    while task.wait(1) do
        if _G.KillAura then
            KillAuraDisplay:SetDesc("Killed: " .. 0 .. " | Range: " .. _G.KillAuraRange)
        else
            KillAuraDisplay:SetDesc("Killed: 0 | Disabled")
        end
    end
end)
task.spawn(function()
    while task.wait(_G.KillAuraDelay) do
        if _G.KillAura then
            pcall(function()
    local hrp = GetHRP()
    if not hrp then
        return
    end
    sethiddenproperty(plr, "SimulationRadius", math.huge)
    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        local humanoid = enemy:FindFirstChild("Humanoid")
        local humanoidRootPart = enemy:FindFirstChild("HumanoidRootPart")
        if humanoid and humanoidRootPart and humanoid.Health > 0 then
            if (humanoidRootPart.Position - hrp.Position).Magnitude <= _G.KillAuraRange then
                humanoid.Health = 0
                humanoidRootPart.CanCollide = false
                enemy:BreakJoints()
                num1 = 1
            end
        end
    end
end)
        end
    end
end)
result1:AddButton({Title = "Reset Kill Counter", Callback = function()
    num1 = 0
end})
result2:AddSection({"Travel - Worlds"})
result2:AddButton({Title = "Teleport Sea 1", Callback = function()
    replicated.Remotes.CommF_:InvokeServer("TravelMain")
end})
result2:AddButton({Title = "Teleport Sea 2", Callback = function()
    replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end})
result2:AddButton({Title = "Teleport Sea 3", Callback = function()
    replicated.Remotes.CommF_:InvokeServer("TravelZou")
end})
result2:AddSection({"Travel - Island"})
for _, value97 in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
    table.insert({}, value97.Name)
end
result2:AddDropdown({Name = "Select Travelling", Options = {}, Default = false, Multi = false, Callback = function(param87)
    _G.Island = param87
end})
result2:AddToggle({Title = "Auto Travel", Callback = function(Value)
    _G.Teleport = Value
    _G.SaveData.AutoTravelIsland_Save = Value
    SaveSettings()
    if Value and _G.Island then
        task.spawn(function()
    local targetIsland = workspace._WorldOrigin.Locations:FindFirstChild(_G.Island)
    if targetIsland and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local Root = plr.Character.HumanoidRootPart
        plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 700, 0)
        wait(0.1)
        local result14 = targetIsland.CFrame * CFrame.new(0, 700, 0)
        repeat
            wait()
            _tp(result14)
        until not _G.Teleport or (plr.Character.HumanoidRootPart.Position - result14.p).Magnitude < 10
    end
end)
    end
end})
result2:AddSection({"Travel - Portal"})
local Location_Portal = {}
if World1 then
    Location_Portal = {"Sky", "UnderWater"}
elseif World2 then
    Location_Portal = {"SwanRoom", "Cursed Ship"}
elseif World3 then
    Location_Portal = {"Castle On The Sea", "Mansion Cafe", "Hydra Teleport", "Canvendish Room", "Temple of Time"}
end
result2:AddDropdown({Name = "Select Portal", Options = {}, Default = false, Multi = false, Callback = function(param88)
    _G.Island_PT = param88
end})
result2:AddButton({Title = "requestEntrance", Callback = function()
    if _G.Island_PT == "Sky" then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894, 5547, -380))
    elseif _G.Island_PT == "UnderWater" then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163, 11, 1819))
    elseif _G.Island_PT == "SwanRoom" then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2285, 15, 905))
    elseif _G.Island_PT == "Cursed Ship" then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923, 126, 32852))
    elseif _G.Island_PT == "Castle On The Sea" then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602))
    elseif _G.Island_PT == "Mansion Cafe" then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
    elseif _G.Island_PT == "Hydra Teleport" then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5643.4526367188, 1013.0858154297, -340.51025390625))
    elseif _G.Island_PT == "Canvendish Room" then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5314.5463867188, 22.562219619751, -127.06755065918))
    elseif _G.Island_PT == "Temple of Time" then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741))
    end
end})
result2:AddSection({"Travel - NPCs"})
for _, npc in pairs(replicated.NPCs:GetChildren()) do
    table.insert({}, npc.Name)
end
result2:AddDropdown({Name = "Select NPCs", Options = {}, Default = false, Multi = false, Callback = function(param89)
    NPClist = param89
end})
result2:AddToggle({Title = "Auto Tween to NPCs", Callback = function(param90)
    _G.TPNpc = param90
    _G.SaveData.AutoTPNPC_Save = param90
    SaveSettings()
end})
spawn(function()
    while wait(0.1) do
        if _G.TPNpc and NPClist then
            pcall(function()
    for _, npc in pairs(replicated.NPCs:GetChildren()) do
        if npc.Name == NPClist then
            _tp(npc.HumanoidRootPart.CFrame)
        end
    end
end)
        end
    end
end)
result4:AddSection({"Stats Upgrade"})
local num2 = 10
result4:AddSlider({Name = "Stats Value", Min = 0, Max = 1000, Default = GetSetting("StatsValue_Save", 10), Increment = 1, Callback = function(Value)
    num2 = Value
    _G.SaveData.StatsValue_Save = Value
    SaveSettings()
end})
result4:AddToggle({Title = "Auto Melee", Callback = function(Value)
    _G.Auto_Melee = Value
    _G.SaveData.Auto_Melee_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.Auto_Melee then
        statsSetings("Melee", 10)
    end
end)
    end
end)
result4:AddToggle({Title = "Auto Sword", Callback = function(Value)
    _G.Auto_Sword = Value
    _G.SaveData.Auto_Sword_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.Auto_Sword then
        statsSetings("Sword", 10)
    end
end)
    end
end)
result4:AddToggle({Title = "Auto Gun", Callback = function(Value)
    _G.Auto_Gun = Value
    _G.SaveData.Auto_Gun_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.Auto_Gun then
        statsSetings("Gun", 10)
    end
end)
    end
end)
result4:AddToggle({Title = "Auto Blox Fruit", Callback = function(Value)
    _G.Auto_DevilFruit = Value
    _G.SaveData.Auto_DevilFruit_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.Auto_DevilFruit then
        statsSetings("Devil", 10)
    end
end)
    end
end)
result4:AddToggle({Title = "Auto Defense", Callback = function(Value)
    _G.Auto_Defense = Value
    _G.SaveData.Auto_Defense_Save = Value
    SaveSettings()
end})
spawn(function()
    while wait(0.1) do
        pcall(function()
    if _G.Auto_Defense then
        statsSetings("Defense", 10)
    end
end)
    end
end)
result4:AddSection({"ESP"})
local NumberESP = math.random(1, 1000000)
local flag = false
local flag1 = false
local flag2 = false
local flag3 = false
local flag4 = false
local flag5 = false
local flag6 = false
local flag7 = false
local flag8 = false
local function round(num)
    return math.floor(tonumber(num) + 0.5)
end
local function UpdateChestESP()
    local CollectionService = game:GetService("CollectionService")
    local Chests = CollectionService:GetTagged("_ChestTagged")
    if not flag4 then
        for _, chest in ipairs(Chests) do
            pcall(function()
    local chestESPAttachment = chest:FindFirstChild("ChestESPAttachment")
    if chestESPAttachment then
        chestESPAttachment:Destroy()
    end
end)
        end
    end
    for _, chest in ipairs(Chests) do
        pcall(function()
    local chestPos = chest:GetPivot().Position
    local distance = round((game.Players.LocalPlayer.Character.Head.Position - chestPos).Magnitude / 3)
    local chestName = chest.Name:gsub("Label", "")
    local chestESPAttachment = chest:FindFirstChild("ChestESPAttachment")
    if not chestESPAttachment then
        chestESPAttachment = Instance.new("Attachment")
        chestESPAttachment.Name = "ChestESPAttachment"
        chestESPAttachment.Parent = chest
        chestESPAttachment.Position = Vector3.new(0, 3, 0)
        local billboardGui = Instance.new("BillboardGui", chestESPAttachment)
        billboardGui.Name = "NameESP"
        billboardGui.Size = UDim2.new(0, 200, 0, 30)
        billboardGui.Adornee = chestESPAttachment
        billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
        billboardGui.AlwaysOnTop = true
        local textLabel = Instance.new("TextLabel", billboardGui)
        textLabel.Font = Enum.Font.Code
        textLabel.TextSize = 14
        textLabel.TextWrapped = true
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.TextYAlignment = Enum.TextYAlignment.Top
        textLabel.BackgroundTransparency = 1
        textLabel.TextStrokeTransparency = 0.5
        textLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
        textLabel.Text = "[" .. chestName .. "] " .. distance .. "M"
    else
        if chestESPAttachment:FindFirstChild("NameESP") then
            chestESPAttachment.NameESP.TextLabel.Text = "[" .. chestName .. "] " .. distance .. "M"
        end
    end
end)
    end
end
result4:AddToggle({Title = "ESP Player", Callback = function(Value)
    flag = Value
    _G.SaveData.ESP_Player_Save = Value
    SaveSettings()
end})
result4:AddToggle({Title = "ESP Island", Callback = function(Value)
    flag1 = Value
    _G.SaveData.ESP_Island_Save = Value
    SaveSettings()
end})
result4:AddToggle({Title = "ESP Fruit", Callback = function(Value)
    flag2 = Value
    _G.SaveData.ESP_Fruit_Save = Value
    SaveSettings()
end})
result4:AddToggle({Title = "ESP Flower", Callback = function(Value)
    flag3 = Value
    _G.SaveData.ESP_Flower_Save = Value
    SaveSettings()
end})
result4:AddToggle({Title = "ESP Chest", Callback = function(Value)
    flag4 = Value
    _G.SaveData.ESP_Chest_Save = Value
    SaveSettings()
end})
result4:AddToggle({Title = "ESP Gear (Mirage)", Callback = function(Value)
    flag5 = Value
    _G.SaveData.ESP_Gear_Save = Value
    SaveSettings()
end})
result4:AddToggle({Title = "ESP Advanced Dealer", Callback = function(Value)
    flag6 = Value
    _G.SaveData.ESP_AdvDealer_Save = Value
    SaveSettings()
end})
result4:AddToggle({Title = "ESP Haki Color", Callback = function(Value)
    flag7 = Value
    _G.SaveData.ESP_HakiColor_Save = Value
    SaveSettings()
end})
result4:AddToggle({Title = "ESP Berry", Callback = function(Value)
    flag8 = Value
    _G.SaveData.ESP_Berry_Save = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(0.1) do
        do
            pcall(function()
    for _, player in pairs(game.Players:GetChildren()) do
        if player.Character and player.Character:FindFirstChild("Head") then
            local esp = player.Character.Head:FindFirstChild("NameESP" .. NumberESP)
            if esp then
                esp:Destroy()
            end
        end
    end
end)
        end
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        do
            pcall(function()
    for _, loc in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
        if loc:FindFirstChild("NameESP") then
            loc.NameESP:Destroy()
        end
    end
end)
        end
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        do
            pcall(function()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:FindFirstChild("Handle") then
            local esp = obj.Handle:FindFirstChild("NameESP" .. NumberESP)
            if esp then
                esp:Destroy()
            end
        end
    end
end)
        end
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        do
            pcall(function()
    for _, obj in pairs(workspace:GetChildren()) do
        if (obj.Name == "Flower1" or obj.Name == "Flower2") and obj:FindFirstChild("NameESP" .. NumberESP) then
            obj["NameESP" .. NumberESP]:Destroy()
        end
    end
end)
        end
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        pcall(UpdateChestESP)
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        do
            pcall(function()
    local mysticIsland = workspace.Map:FindFirstChild("MysticIsland")
    if mysticIsland then
        for _, part in pairs(mysticIsland:GetDescendants()) do
            if part:FindFirstChild("NameESP") then
                part.NameESP:Destroy()
            end
        end
    end
end)
        end
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        do
            pcall(function()
    if workspace:FindFirstChild("AdvESP") then
        workspace.AdvESP:Destroy()
    end
end)
        end
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        do
            pcall(function()
    if workspace:FindFirstChild("HakiESP") then
        workspace.HakiESP:Destroy()
    end
end)
        end
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        do
            pcall(function()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Part") and obj.Name:match("BerryESP_.*") then
            obj:Destroy()
        end
    end
end)
        end
    end
end)
local logicalResult2 = World1 or false
local logicalResult3 = World2 or false
local logicalResult4 = World3 or false
result5:AddSection({"Mua Melee V1"})
local MeleeCoords = {["Dark Step (Ch\226n \196\144en)"] = {Key = "BuyBlackLeg", NPC = "Dark Step Teacher", Pos = logicalResult2 and CFrame.new(-985, 13, 3988) or logicalResult3 and CFrame.new(-4753, 35, -4850) or logicalResult4 and CFrame.new(-5045, 371, -3181) or nil}, ["Electric (Điện)"] = {Key = "BuyElectro", NPC = "Mad Scientist", Pos = logicalResult2 and CFrame.new(-5384, 13, -2148) or logicalResult3 and CFrame.new(-4867, 35, -4766) or logicalResult4 and CFrame.new(-4995, 314, -3203) or nil}, ["Water Kung Fu (V\245 C\225)"] = {Key = "BuyFishmanKarate", NPC = "Water Kung Fu Teacher", Pos = logicalResult2 and CFrame.new(61585, 18, 987) or logicalResult3 and CFrame.new(-4958, 35, -4668) or logicalResult4 and CFrame.new(-5023, 371, -3190) or nil}, ["Dragon Breath (Hơi Thở Rồng)"] = {Key = "BuyDragonClaw", NPC = "Sabi", Pos = logicalResult3 and CFrame.new(701, 187, 655) or logicalResult4 and CFrame.new(-4981, 371, -3207) or nil}, Superhuman = {Key = "BuySuperhuman", NPC = "Martial Arts Master", Pos = logicalResult3 and CFrame.new(1374, 247, -5192) or logicalResult4 and CFrame.new(-5004, 371, -3198) or nil}, ["Death Step (Ch\226n \196\144en V2)"] = {Key = "BuyDeathStep", NPC = "Phoeyu, the Reformed", Pos = logicalResult3 and CFrame.new(6357, 296, -6762) or logicalResult4 and CFrame.new(-4999, 314, -3221) or nil}, ["Sharkman Karate (V\245 C\225 V2)"] = {Key = "BuySharkmanKarate", NPC = "Daigrock, the Sharkman", Pos = logicalResult3 and CFrame.new(-2602, 238, -10316) or logicalResult4 and CFrame.new(-4972, 314, -3222) or nil}, ["Dragon Talon (Rồng V2)"] = {Key = "BuyDragonTalon", NPC = "Uzoth", Pos = logicalResult4 and CFrame.new(5661, 1211, 865) or nil}, ["Electric Claw (Điện V2)"] = {Key = "BuyElectricClaw", NPC = "Previous Hero", Pos = logicalResult4 and CFrame.new(-10371, 331, -10131) or nil}, Godhuman = {Key = "BuyGodhuman", NPC = "Ancient Monk", Pos = logicalResult4 and CFrame.new(-13776, 334, -9879) or nil}, ["Sanguine Art (V\245 Qu\225\187\183)"] = {Key = "BuySanguineArt", NPC = "Shafi", Pos = logicalResult4 and CFrame.new(-16353, 160, 99) or nil}}
local dark_Step__Ch_n___en_ = "Dark Step (Ch\226n \196\144en)"
local function GetAvailableMeleeOptions()
    for name, data in pairs(MeleeCoords) do
        if data.Pos then
            table.insert({}, name)
        end
    end
    table.sort({})
    return {}
end
result5:AddDropdown({Name = "Chọn Melee Cần Mua", Options = GetAvailableMeleeOptions(), Default = "Dark Step (Ch\226n \196\144en)", Callback = function(Value)
    dark_Step__Ch_n___en_ = Value
end})
result5:AddToggle({Title = "Auto Mua (Bật/Tắt)", Callback = function(Value)
    _G.AutoBuyMelee = Value
    _G.SaveData.AutoBuyMelee_Save = Value
    SaveSettings()
    if Value then
        _G.MeleeNoclip = game:GetService "Stepped":Connect(function()
    if not _G.AutoBuyMelee then
        if _G.MeleeNoclip then
            _G.MeleeNoclip:Disconnect()
        end
        return
    end
    if game.Players.LocalPlayer.Character then
        for _, value98 in pairs(char:GetDescendants()) do
            if value98:IsA("BasePart") and value98.CanCollide then
                value98.CanCollide = false
            end
        end
    end
end)
    else
        if game.Players.LocalPlayer.Character then
            for _, value99 in pairs(char:GetDescendants()) do
                if value99:IsA("BasePart") then
                    value99.CanCollide = true
                end
            end
        end
    end
    task.spawn(function()
    while false do
        task.wait()
        if not _G.AutoBuyMelee then
            break
        end
        local dark_Step__Ch_n___en_1 = MeleeCoords["Dark Step (Ch\226n \196\144en)"]
        if not dark_Step__Ch_n___en_1 or not dark_Step__Ch_n___en_1.Pos then
            uiLib:Notify({Title = "Thauan Hub", Message = "L\225\187\151i: Kh\244ng t\236m th\225\186\165y to\225\186\161 \196\145\225\187\153 cho Melee n\224y \225\187\159 Sea hi\225\187\135n t\225\186\161i!", Duration = 3})
            _G.AutoBuyMelee = false
            break
        end
        local value100 = game.Players.LocalPlayer
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
            local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - dark_Step__Ch_n___en_1.Pos.Position).Magnitude
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - dark_Step__Ch_n___en_1.Pos.Position).Magnitude > 15 then
                _tp(dark_Step__Ch_n___en_1.Pos)
            else
                shouldTween = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dark_Step__Ch_n___en_1.Pos
                game:GetService "Remotes".CommF_:InvokeServer(dark_Step__Ch_n___en_1.Key)
                game:GetService "Remotes".CommF_:InvokeServer("BuyItem", dark_Step__Ch_n___en_1.Key)
                uiLib:Notify({Title = "Thauan Hub", Message = "\196\144\227 mua: Dark Step (Ch\226n \196\144en)", Duration = 2})
                task.wait(1)
            end
        end
    end
end)
end})
result5:AddSection({"Mua Đồ Craft Sea Event"})
result5:AddButton({Title = "Craft Dragonheart", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "Dragonheart")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft Dragonheart", Duration = 2})
end})
result5:AddButton({Title = "Craft Dragonstorm", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "Dragonstorm")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft Dragonstorm", Duration = 2})
end})
result5:AddButton({Title = "Craft DinoHood", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "DinoHood")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft DinoHood", Duration = 2})
end})
result5:AddButton({Title = "Craft SharkTooth", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "SharkTooth")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft SharkTooth", Duration = 2})
end})
result5:AddButton({Title = "Craft TerrorJaw", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "TerrorJaw")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft TerrorJaw", Duration = 2})
end})
result5:AddButton({Title = "Craft SharkAnchor", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "SharkAnchor")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft SharkAnchor", Duration = 2})
end})
result5:AddButton({Title = "Craft LeviathanCrown", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "LeviathanCrown")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft LeviathanCrown", Duration = 2})
end})
result5:AddButton({Title = "Craft LeviathanShield", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "LeviathanShield")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft LeviathanShield", Duration = 2})
end})
result5:AddButton({Title = "Craft LeviathanBoat", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "LeviathanBoat")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft LeviathanBoat", Duration = 2})
end})
result5:AddButton({Title = "Craft LegendaryScroll", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "LegendaryScroll")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft LegendaryScroll", Duration = 2})
end})
result5:AddButton({Title = "Craft MythicalScroll", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CraftItem", "Craft", "MythicalScroll")
    uiLib:Notify({Title = "Craft", Message = "\196\144\227 craft MythicalScroll", Duration = 2})
end})
result5:AddSection({"Mua Haki, Soru, Geppo"})
result5:AddButton({Title = "Buy Geppo $10,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyHaki", "Geppo")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Geppo", Duration = 2})
end})
result5:AddButton({Title = "Buy Buso Haki $25,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyHaki", "Buso")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Buso Haki", Duration = 2})
end})
result5:AddButton({Title = "Buy Soru $25,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyHaki", "Soru")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Soru", Duration = 2})
end})
result5:AddButton({Title = "Buy Observation Haki $750,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("KenTalk", "Buy")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Observation Haki", Duration = 2})
end})
result5:AddSection({"Mua Ki\225\186\191m, S\250ng"})
result5:AddButton({Title = "Buy Cutlass $1,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Cutlass")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Cutlass", Duration = 2})
end})
result5:AddButton({Title = "Buy Katana $1,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Katana")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Katana", Duration = 2})
end})
result5:AddButton({Title = "Buy Iron Mace $25,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Iron Mace")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Iron Mace", Duration = 2})
end})
result5:AddButton({Title = "Buy Dual Katana $12,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Duel Katana")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Dual Katana", Duration = 2})
end})
result5:AddButton({Title = "Buy Triple Katana $60,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Triple Katana")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Triple Katana", Duration = 2})
end})
result5:AddButton({Title = "Buy Pipe $100,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Pipe")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Pipe", Duration = 2})
end})
result5:AddButton({Title = "Buy Dual-Headed Blade $400,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Dual-Headed Blade", Duration = 2})
end})
result5:AddButton({Title = "Buy Bisento $1,200,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Bisento")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Bisento", Duration = 2})
end})
result5:AddButton({Title = "Buy Soul Cane $750,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Soul Cane")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Soul Cane", Duration = 2})
end})
result5:AddButton({Title = "Buy Pole V2 5,000F", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("ThunderGodTalk")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Pole V2", Duration = 2})
end})
result5:AddButton({Title = "Buy Slingshot $5,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Slingshot")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Slingshot", Duration = 2})
end})
result5:AddButton({Title = "Buy Musket $8,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Musket")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Musket", Duration = 2})
end})
result5:AddButton({Title = "Buy Flintlock $10,500", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Flintlock")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Flintlock", Duration = 2})
end})
result5:AddButton({Title = "Buy Refined Slingshot $30,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Refined Flintlock")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Refined Slingshot", Duration = 2})
end})
result5:AddButton({Title = "Buy Refined Flintlock $65,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Refined Flintlock")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Refined Flintlock", Duration = 2})
end})
result5:AddButton({Title = "Buy Cannon $100,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Cannon")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Cannon", Duration = 2})
end})
result5:AddButton({Title = "Buy Kabucha 1,500F", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1")
    game:GetService "Remotes".CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Kabucha", Duration = 2})
end})
result5:AddButton({Title = "Buy Bizarre Rifle 250 Ectoplasm", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("Ectoplasm", "Buy", 1)
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Bizarre Rifle", Duration = 2})
end})
result5:AddSection({"Mua Phụ Kiện"})
result5:AddButton({Title = "Buy Black Cape $50,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Black Cape")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Black Cape", Duration = 2})
end})
result5:AddButton({Title = "Buy Swordsman Hat $150,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Swordsman Hat")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Swordsman Hat", Duration = 2})
end})
result5:AddButton({Title = "Buy Tomoe Ring $500,000", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BuyItem", "Tomoe Ring")
    uiLib:Notify({Title = "Shop", Message = "\196\144\227 mua Tomoe Ring", Duration = 2})
end})
result5:AddSection({"Đổi Tộc, Reset Stats"})
result5:AddButton({Title = "Đổi Tộc Ghoul", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("Ectoplasm", "Change", 4)
    uiLib:Notify({Title = "Race", Message = "\196\144\227 \196\145\225\187\149i sang Ghoul", Duration = 2})
end})
result5:AddButton({Title = "Đổi Tộc Cyborg", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("CyborgTrainer", "Buy")
    uiLib:Notify({Title = "Race", Message = "\196\144\227 \196\145\225\187\149i sang Cyborg", Duration = 2})
end})
result5:AddButton({Title = "Reset Stats 2,500F", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
    game:GetService "Remotes".CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
    uiLib:Notify({Title = "Stats", Message = "\196\144\227 Reset Stats", Duration = 2})
end})
result5:AddButton({Title = "Random Race 3,000F", Callback = function()
    game:GetService "Remotes".CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
    game:GetService "Remotes".CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
    uiLib:Notify({Title = "Race", Message = "\196\144\227 Random Race", Duration = 2})
end})
result6:AddSection({"Server Functions"})
result6:AddButton({Title = "Redeem All Codes", Callback = function()
    local Codes = {"LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT", "GIFTING_HOURS", "NOMOREHACK", "BANEXPLOIT", "WildDares", "BossBuild", "GetPranked", "EARN_FRUITS", "SUB2GAMERROBOT_RESET1", "KITT_RESET", "Bignews", "CHANDLER", "Fudd10", "fudd10_v2", "Sub2UncleKizaru", "FIGHT4FRUIT", "kittgaming", "TRIPLEABUSE", "Sub2CaptainMaui", "Sub2Fer999", "Enyu_is_Pro", "Magicbus", "JCWK", "Starcodeheo", "Bluxxy", "SUB2GAMERROBOT_EXP1", "Sub2NoobMaster123", "Sub2Daigrock", "Axiore", "TantaiGaming", "StrawHatMaine", "Sub2OfficialNoobie", "TheGreatAce", "JULYUPDATE_RESET", "ADMINHACKED", "SEATROLLING", "24NOADMIN", "ADMIN_TROLL", "NEWTROLL", "SECRET_ADMIN", "staffbattle", "NOEXPLOIT", "NOOB2ADMIN", "CODESLIDE", "fruitconcepts", "krazydares"}
    local redeem = replicated.Remotes:FindFirstChild("Redeem")
    if not redeem then
        uiLib:Notify({Title = "Error", Message = "Kh\244ng t\236m th\225\186\165y remote Redeem", Duration = 3})
        return
    end
    for _, code in ipairs(Codes) do
        task.wait()
        pcall(function()
    if redeem.InvokeServer then
        redeem:InvokeServer(code)
    else
        redeem:FireServer(code)
    end
end)
    end
    uiLib:Notify({Title = "Success", Message = "\196\144\227 th\225\187\173 nh\225\186\173p t\225\186\165t c\225\186\163 m\227", Duration = 3})
end})
result6:AddSection({"Player GUI / Others"})
result6:AddButton({Title = "Open Awakenings Expert", Callback = function()
    pcall(function()
    plr.PlayerGui.Main.AwakeningToggler.Visible = true
end)
end})
result6:AddButton({Title = "Open Title Selection", Callback = function()
    pcall(function()
    replicated.Remotes.CommF_:InvokeServer("getTitles", true)
    plr.PlayerGui.Main.Titles.Visible = true
end)
end})
result6:AddToggle({Title = "Disable Chat GUI", Callback = function(Value)
    _G.Rechat = Value
    _G.SaveData.DisableChat_Save = Value
    SaveSettings()
    pcall(function()
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, not Value)
end)
end})
result6:AddToggle({Title = "Disable Leaderboard GUI", Callback = function(Value)
    _G.ReLeader = Value
    _G.SaveData.DisableLeader_Save = Value
    SaveSettings()
    pcall(function()
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, not Value)
end)
end})
result6:AddToggle({Title = "Unlock All Portals (WIP)", Callback = function(Value)
    _G.PortalUnLock = Value
    _G.SaveData.PortalUnLock_Save = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(3) do
        if _G.PortalUnLock and logicalResult4 then
            pcall(function()
    if (Root.Position - CFrame.new(-5097.93, 316.44, -3142.66).Position).Magnitude < 8 then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.16, 374.94, -7551.67))
    elseif (Root.Position - CFrame.new(-12471.16, 374.94, -7551.67).Position).Magnitude < 8 then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5072.08, 314.54, -3151.1))
    end
end)
        end
    end
end)
result6:AddSection({"Graphics / Haki Stats"})
result6:AddDropdown({Name = "Select Haki Stage", Options = {"Stage 0", "Stage 1", "Stage 2", "Stage 3", "Stage 4", "Stage 5"}, Default = "Stage 0", Callback = function(Value)
    _G.SelectStateHaki = tonumber(Value:match("%d+"))
end})
result6:AddButton({Title = "Apply Haki Stage", Callback = function()
    pcall(function()
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage", _G.SelectStateHaki or 0)
end)
end})
result6:AddSection({"Misc Graphics"})
result6:AddToggle({Title = "RTX Mode (Visual)", Callback = function(Value)
    _G.RTXMode = Value
    _G.SaveData.RTXMode_Save = Value
    SaveSettings()
    if Value then
        task.spawn(function()
    local lighting1 = Services.Lighting
    local oldAmbient, oldBrightness = Services.Lighting.Ambient, Services.Lighting.Brightness
    while _G.RTXMode do
        Services.Lighting.Ambient = Color3.fromRGB(33, 33, 33)
        Services.Lighting.Brightness = 0.3
        Services.Lighting.FogEnd = 9000000000
        task.wait()
    end
    Services.Lighting.Ambient = oldAmbient
    Services.Lighting.Brightness = oldBrightness
    Services.Lighting.FogEnd = 2500
end)
    end
end})
result6:AddButton({Title = "Fast Mode (Low Graphics)", Callback = function()
    local plasticParts = {"Part", "Union", "CornerWedgePart", "TrussPart", "MeshPart"}
    for _, value101 in pairs(workspace:GetDescendants()) do
        pcall(function()
    if table.find(plasticParts, value101.ClassName) then
        value101.Material = Enum.Material.Plastic
    end
end)
    end
    uiLib:Notify({Title = "Graphics", Message = "\196\144\227 chuy\225\187\131n sang ch\225\186\191 \196\145\225\187\153 Fast Mode", Duration = 2})
end})
result6:AddButton({Title = "Low CPU Mode", Callback = function()
    LowCpu()
    uiLib:Notify({Title = "Optimization", Message = "\196\144\227 b\225\186\173t ch\225\186\191 \196\145\225\187\153 Low CPU", Duration = 2})
end})
result6:AddButton({Title = "Increase Boat Speed (Client)", Callback = function()
    pcall(function()
    for _, boat in pairs(workspace.Boats:GetDescendants()) do
        if boat:IsA("VehicleSeat") then
            boat.MaxSpeed = 350
            boat.Torque = 0.2
            boat.TurnSpeed = 5
        end
    end
end)
    uiLib:Notify({Title = "Boats", Message = "\196\144\227 t\196\131ng t\225\187\145c \196\145\225\187\153 thuy\225\187\129n (ph\237a client)", Duration = 2})
end})
result6:AddButton({Title = "Remove Sky Fog", Callback = function()
    pcall(function()
    if Services.Lighting:FindFirstChild("LightingLayers") then
        Services.Lighting.LightingLayers:Destroy()
    end
    if Services.Lighting:FindFirstChild("SeaTerrorCC") then
        Services.Lighting.SeaTerrorCC:Destroy()
    end
    if Services.Lighting:FindFirstChild("FantasySky") then
        Services.Lighting.FantasySky:Destroy()
    end
end)
    uiLib:Notify({Title = "Fog", Message = "\196\144\227 x\243a s\198\176\198\161ng m\249", Duration = 2})
end})
result6:AddSection({"Configure - God"})
result6:AddButton({Title = "Rain Fruits (Client)", Callback = function()
    task.spawn(function()
    local fruitModel = game:GetObjects("rbxassetid://14759368201")[1]
    for _, fruit in pairs(fruitModel:GetChildren()) do
        fruit.Parent = workspace.Map
        fruit:MoveTo(plr.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
    end
end)
end})
result6:AddToggle({Title = "Full Bright", Callback = function(Value)
    _G.FullBright = Value
    _G.SaveData.FullBright_Save = Value
    SaveSettings()
    if Value then
        Services.Lighting.Ambient = Color3.fromRGB(1, 1, 1)
        Services.Lighting.ColorShift_Bottom = Color3.fromRGB(1, 1, 1)
        Services.Lighting.ColorShift_Top = Color3.fromRGB(1, 1, 1)
    else
        Services.Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        Services.Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        Services.Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
    end
end})
result6:AddDropdown({Name = "Select Time", Options = {"Day", "Night"}, Default = "Day", Callback = function(Value)
    _G.SelectDN = Value
end})
result6:AddToggle({Title = "Auto Set Time", Callback = function(Value)
    _G.AutoTime = Value
    _G.SaveData.AutoTime_Save = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(1) do
        if _G.AutoTime then
            Services.Lighting.ClockTime = _G.SelectDN == "Day" and 12 or 0
        end
    end
end)
result6:AddToggle({Title = "Ice Walk (Visual)", Callback = function(Value)
    _G.IceWalk = Value
    _G.SaveData.IceWalk_Save = Value
    SaveSettings()
end})
task.spawn(function()
    while task.wait(0.5) do
        if _G.IceWalk and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            pcall(function()
    local ice = replicated.Assets.Models.IceSpikes4:Clone()
    ice.Parent = workspace
    ice.Size = Vector3.new(3 + math.random(10, 12), 1.7, 3 + math.random(10, 12))
    ice.Color = Color3.fromRGB(128, 187, 219)
    ice.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position.X, -3.8, plr.Character.HumanoidRootPart.Position.Z)
    local tween = TW:Create(ice, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = Vector3.new(0, 0.3, 0)})
    tween.Completed:Connect(function()
    ice:Destroy()
end)
    tween:Play()
end)
        end
    end
end)
result3:AddSection({"Pvp, Aimbot, Movement"})
local function updatePlayerList()
    for _, value102 in ipairs(game:GetService("Players"):GetPlayers()) do
        if value102.Name ~= game.Players.LocalPlayer.Name then
            table.insert({}, value102.Name)
        end
    end
    return {}
end
local PlayerDropdown = result3:AddDropdown({Name = "Select Players", Options = updatePlayerList(), Default = nil, Multi = false, Callback = function(value)
    _G.PlayersList = value
    _G.SaveData.PlayersList = value
    SaveSettings()
end})
result3:AddButton({Title = "Refresh Player List", Callback = function()
    PlayerDropdown:Refresh(updatePlayerList(), true)
end})
result3:AddToggle({Title = "Teleport to Player", Callback = function(value)
    _G.TpPly = value
    _G.SaveData.TpPly_Save = value
    SaveSettings()
    task.spawn(function()
    while _G.TpPly and _G.PlayersList do
        pcall(function()
    local target = game:GetService("Players"):FindFirstChild(_G.PlayersList)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        _tp(target.Character.HumanoidRootPart.CFrame)
    end
end)
        task.wait(0.1)
    end
end)
end})
result3:AddToggle({Title = "Spectate Choose Players", Callback = function(value)
    _G.SpectatePlys = value
    _G.SaveData.SpectatePlys_Save = value
    SaveSettings()
    task.spawn(function()
    if value and _G.PlayersList then
        local target = game:GetService("Players"):FindFirstChild(_G.PlayersList)
        while _G.SpectatePlys and target and target.Character do
            workspace.Camera.CameraSubject = target.Character.Humanoid
            task.wait()
        end
    end
    workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)
end})
result3:AddSection({"Aimbot"})
result3:AddToggle({Title = "Aimbot Cam Lock", Callback = function(value)
    _G.AimCam = value
    _G.SaveData.AimCam_Save = value
    SaveSettings()
    task.spawn(function()
    local currentCamera = workspace.CurrentCamera
    while _G.AimCam do
        pcall(function()
    local closest, mathHuge = nil, math.huge
    for _, value103 in ipairs(game:GetService("Players"):GetPlayers()) do
        if value103 ~= game.Players.LocalPlayer and value103.Character and value103.Character:FindFirstChild("Head") then
            if value103.Character.Humanoid.Health > 0 then
                local value104 = (value103.Character.Head.Position - game.Players.LocalPlayer.Character.Head.Position).Magnitude
                if {"Part", "SpawnLocation", "Terrain", "WedgePart", "MeshPart"} < mathHuge then
                    mathHuge = {"Part", "SpawnLocation", "Terrain", "WedgePart", "MeshPart"}
                    closest = value103
                end
            end
        end
    end
    if closest and closest.Character then
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, closest.Character.HumanoidRootPart.Position)
    end
end)
        task.wait()
    end
end)
end})
result3:AddToggle({Title = "Aimbot Skills", Callback = function(value)
    _G.SilentAim = value
    _G.SaveData.SilentAim_Save = value
    SaveSettings()
end})
result3:AddSection({"Speed/Jump"})
_G.WalkSpeedEnabled = _G.WalkSpeedEnabled or false
_G.JumpEnabled = _G.JumpEnabled or false
getgenv().WalkSpeedValue = getgenv().WalkSpeedValue or 30
getgenv().JumpValue = getgenv().JumpValue or 50
local function applyStats()
    if game.Players.LocalPlayer.Character then
        local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            if _G.WalkSpeedEnabled then
                hum.WalkSpeed = getgenv().WalkSpeedValue
            end
            if _G.JumpEnabled then
                hum.JumpPower = getgenv().JumpValue
            end
        end
    end
end
local function setupSpeedWatcher(hum)
    if hum then
        hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if _G.WalkSpeedEnabled and hum.WalkSpeed ~= getgenv().WalkSpeedValue then
        hum.WalkSpeed = getgenv().WalkSpeedValue
    end
end)
    end
end
local plr = game.Players.LocalPlayer
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    applyStats()
    setupSpeedWatcher(char:FindFirstChildOfClass("Humanoid"))
end)
if game.Players.LocalPlayer.Character then
    local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        applyStats()
        setupSpeedWatcher(hum)
    end
end
game:GetService "Heartbeat":Connect(applyStats)
result3:AddToggle({Title = "Set WalkSpeed", Callback = function(value)
    _G.WalkSpeedEnabled = value
    _G.SaveData.SpeedToggle_Save = value
    SaveSettings()
    applyStats()
end})
result3:AddTextBox({Name = "WalkSpeed Value", Placeholder = "30", Default = tostring(getgenv().WalkSpeedValue), Callback = function(value)
    if 0 and 0 > 0 then
        getgenv().WalkSpeedValue = 0
        _G.SaveData.SpeedValue_Save = 0
        SaveSettings()
        applyStats()
    end
end})
result3:AddToggle({Title = "Set JumpPower", Callback = function(value)
    _G.JumpEnabled = value
    _G.SaveData.JumpToggle_Save = value
    SaveSettings()
    applyStats()
end})
result3:AddTextBox({Name = "JumpPower Value", Placeholder = "50", Default = tostring(getgenv().JumpValue), Callback = function(value)
    if 0 and 0 > 0 then
        getgenv().JumpValue = 0
        _G.SaveData.JumpValue_Save = 0
        SaveSettings()
        applyStats()
    end
end})
result3:AddSection({"LocalPlayer Settings / Misc"})
result3:AddToggle({Title = "Instance Mink V3 [ INF ]", Callback = function(value)
    _G.InfAblities = value
    _G.SaveData.InfAblities_Save = value
    SaveSettings()
    task.spawn(function()
    while _G.InfAblities do
        pcall(function()
    local char = game.Players.LocalPlayer.Character
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            local agility = game:GetService "FX".Agility:Clone()
            agility.Name = "Agility"
            agility.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        end
    end
end)
        task.wait(0.2)
    end
    pcall(function()
    local char = game.Players.LocalPlayer.Character
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Agility:Destroy()
    end
end)
end)
end})
result3:AddToggle({Title = "Instance Energy [ INF ]", Callback = function(value)
    _G.infEnergy = value
    _G.SaveData.infEnergy_Save = value
    SaveSettings()
    getInfinity_Ability("Energy", _G.infEnergy)
end})
result3:AddToggle({Title = "Instance Soru [ INF ]", Callback = function(value)
    _G.InfSoru = value
    _G.SaveData.InfSoru_Save = value
    SaveSettings()
    getInfinity_Ability("Soru", _G.InfSoru)
end})
result3:AddToggle({Title = "Instance Observation Range [ INF ]", Callback = function(value)
    _G.InfiniteObRange = value
    _G.SaveData.InfiniteObRange_Save = value
    SaveSettings()
    getInfinity_Ability("Observation", _G.InfiniteObRange)
end})
result3:AddSection({"Settings Combat / Aimbot Settings"})
result3:AddToggle({Title = "Ignore Same Teams", Callback = function(value)
    _G.NoAimTeam = value
    _G.SaveData.NoAimTeam_Save = value
    SaveSettings()
end})
result3:AddToggle({Title = "Accept Allies", Callback = function(value)
    _G.AcceptAlly = value
    _G.SaveData.AcceptAlly_Save = value
    SaveSettings()
    task.spawn(function()
    while _G.AcceptAlly do
        pcall(function()
    local remote = game:GetService "Remotes".CommF_
    for _, value105 in ipairs(game:GetService("Players"):GetPlayers()) do
        if value105.Name ~= game.Players.LocalPlayer.Name then
            remote:InvokeServer("AcceptAlly", value105.Name)
        end
    end
end)
        task.wait(1)
    end
end)
end})

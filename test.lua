Library = loadstring(game:HttpGet("https://pastefy.app/aK0pEgmK/raw"))()

Window = Library:CreateWindow({
    Title = "Doraemon Hub",
    Subtitle = "- Blox Fruit | Full Xenon Integration",
    Image = "rbxassetid://122932159240295"
})

wait(1)

Library:Notify({
    Title = "Ui Library",
    Description = "The UI automatically hides once executed.\nPress the button at the bottom-left of the screen to show the GUI.",
    Duration = 3
})

-- ============ VARIABLES ============
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local CommF_ = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") or ReplicatedStorage:FindFirstChild("CommF_")
local CommF_Remote = CommF_ or ReplicatedStorage:FindFirstChild("CommF_")

-- Settings storage
_G.Settings = {
    Main = {
        AutoFarm = false,
        AutoBoss = false,
        AutoMastery = false,
        SelectedWeapon = "Melee",
        FarmDistance = 15,
        BringMob = false,
        FastAttack = true,
        AutoHaki = true,
        UseSkills = false
    },
    Esp = {
        ESPPlayer = false,
        ESPChest = false,
        ESPDevilFruit = false,
        ESPMonster = false,
        ESPSeaBeast = false,
        ESPFlower = false,
        ESPMirage = false
    },
    SeaEvent = {
        AutoSeaBeast = false,
        SelectedBoat = "Guardian",
        BoatSpeed = 300,
        UseSkills = false
    },
    Stats = {
        AutoMelee = false,
        AutoDefense = false,
        AutoSword = false,
        AutoFruit = false,
        AutoStats = false
    },
    Raid = {
        AutoRaid = false,
        SelectedChip = "Flame",
        AutoAwaken = false,
        SelectedFruit = "",
        SelectedMove = ""
    },
    Farm = {
        AutoEliteHunter = false,
        AutoFarmChest = false,
        AutoFarmMaterial = false,
        SelectedMaterial = "Scrap Metal"
    },
    Items = {
        AutoItem = false,
        SelectedItem = "Soul Guitar"
    },
    Race = {
        AutoRace = false,
        RaceType = "V2"
    }
}

-- ============ WORLD CHECK ============
local World1 = false
local World2 = false
local World3 = false

if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
end

-- ============ CORE FUNCTIONS ============

function CheckQuest()
    local I = LocalPlayer.Data.Level.Value
    
    if World1 and I > 699 then I = 650 end
    if World2 and I > 1499 then I = 1450 end
    
    -- World 1 Quests
    if World1 then
        if I <= 9 then
            if tostring(LocalPlayer.Team) == "Marines" then
                Mon = "Trainee"; Qname = "MarineQuest"; Qdata = 1
                PosQ = CFrame.new(-2709.67944, 24.5206585, 2104.24585)
                PosM = CFrame.new(-2709.67944, 24.5206585, 2104.24585)
            else
                Mon = "Bandit"; Qdata = 1; Qname = "BanditQuest1"
                PosQ = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125)
                PosM = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125)
            end
        elseif I >= 10 and I <= 14 then
            Mon = "Monkey"; Qdata = 1; Qname = "JungleQuest"
            PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            PosM = CFrame.new(-1448.5180664062, 67.853012084961, 11.465796470642)
        elseif I >= 15 and I <= 29 then
            Mon = "Gorilla"; Qdata = 2; Qname = "JungleQuest"
            PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            PosM = CFrame.new(-1129.8836669922, 40.46354675293, -525.42370605469)
        elseif I >= 30 and I <= 39 then
            Mon = "Pirate"; Qdata = 1; Qname = "BuggyQuest1"
            PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            PosM = CFrame.new(-1103.5134277344, 13.752052307129, 3896.0910644531)
        elseif I >= 40 and I <= 59 then
            Mon = "Brute"; Qdata = 2; Qname = "BuggyQuest1"
            PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            PosM = CFrame.new(-1140.0837402344, 14.809885025024, 4322.9213867188)
        elseif I >= 60 and I <= 74 then
            Mon = "Desert Bandit"; Qdata = 1; Qname = "DesertQuest"
            PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359)
            PosM = CFrame.new(924.7998046875, 6.4486746788025, 4481.5859375)
        elseif I >= 75 and I <= 89 then
            Mon = "Desert Officer"; Qdata = 2; Qname = "DesertQuest"
            PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359)
            PosM = CFrame.new(1608.2822265625, 8.6142244338989, 4371.0073242188)
        elseif I >= 90 and I <= 99 then
            Mon = "Snow Bandit"; Qdata = 1; Qname = "SnowQuest"
            PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            PosM = CFrame.new(1354.3479003906, 87.272773742676, -1393.9465332031)
        elseif I >= 100 and I <= 119 then
            Mon = "Snowman"; Qdata = 2; Qname = "SnowQuest"
            PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            PosM = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif I >= 120 and I <= 149 then
            Mon = "Chief Petty Officer"; Qdata = 1; Qname = "MarineQuest2"
            PosQ = CFrame.new(-5039.58643, 27.3500385, 4324.68018)
            PosM = CFrame.new(-4881.2309570312, 22.652044296265, 4273.7524414062)
        elseif I >= 150 and I <= 174 then
            Mon = "Sky Bandit"; Qdata = 1; Qname = "SkyQuest"
            PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            PosM = CFrame.new(-4953.20703125, 295.74420166016, -2899.2290039062)
        elseif I >= 175 and I <= 189 then
            Mon = "Dark Master"; Qdata = 2; Qname = "SkyQuest"
            PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            PosM = CFrame.new(-5259.8447265625, 391.39767456055, -2229.0354003906)
        elseif I >= 190 and I <= 209 then
            Mon = "Prisoner"; Qdata = 1; Qname = "PrisonerQuest"
            PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514)
            PosM = CFrame.new(5098.9736328125, -0.3204058110714, 474.23733520508)
        elseif I >= 210 and I <= 249 then
            Mon = "Dangerous Prisoner"; Qdata = 2; Qname = "PrisonerQuest"
            PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514)
            PosM = CFrame.new(5654.5634765625, 15.633401870728, 866.29919433594)
        elseif I >= 250 and I <= 274 then
            Mon = "Toga Warrior"; Qdata = 1; Qname = "ColosseumQuest"
            PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            PosM = CFrame.new(-1820.21484375, 51.683856964111, -2740.6650390625)
        elseif I >= 275 and I <= 299 then
            Mon = "Gladiator"; Qdata = 2; Qname = "ColosseumQuest"
            PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            PosM = CFrame.new(-1292.8381347656, 56.380882263184, -3339.0314941406)
        elseif I >= 300 and I <= 324 then
            Mon = "Military Soldier"; Qdata = 1; Qname = "MagmaQuest"
            PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            PosM = CFrame.new(-5411.1645507812, 11.081554412842, 8454.29296875)
        elseif I >= 325 and I <= 374 then
            Mon = "Military Spy"; Qdata = 2; Qname = "MagmaQuest"
            PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            PosM = CFrame.new(-5802.8681640625, 86.262413024902, 8828.859375)
        elseif I >= 375 and I <= 399 then
            Mon = "Fishman Warrior"; Qdata = 1; Qname = "FishmanQuest"
            PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosM = CFrame.new(60878.30078125, 18.482830047607, 1543.7574462891)
        elseif I >= 400 and I <= 449 then
            Mon = "Fishman Commando"; Qdata = 2; Qname = "FishmanQuest"
            PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosM = CFrame.new(61922.6328125, 18.482830047607, 1493.9343261719)
        elseif I >= 450 and I <= 474 then
            Mon = "God's Guard"; Qdata = 1; Qname = "SkyExp1Quest"
            PosQ = CFrame.new(-4721.88867, 843.874695, -1949.96643)
            PosM = CFrame.new(-4710.04296875, 845.27697753906, -1927.3079833984)
        elseif I >= 475 and I <= 524 then
            Mon = "Shanda"; Qdata = 2; Qname = "SkyExp1Quest"
            PosQ = CFrame.new(-7859.09814, 5544.19043, -381.476196)
            PosM = CFrame.new(-7678.4897460938, 5566.4038085938, -497.21560668945)
        elseif I >= 525 and I <= 549 then
            Mon = "Royal Squad"; Qdata = 1; Qname = "SkyExp2Quest"
            PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            PosM = CFrame.new(-7624.2524414062, 5658.1333007812, -1467.3542480469)
        elseif I >= 550 and I <= 624 then
            Mon = "Royal Soldier"; Qdata = 2; Qname = "SkyExp2Quest"
            PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            PosM = CFrame.new(-7836.7534179688, 5645.6640625, -1790.6236572266)
        elseif I >= 625 and I <= 649 then
            Mon = "Galley Pirate"; Qdata = 1; Qname = "FountainQuest"
            PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            PosM = CFrame.new(5551.0219726562, 78.901351928711, 3930.4128417969)
        elseif I >= 650 then
            Mon = "Galley Captain"; Qdata = 2; Qname = "FountainQuest"
            PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            PosM = CFrame.new(5441.9516601562, 42.502059936523, 4950.09375)
        end
    -- World 2 Quests
    elseif World2 then
        if I >= 700 and I <= 724 then
            Mon = "Raider"; Qdata = 1; Qname = "Area1Quest"
            PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            PosM = CFrame.new(-728.32672119141, 52.779319763184, 2345.7705078125)
        elseif I >= 725 and I <= 774 then
            Mon = "Mercenary"; Qdata = 2; Qname = "Area1Quest"
            PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            PosM = CFrame.new(-1004.3244018555, 80.158866882324, 1424.6193847656)
        elseif I >= 775 and I <= 799 then
            Mon = "Swan Pirate"; Qdata = 1; Qname = "Area2Quest"
            PosQ = CFrame.new(638.43811, 71.769989, 918.282898)
            PosM = CFrame.new(1068.6643066406, 137.61428833008, 1322.1060791016)
        elseif I >= 800 and I <= 874 then
            Mon = "Factory Staff"; Qname = "Area2Quest"; Qdata = 2
            PosQ = CFrame.new(632.698608, 73.1055908, 918.666321)
            PosM = CFrame.new(73.078674316406, 81.863441467285, -27.470672607422)
        elseif I >= 875 and I <= 899 then
            Mon = "Marine Lieutenant"; Qdata = 1; Qname = "MarineQuest3"
            PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            PosM = CFrame.new(-2821.3723144531, 75.897277832031, -3070.0891113281)
        elseif I >= 900 and I <= 949 then
            Mon = "Marine Captain"; Qdata = 2; Qname = "MarineQuest3"
            PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            PosM = CFrame.new(-1861.2310791016, 80.176582336426, -3254.6975097656)
        elseif I >= 950 and I <= 974 then
            Mon = "Zombie"; Qdata = 1; Qname = "ZombieQuest"
            PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            PosM = CFrame.new(-5657.7768554688, 78.969734191895, -928.68701171875)
        elseif I >= 975 and I <= 999 then
            Mon = "Vampire"; Qdata = 2; Qname = "ZombieQuest"
            PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            PosM = CFrame.new(-6037.66796875, 32.184638977051, -1340.6597900391)
        elseif I >= 1000 and I <= 1049 then
            Mon = "Snow Trooper"; Qdata = 1; Qname = "SnowMountainQuest"
            PosQ = CFrame.new(609.858826, 400.119904, -5372.25928)
            PosM = CFrame.new(549.14733886719, 427.38705444336, -5563.6987304688)
        elseif I >= 1050 and I <= 1099 then
            Mon = "Winter Warrior"; Qdata = 2; Qname = "SnowMountainQuest"
            PosQ = CFrame.new(609.858826, 400.119904, -5372.25928)
            PosM = CFrame.new(1142.7451171875, 475.63980102539, -5199.4165039062)
        elseif I >= 1100 and I <= 1124 then
            Mon = "Lab Subordinate"; Qdata = 1; Qname = "IceSideQuest"
            PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            PosM = CFrame.new(-5707.4716796875, 15.951709747314, -4513.3920898438)
        elseif I >= 1125 and I <= 1174 then
            Mon = "Horned Warrior"; Qdata = 2; Qname = "IceSideQuest"
            PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            PosM = CFrame.new(-6341.3666992188, 15.951770782471, -5723.162109375)
        elseif I >= 1175 and I <= 1199 then
            Mon = "Magma Ninja"; Qdata = 1; Qname = "FireSideQuest"
            PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
            PosM = CFrame.new(-5449.6728515625, 76.658744812012, -5808.2006835938)
        elseif I >= 1200 and I <= 1249 then
            Mon = "Lava Pirate"; Qdata = 2; Qname = "FireSideQuest"
            PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
            PosM = CFrame.new(-5213.3315429688, 49.737880706787, -4701.451171875)
        elseif I >= 1250 and I <= 1274 then
            Mon = "Ship Deckhand"; Qdata = 1; Qname = "ShipQuest1"
            PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
            PosM = CFrame.new(1212.0111083984, 150.79205322266, 33059.24609375)
        elseif I >= 1275 and I <= 1299 then
            Mon = "Ship Engineer"; Qdata = 2; Qname = "ShipQuest1"
            PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
            PosM = CFrame.new(919.47863769531, 43.544013977051, 32779.96875)
        elseif I >= 1300 and I <= 1324 then
            Mon = "Ship Steward"; Qdata = 1; Qname = "ShipQuest2"
            PosQ = CFrame.new(968.80957, 125.092171, 33244.125)
            PosM = CFrame.new(919.43853759766, 129.55599975586, 33436.03515625)
        elseif I >= 1325 and I <= 1349 then
            Mon = "Ship Officer"; Qdata = 2; Qname = "ShipQuest2"
            PosQ = CFrame.new(968.80957, 125.092171, 33244.125)
            PosM = CFrame.new(1036.0179443359, 181.4390411377, 33315.7265625)
        elseif I >= 1350 and I <= 1374 then
            Mon = "Arctic Warrior"; Qdata = 1; Qname = "FrostQuest"
            PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            PosM = CFrame.new(5966.24609375, 62.970020294189, -6179.3828125)
        elseif I >= 1375 and I <= 1424 then
            Mon = "Snow Lurker"; Qdata = 2; Qname = "FrostQuest"
            PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            PosM = CFrame.new(5407.0737304688, 69.194374084473, -6880.8803710938)
        elseif I >= 1425 and I <= 1449 then
            Mon = "Sea Soldier"; Qdata = 1; Qname = "ForgottenQuest"
            PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193)
            PosM = CFrame.new(-3028.2236328125, 64.674514770508, -9775.4267578125)
        elseif I >= 1450 then
            Mon = "Water Fighter"; Qdata = 2; Qname = "ForgottenQuest"
            PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193)
            PosM = CFrame.new(-3352.9013671875, 285.01556396484, -10534.841796875)
        end
    -- World 3 Quests (ngắn gọn)
    elseif World3 then
        if I >= 1500 and I <= 1524 then
            Mon = "Pirate Millionaire"; Qdata = 1; Qname = "PiratePortQuest"
            PosQ = CFrame.new(-290.07, 42.90, 5581.59)
            PosM = CFrame.new(-246.00, 47.31, 5584.10)
        elseif I >= 1525 and I <= 1574 then
            Mon = "Pistol Billionaire"; Qdata = 2; Qname = "PiratePortQuest"
            PosQ = CFrame.new(-290.07, 42.90, 5581.59)
            PosM = CFrame.new(-187.33, 86.24, 6013.51)
        elseif I >= 1575 and I <= 1599 then
            Mon = "Dragon Crew Warrior"; Qdata = 1; Qname = "DragonCrewQuest"
            PosQ = CFrame.new(6737.06055, 127.417763, -712.300659)
            PosM = CFrame.new(6709.76367, 52.3442993, -1139.02966)
        elseif I >= 1600 and I <= 1624 then
            Mon = "Dragon Crew Archer"; Qdata = 2; Qname = "DragonCrewQuest"
            PosQ = CFrame.new(6737.06055, 127.417763, -712.300659)
            PosM = CFrame.new(6668.76172, 481.376923, 329.12207)
        elseif I >= 1625 and I <= 1649 then
            Mon = "Hydra Enforcer"; Qname = "VenomCrewQuest"; Qdata = 1
            PosQ = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            PosM = CFrame.new(4547.11523, 1003.10217, 334.194824)
        elseif I >= 1650 and I <= 1699 then
            Mon = "Venomous Assailant"; Qname = "VenomCrewQuest"; Qdata = 2
            PosQ = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            PosM = CFrame.new(4674.92676, 1134.82654, 996.308838)
        elseif I >= 1700 and I <= 1724 then
            Mon = "Marine Commodore"; Qdata = 1; Qname = "MarineTreeIsland"
            PosQ = CFrame.new(2180.54126, 27.8156815, -6741.5498)
            PosM = CFrame.new(2286.0078125, 73.133918762207, -7159.8090820312)
        elseif I >= 1725 and I <= 1774 then
            Mon = "Marine Rear Admiral"; Qname = "MarineTreeIsland"; Qdata = 2
            PosQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            PosM = CFrame.new(3656.7736816406, 160.52406311035, -7001.5986328125)
        elseif I >= 1775 and I <= 1799 then
            Mon = "Fishman Raider"; Qdata = 1; Qname = "DeepForestIsland3"
            PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            PosM = CFrame.new(-10407.526367188, 331.76263427734, -8368.5166015625)
        elseif I >= 1800 and I <= 1824 then
            Mon = "Fishman Captain"; Qdata = 2; Qname = "DeepForestIsland3"
            PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            PosM = CFrame.new(-10994.701171875, 352.38140869141, -9002.1103515625)
        else
            -- Default cho level cao hơn
            Mon = "Skull Slayer"; Qdata = 2; Qname = "TikiQuest3"
            PosQ = CFrame.new(-16668.03, 105.32, 1568.60)
            PosM = CFrame.new(-16709.49, 419.68, 1751.09)
        end
    end
    
    LevelQuest = Qdata
    NameQuest = Qname
    CFrameQuest = PosQ
    CFrameMon = PosM
    MonFarm = Mon
end

function AutoHaki()
    if _G.Settings.Main.AutoHaki and not LocalPlayer.Character:FindFirstChild("HasBuso") then
        CommF_Remote:InvokeServer("Buso")
    end
end

function EquipWeapon(ToolSe)
    if not LocalPlayer.Character:FindFirstChild(ToolSe) then
        if LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack[ToolSe])
        end
    end
end

function HopServer()
    local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings"))()
    module:Teleport(game.PlaceId)
end

function TweenTo(position)
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local tween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {CFrame = position})
    tween:Play()
    return tween
end

-- ============ AUTO FARM FUNCTION ============
function StartAutoFarm()
    while _G.Settings.Main.AutoFarm and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 do
        pcall(function()
            CheckQuest()
            AutoHaki()
            
            if LocalPlayer.Data.Quest.Value == nil then
                CommF_Remote:InvokeServer("StartQuest", NameQuest, LevelQuest)
                wait(0.5)
            end
            
            local nearestMon = nil
            local shortestDist = math.huge
            
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    local dist = (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist < shortestDist and dist <= _G.Settings.Main.FarmDistance then
                        shortestDist = dist
                        nearestMon = v
                    end
                end
            end
            
            if nearestMon then
                LocalPlayer.Character.HumanoidRootPart.CFrame = nearestMon.HumanoidRootPart.CFrame * CFrame.new(0, 2, 3)
                wait(0.1)
                if _G.Settings.Main.FastAttack then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                    wait(0.05)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                end
            else
                TweenTo(CFrameMon)
            end
        end)
        wait(0.2)
    end
end

-- ============ AUTO MASTERY FUNCTION ============
function StartAutoMastery()
    while _G.Settings.Main.AutoMastery do
        pcall(function()
            CheckQuest()
            AutoHaki()
            
            if _G.Settings.Main.SelectedWeapon == "Melee" then
                EquipWeapon("Combat")
            elseif _G.Settings.Main.SelectedWeapon == "Sword" then
                for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == "Sword" then
                        EquipWeapon(v.Name)
                        break
                    end
                end
            elseif _G.Settings.Main.SelectedWeapon == "Fruit" then
                if LocalPlayer.Data.DevilFruit.Value ~= nil then
                    EquipWeapon(LocalPlayer.Data.DevilFruit.Value)
                end
            elseif _G.Settings.Main.SelectedWeapon == "Gun" then
                for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == "Gun" then
                        EquipWeapon(v.Name)
                        break
                    end
                end
            end
            
            local nearestMon = nil
            local shortestDist = math.huge
            
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    local dist = (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist < shortestDist and dist <= _G.Settings.Main.FarmDistance then
                        shortestDist = dist
                        nearestMon = v
                    end
                end
            end
            
            if nearestMon then
                TweenTo(nearestMon.HumanoidRootPart.CFrame * CFrame.new(0, 2, 3))
                wait(0.1)
                if _G.Settings.Main.UseSkills then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                    wait(0.1)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                    wait(0.1)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                    wait(0.1)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                else
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                    wait(0.05)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                end
            else
                TweenTo(CFrameMon)
            end
        end)
        wait(0.2)
    end
end

-- ============ AUTO RAID FUNCTION ============
function StartAutoRaid()
    while _G.Settings.Raid.AutoRaid do
        pcall(function()
            if Workspace:FindFirstChild("Raid") then
                for _, v in pairs(Workspace.Raid:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:IsA("Model") then
                        TweenTo(v.HumanoidRootPart.CFrame * CFrame.new(0, 2, 3))
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                    end
                end
            else
                CommF_Remote:InvokeServer("Raids", "Start", _G.Settings.Raid.SelectedChip)
                wait(3)
            end
        end)
        wait(0.5)
    end
end

-- ============ AUTO CHEST FARM ============
function StartChestFarm()
    while _G.Settings.Farm.AutoFarmChest do
        pcall(function()
            for _, v in pairs(Workspace:GetDescendants()) do
                if v.Name:find("Chest") and v:IsA("BasePart") and v.Parent and v.Parent:FindFirstChild("TouchInterest") then
                    local dist = (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 200 then
                        TweenTo(CFrame.new(v.Position))
                        wait(0.3)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 0)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 1)
                        wait(0.5)
                    end
                end
            end
        end)
        wait(1)
    end
end

-- ============ AUTO STATS ============
function StartAutoStats()
    while _G.Settings.Stats.AutoStats do
        pcall(function()
            local point = LocalPlayer.Data.Points.Value
            if point > 0 then
                if _G.Settings.Stats.AutoMelee then
                    CommF_Remote:InvokeServer("AddPoint", "Melee", point)
                end
                if _G.Settings.Stats.AutoDefense then
                    CommF_Remote:InvokeServer("AddPoint", "Defense", point)
                end
                if _G.Settings.Stats.AutoSword then
                    CommF_Remote:InvokeServer("AddPoint", "Sword", point)
                end
                if _G.Settings.Stats.AutoFruit then
                    CommF_Remote:InvokeServer("AddPoint", "Devil Fruit", point)
                end
            end
        end)
        wait(5)
    end
end

-- ============ ESP FUNCTIONS ============
local Number = math.random(1, 1000000)

function StartESP()
    while _G.Settings.Esp.ESPPlayer or _G.Settings.Esp.ESPChest or _G.Settings.Esp.ESPDevilFruit or _G.Settings.Esp.ESPMonster do
        pcall(function()
            if _G.Settings.Esp.ESPPlayer then
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                        if not v.Character.Head:FindFirstChild("EspLabel"..Number) then
                            local bill = Instance.new("BillboardGui", v.Character.Head)
                            bill.Name = "EspLabel"..Number
                            bill.Size = UDim2.new(0, 200, 0, 30)
                            bill.AlwaysOnTop = true
                            local label = Instance.new("TextLabel", bill)
                            label.Size = UDim2.new(1,0,1,0)
                            label.BackgroundTransparency = 1
                            label.TextColor3 = v.Team == LocalPlayer.Team and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
                            label.Text = v.Name
                            label.TextSize = 12
                        else
                            local dist = (v.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude
                            v.Character.Head["EspLabel"..Number].TextLabel.Text = v.Name .. " | " .. math.floor(dist/3) .. "m"
                        end
                    end
                end
            end
            
            if _G.Settings.Esp.ESPChest then
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name:find("Chest") and v:IsA("BasePart") and not v:FindFirstChild("EspChest") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "EspChest"
                        bill.Size = UDim2.new(0, 150, 0, 20)
                        bill.AlwaysOnTop = true
                        local label = Instance.new("TextLabel", bill)
                        label.Size = UDim2.new(1,0,1,0)
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.fromRGB(255,215,0)
                        label.Text = v.Name
                        label.TextSize = 10
                    end
                end
            end
            
            if _G.Settings.Esp.ESPDevilFruit then
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name:find("Fruit") and v:IsA("Tool") and v:FindFirstChild("Handle") and not v.Handle:FindFirstChild("EspFruit") then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "EspFruit"
                        bill.Size = UDim2.new(0, 150, 0, 20)
                        bill.AlwaysOnTop = true
                        local label = Instance.new("TextLabel", bill)
                        label.Size = UDim2.new(1,0,1,0)
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.fromRGB(255,0,255)
                        label.Text = v.Name
                        label.TextSize = 10
                    end
                end
            end
            
            if _G.Settings.Esp.ESPMonster then
                for _, v in pairs(Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and not v:FindFirstChild("EspMonster") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "EspMonster"
                        bill.Size = UDim2.new(0, 200, 0, 30)
                        bill.AlwaysOnTop = true
                        local label = Instance.new("TextLabel", bill)
                        label.Size = UDim2.new(1,0,1,0)
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.fromRGB(255,100,0)
                        label.Text = v.Name .. " | HP: " .. math.floor(v.Humanoid.Health)
                        label.TextSize = 11
                    end
                end
            end
        end)
        wait(0.5)
    end
end

-- ============ SHOP TAB (Original) ============
ShopBuy = Window:AddTab("Shop")
MiscShopBuy = ShopBuy:AddLeftGroupbox("Misc Shop")

code = {
    "LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT", "NOMOREHACK", "BANEXPLOIT",
    "krazydares", "TRIPLEABUSE", "24NOADMIN", "REWARDFUN", "Chandler",
    "NEWTROLL", "KITT_RESET", "Magicbus", "Starcodeheo", "fudd10_v2",
    "Sub2UncleKizaru", "Fudd10", "Bignews", "SECRET_ADMIN", "SUB2GAMERROBOT_RESET1",
    "SUB2OFFICIALNOOBIE", "AXIORE", "BIGNEWS", "BLUXXY", "CHANDLER",
    "ENYU_IS_PRO", "FUDD10", "FUDD10_V2", "KITTGAMING", "MAGICBUS",
    "STARCODEHEO", "STRAWHATMAINE", "SUB2CAPTAINMAUI", "SUB2DAIGROCK",
    "SUB2FER999", "SUB2NOOBMASTER123", "SUB2UNCLEKIZARU", "TANTAIGAMING",
    "THEGREATACE", "WildDares", "BossBuild", "GetPranked", "FIGHT4FRUIT", "EARN_FRUITS"
}

MiscShopBuy:AddButton({
    Title = "Redeem All Codes",
    Callback = function()
        for i, v in pairs(code) do
            spawn(function()
                ReplicatedStorage.Remotes.Redeem:InvokeServer(v)
                wait(0.3)
            end)
        end
    end
})

MiscShopBuy:AddButton({
    Title = "Teleport Old World",
    Callback = function() CommF_Remote:InvokeServer("TravelMain") end
})

MiscShopBuy:AddButton({
    Title = "Teleport New World",
    Callback = function() CommF_Remote:InvokeServer("TravelDressrosa") end
})

MiscShopBuy:AddButton({
    Title = "Teleport Third Sea",
    Callback = function() CommF_Remote:InvokeServer("TravelZou") end
})

MiscShopBuy:AddButton({
    Title = "Buy Dual Flintlock",
    Callback = function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock") end
})

MiscShopBuy:AddButton({
    Title = "Reroll Race",
    Callback = function()
        CommF_Remote:InvokeServer("BlackbeardReward", "Reroll", "1")
        CommF_Remote:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})

MiscShopBuy:AddButton({
    Title = "Reset Stats",
    Callback = function()
        CommF_Remote:InvokeServer("BlackbeardReward","Refund","1")
        CommF_Remote:InvokeServer("BlackbeardReward","Refund","2")
    end
})

MiscShopBuy:AddButton({
    Title = "Buy Ghoul Race",
    Callback = function()
        CommF_Remote:InvokeServer("Ectoplasm", "BuyCheck", 4)
        wait(0.5)
        CommF_Remote:InvokeServer("Ectoplasm", "Change", 4)
    end
})

MiscShopBuy:AddButton({
    Title = "Buy Cyborg Race",
    Callback = function()
        CommF_Remote:InvokeServer("CyborgTrainer", "Buy")
    end
})

-- ============ AUTO FARM TAB ============
AutoFarmTab = Window:AddTab("Auto Farm")
FarmGroup = AutoFarmTab:AddLeftGroupbox("Auto Farm Settings")

FarmGroup:AddToggle({
    Title = "Auto Farm Level",
    Description = "Tự động farm theo level",
    Callback = function(state)
        _G.Settings.Main.AutoFarm = state
        if state then spawn(StartAutoFarm) end
    end
})

FarmGroup:AddSlider({
    Title = "Farm Distance",
    Min = 10,
    Max = 50,
    Default = 15,
    Callback = function(value)
        _G.Settings.Main.FarmDistance = value
    end
})

FarmGroup:AddToggle({
    Title = "Auto Haki",
    Description = "Tự động bật Haki",
    Callback = function(state)
        _G.Settings.Main.AutoHaki = state
    end
})

FarmGroup:AddToggle({
    Title = "Fast Attack",
    Description = "Tấn công nhanh hơn",
    Callback = function(state)
        _G.Settings.Main.FastAttack = state
    end
})

-- Auto Boss
BossGroup = AutoFarmTab:AddRightGroupbox("Auto Boss")
BossGroup:AddToggle({
    Title = "Auto Farm Boss",
    Description = "Tự động săn boss",
    Callback = function(state)
        _G.Settings.Main.AutoBoss = state
        if state then
            spawn(function()
                while _G.Settings.Main.AutoBoss do
                    for _, v in pairs(Workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("Boss") and v.Humanoid.Health > 0 then
                            TweenTo(v.HumanoidRootPart.CFrame * CFrame.new(0, 5, 5))
                            wait(0.5)
                        end
                    end
                    wait(2)
                end
            end)
        end
    end
})

-- ============ MASTERY TAB ============
MasteryTab = Window:AddTab("Mastery")
MasteryGroup = MasteryTab:AddLeftGroupbox("Auto Mastery")

MasteryGroup:AddToggle({
    Title = "Auto Farm Mastery",
    Description = "Tự động farm mastery cho vũ khí/trái cây",
    Callback = function(state)
        _G.Settings.Main.AutoMastery = state
        if state then spawn(StartAutoMastery) end
    end
})

MasteryGroup:AddDropdown({
    Title = "Select Weapon",
    Values = {"Melee", "Sword", "Fruit", "Gun"},
    Callback = function(value)
        _G.Settings.Main.SelectedWeapon = value
    end
})

MasteryGroup:AddToggle({
    Title = "Use Skills (Z, X, C)",
    Description = "Sử dụng skill để farm mastery nhanh hơn",
    Callback = function(state)
        _G.Settings.Main.UseSkills = state
    end
})

-- ============ RAID TAB ============
RaidTab = Window:AddTab("Raid")
RaidGroup = RaidTab:AddLeftGroupbox("Auto Raid")

RaidGroup:AddToggle({
    Title = "Auto Raid",
    Description = "Tự động làm raid",
    Callback = function(state)
        _G.Settings.Raid.AutoRaid = state
        if state then spawn(StartAutoRaid) end
    end
})

RaidGroup:AddDropdown({
    Title = "Select Chip",
    Values = {"Flame", "Ice", "Dark", "Light", "Magma", "Quake"},
    Callback = function(value)
        _G.Settings.Raid.SelectedChip = value
    end
})

-- ============ CHEST TAB ============
ChestTab = Window:AddTab("Chest")
ChestGroup = ChestTab:AddLeftGroupbox("Auto Chest")

ChestGroup:AddToggle({
    Title = "Auto Farm Chest",
    Description = "Tự động mở rương",
    Callback = function(state)
        _G.Settings.Farm.AutoFarmChest = state
        if state then spawn(StartChestFarm) end
    end
})

-- ============ STATS TAB ============
StatsTab = Window:AddTab("Stats")
StatsGroup = StatsTab:AddLeftGroupbox("Auto Stats")

StatsGroup:AddToggle({
    Title = "Auto Add Melee",
    Callback = function(state) _G.Settings.Stats.AutoMelee = state end
})

StatsGroup:AddToggle({
    Title = "Auto Add Defense",
    Callback = function(state) _G.Settings.Stats.AutoDefense = state end
})

StatsGroup:AddToggle({
    Title = "Auto Add Sword",
    Callback = function(state) _G.Settings.Stats.AutoSword = state end
})

StatsGroup:AddToggle({
    Title = "Auto Add Fruit",
    Callback = function(state) _G.Settings.Stats.AutoFruit = state end
})

StatsGroup:AddToggle({
    Title = "Enable Auto Stats",
    Description = "Bật tất cả auto stats",
    Callback = function(state)
        _G.Settings.Stats.AutoStats = state
        if state then spawn(StartAutoStats) end
    end
})

-- ============ ESP TAB ============
EspTab = Window:AddTab("ESP")
EspGroup = EspTab:AddLeftGroupbox("ESP Settings")

EspGroup:AddToggle({
    Title = "Player ESP",
    Description = "Hiển thị người chơi khác",
    Callback = function(state)
        _G.Settings.Esp.ESPPlayer = state
        if state then spawn(StartESP) end
    end
})

EspGroup:AddToggle({
    Title = "Chest ESP",
    Description = "Hiển thị rương",
    Callback = function(state)
        _G.Settings.Esp.ESPChest = state
        if state then spawn(StartESP) end
    end
})

EspGroup:AddToggle({
    Title = "Devil Fruit ESP",
    Description = "Hiển thị trái ác quỷ",
    Callback = function(state)
        _G.Settings.Esp.ESPDevilFruit = state
        if state then spawn(StartESP) end
    end
})

EspGroup:AddToggle({
    Title = "Monster ESP",
    Description = "Hiển thị quái vật",
    Callback = function(state)
        _G.Settings.Esp.ESPMonster = state
        if state then spawn(StartESP) end
    end
})

-- ============ MOVEMENT TAB ============
MovementTab = Window:AddTab("Movement")
SpeedGroup = MovementTab:AddLeftGroupbox("Speed Settings")

SpeedGroup:AddSlider({
    Title = "Walk Speed",
    Min = 16,
    Max = 300,
    Default = 16,
    Callback = function(value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

SpeedGroup:AddSlider({
    Title = "Jump Power",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

-- Fly
local flying = false
local bodyVelocity = nil

SpeedGroup:AddToggle({
    Title = "Fly Mode",
    Description = "Bật/tắt chế độ bay",
    Callback = function(state)
        flying = state
        if flying then
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(1/0, 1/0, 1/0)
            bodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
            
            game:GetService("RunService").RenderStepped:Connect(function()
                if flying and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local move = Vector3.new()
                    if UserInputService:IsKeyPressed(Enum.KeyCode.W) then
                        move = move + LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector
                    end
                    if UserInputService:IsKeyPressed(Enum.KeyCode.S) then
                        move = move - LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector
                    end
                    if UserInputService:IsKeyPressed(Enum.KeyCode.A) then
                        move = move - LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector
                    end
                    if UserInputService:IsKeyPressed(Enum.KeyCode.D) then
                        move = move + LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector
                    end
                    if UserInputService:IsKeyPressed(Enum.KeyCode.Space) then
                        move = move + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyPressed(Enum.KeyCode.LeftControl) then
                        move = move - Vector3.new(0, 1, 0)
                    end
                    bodyVelocity.Velocity = move * 100
                    LocalPlayer.Character.Humanoid.PlatformStand = true
                end
            end)
        else
            if bodyVelocity then bodyVelocity:Destroy() end
            if LocalPlayer.Character then
                LocalPlayer.Character.Humanoid.PlatformStand = false
            end
        end
    end
})

-- Noclip
local noclipEnabled = false
SpeedGroup:AddToggle({
    Title = "Noclip",
    Description = "Đi xuyên tường",
    Callback = function(state)
        noclipEnabled = state
        spawn(function()
            while noclipEnabled do
                if LocalPlayer.Character then
                    for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
                wait(0.1)
            end
        end)
    end
})

-- ============ UTILITIES TAB ============
UtilTab = Window:AddTab("Utilities")
UtilGroup = UtilTab:AddLeftGroupbox("Server Utilities")

UtilGroup:AddButton({
    Title = "Hop Server",
    Description = "Nhảy sang server khác",
    Callback = function()
        HopServer()
    end
})

UtilGroup:AddButton({
    Title = "Rejoin Server",
    Description = "Vào lại server hiện tại",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

UtilGroup:AddButton({
    Title = "Server Lag? Fix",
    Description = "Dọn dẹp effect gây lag",
    Callback = function()
        for _, v in pairs(Workspace._WorldOrigin:GetChildren()) do
            if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "Sounds" then
                v:Destroy()
            end
        end
        Library:Notify({Title = "Cleaned!", Description = "Removed laggy effects", Duration = 2})
    end
})

-- ============ INFO TAB ============
InfoTab = Window:AddTab("Info")
InfoGroup = InfoTab:AddLeftGroupbox("Player Info")

InfoGroup:AddLabel("Level: " .. LocalPlayer.Data.Level.Value)
InfoGroup:AddLabel("Race: " .. (LocalPlayer.Data.Race.Value or "Unknown"))
InfoGroup:AddLabel("Fruit: " .. (LocalPlayer.Data.DevilFruit.Value or "None"))

-- ============ FINAL NOTIFY ============
Library:Notify({
    Title = "Doraemon Hub + Xenon",
    Description = "All features loaded successfully!",
    Duration = 3
})

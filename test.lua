-- ============ LOAD UI LIBRARY ============
Library = loadstring(game:HttpGet("https://pastefy.app/aK0pEgmK/raw"))()

local Window = Library:CreateWindow({
    Title = "Doraemon Hub",
    Subtitle = "Blox Fruit - Full Feature",
    Image = "rbxassetid://122932159240295"
})

wait(1)

Library:Notify({
    Title = "Doraemon Hub",
    Description = "Loaded successfully! Press the button at bottom-left to show/hide GUI.",
    Duration = 3
})

-- ============ VARIABLES ============
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local CommF = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") or ReplicatedStorage:FindFirstChild("CommF_")

-- Auto farm states
local AutoFarmEnabled = false
local AutoMasteryEnabled = false
local AutoRaidEnabled = false
local AutoChestEnabled = false
local AutoStatsEnabled = false
local AutoHakiEnabled = true
local ESPEnabled = {
    Player = false,
    Chest = false,
    Fruit = false,
    Monster = false
}

local SelectedWeapon = "Melee"
local FarmDistance = 15
local ESPNumber = math.random(1, 999999)

-- World check
local World1 = game.PlaceId == 2753915549
local World2 = game.PlaceId == 4442272183
local World3 = game.PlaceId == 7449423635

-- ============ CORE FUNCTIONS ============

function AutoHaki()
    if AutoHakiEnabled and LocalPlayer.Character and not LocalPlayer.Character:FindFirstChild("HasBuso") then
        CommF:InvokeServer("Buso")
    end
end

function EquipWeapon(ToolName)
    if not LocalPlayer.Character:FindFirstChild(ToolName) then
        local tool = LocalPlayer.Backpack:FindFirstChild(ToolName)
        if tool then
            LocalPlayer.Character.Humanoid:EquipTool(tool)
        end
    end
end

function TweenTo(pos)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local tween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {CFrame = pos})
        tween:Play()
    end
end

function CheckQuest()
    local level = LocalPlayer.Data.Level.Value
    
    if World1 then
        if level <= 9 then
            if tostring(LocalPlayer.Team) == "Marines" then
                Mon = "Trainee"; QName = "MarineQuest"; QData = 1
                QuestPos = CFrame.new(-2709.67944, 24.5206585, 2104.24585)
                MonPos = CFrame.new(-2709.67944, 24.5206585, 2104.24585)
            else
                Mon = "Bandit"; QName = "BanditQuest1"; QData = 1
                QuestPos = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125)
                MonPos = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125)
            end
        elseif level <= 14 then
            Mon = "Monkey"; QName = "JungleQuest"; QData = 1
            QuestPos = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            MonPos = CFrame.new(-1448.5180664062, 67.853012084961, 11.465796470642)
        elseif level <= 29 then
            Mon = "Gorilla"; QName = "JungleQuest"; QData = 2
            QuestPos = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            MonPos = CFrame.new(-1129.8836669922, 40.46354675293, -525.42370605469)
        elseif level <= 39 then
            Mon = "Pirate"; QName = "BuggyQuest1"; QData = 1
            QuestPos = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            MonPos = CFrame.new(-1103.5134277344, 13.752052307129, 3896.0910644531)
        elseif level <= 59 then
            Mon = "Brute"; QName = "BuggyQuest1"; QData = 2
            QuestPos = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            MonPos = CFrame.new(-1140.0837402344, 14.809885025024, 4322.9213867188)
        elseif level <= 74 then
            Mon = "Desert Bandit"; QName = "DesertQuest"; QData = 1
            QuestPos = CFrame.new(894.488647, 5.14000702, 4392.43359)
            MonPos = CFrame.new(924.7998046875, 6.4486746788025, 4481.5859375)
        elseif level <= 89 then
            Mon = "Desert Officer"; QName = "DesertQuest"; QData = 2
            QuestPos = CFrame.new(894.488647, 5.14000702, 4392.43359)
            MonPos = CFrame.new(1608.2822265625, 8.6142244338989, 4371.0073242188)
        elseif level <= 99 then
            Mon = "Snow Bandit"; QName = "SnowQuest"; QData = 1
            QuestPos = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            MonPos = CFrame.new(1354.3479003906, 87.272773742676, -1393.9465332031)
        elseif level <= 119 then
            Mon = "Snowman"; QName = "SnowQuest"; QData = 2
            QuestPos = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            MonPos = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif level <= 149 then
            Mon = "Chief Petty Officer"; QName = "MarineQuest2"; QData = 1
            QuestPos = CFrame.new(-5039.58643, 27.3500385, 4324.68018)
            MonPos = CFrame.new(-4881.2309570312, 22.652044296265, 4273.7524414062)
        elseif level <= 174 then
            Mon = "Sky Bandit"; QName = "SkyQuest"; QData = 1
            QuestPos = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            MonPos = CFrame.new(-4953.20703125, 295.74420166016, -2899.2290039062)
        elseif level <= 189 then
            Mon = "Dark Master"; QName = "SkyQuest"; QData = 2
            QuestPos = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            MonPos = CFrame.new(-5259.8447265625, 391.39767456055, -2229.0354003906)
        elseif level <= 209 then
            Mon = "Prisoner"; QName = "PrisonerQuest"; QData = 1
            QuestPos = CFrame.new(5308.93115, 1.65517521, 475.120514)
            MonPos = CFrame.new(5098.9736328125, -0.3204058110714, 474.23733520508)
        elseif level <= 249 then
            Mon = "Dangerous Prisoner"; QName = "PrisonerQuest"; QData = 2
            QuestPos = CFrame.new(5308.93115, 1.65517521, 475.120514)
            MonPos = CFrame.new(5654.5634765625, 15.633401870728, 866.29919433594)
        elseif level <= 274 then
            Mon = "Toga Warrior"; QName = "ColosseumQuest"; QData = 1
            QuestPos = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            MonPos = CFrame.new(-1820.21484375, 51.683856964111, -2740.6650390625)
        elseif level <= 299 then
            Mon = "Gladiator"; QName = "ColosseumQuest"; QData = 2
            QuestPos = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            MonPos = CFrame.new(-1292.8381347656, 56.380882263184, -3339.0314941406)
        elseif level <= 324 then
            Mon = "Military Soldier"; QName = "MagmaQuest"; QData = 1
            QuestPos = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            MonPos = CFrame.new(-5411.1645507812, 11.081554412842, 8454.29296875)
        elseif level <= 374 then
            Mon = "Military Spy"; QName = "MagmaQuest"; QData = 2
            QuestPos = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            MonPos = CFrame.new(-5802.8681640625, 86.262413024902, 8828.859375)
        elseif level <= 399 then
            Mon = "Fishman Warrior"; QName = "FishmanQuest"; QData = 1
            QuestPos = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            MonPos = CFrame.new(60878.30078125, 18.482830047607, 1543.7574462891)
        elseif level <= 449 then
            Mon = "Fishman Commando"; QName = "FishmanQuest"; QData = 2
            QuestPos = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            MonPos = CFrame.new(61922.6328125, 18.482830047607, 1493.9343261719)
        elseif level <= 474 then
            Mon = "God's Guard"; QName = "SkyExp1Quest"; QData = 1
            QuestPos = CFrame.new(-4721.88867, 843.874695, -1949.96643)
            MonPos = CFrame.new(-4710.04296875, 845.27697753906, -1927.3079833984)
        elseif level <= 524 then
            Mon = "Shanda"; QName = "SkyExp1Quest"; QData = 2
            QuestPos = CFrame.new(-7859.09814, 5544.19043, -381.476196)
            MonPos = CFrame.new(-7678.4897460938, 5566.4038085938, -497.21560668945)
        elseif level <= 549 then
            Mon = "Royal Squad"; QName = "SkyExp2Quest"; QData = 1
            QuestPos = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            MonPos = CFrame.new(-7624.2524414062, 5658.1333007812, -1467.3542480469)
        elseif level <= 624 then
            Mon = "Royal Soldier"; QName = "SkyExp2Quest"; QData = 2
            QuestPos = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            MonPos = CFrame.new(-7836.7534179688, 5645.6640625, -1790.6236572266)
        elseif level <= 649 then
            Mon = "Galley Pirate"; QName = "FountainQuest"; QData = 1
            QuestPos = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            MonPos = CFrame.new(5551.0219726562, 78.901351928711, 3930.4128417969)
        else
            Mon = "Galley Captain"; QName = "FountainQuest"; QData = 2
            QuestPos = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            MonPos = CFrame.new(5441.9516601562, 42.502059936523, 4950.09375)
        end
    elseif World2 then
        if level <= 724 then
            Mon = "Raider"; QName = "Area1Quest"; QData = 1
            QuestPos = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            MonPos = CFrame.new(-728.32672119141, 52.779319763184, 2345.7705078125)
        elseif level <= 774 then
            Mon = "Mercenary"; QName = "Area1Quest"; QData = 2
            QuestPos = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            MonPos = CFrame.new(-1004.3244018555, 80.158866882324, 1424.6193847656)
        elseif level <= 799 then
            Mon = "Swan Pirate"; QName = "Area2Quest"; QData = 1
            QuestPos = CFrame.new(638.43811, 71.769989, 918.282898)
            MonPos = CFrame.new(1068.6643066406, 137.61428833008, 1322.1060791016)
        elseif level <= 874 then
            Mon = "Factory Staff"; QName = "Area2Quest"; QData = 2
            QuestPos = CFrame.new(632.698608, 73.1055908, 918.666321)
            MonPos = CFrame.new(73.078674316406, 81.863441467285, -27.470672607422)
        elseif level <= 899 then
            Mon = "Marine Lieutenant"; QName = "MarineQuest3"; QData = 1
            QuestPos = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            MonPos = CFrame.new(-2821.3723144531, 75.897277832031, -3070.0891113281)
        elseif level <= 949 then
            Mon = "Marine Captain"; QName = "MarineQuest3"; QData = 2
            QuestPos = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            MonPos = CFrame.new(-1861.2310791016, 80.176582336426, -3254.6975097656)
        elseif level <= 974 then
            Mon = "Zombie"; QName = "ZombieQuest"; QData = 1
            QuestPos = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            MonPos = CFrame.new(-5657.7768554688, 78.969734191895, -928.68701171875)
        elseif level <= 999 then
            Mon = "Vampire"; QName = "ZombieQuest"; QData = 2
            QuestPos = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            MonPos = CFrame.new(-6037.66796875, 32.184638977051, -1340.6597900391)
        elseif level <= 1049 then
            Mon = "Snow Trooper"; QName = "SnowMountainQuest"; QData = 1
            QuestPos = CFrame.new(609.858826, 400.119904, -5372.25928)
            MonPos = CFrame.new(549.14733886719, 427.38705444336, -5563.6987304688)
        elseif level <= 1099 then
            Mon = "Winter Warrior"; QName = "SnowMountainQuest"; QData = 2
            QuestPos = CFrame.new(609.858826, 400.119904, -5372.25928)
            MonPos = CFrame.new(1142.7451171875, 475.63980102539, -5199.4165039062)
        elseif level <= 1124 then
            Mon = "Lab Subordinate"; QName = "IceSideQuest"; QData = 1
            QuestPos = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            MonPos = CFrame.new(-5707.4716796875, 15.951709747314, -4513.3920898438)
        elseif level <= 1174 then
            Mon = "Horned Warrior"; QName = "IceSideQuest"; QData = 2
            QuestPos = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            MonPos = CFrame.new(-6341.3666992188, 15.951770782471, -5723.162109375)
        elseif level <= 1199 then
            Mon = "Magma Ninja"; QName = "FireSideQuest"; QData = 1
            QuestPos = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
            MonPos = CFrame.new(-5449.6728515625, 76.658744812012, -5808.2006835938)
        elseif level <= 1249 then
            Mon = "Lava Pirate"; QName = "FireSideQuest"; QData = 2
            QuestPos = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
            MonPos = CFrame.new(-5213.3315429688, 49.737880706787, -4701.451171875)
        elseif level <= 1274 then
            Mon = "Ship Deckhand"; QName = "ShipQuest1"; QData = 1
            QuestPos = CFrame.new(1037.80127, 125.092171, 32911.6016)
            MonPos = CFrame.new(1212.0111083984, 150.79205322266, 33059.24609375)
        elseif level <= 1299 then
            Mon = "Ship Engineer"; QName = "ShipQuest1"; QData = 2
            QuestPos = CFrame.new(1037.80127, 125.092171, 32911.6016)
            MonPos = CFrame.new(919.47863769531, 43.544013977051, 32779.96875)
        elseif level <= 1324 then
            Mon = "Ship Steward"; QName = "ShipQuest2"; QData = 1
            QuestPos = CFrame.new(968.80957, 125.092171, 33244.125)
            MonPos = CFrame.new(919.43853759766, 129.55599975586, 33436.03515625)
        elseif level <= 1349 then
            Mon = "Ship Officer"; QName = "ShipQuest2"; QData = 2
            QuestPos = CFrame.new(968.80957, 125.092171, 33244.125)
            MonPos = CFrame.new(1036.0179443359, 181.4390411377, 33315.7265625)
        elseif level <= 1374 then
            Mon = "Arctic Warrior"; QName = "FrostQuest"; QData = 1
            QuestPos = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            MonPos = CFrame.new(5966.24609375, 62.970020294189, -6179.3828125)
        elseif level <= 1424 then
            Mon = "Snow Lurker"; QName = "FrostQuest"; QData = 2
            QuestPos = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            MonPos = CFrame.new(5407.0737304688, 69.194374084473, -6880.8803710938)
        elseif level <= 1449 then
            Mon = "Sea Soldier"; QName = "ForgottenQuest"; QData = 1
            QuestPos = CFrame.new(-3054.44458, 235.544281, -10142.8193)
            MonPos = CFrame.new(-3028.2236328125, 64.674514770508, -9775.4267578125)
        else
            Mon = "Water Fighter"; QName = "ForgottenQuest"; QData = 2
            QuestPos = CFrame.new(-3054.44458, 235.544281, -10142.8193)
            MonPos = CFrame.new(-3352.9013671875, 285.01556396484, -10534.841796875)
        end
    elseif World3 then
        if level <= 1524 then
            Mon = "Pirate Millionaire"; QName = "PiratePortQuest"; QData = 1
            QuestPos = CFrame.new(-290.07, 42.90, 5581.59)
            MonPos = CFrame.new(-246.00, 47.31, 5584.10)
        elseif level <= 1574 then
            Mon = "Pistol Billionaire"; QName = "PiratePortQuest"; QData = 2
            QuestPos = CFrame.new(-290.07, 42.90, 5581.59)
            MonPos = CFrame.new(-187.33, 86.24, 6013.51)
        elseif level <= 1599 then
            Mon = "Dragon Crew Warrior"; QName = "DragonCrewQuest"; QData = 1
            QuestPos = CFrame.new(6737.06055, 127.417763, -712.300659)
            MonPos = CFrame.new(6709.76367, 52.3442993, -1139.02966)
        elseif level <= 1624 then
            Mon = "Dragon Crew Archer"; QName = "DragonCrewQuest"; QData = 2
            QuestPos = CFrame.new(6737.06055, 127.417763, -712.300659)
            MonPos = CFrame.new(6668.76172, 481.376923, 329.12207)
        elseif level <= 1649 then
            Mon = "Hydra Enforcer"; QName = "VenomCrewQuest"; QData = 1
            QuestPos = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            MonPos = CFrame.new(4547.11523, 1003.10217, 334.194824)
        elseif level <= 1699 then
            Mon = "Venomous Assailant"; QName = "VenomCrewQuest"; QData = 2
            QuestPos = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            MonPos = CFrame.new(4674.92676, 1134.82654, 996.308838)
        elseif level <= 1724 then
            Mon = "Marine Commodore"; QName = "MarineTreeIsland"; QData = 1
            QuestPos = CFrame.new(2180.54126, 27.8156815, -6741.5498)
            MonPos = CFrame.new(2286.0078125, 73.133918762207, -7159.8090820312)
        elseif level <= 1774 then
            Mon = "Marine Rear Admiral"; QName = "MarineTreeIsland"; QData = 2
            QuestPos = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            MonPos = CFrame.new(3656.7736816406, 160.52406311035, -7001.5986328125)
        elseif level <= 1799 then
            Mon = "Fishman Raider"; QName = "DeepForestIsland3"; QData = 1
            QuestPos = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            MonPos = CFrame.new(-10407.526367188, 331.76263427734, -8368.5166015625)
        elseif level <= 1824 then
            Mon = "Fishman Captain"; QName = "DeepForestIsland3"; QData = 2
            QuestPos = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            MonPos = CFrame.new(-10994.701171875, 352.38140869141, -9002.1103515625)
        elseif level <= 1849 then
            Mon = "Forest Pirate"; QName = "DeepForestIsland"; QData = 1
            QuestPos = CFrame.new(-13234.04, 331.488495, -7625.40137)
            MonPos = CFrame.new(-13274.478515625, 332.37814331055, -7769.5805664062)
        elseif level <= 1899 then
            Mon = "Mythological Pirate"; QName = "DeepForestIsland"; QData = 2
            QuestPos = CFrame.new(-13234.04, 331.488495, -7625.40137)
            MonPos = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif level <= 1924 then
            Mon = "Jungle Pirate"; QName = "DeepForestIsland2"; QData = 1
            QuestPos = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            MonPos = CFrame.new(-12256.16015625, 331.73828125, -10485.836914062)
        elseif level <= 1974 then
            Mon = "Musketeer Pirate"; QName = "DeepForestIsland2"; QData = 2
            QuestPos = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            MonPos = CFrame.new(-13457.904296875, 391.54565429688, -9859.177734375)
        elseif level <= 1999 then
            Mon = "Reborn Skeleton"; QName = "HauntedQuest1"; QData = 1
            QuestPos = CFrame.new(-9479.2168, 141.215088, 5566.09277)
            MonPos = CFrame.new(-8763.7236328125, 165.72299194336, 6159.8618164062)
        elseif level <= 2024 then
            Mon = "Living Zombie"; QName = "HauntedQuest1"; QData = 2
            QuestPos = CFrame.new(-9479.2168, 141.215088, 5566.09277)
            MonPos = CFrame.new(-10144.131835938, 138.6266784668, 5838.0888671875)
        elseif level <= 2049 then
            Mon = "Demonic Soul"; QName = "HauntedQuest2"; QData = 1
            QuestPos = CFrame.new(-9516.99316, 172.017181, 6078.46533)
            MonPos = CFrame.new(-9505.8720703125, 172.10482788086, 6158.9931640625)
        elseif level <= 2074 then
            Mon = "Posessed Mummy"; QName = "HauntedQuest2"; QData = 2
            QuestPos = CFrame.new(-9516.99316, 172.017181, 6078.46533)
            MonPos = CFrame.new(-9582.0224609375, 6.2515273094177, 6205.478515625)
        elseif level <= 2099 then
            Mon = "Peanut Scout"; QName = "NutsIslandQuest"; QData = 1
            QuestPos = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875)
            MonPos = CFrame.new(-2143.2419433594, 47.721984863281, -10029.995117188)
        elseif level <= 2124 then
            Mon = "Peanut President"; QName = "NutsIslandQuest"; QData = 2
            QuestPos = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875)
            MonPos = CFrame.new(-1859.3540039062, 38.103168487549, -10422.4296875)
        elseif level <= 2149 then
            Mon = "Ice Cream Chef"; QName = "IceCreamIslandQuest"; QData = 1
            QuestPos = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438)
            MonPos = CFrame.new(-872.24658203125, 65.81957244873, -10919.95703125)
        elseif level <= 2199 then
            Mon = "Ice Cream Commander"; QName = "IceCreamIslandQuest"; QData = 2
            QuestPos = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438)
            MonPos = CFrame.new(-558.06103515625, 112.04895782471, -11290.774414062)
        elseif level <= 2224 then
            Mon = "Cookie Crafter"; QName = "CakeQuest1"; QData = 1
            QuestPos = CFrame.new(-2021.32007, 37.7982254, -12028.7295)
            MonPos = CFrame.new(-2374.13671875, 37.798263549805, -12125.30859375)
        elseif level <= 2249 then
            Mon = "Cake Guard"; QName = "CakeQuest1"; QData = 2
            QuestPos = CFrame.new(-2021.32007, 37.7982254, -12028.7295)
            MonPos = CFrame.new(-1598.3070068359, 43.773197174072, -12244.581054688)
        elseif level <= 2274 then
            Mon = "Baking Staff"; QName = "CakeQuest2"; QData = 1
            QuestPos = CFrame.new(-1927.91602, 37.7981339, -12842.5391)
            MonPos = CFrame.new(-1887.8099365234, 77.618507385254, -12998.350585938)
        elseif level <= 2299 then
            Mon = "Head Baker"; QName = "CakeQuest2"; QData = 2
            QuestPos = CFrame.new(-1927.91602, 37.7981339, -12842.5391)
            MonPos = CFrame.new(-2216.1882324219, 82.884521484375, -12869.293945312)
        elseif level <= 2324 then
            Mon = "Cocoa Warrior"; QName = "ChocQuest1"; QData = 1
            QuestPos = CFrame.new(233.22836303711, 29.876001358032, -12201.233398438)
            MonPos = CFrame.new(-21.553283691406, 80.574996948242, -12352.387695312)
        elseif level <= 2349 then
            Mon = "Chocolate Bar Battler"; QName = "ChocQuest1"; QData = 2
            QuestPos = CFrame.new(233.22836303711, 29.876001358032, -12201.233398438)
            MonPos = CFrame.new(582.59057617188, 77.188095092773, -12463.162109375)
        elseif level <= 2374 then
            Mon = "Sweet Thief"; QName = "ChocQuest2"; QData = 1
            QuestPos = CFrame.new(150.50663757324, 30.693693161011, -12774.502929688)
            MonPos = CFrame.new(165.1884765625, 76.058853149414, -12600.836914062)
        elseif level <= 2399 then
            Mon = "Candy Rebel"; QName = "ChocQuest2"; QData = 2
            QuestPos = CFrame.new(150.50663757324, 30.693693161011, -12774.502929688)
            MonPos = CFrame.new(134.86563110352, 77.247680664062, -12876.547851562)
        elseif level <= 2449 then
            Mon = "Candy Pirate"; QName = "CandyQuest1"; QData = 1
            QuestPos = CFrame.new(-1150.0400390625, 20.378934860229, -14446.334960938)
            MonPos = CFrame.new(-1310.5003662109, 26.016523361206, -14562.404296875)
        elseif level <= 2474 then
            Mon = "Isle Outlaw"; QName = "TikiQuest1"; QData = 1
            QuestPos = CFrame.new(-16548.8164, 55.6059914, -172.8125)
            MonPos = CFrame.new(-16479.900390625, 226.6117401123, -300.31143188477)
        elseif level <= 2499 then
            Mon = "Island Boy"; QName = "TikiQuest1"; QData = 2
            QuestPos = CFrame.new(-16548.8164, 55.6059914, -172.8125)
            MonPos = CFrame.new(-16849.396484375, 192.86505126953, -150.78532409668)
        elseif level <= 2524 then
            Mon = "Sun-kissed Warrior"; QName = "TikiQuest2"; QData = 1
            QuestPos = CFrame.new(-16538, 55, 1049)
            MonPos = CFrame.new(-16347, 64, 984)
        elseif level <= 2550 then
            Mon = "Isle Champion"; QName = "TikiQuest2"; QData = 2
            QuestPos = CFrame.new(-16541.0215, 57.3082275, 1051.46118)
            MonPos = CFrame.new(-16602.1015625, 130.38734436035, 1087.2456054688)
        elseif level <= 2574 then
            Mon = "Serpent Hunter"; QName = "TikiQuest3"; QData = 1
            QuestPos = CFrame.new(-16668.03, 105.32, 1568.60)
            MonPos = CFrame.new(-16645.64, 163.09, 1352.87)
        else
            Mon = "Skull Slayer"; QName = "TikiQuest3"; QData = 2
            QuestPos = CFrame.new(-16668.03, 105.32, 1568.60)
            MonPos = CFrame.new(-16709.49, 419.68, 1751.09)
        end
    end
end

-- ============ AUTO FARM FUNCTION ============
function StartAutoFarm()
    while AutoFarmEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 do
        pcall(function()
            CheckQuest()
            AutoHaki()
            
            if LocalPlayer.Data.Quest.Value == nil then
                CommF:InvokeServer("StartQuest", QName, QData)
                wait(0.5)
            end
            
            local nearest = nil
            local shortest = math.huge
            
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    local dist = (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist < shortest and dist <= FarmDistance then
                        shortest = dist
                        nearest = v
                    end
                end
            end
            
            if nearest then
                LocalPlayer.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0, 2, 3)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                wait(0.05)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
            else
                TweenTo(MonPos)
            end
        end)
        wait(0.2)
    end
end

-- ============ AUTO MASTERY FUNCTION ============
function StartAutoMastery()
    while AutoMasteryEnabled do
        pcall(function()
            CheckQuest()
            AutoHaki()
            
            if SelectedWeapon == "Melee" then
                EquipWeapon("Combat")
            elseif SelectedWeapon == "Sword" then
                for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == "Sword" then
                        EquipWeapon(v.Name)
                        break
                    end
                end
            elseif SelectedWeapon == "Fruit" and LocalPlayer.Data.DevilFruit.Value then
                EquipWeapon(LocalPlayer.Data.DevilFruit.Value)
            elseif SelectedWeapon == "Gun" then
                for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == "Gun" then
                        EquipWeapon(v.Name)
                        break
                    end
                end
            end
            
            local nearest = nil
            local shortest = math.huge
            
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    local dist = (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist < shortest and dist <= FarmDistance then
                        shortest = dist
                        nearest = v
                    end
                end
            end
            
            if nearest then
                TweenTo(nearest.HumanoidRootPart.CFrame * CFrame.new(0, 2, 3))
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                wait(0.05)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
            else
                TweenTo(MonPos)
            end
        end)
        wait(0.2)
    end
end

-- ============ AUTO RAID FUNCTION ============
function StartAutoRaid()
    while AutoRaidEnabled do
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
                CommF:InvokeServer("Raids", "Start", "Flame")
                wait(3)
            end
        end)
        wait(0.5)
    end
end

-- ============ AUTO CHEST FUNCTION ============
function StartAutoChest()
    while AutoChestEnabled do
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

-- ============ AUTO STATS FUNCTION ============
function StartAutoStats()
    while AutoStatsEnabled do
        pcall(function()
            local point = LocalPlayer.Data.Points.Value
            if point > 0 then
                CommF:InvokeServer("AddPoint", "Melee", point)
                CommF:InvokeServer("AddPoint", "Defense", point)
                CommF:InvokeServer("AddPoint", "Sword", point)
                CommF:InvokeServer("AddPoint", "Devil Fruit", point)
            end
        end)
        wait(5)
    end
end

-- ============ ESP FUNCTIONS ============
function StartESP()
    while ESPEnabled.Player or ESPEnabled.Chest or ESPEnabled.Fruit or ESPEnabled.Monster do
        pcall(function()
            if ESPEnabled.Player then
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                        if not v.Character.Head:FindFirstChild("ESP_"..ESPNumber) then
                            local bill = Instance.new("BillboardGui", v.Character.Head)
                            bill.Name = "ESP_"..ESPNumber
                            bill.Size = UDim2.new(0, 200, 0, 30)
                            bill.AlwaysOnTop = true
                            local txt = Instance.new("TextLabel", bill)
                            txt.Size = UDim2.new(1,0,1,0)
                            txt.BackgroundTransparency = 1
                            txt.TextColor3 = v.Team == LocalPlayer.Team and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
                            txt.Text = v.Name
                            txt.TextSize = 12
                        else
                            local dist = (v.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude
                            v.Character.Head["ESP_"..ESPNumber].TextLabel.Text = v.Name .. " | " .. math.floor(dist/3) .. "m"
                        end
                    end
                end
            end
            
            if ESPEnabled.Chest then
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name:find("Chest") and v:IsA("BasePart") and not v:FindFirstChild("ESP_Chest") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "ESP_Chest"
                        bill.Size = UDim2.new(0, 100, 0, 20)
                        bill.AlwaysOnTop = true
                        local txt = Instance.new("TextLabel", bill)
                        txt.Size = UDim2.new(1,0,1,0)
                        txt.BackgroundTransparency = 1
                        txt.TextColor3 = Color3.fromRGB(255,215,0)
                        txt.Text = v.Name
                        txt.TextSize = 10
                    end
                end
            end
            
            if ESPEnabled.Fruit then
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name:find("Fruit") and v:IsA("Tool") and v:FindFirstChild("Handle") and not v.Handle:FindFirstChild("ESP_Fruit") then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "ESP_Fruit"
                        bill.Size = UDim2.new(0, 150, 0, 20)
                        bill.AlwaysOnTop = true
                        local txt = Instance.new("TextLabel", bill)
                        txt.Size = UDim2.new(1,0,1,0)
                        txt.BackgroundTransparency = 1
                        txt.TextColor3 = Color3.fromRGB(255,0,255)
                        txt.Text = v.Name
                        txt.TextSize = 10
                    end
                end
            end
            
            if ESPEnabled.Monster then
                for _, v in pairs(Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and not v:FindFirstChild("ESP_Monster") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "ESP_Monster"
                        bill.Size = UDim2.new(0, 200, 0, 30)
                        bill.AlwaysOnTop = true
                        local txt = Instance.new("TextLabel", bill)
                        txt.Size = UDim2.new(1,0,1,0)
                        txt.BackgroundTransparency = 1
                        txt.TextColor3 = Color3.fromRGB(255,100,0)
                        txt.Text = v.Name .. " | HP: " .. math.floor(v.Humanoid.Health)
                        txt.TextSize = 11
                    end
                end
            end
        end)
        wait(0.5)
    end
end

function HopServer()
    local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings"))()
    module:Teleport(game.PlaceId)
end

-- ============ SHOP TAB ============
local ShopTab = Window:AddTab("Shop")
local ShopGroup = ShopTab:AddLeftGroupbox("Misc Shop")

local codes = {
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

ShopGroup:AddButton({
    Title = "Redeem All Codes",
    Callback = function()
        for _, v in pairs(codes) do
            spawn(function()
                ReplicatedStorage.Remotes.Redeem:InvokeServer(v)
                wait(0.3)
            end)
        end
    end
})

ShopGroup:AddButton({
    Title = "Teleport Old World",
    Callback = function() CommF:InvokeServer("TravelMain") end
})

ShopGroup:AddButton({
    Title = "Teleport New World",
    Callback = function() CommF:InvokeServer("TravelDressrosa") end
})

ShopGroup:AddButton({
    Title = "Teleport Third Sea",
    Callback = function() CommF:InvokeServer("TravelZou") end
})

ShopGroup:AddButton({
    Title = "Buy Dual Flintlock",
    Callback = function() CommF:InvokeServer("BuyItem", "Dual Flintlock") end
})

ShopGroup:AddButton({
    Title = "Reroll Race",
    Callback = function()
        CommF:InvokeServer("BlackbeardReward", "Reroll", "1")
        CommF:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})

ShopGroup:AddButton({
    Title = "Reset Stats",
    Callback = function()
        CommF:InvokeServer("BlackbeardReward","Refund","1")
        CommF:InvokeServer("BlackbeardReward","Refund","2")
    end
})

ShopGroup:AddButton({
    Title = "Buy Ghoul Race",
    Callback = function()
        CommF:InvokeServer("Ectoplasm", "BuyCheck", 4)
        wait(0.5)
        CommF:InvokeServer("Ectoplasm", "Change", 4)
    end
})

ShopGroup:AddButton({
    Title = "Buy Cyborg Race",
    Callback = function()
        CommF:InvokeServer("CyborgTrainer", "Buy")
    end
})

-- ============ AUTO FARM TAB ============
local FarmTab = Window:AddTab("Auto Farm")
local FarmGroup = FarmTab:AddLeftGroupbox("Farm Settings")

FarmGroup:AddToggle({
    Title = "Auto Farm Level",
    Description = "Tự động farm theo level",
    Callback = function(state)
        AutoFarmEnabled = state
        if state then spawn(StartAutoFarm) end
    end
})

FarmGroup:AddToggle({
    Title = "Auto Haki",
    Description = "Tự động bật Haki",
    Callback = function(state)
        AutoHakiEnabled = state
    end
})

FarmGroup:AddSlider({
    Title = "Farm Distance",
    Min = 10,
    Max = 50,
    Default = 15,
    Callback = function(value)
        FarmDistance = value
    end
})

-- ============ MASTERY TAB ============
local MasteryTab = Window:AddTab("Mastery")
local MasteryGroup = MasteryTab:AddLeftGroupbox("Mastery Settings")

MasteryGroup:AddToggle({
    Title = "Auto Farm Mastery",
    Description = "Tự động farm mastery",
    Callback = function(state)
        AutoMasteryEnabled = state
        if state then spawn(StartAutoMastery) end
    end
})

MasteryGroup:AddDropdown({
    Title = "Select Weapon",
    Values = {"Melee", "Sword", "Fruit", "Gun"},
    Callback = function(value)
        SelectedWeapon = value
    end
})

-- ============ RAID TAB ============
local RaidTab = Window:AddTab("Raid")
local RaidGroup = RaidTab:AddLeftGroupbox("Raid Settings")

RaidGroup:AddToggle({
    Title = "Auto Raid",
    Description = "Tự động làm raid",
    Callback = function(state)
        AutoRaidEnabled = state
        if state then spawn(StartAutoRaid) end
    end
})

-- ============ CHEST TAB ============
local ChestTab = Window:AddTab("Chest")
local ChestGroup = ChestTab:AddLeftGroupbox("Chest Settings")

ChestGroup:AddToggle({
    Title = "Auto Farm Chest",
    Description = "Tự động mở rương",
    Callback = function(state)
        AutoChestEnabled = state
        if state then spawn(StartAutoChest) end
    end
})

-- ============ STATS TAB ============
local StatsTab = Window:AddTab("Stats")
local StatsGroup = StatsTab:AddLeftGroupbox("Auto Stats")

StatsGroup:AddToggle({
    Title = "Auto Add Stats",
    Description = "Tự động cộng điểm stats",
    Callback = function(state)
        AutoStatsEnabled = state
        if state then spawn(StartAutoStats) end
    end
})

-- ============ ESP TAB ============
local EspTab = Window:AddTab("ESP")
local EspGroup = EspTab:AddLeftGroupbox("ESP Settings")

EspGroup:AddToggle({
    Title = "Player ESP",
    Callback = function(state)
        ESPEnabled.Player = state
        if state then spawn(StartESP) end
    end
})

EspGroup:AddToggle({
    Title = "Chest ESP",
    Callback = function(state)
        ESPEnabled.Chest = state
        if state then spawn(StartESP) end
    end
})

EspGroup:AddToggle({
    Title = "Fruit ESP",
    Callback = function(state)
        ESPEnabled.Fruit = state
        if state then spawn(StartESP) end
    end
})

EspGroup:AddToggle({
    Title = "Monster ESP",
    Callback = function(state)
        ESPEnabled.Monster = state
        if state then spawn(StartESP) end
    end
})

-- ============ MOVEMENT TAB ============
local MoveTab = Window:AddTab("Movement")
local MoveGroup = MoveTab:AddLeftGroupbox("Speed Settings")

MoveGroup:AddSlider({
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

MoveGroup:AddSlider({
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
local bv = nil

MoveGroup:AddToggle({
    Title = "Fly Mode",
    Callback = function(state)
        flying = state
        if flying then
            bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bv.Parent = LocalPlayer.Character.HumanoidRootPart
            LocalPlayer.Character.Humanoid.PlatformStand = true
            game:GetService("RunService").RenderStepped:Connect(function()
                if flying and LocalPlayer.Character then
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
                    bv.Velocity = move * 100
                end
            end)
        else
            if bv then bv:Destroy() end
            if LocalPlayer.Character then
                LocalPlayer.Character.Humanoid.PlatformStand = false
            end
        end
    end
})

-- ============ UTILITIES TAB ============
local UtilTab = Window:AddTab("Utilities")
local UtilGroup = UtilTab:AddLeftGroupbox("Server")

UtilGroup:AddButton({
    Title = "Hop Server",
    Callback = function() HopServer() end
})

UtilGroup:AddButton({
    Title = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

UtilGroup:AddButton({
    Title = "Clear Lag",
    Callback = function()
        for _, v in pairs(Workspace._WorldOrigin:GetChildren()) do
            if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" then
                v:Destroy()
            end
        end
    end
})

-- ============ INFO TAB ============
local InfoTab = Window:AddTab("Info")
local InfoGroup = InfoTab:AddLeftGroupbox("Player Info")

InfoGroup:AddLabel("Level: " .. LocalPlayer.Data.Level.Value)
InfoGroup:AddLabel("Race: " .. (LocalPlayer.Data.Race.Value or "Unknown"))
InfoGroup:AddLabel("Fruit: " .. (LocalPlayer.Data.DevilFruit.Value or "None"))

-- Final
Library:Notify({
    Title = "Doraemon Hub",
    Description = "Full version loaded!",
    Duration = 3
})


repeat task.wait() until :IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
if playerGui:FindFirstChild("Main (minimal)") or playerGui:FindFirstChild("ChooseTeam") then
local Remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
pcall(function()
Remotes.CommF_:InvokeServer("SetTeam", getgenv().team)
end)
repeat task.wait() until not (playerGui:FindFirstChild("Main (minimal)") or playerGui:FindFirstChild("ChooseTeam"))
end
task.wait(3)
repeat task.wait() until game:IsLoaded()
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local FolderName = "Hinishi Hub"
local FileName = "Configs.json"
local FullPath = FolderName .. "/" .. FileName

if makefolder and not isfolder(FolderName) then makefolder(FolderName) end

_G.SaveData = {}

function SaveSettings()
if writefile then
local json = HttpService:JSONEncode(_G.SaveData)
writefile(FullPath, json)
end
end

function LoadSettings()
if isfile and isfile(FullPath) then
local content = readfile(FullPath)
local success, result = pcall(function() return HttpService:JSONDecode(content) end)
if success then 
_G.SaveData = result 
return true
end
end
return false
end

function GetSetting(name, default)
if _G.SaveData[name] ~= nil then return _G.SaveData[name] end
return default
end


function ShowResetConfigDialog()
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "skibidi"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Background = Instance.new("Frame")
Background.Name = "bruh"
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.5
Background.BorderSizePixel = 0
Background.Parent = ScreenGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "cuccut"
MainFrame.Size = UDim2.new(0, 400, 0, 200)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(100, 100, 150)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
Title.BackgroundTransparency = 0
Title.BorderSizePixel = 0
Title.Text = "Hinishi Hub - Config Load"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

local Message = Instance.new("TextLabel")
Message.Name = "Message"
Message.Size = UDim2.new(1, -40, 0, 80)
Message.Position = UDim2.new(0, 20, 0, 60)
Message.BackgroundTransparency = 1
Message.Text = "Found config from previous server!\n\nDo you want to load this config?\n\nYES: Load previous config\nNO: Keep default settings"
Message.TextColor3 = Color3.fromRGB(220, 220, 220)
Message.TextSize = 18
Message.Font = Enum.Font.Gotham
Message.TextWrapped = true
Message.TextYAlignment = Enum.TextYAlignment.Top
Message.Parent = MainFrame

local ButtonContainer = Instance.new("Frame")
ButtonContainer.Name = "ghabJ"
ButtonContainer.Size = UDim2.new(1, -40, 0, 50)
ButtonContainer.Position = UDim2.new(0, 20, 1, -60)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = MainFrame

local YesButton = Instance.new("TextButton")
YesButton.Name = "shshjshs"
YesButton.Size = UDim2.new(0.4, -5, 1, 0)
YesButton.Position = UDim2.new(0, 0, 0, 0)
YesButton.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
YesButton.Text = "YES"
YesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YesButton.TextSize = 18
YesButton.Font = Enum.Font.GothamBold
YesButton.Parent = ButtonContainer

local YesCorner = Instance.new("UICorner")
YesCorner.CornerRadius = UDim.new(0, 8)
YesCorner.Parent = YesButton

local NoButton = Instance.new("TextButton")
NoButton.Name = "hssjdjdn"
NoButton.Size = UDim2.new(0.4, -5, 1, 0)
NoButton.Position = UDim2.new(0.6, 5, 0, 0)
NoButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
NoButton.Text = "NO"
NoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NoButton.TextSize = 18
NoButton.Font = Enum.Font.GothamBold
NoButton.Parent = ButtonContainer

local NoCorner = Instance.new("UICorner")
NoCorner.CornerRadius = UDim.new(0, 8)
NoCorner.Parent = NoButton

ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Size = UDim2.new(0, 0, 0, 200)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, -100)

local openTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
Size = UDim2.new(0, 400, 0, 200),
Position = UDim2.new(0.5, -200, 0.5, -100)
})
openTween:Play()

local resultPromise = {}
resultPromise.Value = nil

YesButton.MouseButton1Click:Connect(function()
resultPromise.Value = true

ScreenGui:Destroy()
end)

NoButton.MouseButton1Click:Connect(function()
resultPromise.Value = false

ScreenGui:Destroy()
end)

return resultPromise
end

local function MainConfigLoad()

if not isfile or not isfile(FullPath) then
_G.SaveData = {}
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Hinishi Hub",
Text = "No saved config found",
Duration = 3
})
return
end


local success = LoadSettings()

if not success then
_G.SaveData = {}
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Hinishi Hub",
Text = "Config file corrupted, using defaults",
Duration = 3
})
return
end


local dialogResult = ShowResetConfigDialog()


repeat task.wait() until dialogResult.Value ~= nil

if dialogResult.Value == true then

game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Hinishi Hub",
Text = "Config loaded successfully",
Duration = 3
})
else

_G.SaveData = {}
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Hinishi Hub",
Text = "Using default settings",
Duration = 3
})
end
end


MainConfigLoad()

local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local commE = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommE")

local AutoKen = true

local function HasKen()
local char = player.Character
if not char then return false end
return CollectionService:HasTag(char, "Ken")
end

task.spawn(function()
while AutoKen do
task.wait(0.2)

if HasKen() then
pcall(function()
commE:FireServer("Ken", true)
end)
end
end
end)
_G.Vietnamese = false
if _G.Translate == "Vietnamese" then
_G.Vietnamese = true

if _G.Vietnamese then
task.spawn(function()
local dictionary = {
["Farm"] = "Cày", ["Farming"] = "Cày", ["Fast Attack"] = "Đánh Nhanh", ["Mobs"] = "Quái",
["Player"] = "Người Chơi", ["Fruit"] = "Trái", ["Fruits"] = "Trái", ["Raid"] = "Tập Kích",
["Teleport"] = "Dịch Chuyển", ["Tween"] = "Bay", ["Quest"] = "Nhiệm Vụ", ["Quests"] = "Nhiệm Vụ",
["Risk"] = "Nguy Hiểm", ["Melee"] = "Cận Chiến", ["Sword"] = "Kiếm", ["Gun"] = "Súng",
["Auto"] = "Tự Động", ["Redeem"] = "Nhập", ["Pirate"] = "Hải Tặc", ["Marine"] = "Hải Quân",
["Join"] = "Tham Gia", ["Remove"] = "Xoá", ["Notify"] = "Thông Báo", ["Esp"] = "Định Vị",
["Day"] = "Sáng", ["Night"] = "Tối", ["Fog"] = "Xương Mù", ["Walk on Water"] = "Đi Bộ Trên Nước",
["Buy"] = "Mua", ["Shop"] = "Cửa Hàng", ["Random"] = "Quay", ["All"] = "Tất Cả",
["Settings"] = "Cài Đặt", ["Server"] = "Máy Chủ", ["Fishing"] = "Câu Cá", ["Misc"] = "Linh Tinh",
["Mastery"] = "Thông Thạo", ["Bone"] = "Xương", ["Select"] = "Chọn", ["Choose"] = "Chọn",
["Try Luck"] = "Thử Vận May", ["Unlock"] = "Mở Khoá", ["Background"] = "Nền", ["Level"] = "Cấp",
["Distance"] = "Khoảng Cách", ["Accept"] = "Chấp Nhận", ["Turn on"] = "Bật", ["Race"] = "Tộc",
["Mirage"] = "Đảo Bí Ẩn", ["Anti"] = "Chống", ["Effect"] = "Hiệu Ứng", ["Fast"] = "Nhanh",
["Attack"] = "Đánh", ["Die"] = "Chết", ["Mode"] = "Chế Độ", ["Safe"] = "An Toàn",
["Stats"] = "Chỉ Số", ["Get"] = "Lấy", ["Beta"] = "Thử Nghiệm", ["Sea"] = "Biển",
["Start"] = "Bắt Đầu", ["Delay"] = "Chờ", ["Nearest"] = "Gần", ["Hop if"] = "Đổi SV Nếu",
["Bring"] = "Gom", ["Main"] = "Chính", ["Status"] = "Trạng Thái", ["Items"] = "Vật Phẩm",
["Item"] = "Vật Phẩm", ["Travel"] = "Di Chuyển", ["Event"] = "Sự Kiện", ["Boss"] = "Trùm",
["Draco"] = "Rồng", ["Prehistoric"] = "Tiền Sử", ["Jump"] = "Nhảy", ["Material"] = "Vật Liệu",
["Materials"] = "Vật Liệu", ["Island"] = "Đảo", ["Bones"] = "Xương", ["Pray Gravestone"] = "Cầu Nguyện",
["Observation"] = "Haki Né", ["Angle"] = "Thiên Thần", ["Upgrade"] = "Nâng Cấp", ["Theme"] = "Màu Chủ Đề",
["Human"] = "Người", ["FishMan"] = "Người Cá", ["Mink"] = "Thỏ", ["Factory"] = "Nhà Máy",
["Stop"] = "Dừng", ["When"] = "Khi", ["Chalice"] = "Chén Thánh", ["Have"] = "Có", ["Chest"] = "Rương",
["Number"] = "Số", ["To"] = "Đến", ["Legendary"] = "Huyền Thoại", ["Dealer"] = "Bán",
["Coat"] = "Áo Choàng", ["Key"] = "Chìa Khoá", ["Unlocked"] = "Mở Khoá", ["Accessory"] = "Phụ Kiện",
["Swords"] = "Kiếm", ["Portals"] = "Cổng", ["Lag fix"] = "Giảm Lag", ["Visual"] = "Giao Diện",
["Rain"] = "Mưa", ["(Old)"] = "Cũ", ["Bright"] = "Ánh Sáng", ["Ice walk"] = "Đi Bộ Có Hiệu Ứng Băng",
["Chests"] = "Rương", ["Craft"] = "Lắp Ráp", ["Crafts"] = "Lắp Ráp", ["Eggs"] = "Trứng",
["Dragon"] = "Rồng", ["Dino"] = "Khủng Long", ["Complete"] = "Xong", ["Collect"] = "Nhận",
["Find"] = "Tìm", ["Events"] = "Sự Kiện", ["Killed"] = "Đã Giết", ["Full moon"] = "Trăng Tròn",
["Fullmoon"] = "Trăng Tròn", ["Raiding"] = "Tập Kích", ["Rejoin"] = "Vô Lại",
["Defense"] = "Máu", ["Energy"] = "Năng Lượng", ["Ectoplasm"] = "Vật Chất Kì Dị",
["Discord"] = "Discord", ["info"] = "Thông Tin", ["home"] = "Trang Chủ", ["Waves"] = "Sóng",
["star"] = "Ngôi Sao", ["PalmTree"] = "Cây Cọ", ["Swords"] = "Kiếm", ["wifi"] = "Wifi",
["shield"] = "Khiên", ["Cherry"] = "Anh Đào", ["Signal"] = "Tín Hiệu", ["Locate"] = "Định Vị",
["scroll"] = "Cuộn", ["user"] = "Người Dùng", ["shopping-cart"] = "Giỏ Hàng", ["Settings"] = "Cài Đặt",
["Owner | Tik Tok"] = "Chủ Nhân | Tik Tok", ["Fishing Config"] = "Cấu Hình Câu Cá",
["Select Rod"] = "Chọn Cần Câu", ["Fishing Rod"] = "Cần Câu", ["Gold Rod"] = "Cần Câu Vàng",
["Shark Rod"] = "Cần Câu Cá Mập", ["Shell Rod"] = "Cần Câu Vỏ Sò", ["Treasure Rod"] = "Cần Câu Kho Báu",
["Select Bait"] = "Chọn Mồi Câu", ["Basic Bait"] = "Mồi Cơ Bản", ["Kelp Bait"] = "Mồi Tảo Bẹ",
["Good Bait"] = "Mồi Tốt", ["Abyssal Bait"] = "Mồi Vực Thẳm", ["Frozen Bait"] = "Mồi Đông Lạnh",
["Epic Bait"] = "Mồi Huyền Thoại", ["Carnivore Bait"] = "Mồi Ăn Thịt",
["Auto Fishing Quest"] = "Tự Động Nhiệm Vụ Câu Cá", ["Auto Fishing"] = "Tự Động Câu Cá",
["Save Fishing Position"] = "Lưu Vị Trí Câu Cá", ["Auto Fish Saved Pos"] = "Tự Động Câu Cá Tại Vị Trí Đã Lưu",
["Auto Sell Fish"] = "Tự Động Bán Cá", ["Hide All Mob"] = "Ẩn Tất Cả Quái",
["Level Up"] = "Tăng Cấp", ["Select Color"] = "Chọn Màu", ["Red"] = "Đỏ",
["Orange"] = "Cam", ["Yellow"] = "Vàng", ["Green"] = "Xanh Lá", ["Blue"] = "Xanh Dương",
["Pink"] = "Hồng", ["Violet"] = "Tím", ["White"] = "Trắng", ["Rainbow"] = "Cầu Vồng",
["Skill Color"] = "Màu Kỹ Năng", ["Rain Fruits"] = "Mưa Trái", ["Fake Level"] = "Cấp Độ Giả",
["Enter Level"] = "Nhập Cấp Độ", ["Fake EXP"] = "EXP Giả", ["Enter EXP"] = "Nhập EXP",
["Fake Beli"] = "Beli Giả", ["Enter Beli"] = "Nhập Beli", ["Fake Fragment"] = "Mảnh Giả",
["Enter Fragment"] = "Nhập Mảnh", ["Select Tool"] = "Chọn Vũ Khí", ["Melee"] = "Cận Chiến",
["Sword"] = "Kiếm", ["Blox Fruit"] = "Trái Blox", ["Gun"] = "Súng", ["UI Scale"] = "Tỷ Lệ UI",
["Small"] = "Nhỏ", ["Medium"] = "Trung Bình", ["Large"] = "Lớn", ["Bigger"] = "Lớn Hơn",
["Farm Method"] = "Phương Pháp Cày", ["Start Farm"] = "Bắt Đầu Cày", ["Auto Chest [ Tween ]"] = "Rương Tự Động [ Bay ]",
["Tyrant of the Skies"] = "Bạo Chúa Bầu Trời", ["False"] = "Sai", ["Tyrant Eyes"] = "Mắt Bạo Chúa",
["Auto Tyrant of the Skies [Fully]"] = "Bạo Chúa Bầu Trời Tự Động [Đầy Đủ]",
["Main Quests"] = "Nhiệm Vụ Chính", ["Auto Attack Factory"] = "Tự Động Tấn Công Nhà Máy",
["Auto Pirate Raid"] = "Tự Động Tập Kích Hải Tặc", ["Choose Material"] = "Chọn Vật Liệu",
["Auto Farm Material"] = "Tự Động Cày Vật Liệu", ["Auto Berry"] = "Quả Mọng Tự Động",
["Auto Ectoplasm"] = "Vật Chất Kì Dị Tự Động", ["Auto Citizen Quest"] = "Nhiệm Vụ Công Dân Tự Động",
["Auto Training Dummy"] = "Bia Tập Tự Động", ["Auto Bartilo Quest"] = "Nhiệm Vụ Bartilo Tự Động",
["Choose Island"] = "Chọn Đảo", ["Cake"] = "Bánh", ["Bone"] = "Xương",
["Auto Farm Mastery Fruits"] = "Tự Động Cày Thông Thạo Trái", ["Auto Farm Mastery Gun"] = "Tự Động Cày Thông Thạo Súng",
["Auto Mastery All Sword"] = "Tự Động Thông Thạo Tất Cả Kiếm", ["Use Skill Z"] = "Sử Dụng Kỹ Năng Z",
["Use Skill X"] = "Sử Dụng Kỹ Năng X", ["Use Skill C"] = "Sử Dụng Kỹ Năng C",
["Use Skill V"] = "Sử Dụng Kỹ Năng V", ["Use Skill F"] = "Sử Dụng Kỹ Năng F",
["Cake Princes"] = "Hoàng Tử Bánh", ["Your Bones"] = "Xương Của Bạn", ["Soul Reaper"] = "Thần Chết",
["Auto Soul Reaper [Fully]"] = "Thần Chết Tự Động [Đầy Đủ]", ["Auto Random Bones"] = "Xương Ngẫu Nhiên Tự Động",
["Auto Pray Gravestone"] = "Tự Động Cầu Nguyện Bia Mộ", ["Auto Try Luck"] = "Tự Động Thử Vận May",
["Unlocked Chip"] = "Chip Đã Mở Khóa", ["Auto Unlock Dough Chip"] = "Tự Động Mở Khóa Chip Bột",
["Auto Unlock Phoenix Chip"] = "Tự Động Mở Khóa Chip Phượng Hoàng",
["Aura Colours"] = "Màu Sắc Hào Quang", ["Teleport Barista Cousin"] = "Dịch Chuyển Đến Barista Cousin",
["Buy Aura Colors"] = "Mua Màu Hào Quang", ["Auto Rainbow Colors"] = "Màu Cầu Vồng Tự Động",
["Accept Rainbow Quest Fast"] = "Chấp Nhận Nhiệm Vụ Cầu Vồng Nhanh",
["Observation"] = "Haki Quan Sát", ["Auto Farm Observation"] = "Tự Động Cày Haki Quan Sát",
["Auto Observation V2"] = "Haki Quan Sát V2 Tự Động", ["Upgrade Races V3"] = "Nâng Cấp Tộc V3",
["Auto Mink V2 & V3"] = "Thỏ V2 & V3 Tự Động", ["Auto Human V2 & V3"] = "Người V2 & V3 Tự Động",
["Auto Angle V2 & V3"] = "Thiên Thần V2 & V3 Tự Động", ["Auto FishMan V2 & V3"] = "Người Cá V2 & V3 Tự Động",
["Rip_Indra"] = "Rip_Indra", ["Auto Attack Rip_indra"] = "Tự Động Tấn Công Rip_indra",
["Auto Unlocked Aura Puzzle"] = "Tự Động Mở Khóa Câu Đố Hào Quang",
["Attack Delay"] = "Độ Trễ Tấn Công", ["Tween Speed"] = "Tốc Độ Bay",
["Bring Mobs Distance"] = "Khoảng Cách Gom Quái", ["Bring Mobs"] = "Gom Quái",
["Auto Haki"] = "Haki Tự Động", ["Auto Attack"] = "Tấn Công Tự Động",
["Auto Shoot"] = "Bắn Tự Động", ["Bypass Quest [Risk]"] = "Vượt Qua Nhiệm Vụ [Nguy Hiểm]",
["Take Quest Debounce"] = "Chờ Giữa Các Nhiệm Vụ", ["Codes"] = "Mã",
["Redeem all Codes"] = "Nhập Tất Cả Mã", ["Team"] = "Đội",
["Join Pirate Team"] = "Tham Gia Đội Hải Tặc", ["Join Marine Team"] = "Tham Gia Đội Hải Quân",
["Race"] = "Tộc", ["Auto Active Race V3"] = "Kích Hoạt Tộc V3 Tự Động",
["Auto Active Race V4"] = "Kích Hoạt Tộc V4 Tự Động", ["Menu"] = "Menu",
["Awakenings Expert"] = "Chuyên Gia Thức Tỉnh", ["Devil Fruit Shop"] = "Cửa Hàng Trái Ác Quỷ",
["Advanced Fruit Dealer"] = "Đại Lý Trái Nâng Cao", ["Titles"] = "Danh Hiệu",
["Local-Player"] = "Người Chơi Cục Bộ", ["Enable Speed Hack"] = "Bật Tăng Tốc",
["Walk Speed"] = "Tốc Độ Chạy", ["Dash No CD"] = "Dash Không Hồi Chiêu",
["Visual"] = "Giao Diện", ["Remove Fog"] = "Xóa Sương Mù",
["More FPS"] = "Thêm FPS", ["Smooth Farm Mode"] = "Chế Độ Cày Mượt",
["Reduces calculation speed to improve FPS"] = "Giảm tốc độ tính toán để cải thiện FPS",
["Fix Lag"] = "Sửa Lag", ["Fix Lag More"] = "Sửa Lag Nhiều Hơn",
["Remove Dame Text"] = "Xóa Chữ Sát Thương", ["Remove Notifications"] = "Xóa Thông Báo",
["Others"] = "Khác", ["Walk on Water"] = "Đi Bộ Trên Nước",
["Anti AFK"] = "Chống AFK", ["Auto Dash"] = "Dash Tự Động",
["Dash Speed"] = "Tốc Độ Dash", ["Infinite Soru"] = "Soru Vô Hạn",
["No Clip"] = "Xuyên Tường", ["Auto Jump"] = "Nhảy Tự Động",
["Auto Fly"] = "Bay Tự Động", ["Auto Set Spawn Point"] = "Tự Động Đặt Điểm Hồi Sinh",
["Safe Mode"] = "Chế Độ An Toàn", ["Remove Die Effect"] = "Xóa Hiệu Ứng Chết",
["Screen"] = "Màn Hình", ["White Screen"] = "Màn Hình Trắng",
["Black Screen"] = "Màn Hình Đen", ["Blur Screen"] = "Màn Hình Mờ",
["Blur Amount"] = "Độ Mờ", ["Misc"] = "Linh Tinh",
["Distance"] = "Khoảng Cách", ["Random CFrame"] = "CFrame Ngẫu Nhiên",
["Auto Accept Quests"] = "Tự Động Chấp Nhận Nhiệm Vụ", ["Stats"] = "Chỉ Số",
["Stats Upgrade Delay"] = "Độ Trễ Nâng Cấp Chỉ Số", ["Stats Value"] = "Giá Trị Chỉ Số",
["Add Energy"] = "Thêm Năng Lượng", ["Add Defense"] = "Thêm Máu",
["Add Swords"] = "Thêm Kiếm", ["Add Gun"] = "Thêm Súng",
["Add Blox Fruit"] = "Thêm Trái Blox", ["Auto Get Melee [Beta]"] = "Tự Động Lấy Cận Chiến [Beta]",
["Auto Get Superhuman"] = "Tự Động Lấy Siêu Nhân", ["Auto Get DeathStep"] = "Tự Động Lấy Tử Thần",
["Auto Get Sharkman Karate"] = "Tự Động Lấy Karate Người Cá Mập",
["Auto Get Electric Claw"] = "Tự Động Lấy Móng Vuốt Điện",
["Auto Get Dragon Talon"] = "Tự Động Lấy Móng Vuốt Rồng",
["Auto Get Godhuman"] = "Tự Động Lấy Thần Nhân", ["Auto Get SanguineArt"] = "Tự Động Lấy Nghệ Thuật Huyết",
["Next World"] = "Thế Giới Tiếp Theo", ["Auto Second Sea"] = "Tự Động Biển Hai",
["Auto Third Sea"] = "Tự Động Biển Ba", ["Tushita And Yama"] = "Tushita Và Yama",
["Elites Process"] = "Quá Trình Tinh Anh", ["Auto Elite Hunter"] = "Thợ Săn Tinh Anh Tự Động",
["Stop If Have Items"] = "Dừng Nếu Có Vật Phẩm", ["Auto Tushita"] = "Tushita Tự Động",
["Auto Yama"] = "Yama Tự Động", ["Cursed Dual Katana"] = "Song Kiếm Bị Nguyền",
["Auto Cursed Dual Katana (Yama Quest)"] = "Song Kiếm Bị Nguyền Tự Động (Nhiệm Vụ Yama)",
["Auto Cursed Dual Katana (Tushita Quest)"] = "Song Kiếm Bị Nguyền Tự Động (Nhiệm Vụ Tushita)",
["Auto Cursed Dual Katana (Last quest)"] = "Song Kiếm Bị Nguyền Tự Động (Nhiệm Vụ Cuối)",
["True Triple Katana"] = "Tam Kiếm Chân Chính", ["Buy Legendary Sword"] = "Mua Kiếm Huyền Thoại",
["Buy True Triple Katana Sword"] = "Mua Tam Kiếm Chân Chính",
["Tween to Legendary Sword Dealer"] = "Bay Đến Đại Lý Kiếm Huyền Thoại",
["Polo Sword"] = "Kiếm Polo", ["Auto Get Pole Sword"] = "Tự Động Lấy Kiếm Polo",
["Law Raid"] = "Tập Kích Law", ["Auto Kill Law"] = "Tự Động Giết Law",
["Buy Microchip Law"] = "Mua Vi Mạch Law", ["Start Law Raids"] = "Bắt Đầu Tập Kích Law",
["First Sea Items"] = "Vật Phẩm Biển Một", ["Auto Saw Sword"] = "Tự Động Kiếm Cưa",
["Auto Unlock Saber"] = "Tự Động Mở Khóa Saber", ["Auto Cool Glasses"] = "Kính Ngầu Tự Động",
["Auto Usoap's Hat"] = "Nón Usoap Tự Động", ["Auto Warden Sword"] = "Kiếm Quản Ngục Tự Động",
["Auto Marine Coat"] = "Áo Choàng Hải Quân Tự Động", ["Auto Swan Coat"] = "Áo Choàng Thiên Nga Tự Động",
["Rengoku"] = "Rengoku", ["Auto Rengoku Sword"] = "Kiếm Rengoku Tự Động",
["Auto Key Rengoku"] = "Chìa Khóa Rengoku Tự Động", ["Second Sea Items"] = "Vật Phẩm Biển Hai",
["Auto Dragon Trident"] = "Đinh Ba Rồng Tự Động", ["Auto Long Sword"] = "Kiếm Dài Tự Động",
["Auto Black Spikey"] = "Gai Đen Tự Động", ["Auto Dark Blade V3"] = "Hắc Kiếm V3 Tự Động",
["Auto Midnight Blade"] = "Kiếm Nửa Đêm Tự Động", ["Auto Darkbeard"] = "Darkbeard Tự Động",
["Auto Unlock Don Swan"] = "Tự Động Mở Khóa Don Swan", ["Auto Swan Glasses"] = "Kính Thiên Nga Tự Động",
["Bosses"] = "Trùm", ["Auto Whitebeard"] = "Whitebeard Tự Động",
["Third Sea Items"] = "Vật Phẩm Biển Ba", ["Auto Buddy"] = "Bạn Thân Tự Động",
["Auto Canvender"] = "Canvender Tự Động", ["Auto Twin Hooks"] = "Móc Đôi Tự Động",
["Auto Serpent Bow"] = "Cung Rắn Tự Động", ["Auto Lei Accessory"] = "Phụ Kiện Lei Tự Động",
["Mirage"] = "Đảo Bí Ẩn", [" Full Moon "] = " Trăng Tròn ", [" Mirage Island "] = " Đảo Bí Ẩn ",
["Auto Find Mirage Island"] = "Tự Động Tìm Đảo Bí Ẩn", ["Auto Tween To Highest Point"] = "Tự Động Bay Đến Điểm Cao Nhất",
["Auto Look Moon"] = "Tự Động Nhìn Trăng", ["Auto Get Gear"] = "Tự Động Lấy Trang Bị",
["Easy See"] = "Dễ Nhìn", ["Auto Tween Advanced Fruit Dealer"] = "Tự Động Bay Đến Đại Lý Trái Nâng Cao",
["Auto Collect Mirage Chest"] = "Tự Động Thu Thập Rương Đảo Bí Ẩn",
["Skull Guitars"] = "Guitar Sọ Người", [" Skull Guitar Quests "] = " Nhiệm Vụ Guitar Sọ Người ",
["Auto Skull Guitar"] = "Guitar Sọ Người Tự Động", ["Talk With Stone"] = "Nói Chuyện Với Đá",
["Race V4"] = "Tộc V4", [" Tiers V4 "] = " Cấp Bậc V4 ",
["Auto Pull Lever"] = "Tự Động Kéo Cần Gạt", ["Auto Train V4"] = "Tự Động Huấn Luyện V4",
["Teleport to Temple of Time"] = "Dịch Chuyển Đến Đền Thời Gian",
["Teleport to Ancient One"] = "Dịch Chuyển Đến Cổ Nhân",
["Teleport to Ancient Clock"] = "Dịch Chuyển Đến Đồng Hồ Cổ",
["Tween to Race Doors"] = "Bay Đến Cửa Tộc", ["Auto Complete Trial"] = "Tự Động Hoàn Thành Thử Thách",
["Auto Kill Player Trial"] = "Tự Động Giết Người Chơi Thử Thách",
["Dojo"] = "Đạo Trường", ["Auto Dojo Trainer"] = "Huấn Luyện Viên Đạo Trường Tự Động",
["Auto Dragon Hunter"] = "Thợ Săn Rồng Tự Động", ["Draco Race"] = "Tộc Rồng",
["Tween To Upgrade Draco Trial"] = "Bay Đến Nâng Cấp Thử Thách Rồng",
["Auto Draco V1"] = "Rồng V1 Tự Động", ["Auto Draco V2"] = "Rồng V2 Tự Động",
["Auto Draco V3"] = "Rồng V3 Tự Động", ["Auto Trial Draco"] = "Thử Thách Rồng Tự Động",
["Auto Train Draco"] = "Tự Động Huấn Luyện Rồng", ["Tween to Draco Trial"] = "Bay Đến Thử Thách Rồng",
["Change To Draco Race"] = "Đổi Sang Tộc Rồng", ["Upgrade Dragon Talon"] = "Nâng Cấp Móng Vuốt Rồng",
["Prehistoric Island"] = "Đảo Tiền Sử", ["Craft Volcanic Magnet"] = "Chế Tạo Nam Châm Núi Lửa",
[" Prehistoric "] = " Tiền Sử ", ["Find Prehistoric"] = "Tìm Đảo Tiền Sử",
["Attack Lava"] = "Tấn Công Dung Nham", ["Collect Dragon Eggs"] = "Thu Thập Trứng Rồng",
["Collect Dino Bones"] = "Thu Thập Xương Khủng Long",
["Auto Reset When Complete Volcano"] = "Tự Động Reset Khi Hoàn Thành Núi Lửa",
["Kitsune Event"] = "Sự Kiện Kitsune", [" Kitsune Island "] = " Đảo Kitsune ",
["Auto Find Kitsune Island"] = "Tự Động Tìm Đảo Kitsune",
["Auto Teleport to Shrine Actived"] = "Tự Động Dịch Chuyển Đến Đền Thờ Đã Kích Hoạt",
["Auto Trade Azure Ember"] = "Tự Động Trao Đổi Thanh Hồng Ngọc",
["Auto Collect Azure Ember"] = "Tự Động Thu Thập Thanh Hồng Ngọc",
["Trade Items Azure"] = "Trao Đổi Vật Phẩm Azure", ["Talk with Kitsune statue"] = "Nói chuyện với tượng Kitsune",
["Sea Event"] = "Sự Kiện Biển", [" Spy"] = " Gián Điệp",
["Buy Levi Spy"] = "Mua Gián Điệp Leviathan", [" Flozen Dimension "] = " Chiều Không Gian Băng Giá ",
["Tween To Frozen Dimension"] = "Bay Đến Chiều Không Gian Băng Giá", ["Drive To Hydra"] = "Lái Thuyền Đến Hydra",
["Choose Boats"] = "Chọn Thuyền", ["Guardian"] = "Người Bảo Vệ",
["PirateGrandBrigade"] = "Lữ Đoàn Hải Tặc Lớn", ["MarineGrandBrigade"] = "Lữ Đoàn Hải Quân Lớn",
["PirateBrigade"] = "Lữ Đoàn Hải Tặc", ["MarineBrigade"] = "Lữ Đoàn Hải Quân",
["PirateSloop"] = "Thuyền Buồm Hải Tặc", ["MarineSloop"] = "Thuyền Buồm Hải Quân",
["Beast Hunter"] = "Thợ Săn Quái Thú", ["Lv 1"] = "Cấp 1", ["Lv 2"] = "Cấp 2",
["Lv 3"] = "Cấp 3", ["Lv 4"] = "Cấp 4", ["Lv 5"] = "Cấp 5", ["Lv 6"] = "Cấp 6",
["Lv Infinite"] = "Cấp Vô Hạn", ["Choose Sea Level"] = "Chọn Cấp Độ Biển",
["Auto Sail Boat"] = "Tự Động Lái Thuyền", ["Setup Sea Event"] = "Thiết Lập Sự Kiện Biển",
["Auto Attack Sea Beast"] = "Tự Động Tấn Công Quái Biển", ["Auto Shark"] = "Cá Mập Tự Động",
["Auto Piranha"] = "Cá Hồng Tự Động", ["Auto Terror Shark"] = "Cá Mập Kinh Hoàng Tự Động",
["Auto Fish Crew Member"] = "Thành Viên Thủy Thủ Cá Tự Động",
["Auto Haunted Crew Member"] = "Thành Viên Thủy Thủ Ma Tự Động",
["Auto Attack PirateGrandBrigade"] = "Tự Động Tấn Công Lữ Đoàn Hải Tặc Lớn",
["Auto Attack Fish Boat"] = "Tự Động Tấn Công Thuyền Cá", ["Auto Attack Leviathan"] = "Tự Động Tấn Công Leviathan",
["Raiding"] = "Tập Kích", ["Select Chip"] = "Chọn Chip", ["Flame"] = "Lửa",
["Ice"] = "Băng", ["Quake"] = "Địa Chấn", ["Light"] = "Ánh Sáng", ["Dark"] = "Bóng Tối",
["String"] = "Sợi", ["Magma"] = "Dung Nham", ["Human: Buddha"] = "Người: Phật",
["Sand"] = "Cát", ["Bird: Phoenix"] = "Chim: Phượng Hoàng", ["Dough"] = "Bột",
["Buy Chips Beli"] = "Mua Chip Bằng Beli", ["Buy Chips Blox Fruit"] = "Mua Chip Bằng Trái Blox",
["Get Fruit In Inventory Low Beli"] = "Lấy Trái Trong Kho Đồ Với Beli Thấp",
["Auto Start Raid"] = "Tự Động Bắt Đầu Tập Kích", ["Teleport To Lab"] = "Dịch Chuyển Đến Phòng Thí Nghiệm",
["Auto Farm Raid"] = "Tự Động Cày Tập Kích", ["Auto Awakening"] = "Thức Tỉnh Tự Động",
["Teleport to player"] = "Dịch Chuyển Đến Người Chơi", ["Esp Items"] = "Định Vị Vật Phẩm",
["ESP Box Size"] = "Kích Thước Hộp Định Vị", ["ESP Font"] = "Phông Chữ Định Vị",
["GothamBold"] = "GothamBold", ["GothamBlack"] = "GothamBlack", ["Code"] = "Code",
["SourceSansBold"] = "SourceSansBold", ["ESP Font Size"] = "Kích Cỡ Phông Chữ Định Vị",
["Esp Fruits"] = "Định Vị Trái", ["Esp Players"] = "Định Vị Người Chơi",
["Esp Island"] = "Định Vị Đảo", ["Esp Chests"] = "Định Vị Rương",
["Esp Berries"] = "Định Vị Quả Mọng", ["Esp Flower"] = "Định Vị Hoa",
["Esp Legendary Sword Dealers"] = "Định Vị Đại Lý Kiếm Huyền Thoại",
["Esp Aura Colour Dealers"] = "Định Vị Đại Lý Màu Hào Quang",
["Esp Gear"] = "Định Vị Trang Bị", ["Esp Event Island"] = "Định Vị Đảo Sự Kiện",
["Esp Advanced Fruits Dealer"] = "Định Vị Đại Lý Trái Nâng Cao",
["World"] = "Thế Giới", ["Travel First Sea"] = "Di Chuyển Đến Biển Một",
["Travel Second Sea"] = "Di Chuyển Đến Biển Hai", ["Travel Third Sea"] = "Di Chuyển Đến Biển Ba",
["Island"] = "Đảo", ["WindMill"] = "Cối Xay Gió", ["Marine"] = "Hải Quân",
["Middle Town"] = "Thị Trấn Giữa", ["Jungle"] = "Rừng Rậm", ["Pirate Village"] = "Làng Hải Tặc",
["Desert"] = "Sa Mạc", ["Snow Island"] = "Đảo Tuyết", ["MarineFord"] = "MarineFord",
["Colosseum"] = "Đấu Trường", ["Sky Island 1"] = "Đảo Trời 1", ["Sky Island 2"] = "Đảo Trời 2",
["Sky Island 3"] = "Đảo Trời 3", ["Prison"] = "Nhà Tù", ["Magma Village"] = "Làng Dung Nham",
["Under Water Island"] = "Đảo Dưới Nước", ["Fountain City"] = "Thành Phố Suối Nước",
["Shank Room"] = "Phòng Shank", ["Mob Island"] = "Đảo Quái",
["The Cafe"] = "Quán Cà Phê", ["Frist Spot"] = "Điểm Đầu Tiên", ["Dark Area"] = "Khu Vực Tối",
["Flamingo Mansion"] = "Biệt Thự Hồng Hạc", ["Flamingo Room"] = "Phòng Hồng Hạc",
["Green Zone"] = "Khu Xanh", ["Factory"] = "Nhà Máy", ["Colossuim"] = "Đấu Trường",
["Zombie Island"] = "Đảo Zombie", ["Two Snow Mountain"] = "Hai Núi Tuyết",
["Punk Hazard"] = "Punk Hazard", ["Cursed Ship"] = "Tàu Bị Nguyền", ["Ice Castle"] = "Lâu Đài Băng",
["Forgotten Island"] = "Đảo Bị Lãng Quên", ["Ussop Island"] = "Đảo Ussop",
["Mini Sky Island"] = "Đảo Trời Nhỏ", ["Mansion"] = "Biệt Thự", ["Port Town"] = "Thị Trấn Cảng",
["Great Tree"] = "Cây Lớn", ["Castle On The Sea"] = "Lâu Đài Trên Biển", ["MiniSky"] = "Trời Nhỏ",
["Hydra Island"] = "Đảo Hydra", ["Floating Turtle"] = "Rùa Bay", ["Haunted Castle"] = "Lâu Đài Ma Ám",
["Ice Cream Island"] = "Đảo Kem", ["Peanut Island"] = "Đảo Đậu Phộng", ["Cake Island"] = "Đảo Bánh",
["Cocoa Island"] = "Đảo Ca Cao", ["Candy Island"] = "Đảo Kẹo", ["Tiki Outpost"] = "Tiền Đồn Tiki",
["Submerged Island"] = "Đảo Chìm", ["Select Island"] = "Chọn Đảo", ["Auto Travel"] = "Di Chuyển Tự Động",
["Bypass Travel"] = "Vượt Qua Di Chuyển", ["Select NPC"] = "Chọn NPC",
["Auto Tween To NPC"] = "Tự Động Bay Đến NPC", ["Blox Fruits"] = "Trái Blox",
["Mirage Stock"] = "Kho Hàng Đảo Bí Ẩn", ["Select Fruit"] = "Chọn Trái",
["Buy Fruit"] = "Mua Trái", ["Misc"] = "Linh Tinh", ["Auto Random Fruit"] = "Trái Ngẫu Nhiên Tự Động",
["Auto Store Fruit"] = "Tự Động Lưu Trữ Trái", ["Auto Tween to Fruit"] = "Tự Động Bay Đến Trái",
["Auto Teleport Fruit"] = "Tự Động Dịch Chuyển Đến Trái", ["Auto Drop Fruit"] = "Tự Động Vứt Trái",
["Ability"] = "Kỹ Năng", ["Buy Buso"] = "Mua Buso", ["Buy Geppo"] = "Mua Geppo",
["Buy Soru"] = "Mua Soru", ["Buy Ken"] = "Mua Ken", ["Fighting Style"] = "Phong Cách Chiến Đấu",
["Buy Black Leg"] = "Mua Chân Đen", ["Buy Electro"] = "Mua Điện", ["Buy Fishman Karate"] = "Mua Karate Người Cá",
["Buy Dragon Claw"] = "Mua Móng Vuốt Rồng", ["Buy Superhuman"] = "Mua Siêu Nhân",
["Buy Death Step"] = "Mua Tử Thần", ["Buy Sharkman Karate"] = "Mua Karate Người Cá Mập",
["Buy Electric Claw"] = "Mua Móng Vuốt Điện", ["Buy Dragon Talon"] = "Mua Móng Vuốt Rồng",
["Buy Godhuman"] = "Mua Thần Nhân", ["Buy Sanguine Art"] = "Mua Nghệ Thuật Huyết",
["Sword"] = "Kiếm", ["Buy Cutlass"] = "Mua Đoản Kiếm", ["Buy Katana"] = "Mua Katana",
["Buy Iron Mace"] = "Mua Chùy Sắt", ["Buy Duel Katana"] = "Mua Song Kiếm",
["Buy Triple Katana"] = "Mua Tam Kiếm", ["Buy Pipe"] = "Mua Ống", ["Buy Dual-Headed Blade"] = "Mua Lưỡi Đầu Đôi",
["Buy Bisento"] = "Mua Bisento", ["Buy Soul Cane"] = "Mua Gậy Linh Hồn",
["Gun"] = "Súng", ["Buy Slingshot"] = "Mua Súng Cao Su", ["Buy Musket"] = "Mua Súng Hỏa Mai",
["Buy Dual Flintlock"] = "Mua Súng Lục Đôi", ["Buy Flintlock"] = "Mua Súng Lục",
["Buy Refined Flintlock"] = "Mua Súng Lục Tinh Luyện", ["Buy Cannon"] = "Mua Đại Bác",
["Buy Kabucha"] = "Mua Kabucha", ["Accessory"] = "Phụ Kiện", ["Buy Tomoe Ring"] = "Mua Nhẫn Tomoe",
["Buy Black Cape"] = "Mua Áo Choàng Đen", ["Buy Swordsman Hat"] = "Mua Nón Kiếm Sĩ",
["Ectoplasm"] = "Vật Chất Kì Dị", ["Buy Bizarre Rifle"] = "Mua Súng Trường Kỳ Quái",
["Buy Ghoul Mask"] = "Mua Mặt Nạ Ghoul", ["Fragments"] = "Mảnh",
["Buy Refund Stats"] = "Mua Hoàn Trả Chỉ Số", ["Buy Reroll Race"] = "Mua Xoay Vòng Tộc",
["Race"] = "Tộc", ["Change Ghoul Race"] = "Đổi Tộc Ghoul", ["Buy Cyborg Race"] = "Mua Tộc Người Máy",
["Craft Items"] = "Chế Tạo Vật Phẩm", ["Craft Dragon Heart"] = "Chế Tạo Tim Rồng",
["Craft Dragon Storm"] = "Chế Tạo Bão Rồng", ["Craft Dino Hood"] = "Chế Tạo Mũ Trùm Khủng Long",
["Craft Shark Tooth"] = "Chế Tạo Răng Cá Mập", ["Craft Terror Jaw"] = "Chế Tạo Hàm Kinh Hoàng",
["Craft Shark Anchor"] = "Chế Tạo Mỏ Neo Cá Mập", ["Craft Leviathan Crown"] = "Chế Tạo Vương Miện Leviathan",
["Craft Leviathan Shield"] = "Chế Tạo Khiên Leviathan", ["Craft Leviathan Boat"] = "Chế Tạo Thuyền Leviathan",
["Craft Legendary Scroll"] = "Chế Tạo Cuộn Giấy Huyền Thoại",
["Craft Mythical Scroll"] = "Chế Tạo Cuộn Giấy Thần Thoại", ["Server"] = "Máy Chủ",
["Input Job ID"] = "Nhập ID Công Việc", ["Job ID"] = "ID Công Việc",
["Spam Join"] = "Tham Gia Spam", ["Join Server"] = "Tham Gia Máy Chủ",
["Copy Job ID"] = "Sao Chép ID Công Việc", ["Rejoin Server"] = "Tham Gia Lại Máy Chủ",
["Hop Server"] = "Chuyển Máy Chủ", ["Hop Server Low Players"] = "Chuyển Máy Chủ Ít Người Chơi",
["Hide Chat"] = "Ẩn Chat", ["Hide Leader Board"] = "Ẩn Bảng Xếp Hạng",
["Unlock All Portals"] = "Mở Khóa Tất Cả Cổng", ["Anti Ban"] = "Chống Cấm",
["Hop if admin join"] = "Đổi SV nếu admin vào", ["Auto Hop (30 min)"] = "Tự Động Đổi SV (30 phút)",
["Auto Rejoin If Kick"] = "Tự Động Vào Lại Nếu Bị Kick", ["Font"] = "Phông Chữ",
["Change Font Text"] = "Thay Đổi Phông Chữ Văn Bản", ["SELECT FONT"] = "CHỌN PHÔNG CHỮ",
["Hinishi Hub"] = "Hinishi Hub", ["Hinishi Hub - Hop Server"] = "Hinishi Hub - Chuyển Máy Chủ",
["Admin Join - Hopping..."] = "Admin Vào - Đang Chuyển...", ["30 min - Hopping..."] = "30 phút - Đang Chuyển..."
}

loadstring(game:HttpGet("https://pastefy.app/aVY0kOtw/raw"))()
repeat
	task.wait()
until game:IsLoaded()
and plr:FindFirstChild("PlayerGui")
and plr.PlayerGui:FindFirstChild("Main")
and plr.PlayerGui.Main:FindFirstChild("Loading")

World1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089
WorldD = game.PlaceId == 73902483975735 or game.PlaceId == 73902483975735
if not (World1 or World2 or World3 or WorldD) then
	warn("Hey bro, I think you're playing the wrong game..!")
end
Marines = function() replicated.Remotes.CommF_:InvokeServer("SetTeam","Marines") end
Pirates = function() replicated.Remotes.CommF_:InvokeServer("SetTeam","Pirates") end
if World1 then Boss = {"The Gorilla King","Bobby","The Saw","Yeti","Mob Leader","Vice Admiral","Saber Expert","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Ice Admiral","Greybeard"}
elseif World2 then Boss = {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Awakened Ice Admiral","Tide Keeper","Darkbeard","Cursed Captain","Order"}
elseif World3 then Boss = {"Tyrant of the Skies","Stone","Hydra Leader","Kilo Admiral","Captain Elephant","Beautiful Pirate","Cake Queen","Longma","Soul Reaper"}
end
if World1 then MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail"}
elseif World2 then MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang"}
elseif World3 then MaterialList = {"Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk"}
end
local DungeonTables = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}
local RenMon = {"Snow Lurker","Arctic Warrior","Hidden Key","Awakened Ice Admiral"}
local CursedTables = {["Mob"] = "Mythological Pirate",["Mob2"] = "Cursed Skeleton","Hell's Messenger",["Mob3"] = "Cursed Skeleton","Heaven's Guardian"}
local Past = {"Part","SpawnLocation","Terrain","WedgePart","MeshPart"}
local BartMon = {"Swan Pirate","Jeremy"}
local CitizenTable = {"Forest Pirate","Captain Elephant"}
local Human_v3_Mob = {"Fajita","Jeremy","Diamond"}
local AllBoats = {"Beast Hunter","Lantern","Guardian","Grand Brigade","Dinghy","Sloop","The Sentinel"}
local mastery1 = {"Cookie Crafter"}
local mastery2 = {"Reborn Skeleton"}
local PosMsList = {["Pirate Millionaire"] = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625),["Pistol Billionaire"] = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625),["Dragon Crew Warrior"] = CFrame.new(7021.50439453125, 55.76270294189453, -730.1290893554688),["Dragon Crew Archer"] = CFrame.new(6625, 378, 244),["Female Islander"] = CFrame.new(4692.7939453125, 797.9766845703125, 858.8480224609375),["Venomous Assailant"] = CFrame.new(4902, 670, 39), ["Marine Commodore"] = CFrame.new(2401, 123, -7589),["Marine Rear Admiral"] = CFrame.new(3588, 229, -7085),["Fishman Raider"] = CFrame.new(-10941, 332, -8760),["Fishman Captain"] = CFrame.new(-11035, 332, -9087),["Forest Pirate"] = CFrame.new(-13446, 413, -7760),["Mythological Pirate"] = CFrame.new(-13510, 584, -6987),["Jungle Pirate"] = CFrame.new(-11778, 426, -10592),["Musketeer Pirate"] = CFrame.new(-13282, 496, -9565),["Reborn Skeleton"] = CFrame.new(-8764, 142, 5963),["Living Zombie"] = CFrame.new(-10227, 421, 6161),["Demonic Soul"] = CFrame.new(-9579, 6, 6194),["Posessed Mummy"] = CFrame.new(-9579, 6, 6194),["Peanut Scout"] = CFrame.new(-1993, 187, -10103),["Peanut President"] = CFrame.new(-2215, 159, -10474),["Ice Cream Chef"] = CFrame.new(-877, 118, -11032),["Ice Cream Commander"] = CFrame.new(-877, 118, -11032),["Cookie Crafter"] = CFrame.new(-2021, 38, -12028),["Cake Guard"] = CFrame.new(-2024, 38, -12026),["Baking Staff"] = CFrame.new(-1932, 38, -12848),["Head Baker"] = CFrame.new(-1932, 38, -12848),["Cocoa Warrior"] = CFrame.new(95, 73, -12309),["Chocolate Bar Battler"] = CFrame.new(647, 42, -12401),["Sweet Thief"] = CFrame.new(116, 36, -12478),["Candy Rebel"] = CFrame.new(47, 61, -12889),["Ghost"] = CFrame.new(5251, 5, 1111)}
EquipWeapon = function(text)
if not text then return end
if plr.Backpack:FindFirstChild(text) then
	plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(text))
end
end
weaponSc = function(weapon)
for __in, v in pairs(plr.Backpack:GetChildren()) do
if v:IsA("Tool") then
if v.ToolTip == weapon then EquipWeapon(v.Name) end
end
end
end
loadstring(game:HttpGet("https://pastefy.app/0pqieNkk/raw"))()
local Attack = {}
Attack.__index = Attack
Attack.Alive = function(model) if not model then return end local Humanoid = model:FindFirstChild("Humanoid") return Humanoid and Humanoid.Health > 0 end
Attack.Pos = function(model, dist)
if not model or not model:FindFirstChild("HumanoidRootPart") then return false end
dist = dist or _G.FarmDistance
return (Root.Position - model.HumanoidRootPart.Position).Magnitude <= dist
end

Attack.Dist = function(model, dist)
if not model or not model:FindFirstChild("HumanoidRootPart") then return false end
dist = dist or _G.FarmDistance
return (Root.Position - model.HumanoidRootPart.Position).Magnitude <= dist
end

Attack.DistH = function(model, dist)
if not model or not model:FindFirstChild("HumanoidRootPart") then return false end
dist = dist or _G.FarmDistance
return (Root.Position - model.HumanoidRootPart.Position).Magnitude > dist
end

Attack.Dist = function(model,dist) return (Root.Position - model:FindFirstChild("HumanoidRootPart").Position).Magnitude <= dist end
Attack.DistH = function(model,dist) return (Root.Position - model:FindFirstChild("HumanoidRootPart").Position).Magnitude > dist end

Kill = function(model,Succes)
if model and Succes then
if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
PosMon = model:GetAttribute("Locked").Position
BringEnemy()
EquipWeapon(_G.SelectWeapon)
local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
local ToolTip = Equipped.ToolTip
local d = _G.FarmDistance
if ToolTip == "Blox Fruit" then
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d,0) * CFrame.Angles(0,math.rad(90),0))
else
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d+10,0) * CFrame.Angles(0,math.rad(180),0))
end
if RandomCFrame then
local r = d/2
task.wait(0.03)tween(model.HumanoidRootPart.CFrame * CFrame.new(0,r,r))
task.wait(0.03)tween(model.HumanoidRootPart.CFrame * CFrame.new(r,r,0))
task.wait(0.03)tween(model.HumanoidRootPart.CFrame * CFrame.new(-r,r,0))
end
end
end

Kill2 = function(model,Succes)
if model and Succes then
if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
PosMon = model:GetAttribute("Locked").Position
BringEnemy()
EquipWeapon(_G.SelectWeapon)
local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
local ToolTip = Equipped.ToolTip
local d = _G.FarmDistance
if ToolTip == "Blox Fruit" then
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d,0) * CFrame.Angles(0,math.rad(90),0))
else
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d,d/3) * CFrame.Angles(0,math.rad(180),0))
end
if RandomCFrame then
local r = d/2
task.wait(0.02)tween(model.HumanoidRootPart.CFrame * CFrame.new(0,r,r))
task.wait(0.02)tween(model.HumanoidRootPart.CFrame * CFrame.new(r,r,0))
task.wait(0.02)tween(model.HumanoidRootPart.CFrame * CFrame.new(-r,r,0))
end
end
end

KillSea = function(model,Succes)
if model and Succes then
if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
PosMon = model:GetAttribute("Locked").Position
BringEnemy()
EquipWeapon(_G.SelectWeapon)
local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
local ToolTip = Equipped.ToolTip
local d = _G.FarmDistance
if ToolTip == "Blox Fruit" then
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d,0) * CFrame.Angles(0,math.rad(90),0))
else
notween(model.HumanoidRootPart.CFrame * CFrame.new(0,d,d/3))
task.wait(0.05)
notween(model.HumanoidRootPart.CFrame * CFrame.new(0,d*2,0))
task.wait(0.08)
end
end
end

Attack.Sword = function(model,Succes)
if model and Succes then
if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
PosMon = model:GetAttribute("Locked").Position
BringEnemy()
weaponSc("Sword")
local d = _G.FarmDistance
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d,0))
if RandomCFrame then
local r = d/2
task.wait(0.02)tween(model.HumanoidRootPart.CFrame * CFrame.new(0,r,r))
task.wait(0.02)tween(model.HumanoidRootPart.CFrame * CFrame.new(r,r,0))
task.wait(0.02)tween(model.HumanoidRootPart.CFrame * CFrame.new(-r,r,0))
end
end
end

Attack.Mas = function(model,Succes)
if model and Succes then
if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
PosMon = model:GetAttribute("Locked").Position
BringEnemy()
local d = _G.FarmDistance
if model.Humanoid.Health <= HealthM then
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d,0))
if _G.Z then Useskills("Blox Fruit","Z") end
if _G.X then Useskills("Blox Fruit","X") end
if _G.C then Useskills("Blox Fruit","C") end
if _G.V then Useskills("Blox Fruit","V") end
if _G.F then Useskills("Blox Fruit","F") end
else
weaponSc("Melee")
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d,0))
end
end
end

Attack.Masgun = function(model,Succes)
if model and Succes then
if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
PosMon = model:GetAttribute("Locked").Position
BringEnemy()
local d = _G.FarmDistance
if model.Humanoid.Health <= HealthM then
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d+5,d/3))
if _G.Z then Useskills("Gun","Z") end
if _G.X then Useskills("Gun","X") end
else
weaponSc("Melee")
tween(model.HumanoidRootPart.CFrame * CFrame.new(0,d,0))
end
end
end


statsSetings = function(Num, value)
if Num == "Melee" then
if plr.Data.Points.Value ~= 0 then
replicated.Remotes.CommF_:InvokeServer("AddPoint","Melee",value)
end
elseif Num == "Defense" then
if plr.Data.Points.Value ~= 0 then
replicated.Remotes.CommF_:InvokeServer("AddPoint","Defense",value)
end
elseif Num == "Sword" then
if plr.Data.Points.Value ~= 0 then
replicated.Remotes.CommF_:InvokeServer("AddPoint","Sword",value)
end
elseif Num == "Gun" then
if plr.Data.Points.Value ~= 0 then
replicated.Remotes.CommF_:InvokeServer("AddPoint","Gun",value)
end
elseif Num == "Devil" then
if plr.Data.Points.Value ~= 0 then
replicated.Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",value)
end
end
end

Useskills = function(weapon, skill)
if skill == "Z" and not _G.Z then return end
if skill == "X" and not _G.X then return end
if skill == "C" and not _G.C then return end
if skill == "V" and not _G.V then return end
if skill == "F" and not _G.F then return end
if weapon == "Melee" then
weaponSc("Melee")
if skill == "Z" then
vim1:SendKeyEvent(true,"Z",false,game)
vim1:SendKeyEvent(false,"Z",false,game)
elseif skill == "X" then
vim1:SendKeyEvent(true,"X",false,game)
vim1:SendKeyEvent(false,"X",false,game)
elseif skill == "C" then
vim1:SendKeyEvent(true,"C",false,game)
vim1:SendKeyEvent(false,"C",false,game)
end
elseif weapon == "Sword" then
weaponSc("Sword")
if skill == "Z" then
vim1:SendKeyEvent(true,"Z",false,game)
vim1:SendKeyEvent(false,"Z",false,game)
elseif skill == "X" then
vim1:SendKeyEvent(true,"X",false,game)
vim1:SendKeyEvent(false,"X",false,game)
end
elseif weapon == "Blox Fruit" then
weaponSc("Blox Fruit")
if skill == "Z" then
vim1:SendKeyEvent(true,"Z",false,game)
vim1:SendKeyEvent(false,"Z",false,game)
elseif skill == "X" then
vim1:SendKeyEvent(true,"X",false,game)
vim1:SendKeyEvent(false,"X",false,game)
elseif skill == "C" then
vim1:SendKeyEvent(true,"C",false,game)
vim1:SendKeyEvent(false,"C",false,game)
elseif skill == "V" then
vim1:SendKeyEvent(true,"V",false,game)
vim1:SendKeyEvent(false,"V",false,game)
elseif skill == "F" then
vim1:SendKeyEvent(true,"F",false,game)
vim1:SendKeyEvent(false,"F",false,game)
end
elseif weapon == "Gun" then
weaponSc("Gun")
if skill == "Z" then
vim1:SendKeyEvent(true,"Z",false,game)
vim1:SendKeyEvent(false,"Z",false,game)
elseif skill == "X" then
vim1:SendKeyEvent(true,"X",false,game)
vim1:SendKeyEvent(false,"X",false,game)
end
end
if weapon == "nil" and skill == "Y" then
vim1:SendKeyEvent(true,"Y",false,game)
vim1:SendKeyEvent(false,"Y",false,game)
end
end
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall = newcclosure(function(...)
local method = getnamecallmethod()
local args = {...}
if tostring(method) == "FireServer" then
if tostring(args[1]) == "RemoteEvent" then
if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
if (_G.FarmMastery_G and not SoulGuitar) or (_G.FarmMastery_Dev) or (_G.FarmBlazeEM) or (_G.Prehis_Skills) or (_G.SeaBeast1 or _G.FishBoat or _G.PGB or _G.Leviathan1 or _G.Complete_Trials) or (_G.AimMethod and ABmethod == "AimBots Skill") or (_G.AimMethod and ABmethod == "Auto Aimbots") then
args[2] = MousePos
return old(unpack(args))
end
end
end
end
return old(...)
end)
GetConnectionEnemies = function(a)
for i,v in pairs(replicated:GetChildren()) do
if v:IsA("Model") and((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
return v
end
end
for i,v in next,game.Workspace.Enemies:GetChildren() do
if v:IsA("Model") and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a)and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
return v
end
end
end
LowCpu = function()
local decalsyeeted = true
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
v.Material = "Plastic"
v.Reflectance = 0
elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
v.Transparency = 1
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
v.Lifetime = NumberRange.new(0)
elseif v:IsA("Explosion") then
v.BlastPressure = 1
v.BlastRadius = 1
elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
v.Enabled = false
elseif v:IsA("MeshPart") then
v.Material = "Plastic"
v.Reflectance = 0
v.TextureID = 10385902758728957
end
end
for i, e in pairs(l:GetChildren()) do
if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
e.Enabled = false
end
end
end
CheckF = function()
if GetBP("Dragon-Dragon") or GetBP("Gas-Gas") or GetBP("Yeti-Yeti") or GetBP("Kitsune-Kitsune") or GetBP("T-Rex-T-Rex") then return true end
end
CheckBoat = function()
for i, v in pairs(workspace.Boats:GetChildren()) do
if tostring(v.Owner.Value) == tostring(plr.Name) then
return v
end;
end;
return false
end;
CheckEnemiesBoat = function()
for _,v in pairs(workspace.Enemies:GetChildren()) do
if (v.Name == "FishBoat") and v:FindFirstChild("Health").Value > 0 then
return true
end;
end;
return false
end;
CheckPirateGrandBrigade = function()
for _,v in pairs(workspace.Enemies:GetChildren()) do
if (v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade") and v:FindFirstChild("Health").Value > 0 then
return true
end
end
return false
end
CheckShark = function()
for _,v in pairs(workspace.Enemies:GetChildren()) do
if v.Name == "Shark" and Attack.Alive(v) then
return true
end;
end;
return false
end;
CheckTerrorShark = function()
for _,v in pairs(workspace.Enemies:GetChildren()) do
if v.Name == "Terrorshark" and Attack.Alive(v) then
return true
end;
end;
return false
end;
CheckPiranha = function()
for _,v in pairs(workspace.Enemies:GetChildren()) do
if v.Name == "Piranha" and Attack.Alive(v) then
return true
end;
end;
return false
end;
CheckFishCrew = function()
for _,v in pairs(workspace.Enemies:GetChildren()) do
if (v.Name == "Fish Crew Member" or v.Name == "Haunted Crew Member") and Attack.Alive(v) then
return true
end;
end;
return false
end;
CheckHauntedCrew = function()
for _,v in pairs(workspace.Enemies:GetChildren()) do
if (v.Name == "Haunted Crew Member") and Attack.Alive(v) then
return true
end;
end;
return false
end;
CheckSeaBeast = function()
if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
return true
end;
return false
end;
CheckLeviathan = function()
if workspace.SeaBeasts:FindFirstChild("Leviathan") then
return true
end;
return false
end;
UpdStFruit = function()
for z,x in next, plr.Backpack:GetChildren() do
StoreFruit = x:FindFirstChild("EatRemote", true)
if StoreFruit then
replicated.Remotes.CommF_:InvokeServer("StoreFruit",StoreFruit.Parent:GetAttribute("OriginalName"),
plr.Backpack:FindFirstChild(x.Name))
end
end
end
collectFruits = function(Succes)
if Succes then
local Character = plr.Character
for _,v1 in pairs(workspace:GetChildren()) do
if string.find(v1.Name, "Fruit") then v1.Handle.CFrame = Character.HumanoidRootPart.CFrame end
end
end
end
Getmoon = function()
if World1 then
return Lighting.FantasySky.MoonTextureId
elseif World2 then
return Lighting.FantasySky.MoonTextureId
elseif World3 then
return Lighting.Sky.MoonTextureId
end
end
DropFruits = function()
for _,v3 in next, plr.Backpack:GetChildren() do
if string.find(v3.Name, "Fruit") then
EquipWeapon(v3.Name) wait(.1)
if plr.PlayerGui.Main.Dialogue.Visible == true then plr.PlayerGui.Main.Dialogue.Visible = false end EquipWeapon(v3.Name) plr.Character:FindFirstChild(v3.Name).EatRemote:InvokeServer("Drop")
end
end
for a,b2 in pairs(plr.Character:GetChildren()) do
if string.find(b2.Name, "Fruit") then EquipWeapon(b2.Name) wait(.1)
if plr.PlayerGui.Main.Dialogue.Visible == true then plr.PlayerGui.Main.Dialogue.Visible = false end EquipWeapon(b2.Name) plr.Character:FindFirstChild(b2.Name).EatRemote:InvokeServer("Drop")
end
end
end
GetBP = function(v)
return plr.Backpack:FindFirstChild(v) or plr.Character:FindFirstChild(v)
end
GetIn = function(Name)
for _ ,v1 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
if type(v1) == "table" then
if v1.Name == Name or plr.Character:FindFirstChild(Name) or plr.Backpack:FindFirstChild(Name) then
return true
	 end
end
end
return false
end
GetM = function(Name)
for _,tab in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
if type(tab) == "table" then
	if tab.Type == "Material" then
	if tab.Name == Name then
		return tab.Count
	end
	end
end
end
return 0
end
GetWP = function(nametool)
for _,v4 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
if type(v4) == "table" then
if v4.Type == "Sword" then
if v4.Name == nametool or plr.Character:FindFirstChild(nametool) or plr.Backpack:FindFirstChild(nametool) then
	 return true
	 end
	 end
end
end
return false
end 
getInfinity_Ability = function(Method, Var)
if not Root then return end
if Method == "Soru" and Var then
for _,gc in next, getgc() do
if plr.Character.Soru then
if ((typeof(gc) == "function") and (getfenv(gc).script == plr.Character.Soru)) then
for _, v in next, getupvalues(gc) do
if (typeof(v) == "table") then
repeat wait(Sec) v.LastUse = 0 until not Var or (plr.Character.Humanoid.Health <= 0)
end
end
end
end
end
elseif Method == "Energy" and Var then
plr.Character.Energy.Changed:connect(function()
if Var then plr.Character.Energy.Value = Energy end 
end)
elseif Method == "Observation" and Var then
local VisionRadius = plr.VisionRadius
VisionRadius.Value = math.huge
end
end
Hop = function()
pcall(function()
for count = math.random(1, math.random(40, 75)), 100 do
local remote = replicated.__ServerBrowser:InvokeServer(count)
	for _, v in next, remote do
	if tonumber(v['Count']) < 12 then TeleportService:TeleportToPlaceInstance(game.PlaceId, _) end
	end
end
end)
end
local UIS = game:GetService("UserInputService")

local TweenToggle = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Button = Instance.new("TextButton")

TweenToggle.Parent = game.CoreGui
TweenToggle.ResetOnSpawn = false
TweenToggle.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Parent = TweenToggle
Main.Size = UDim2.new(0, 108, 0, 28)
Main.Position = UDim2.new(0.5, -54, 0, 10)
Main.BackgroundColor3 = Color3.fromRGB(115, 145, 255)
Main.BorderSizePixel = 0
Main.Active = true
Main.ZIndex = 10

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(185, 210, 255)
Stroke.Thickness = 1.2

Button.Parent = Main
Button.Size = UDim2.new(1, -6, 1, -6)
Button.Position = UDim2.new(0, 3, 0, 3)
Button.Text = "STOP TWEEN"
Button.Font = Enum.Font.GothamSemibold
Button.TextSize = 12
Button.TextColor3 = Color3.fromRGB(255,255,255)
Button.BackgroundColor3 = Color3.fromRGB(90, 120, 235)
Button.BorderSizePixel = 0
Button.AutoButtonColor = false
Button.ZIndex = 11

Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 12)

getgenv().TweenPaused = false

Button.MouseButton1Click:Connect(function()
getgenv().TweenPaused = not getgenv().TweenPaused
if getgenv().TweenPaused then
Button.Text = "START TWEEN"
Button.BackgroundColor3 = Color3.fromRGB(90,120,235)
Stroke.Color = Color3.fromRGB(145,170,255)
if getgenv().currentTween then
getgenv().currentTween:Cancel()
getgenv().currentTween = nil
end
DisableNoclip()
else
Button.Text = "STOP TWEEN"
Button.BackgroundColor3 = Color3.fromRGB(120,160,255)
Stroke.Color = Color3.fromRGB(185,210,255)
end
end)

local dragging = false
local dragStart, startPos

local function update(input)
local delta = input.Position - dragStart
Main.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end

Button.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = Main.Position
end
end)

Button.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then
dragging = false
end
end)

UIS.InputChanged:Connect(function(input)
if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
or input.UserInputType == Enum.UserInputType.Touch) then
update(input)
end
end)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local plr = Players.LocalPlayer
getgenv().currentTween = nil
local shouldTween = false

local function EnableNoclip()
local char = plr.Character
if not char then return end
local hrp = char:FindFirstChild("HumanoidRootPart")
local hum = char:FindFirstChildOfClass("Humanoid")
if not hrp or not hum then return end
if not hrp:FindFirstChild("BodyClip") then
local bv = Instance.new("BodyVelocity")
bv.Name = "BodyClip"
bv.MaxForce = Vector3.new(1e9,1e9,1e9)
bv.Velocity = Vector3.zero
bv.Parent = hrp
end
for _, v in pairs(char:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = false
end
end
if not char:FindFirstChild("NoclipHighlight") then
local hl = Instance.new("Highlight")
hl.Name = "NoclipHighlight"
hl.FillColor = Color3.fromRGB(0, 0, 255)
hl.OutlineColor = Color3.fromRGB(0, 0, 255)
hl.FillTransparency = 0.8
hl.OutlineTransparency = 0.4
hl.Parent = char
end
end

local function DisableNoclip()
local char = plr.Character
if not char then return end
local hrp = char:FindFirstChild("HumanoidRootPart")
if hrp and hrp:FindFirstChild("BodyClip") then
hrp.BodyClip:Destroy()
end
for _, v in pairs(char:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = true
end
end
if char:FindFirstChild("NoclipHighlight") then
char.NoclipHighlight:Destroy()
end
end
getgenv().TweenPaused = false

-- func tween gay
tween = function(targetCFrame)
if getgenv().TweenPaused then return end

local char = plr.Character
if not char then return end
local hum = char:FindFirstChildOfClass("Humanoid")
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hum or not hrp or hum.Health <= 0 then return end

if getgenv().currentTween then
getgenv().currentTween:Cancel()
getgenv().currentTween = nil
end

hum.Sit = false
hum.PlatformStand = false
hrp.Anchored = false

local startPos = hrp.Position
local targetPos = targetCFrame.Position
local distance = (targetPos - startPos).Magnitude

if distance < 400 then
if notween then
notween(targetCFrame)
else
hrp.CFrame = targetCFrame
end
return
end

local teleportPoint = CheckNearestTeleporter(targetCFrame)
if teleportPoint then
requestEntrance(teleportPoint)
task.wait(0.15)
startPos = hrp.Position
distance = (targetPos - startPos).Magnitude
end

if distance <= 1 then
for i = 1, (_G.TeleportSpamTimes or 5) do
hrp.CFrame = targetCFrame
task.wait()
end
return
end

if distance <= 6000 then
hrp.CFrame = CFrame.new(
startPos.X,
startPos.Y + _G.PosY,
startPos.Z
)
end

local speed = (_G.Flytween and 80) or (_G.TweenSpeed or 420)
local flatTarget = Vector3.new(targetPos.X, hrp.Position.Y, targetPos.Z)
local flatDist = (flatTarget - hrp.Position).Magnitude
local tweenTime = flatDist / speed

local tw = TweenService:Create(
hrp,
TweenInfo.new(tweenTime, Enum.EasingStyle.Linear),
{CFrame = CFrame.new(flatTarget)}
)
getgenv().currentTween = tw
tw:Play()
tw.Completed:Wait()

hrp.CFrame = targetCFrame
getgenv().currentTween = nil
end

TeleportToTarget = function(targetCFrame)
if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end
local hrp = plr.Character.HumanoidRootPart
local dist = (targetCFrame.Position - hrp.Position).Magnitude
if dist > 450 then
notween(targetCFrame)
else
tween(targetCFrame)
end
end

notween = function(cf)
local char = plr.Character
if char and char:FindFirstChild("HumanoidRootPart") then
char.HumanoidRootPart.CFrame = cf
end
end

function CheckNearestTeleporter(aI)
local vcspos = aI.Position
local closestDist = math.huge
local chosen
local locations = {}
if World3 then
locations = {
Vector3.new(-5096.27,314.74,-3142.80),
Vector3.new(-12471.17,375.14,-7551.68),
Vector3.new(5643.49,1014.52,-341.89)
}
elseif World2 then
locations = {
Vector3.new(2285,15,905),
Vector3.new(923,126,32852),
Vector3.new(-6508.55,83.44,-132.84),
Vector3.new(-286.99,306.35,597.79),
Vector3.new(3028.59, 2281.08, -7324.82),
Vector3.new(28286.36, 14896.73, 102.62)
}
elseif World1 then
locations = {
Vector3.new(-4652,873,-1754),
Vector3.new(-7895,5547,-380),
Vector3.new(61164,5,1820),
Vector3.new(3865,5,-1926)
}
end
for _, v in ipairs(locations) do
local d = (v - vcspos).Magnitude
if d < closestDist then
closestDist = d
chosen = v
end
end
local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
if hrp and chosen then
if closestDist <= (vcspos - hrp.Position).Magnitude then
return chosen
end
end
end

function requestEntrance(pos)
ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", pos)
local hrp = plr.Character.HumanoidRootPart
hrp.CFrame = hrp.CFrame + Vector3.new(0,50,0)
task.wait(0.4)
end

function BTP(p)
local char = plr.Character
if not char then return end
local hrp = char.HumanoidRootPart
local hum = char.Humanoid
local gui = plr.PlayerGui.Main
local last = hrp.Position
repeat
hum.Health = 0
hrp.CFrame = p
gui.Quest.Visible = true
if (hrp.Position - last).Magnitude > 1 then
last = hrp.Position
hrp.CFrame = p
end
task.wait(0.5)
until (p.Position - hrp.Position).Magnitude <= 2000
end

spawn(function()
while task.wait() do
pcall(function()
if getgenv().TweenPaused then
shouldTween = false
DisableNoclip()
return
end

if _G.SailBoat_Hydra or _G.Travelis or _G.TpDung or _G.FD
or _G.TP_Temple or _G.TP_AncientOne or _G.TP_Clock
or _G.AutoTyrantFully or _G.WardenBoss or _G.AutoFishAtPos2
or _G.Flytween or _G.StartFarm or _G.FarmBoss or _G.AutoFactory
or _G.HighestMirage or _G.HCM or _G.PGB or _G.Leviathan1
or _G.UPGDrago or _G.Complete_Trials or _G.TpDrago_Prehis
or _G.BuyDrago or _G.AutoFireFlowers or _G.DT_Uzoth
or _G.AutoBerry or _G.Prehis_Find or _G.Prehis_Skills
or _G.Prehis_DB or _G.Prehis_DE or _G.FarmBlazeEM
or _G.Dojoo or _G.CollectPresent or _G.AutoLawKak
or _G.TpLab or _G.AutoPhoenixF or _G.AutoFarmChest
or _G.AutoHytHallow or _G.LongsWord or _G.BlackSpikey
or _G.TPChristmasGift or _G.AutoFarmCandy or _G.AutoHolyTorch
or _G.Greybeard or _G.TrainDrago or _G.AutoSaber
or _G.FarmMastery_Dev or _G.CitizenQuest
or _G.AutoTPWhenCountdownEnd or _G.AutoEctoplasm
or _G.KeysRen or _G.Auto_Rainbow_Haki or _G.obsFarm
or _G.AutoBigmom or _G.Doughv2 or _G.AuraBoss
or _G.Raiding or _G.Auto_Cavender or _G.TpPly
or _G.Bartilo_Quest or _G.Level or _G.FarmEliteHunt
or _G.AutoZou or _G.AutoFarm_Bone or getgenv().AutoMaterial
or _G.CraftVM or _G.FrozenTP or _G.TPDoor or _G.AcientOne
or _G.AutoFarmNear or _G.AutoRaidCastle or _G.DarkBladev3
or _G.AutoFarmRaid or _G.Auto_Cake_Prince or _G.Addealer
or _G.TPNpc or _G.TwinHook or _G.FindMirage
or _G.FarmChestM or _G.Shark or _G.TerrorShark
or _G.Piranha or _G.MobCrew or _G.SeaBeast1
or _G.FishBoat or _G.AutoPole or _G.AutoPoleV2
or _G.Auto_SuperHuman or _G.AutoDeathStep
or _G.Auto_SharkMan_Karate or _G.Auto_Electric_Claw
or _G.AutoDragonTalon or _G.Auto_Def_DarkCoat
or _G.Auto_God_Human or _G.Auto_Tushita
or _G.AutoMatSoul or _G.AutoKenVTWO
or _G.AutoSerpentBow or _G.AutoFMon
or _G.Auto_Soul_Guitar or _G.TPGEAR
or _G.AutoSaw or _G.AutoTridentW2
or _G.Auto_StartRaid or _G.AutoEvoRace
or _G.AutoGetQuestBounty or _G.MarinesCoat
or _G.TravelDres or _G.Defeating or _G.DummyMan
or _G.Auto_Yama or _G.Auto_SwanGG or _G.SwanCoat
or _G.AutoEcBoss or _G.Auto_Mink or _G.Auto_Human
or _G.Auto_Skypiea or _G.Auto_Fish
or _G.CDK_TS or _G.CDK_YM or _G.CDK
or _G.AutoFarmGodChalice or _G.AutoFistDarkness
or _G.AutoMiror or _G.Teleport or _G.AutoKilo
or _G.AutoGetUsoap or _G.Praying or _G.TryLucky
or _G.AutoColShad or _G.AutoUnHaki
or _G.Auto_DonAcces or _G.AutoRipIngay
or _G.DragoV3 or _G.DragoV1 or _G.SailBoats
or NextIs or _G.FarmGodChalice or _G.IceBossRen
or senth or senth2 or _G.Lvthan or _G.beasthunter
or _G.DangerLV or _G.Relic123 or _G.tweenKitsune
or _G.Collect_Ember or _G.AutofindKitIs
or _G.snaguine or _G.TwFruits
or _G.tweenKitShrine or _G.Tp_LgS
or _G.Tp_MasterA or _G.tweenShrine
or _G.FarmMastery_G or _G.FarmMastery_S
or _G.FarmPhaBinh or _G.FarmTyrant then

shouldTween = true
EnableNoclip()

else
shouldTween = false
DisableNoclip()
end
end)
end
end)



QuestB=function()if World1 then if _G.FindBoss=="The Gorilla King"then bMon="The Gorilla King"Qname="JungleQuest"Qdata=3;PosQBoss=CFrame.new(-1601.6553955078,36.85213470459,153.38809204102)PosB=CFrame.new(-1088.75977,8.13463783,-488.559906,-0.707134247,0,0.707079291,0,1,0,-0.707079291,0,-0.707134247)elseif _G.FindBoss=="Bobby"then bMon="Bobby"Qname="BuggyQuest1"Qdata=3;PosQBoss=CFrame.new(-1140.1761474609,4.752049446106,3827.4057617188)PosB=CFrame.new(-1087.3760986328,46.949409484863,4040.1462402344)elseif _G.FindBoss=="The Saw"then bMon="The Saw"PosB=CFrame.new(-784.89715576172,72.427383422852,1603.5822753906)elseif _G.FindBoss=="Yeti"then bMon="Yeti"Qname="SnowQuest"Qdata=3;PosQBoss=CFrame.new(1386.8073730469,87.272789001465,-1298.3576660156)PosB=CFrame.new(1218.7956542969,138.01184082031,-1488.0262451172)elseif _G.FindBoss=="Mob Leader"then bMon="Mob Leader"PosB=CFrame.new(-2844.7307128906,7.4180502891541,5356.6723632813)elseif _G.FindBoss=="Vice Admiral"then bMon="Vice Admiral"Qname="MarineQuest2"Qdata=2;PosQBoss=CFrame.new(-5036.2465820313,28.677835464478,4324.56640625)PosB=CFrame.new(-5006.5454101563,88.032081604004,4353.162109375)elseif _G.FindBoss=="Saber Expert"then bMon="Saber Expert"PosB=CFrame.new(-1458.89502,29.8870335,-50.633564)elseif _G.FindBoss=="Warden"then bMon="Warden"Qname="ImpelQuest"Qdata=1;PosB=CFrame.new(5278.04932,2.15167475,944.101929,0.220546961,-4.49946401e-06,0.975376427,-1.95412576e-05,1,9.03162072e-06,-0.975376427,-2.10519756e-05,0.220546961)PosQBoss=CFrame.new(5191.86133,2.84020686,686.438721,-0.731384635,0,0.681965172,0,1,0,-0.681965172,0,-0.731384635)elseif _G.FindBoss=="Chief Warden"then bMon="Chief Warden"Qname="ImpelQuest"Qdata=2;PosB=CFrame.new(5206.92578,0.997753382,814.976746,0.342041343,-0.00062915677,0.939684749,0.00191645394,0.999998152,-2.80422337e-05,-0.939682961,0.00181045406,0.342041939)PosQBoss=CFrame.new(5191.86133,2.84020686,686.438721,-0.731384635,0,0.681965172,0,1,0,-0.681965172,0,-0.731384635)elseif _G.FindBoss=="Swan"then bMon="Swan"Qname="ImpelQuest"Qdata=3;PosB=CFrame.new(5325.09619,7.03906584,719.570679,-0.309060812,0,0.951042235,0,1,0,-0.951042235,0,-0.309060812)PosQBoss=CFrame.new(5191.86133,2.84020686,686.438721,-0.731384635,0,0.681965172,0,1,0,-0.681965172,0,-0.731384635)elseif _G.FindBoss=="Magma Admiral"then bMon="Magma Admiral"Qname="MagmaQuest"Qdata=3;PosQBoss=CFrame.new(-5314.6220703125,12.262420654297,8517.279296875)PosB=CFrame.new(-5765.8969726563,82.92064666748,8718.3046875)elseif _G.FindBoss=="Fishman Lord"then bMon="Fishman Lord"Qname="FishmanQuest"Qdata=3;PosQBoss=CFrame.new(61122.65234375,18.497442245483,1569.3997802734)PosB=CFrame.new(61260.15234375,30.950881958008,1193.4329833984)elseif _G.FindBoss=="Wysper"then bMon="Wysper"Qname="SkyExp1Quest"Qdata=3;PosQBoss=CFrame.new(-7861.947265625,5545.517578125,-379.85974121094)PosB=CFrame.new(-7866.1333007813,5576.4311523438,-546.74816894531)elseif _G.FindBoss=="Thunder God"then bMon="Thunder God"Qname="SkyExp2Quest"Qdata=3;PosQBoss=CFrame.new(-7903.3828125,5635.9897460938,-1410.923828125)PosB=CFrame.new(-7994.984375,5761.025390625,-2088.6479492188)elseif _G.FindBoss=="Cyborg"then bMon="Cyborg"Qname="FountainQuest"Qdata=3;PosQBoss=CFrame.new(5258.2788085938,38.526931762695,4050.044921875)PosB=CFrame.new(6094.0249023438,73.770050048828,3825.7348632813)elseif _G.FindBoss=="Ice Admiral"then bMon="Ice Admiral"Qdata=nil;PosQBoss=CFrame.new(1266.08948,26.1757946,-1399.57678,-0.573599219,0,-0.81913656,0,1,0,0.81913656,0,-0.573599219)PosB=CFrame.new(1266.08948,26.1757946,-1399.57678,-0.573599219,0,-0.81913656,0,1,0,0.81913656,0,-0.573599219)elseif _G.FindBoss=="Greybeard"then bMon="Greybeard"Qdata=nil;PosQBoss=CFrame.new(-5081.3452148438,85.221641540527,4257.3588867188)PosB=CFrame.new(-5081.3452148438,85.221641540527,4257.3588867188)end end;if World2 then if _G.FindBoss=="Diamond"then bMon="Diamond"Qname="Area1Quest"Qdata=3;PosQBoss=CFrame.new(-427.5666809082,73.313781738281,1835.4208984375)PosB=CFrame.new(-1576.7166748047,198.59265136719,13.724286079407)elseif _G.FindBoss=="Jeremy"then bMon="Jeremy"Qname="Area2Quest"Qdata=3;PosQBoss=CFrame.new(636.79943847656,73.413787841797,918.00415039063)PosB=CFrame.new(2006.9261474609,448.95666503906,853.98284912109)elseif _G.FindBoss=="Fajita"then bMon="Fajita"Qname="MarineQuest3"Qdata=3;PosQBoss=CFrame.new(-2441.986328125,73.359344482422,-3217.5324707031)PosB=CFrame.new(-2172.7399902344,103.32216644287,-4015.025390625)elseif _G.FindBoss=="Don Swan"then bMon="Don Swan"PosB=CFrame.new(2286.2004394531,15.177839279175,863.8388671875)elseif _G.FindBoss=="Smoke Admiral"then bMon="Smoke Admiral"Qname="IceSideQuest"Qdata=3;PosQBoss=CFrame.new(-5429.0473632813,15.977565765381,-5297.9614257813)PosB=CFrame.new(-5275.1987304688,20.757257461548,-5260.6669921875)elseif _G.FindBoss=="Awakened Ice Admiral"then bMon="Awakened Ice Admiral"Qname="FrostQuest"Qdata=3;PosQBoss=CFrame.new(5668.9780273438,28.519989013672,-6483.3520507813)PosB=CFrame.new(6403.5439453125,340.29766845703,-6894.5595703125)elseif _G.FindBoss=="Tide Keeper"then bMon="Tide Keeper"Qname="ForgottenQuest"Qdata=3;PosQBoss=CFrame.new(-3053.9814453125,237.18954467773,-10145.0390625)PosB=CFrame.new(-3795.6423339844,105.88877105713,-11421.307617188)elseif _G.FindBoss=="Darkbeard"then bMon="Darkbeard"Qdata=nil;PosQBoss=CFrame.new(3677.08203125,62.751937866211,-3144.8332519531)PosB=CFrame.new(3677.08203125,62.751937866211,-3144.8332519531)elseif _G.FindBoss=="Cursed Captaim"then bMon="Cursed Captain"Qdata=nil;PosQBoss=CFrame.new(916.928589,181.092773,33422)PosB=CFrame.new(916.928589,181.092773,33422)elseif _G.FindBoss=="Order"then bMon="Order"Qdata=nil;PosQBoss=CFrame.new(-6217.2021484375,28.047645568848,-5053.1357421875)PosB=CFrame.new(-6217.2021484375,28.047645568848,-5053.1357421875)end end;if World3 then if _G.FindBoss=="Stone"then bMon="Stone"Qname="PiratePortQuest"Qdata=3;PosQBoss=CFrame.new(-289.76705932617,43.819011688232,5579.9384765625)PosB=CFrame.new(-1027.6512451172,92.404174804688,6578.8530273438)elseif _G.FindBoss=="Hydra Leader"then bMon="Hydra Leader"Qname="AmazonQuest2"Qdata=3;PosQBoss=CFrame.new(5821.89794921875,1019.0950927734375,-73.71923065185547)PosB=CFrame.new(5821.89794921875,1019.0950927734375,-73.71923065185547)elseif _G.FindBoss=="Kilo Admiral"then bMon="Kilo Admiral"Qname="MarineTreeIsland"Qdata=3;PosQBoss=CFrame.new(2179.3010253906,28.731239318848,-6739.9741210938)PosB=CFrame.new(2764.2233886719,432.46154785156,-7144.4580078125)elseif _G.FindBoss=="Captain Elephant"then bMon="Captain Elephant"Qname="DeepForestIsland"Qdata=3;PosQBoss=CFrame.new(-13232.682617188,332.40396118164,-7626.01171875)PosB=CFrame.new(-13376.7578125,433.28689575195,-8071.392578125)elseif _G.FindBoss=="Beautiful Pirate"then bMon="Beautiful Pirate"Qname="DeepForestIsland2"Qdata=3;PosQBoss=CFrame.new(-12682.096679688,390.88653564453,-9902.1240234375)PosB=CFrame.new(5283.609375,22.56223487854,-110.78285217285)elseif _G.FindBoss=="Cake Queen"then bMon="Cake Queen"Qname="IceCreamIslandQuest"Qdata=3;PosQBoss=CFrame.new(-819.376709,64.9259796,-10967.2832,-0.766061664,0,0.642767608,0,1,0,-0.642767608,0,-0.766061664)PosB=CFrame.new(-678.648804,381.353943,-11114.2012,-0.908641815,0.00149294338,0.41757378,0.00837114919,0.999857843,0.0146408929,-0.417492568,0.0167988986,-0.90852499)elseif _G.FindBoss=="Longma"then bMon="Longma"Qdata=nil;PosQBoss=CFrame.new(-10238.875976563,389.7912902832,-9549.7939453125)PosB=CFrame.new(-10238.875976563,389.7912902832,-9549.7939453125)elseif _G.FindBoss=="Soul Reaper"then bMon="Soul Reaper"Qdata=nil;PosQBoss=CFrame.new(-9524.7890625,315.80429077148,6655.7192382813)PosB=CFrame.new(-9524.7890625,315.80429077148,6655.7192382813)end end end
QuestBeta = function()
local Neta = QuestB()
return {
[0] = _G.FindBoss,
[1] = bMon,
[2] = Qdata,
[3] = Qname,
[4] = PosB
}
end
QuestCheck = function()
		local r = game.Players.LocalPlayer.Data.Level.Value;
		if World1 then
			if r == 1 or r <= 9 then
				if tostring(TeamSelf) == "Marines" then
					Mon = "Trainee";
					Qname = "MarineQuest";
					Qdata = 1;
					NameMon = "Trainee";
					PosM = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, .667371571, -1.09201515e-07, -0.744724929);
					PosQ = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, .667371571, -1.09201515e-07, -0.744724929);
				elseif tostring(TeamSelf) == "Pirates" then
					Mon = "Bandit";
					Qdata = 1;
					Qname = "BanditQuest1";
					NameMon = "Bandit";
					PosM = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125);
					PosQ = CFrame.new(1045.9626464844, 27.002508163452, 1560.8203125);
				end;
			elseif r == 10 or r <= 14 then
				Mon = "Monkey";
				Qdata = 1;
				Qname = "JungleQuest";
				NameMon = "Monkey";
				PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, 0, -1, 0, 0);
				PosM = CFrame.new(-1448.5180664062, 67.853012084961, 11.465796470642);
			elseif r == 15 or r <= 29 then
				Mon = "Gorilla";
				Qdata = 2;
				Qname = "JungleQuest";
				NameMon = "Gorilla";
				PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, 0, -1, 0, 0);
				PosM = CFrame.new(-1129.8836669922, 40.46354675293, -525.42370605469);
			elseif r == 30 or r <= 39 then
				Mon = "Pirate";
				Qdata = 1;
				Qname = "BuggyQuest1";
				NameMon = "Pirate";
				PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498, .965929627, 0, -0.258804798, 0, 1, 0, .258804798, 0, .965929627);
				PosM = CFrame.new(-1103.5134277344, 13.752052307129, 3896.0910644531);
			elseif r == 40 or r <= 59 then
				Mon = "Brute";
				Qdata = 2;
				Qname = "BuggyQuest1";
				NameMon = "Brute";
				PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498, .965929627, 0, -0.258804798, 0, 1, 0, .258804798, 0, .965929627);
				PosM = CFrame.new(-1140.0837402344, 14.809885025024, 4322.9213867188);
			elseif r == 60 or r <= 74 then
				Mon = "Desert Bandit";
				Qdata = 1;
				Qname = "DesertQuest";
				NameMon = "Desert Bandit";
				PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359, .819155693, 0, -0.573571265, 0, 1, 0, .573571265, 0, .819155693);
				PosM = CFrame.new(924.7998046875, 6.4486746788025, 4481.5859375);
			elseif r == 75 or r <= 89 then
				Mon = "Desert Officer";
				Qdata = 2;
				Qname = "DesertQuest";
				NameMon = "Desert Officer";
				PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359, .819155693, 0, -0.573571265, 0, 1, 0, .573571265, 0, .819155693);
				PosM = CFrame.new(1608.2822265625, 8.6142244338989, 4371.0073242188);
			elseif r == 90 or r <= 99 then
				Mon = "Snow Bandit";
				Qdata = 1;
				Qname = "SnowQuest";
				NameMon = "Snow Bandit";
				PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, .939684391, 0, 1, 0, -0.939684391, 0, -0.342042685);
				PosM = CFrame.new(1354.3479003906, 87.272773742676, -1393.9465332031);
			elseif r == 100 or r <= 119 then
				Mon = "Snowman";
				Qdata = 2;
				Qname = "SnowQuest";
				NameMon = "Snowman";
				PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, .939684391, 0, 1, 0, -0.939684391, 0, -0.342042685);
				PosM = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516);
			elseif r == 120 or r <= 149 then
				Mon = "Chief Petty Officer";
				Qdata = 1;
				Qname = "MarineQuest2";
				NameMon = "Chief Petty Officer";
				PosQ = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0);
				PosM = CFrame.new(-4881.2309570312, 22.652044296265, 4273.7524414062);
			elseif r == 150 or r <= 174 then
				Mon = "Sky Bandit";
				Qdata = 1;
				Qname = "SkyQuest";
				NameMon = "Sky Bandit";
				PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268);
				PosM = CFrame.new(-4953.20703125, 295.74420166016, -2899.2290039062);
			elseif r == 175 or r <= 189 then
				Mon = "Dark Master";
				Qdata = 2;
				Qname = "SkyQuest";
				NameMon = "Dark Master";
				PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268);
				PosM = CFrame.new(-5259.8447265625, 391.39767456055, -2229.0354003906);
			elseif r == 190 or r <= 209 then
				Mon = "Prisoner";
				Qdata = 1;
				Qname = "PrisonerQuest";
				NameMon = "Prisoner";
				PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, .995993316, -2.06384709e-09, -0.0894274712);
				PosM = CFrame.new(5098.9736328125, -0.3204058110714, 474.23733520508);
			elseif r == 210 or r <= 249 then
				Mon = "Dangerous Prisoner";
				Qdata = 2;
				Qname = "PrisonerQuest";
				NameMon = "Dangerous Prisoner";
				PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, .995993316, -2.06384709e-09, -0.0894274712);
				PosM = CFrame.new(5654.5634765625, 15.633401870728, 866.29919433594);
			elseif r == 250 or r <= 274 then
				Mon = "Toga Warrior";
				Qdata = 1;
				Qname = "ColosseumQuest";
				NameMon = "Toga Warrior";
				PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, .857167721, 0, -0.515037298);
				PosM = CFrame.new(-1820.21484375, 51.683856964111, -2740.6650390625);
			elseif r == 275 or r <= 299 then
				Mon = "Gladiator";
				Qdata = 2;
				Qname = "ColosseumQuest";
				NameMon = "Gladiator";
				PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, .857167721, 0, -0.515037298);
				PosM = CFrame.new(-1292.8381347656, 56.380882263184, -3339.0314941406);
			elseif r == 300 or r <= 324 then
				Boubty = false;
				Mon = "Military Soldier";
				Qdata = 1;
				Qname = "MagmaQuest";
				NameMon = "Military Soldier";
				PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, .866048813, 0, 1, 0, -0.866048813, 0, -0.499959469);
				PosM = CFrame.new(-5411.1645507812, 11.081554412842, 8454.29296875);
			elseif r == 325 or r <= 374 then
				Mon = "Military Spy";
				Qdata = 2;
				Qname = "MagmaQuest";
				NameMon = "Military Spy";
				PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, .866048813, 0, 1, 0, -0.866048813, 0, -0.499959469);
				PosM = CFrame.new(-5802.8681640625, 86.262413024902, 8828.859375);
			elseif r == 375 or r <= 399 then
				Mon = "Fishman Warrior";
				Qdata = 1;
				Qname = "FishmanQuest";
				NameMon = "Fishman Warrior";
				PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
				PosM = CFrame.new(60878.30078125, 18.482830047607, 1543.7574462891);
				if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
				end;
			elseif r == 400 or r <= 449 then
				Mon = "Fishman Commando";
				Qdata = 2;
				Qname = "FishmanQuest";
				NameMon = "Fishman Commando";
				PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
				PosM = CFrame.new(61922.6328125, 18.482830047607, 1493.9343261719);
				if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
				end;
			elseif r == 450 or r <= 474 then
				Mon = "God\'s Guard";
				Qdata = 1;
				Qname = "SkyExp1Quest";
				NameMon = "God\'s Guard";
				PosQ = CFrame.new(-4721.88867, 843.874695, -1949.96643, .996191859, 0, -0.0871884301, 0, 1, 0, .0871884301, 0, .996191859);
				PosM = CFrame.new(-4710.04296875, 845.27697753906, -1927.3079833984);
				if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688));
				end;
			elseif r == 475 or r <= 524 then
				Mon = "Shanda";
				Qdata = 2;
				Qname = "SkyExp1Quest";
				NameMon = "Shanda";
				PosQ = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, .906319618, 0, 1, 0, -0.906319618, 0, -0.422592998);
				PosM = CFrame.new(-7678.4897460938, 5566.4038085938, -497.21560668945);
				if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047));
				end;
			elseif r == 525 or r <= 549 then
				Mon = "Royal Squad";
				Qdata = 1;
				Qname = "SkyExp2Quest";
				NameMon = "Royal Squad";
				PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0);
				PosM = CFrame.new(-7624.2524414062, 5658.1333007812, -1467.3542480469);
			elseif r == 550 or r <= 624 then
				Mon = "Royal Soldier";
				Qdata = 2;
				Qname = "SkyExp2Quest";
				NameMon = "Royal Soldier";
				PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0);
				PosM = CFrame.new(-7836.7534179688, 5645.6640625, -1790.6236572266);
			elseif r == 625 or r <= 649 then
				Mon = "Galley Pirate";
				Qdata = 1;
				Qname = "FountainQuest";
				NameMon = "Galley Pirate";
				PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, .087131381, 0, .996196866, 0, 1, 0, -0.996196866, 0, .087131381);
				PosM = CFrame.new(5551.0219726562, 78.901351928711, 3930.4128417969);
			elseif r >= 650 then
				Mon = "Galley Captain";
				Qdata = 2;
				Qname = "FountainQuest";
				NameMon = "Galley Captain";
				PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, .087131381, 0, .996196866, 0, 1, 0, -0.996196866, 0, .087131381);
				PosM = CFrame.new(5441.9516601562, 42.502059936523, 4950.09375);
			end;
		elseif World2 then
			if r == 700 or r <= 724 then
				Mon = "Raider";
				Qdata = 1;
				Qname = "Area1Quest";
				NameMon = "Raider";
				PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, .974368095, 0, -0.22495985);
				PosM = CFrame.new(-728.32672119141, 52.779319763184, 2345.7705078125);
			elseif r == 725 or r <= 774 then
				Mon = "Mercenary";
				Qdata = 2;
				Qname = "Area1Quest";
				NameMon = "Mercenary";
				PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, .974368095, 0, -0.22495985);
				PosM = CFrame.new(-1004.3244018555, 80.158866882324, 1424.6193847656);
			elseif r == 775 or r <= 799 then
				Mon = "Swan Pirate";
				Qdata = 1;
				Qname = "Area2Quest";
				NameMon = "Swan Pirate";
				PosQ = CFrame.new(638.43811, 71.769989, 918.282898, .139203906, 0, .99026376, 0, 1, 0, -0.99026376, 0, .139203906);
				PosM = CFrame.new(1068.6643066406, 137.61428833008, 1322.1060791016);
			elseif r == 800 or r <= 874 then
				Mon = "Factory Staff";
				Qname = "Area2Quest";
				Qdata = 2;
				NameMon = "Factory Staff";
				PosQ = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, .999488771, -1.07732087e-10, -0.0319722369);
				PosM = CFrame.new(73.078674316406, 81.863441467285, -27.470672607422);
			elseif r == 875 or r <= 899 then
				Mon = "Marine Lieutenant";
				Qdata = 1;
				Qname = "MarineQuest3";
				NameMon = "Marine Lieutenant";
				PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268);
				PosM = CFrame.new(-2821.3723144531, 75.897277832031, -3070.0891113281);
			elseif r == 900 or r <= 949 then
				Mon = "Marine Captain";
				Qdata = 2;
				Qname = "MarineQuest3";
				NameMon = "Marine Captain";
				PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268);
				PosM = CFrame.new(-1861.2310791016, 80.176582336426, -3254.6975097656);
			elseif r == 950 or r <= 974 then
				Mon = "Zombie";
				Qdata = 1;
				Qname = "ZombieQuest";
				NameMon = "Zombie";
				PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, .95628953, 0, -0.29242146);
				PosM = CFrame.new(-5657.7768554688, 78.969734191895, -928.68701171875);
			elseif r == 975 or r <= 999 then
				Mon = "Vampire";
				Qdata = 2;
				Qname = "ZombieQuest";
				NameMon = "Vampire";
				PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, .95628953, 0, -0.29242146);
				PosM = CFrame.new(-6037.66796875, 32.184638977051, -1340.6597900391);
			elseif r == 1000 or r <= 1049 then
				Mon = "Snow Trooper";
				Qdata = 1;
				Qname = "SnowMountainQuest";
				NameMon = "Snow Trooper";
				PosQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, .92718488, 0, 1, 0, -0.92718488, 0, -0.374604106);
				PosM = CFrame.new(549.14733886719, 427.38705444336, -5563.6987304688);
			elseif r == 1050 or r <= 1099 then
				Mon = "Winter Warrior";
				Qdata = 2;
				Qname = "SnowMountainQuest";
				NameMon = "Winter Warrior";
				PosQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, .92718488, 0, 1, 0, -0.92718488, 0, -0.374604106);
				PosM = CFrame.new(1142.7451171875, 475.63980102539, -5199.4165039062);
			elseif r == 1100 or r <= 1124 then
				Mon = "Lab Subordinate";
				Qdata = 1;
				Qname = "IceSideQuest";
				NameMon = "Lab Subordinate";
				PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, .453972578, 0, -0.891015649, 0, 1, 0, .891015649, 0, .453972578);
				PosM = CFrame.new(-5707.4716796875, 15.951709747314, -4513.3920898438);
			elseif r == 1125 or r <= 1174 then
				Mon = "Horned Warrior";
				Qdata = 2;
				Qname = "IceSideQuest";
				NameMon = "Horned Warrior";
				PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, .453972578, 0, -0.891015649, 0, 1, 0, .891015649, 0, .453972578);
				PosM = CFrame.new(-6341.3666992188, 15.951770782471, -5723.162109375);
			elseif r == 1175 or r <= 1199 then
				Mon = "Magma Ninja";
				Qdata = 1;
				Qname = "FireSideQuest";
				NameMon = "Magma Ninja";
				PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
				PosM = CFrame.new(-5449.6728515625, 76.658744812012, -5808.2006835938);
			elseif r == 1200 or r <= 1249 then
				Mon = "Lava Pirate";
				Qdata = 2;
				Qname = "FireSideQuest";
				NameMon = "Lava Pirate";
				PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
				PosM = CFrame.new(-5213.3315429688, 49.737880706787, -4701.451171875);
			elseif r == 1250 or r <= 1274 then
				Mon = "Ship Deckhand";
				Qdata = 1;
				Qname = "ShipQuest1";
				NameMon = "Ship Deckhand";
				PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016);
				PosM = CFrame.new(1212.0111083984, 150.79205322266, 33059.24609375);
				if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
				end;
			elseif r == 1275 or r <= 1299 then
				Mon = "Ship Engineer";
				Qdata = 2;
				Qname = "ShipQuest1";
				NameMon = "Ship Engineer";
				PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016);
				PosM = CFrame.new(919.47863769531, 43.544013977051, 32779.96875);
				if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
				end;
			elseif r == 1300 or r <= 1324 then
				Mon = "Ship Steward";
				Qdata = 1;
				Qname = "ShipQuest2";
				NameMon = "Ship Steward";
				PosQ = CFrame.new(968.80957, 125.092171, 33244.125);
				PosM = CFrame.new(919.43853759766, 129.55599975586, 33436.03515625);
				if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
				end;
			elseif r == 1325 or r <= 1349 then
				Mon = "Ship Officer";
				Qdata = 2;
				Qname = "ShipQuest2";
				NameMon = "Ship Officer";
				PosQ = CFrame.new(968.80957, 125.092171, 33244.125);
				PosM = CFrame.new(1036.0179443359, 181.4390411377, 33315.7265625);
				if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
					replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
				end;
			elseif r == 1350 or r <= 1374 then
				Mon = "Arctic Warrior";
				Qdata = 1;
				Qname = "FrostQuest";
				NameMon = "Arctic Warrior";
				PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, .358349502, 0, -0.933587909);
				PosM = CFrame.new(5966.24609375, 62.970020294189, -6179.3828125);
				if _G.Level and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
					BTP(PosM);
				end;
			elseif r == 1375 or r <= 1424 then
				Mon = "Snow Lurker";
				Qdata = 2;
				Qname = "FrostQuest";
				NameMon = "Snow Lurker";
				PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, .358349502, 0, -0.933587909);
				PosM = CFrame.new(5407.0737304688, 69.194374084473, -6880.8803710938);
			elseif r == 1425 or r <= 1449 then
				Mon = "Sea Soldier";
				Qdata = 1;
				Qname = "ForgottenQuest";
				NameMon = "Sea Soldier";
				PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193, .990270376, 0, -0.13915664, 0, 1, 0, .13915664, 0, .990270376);
				PosM = CFrame.new(-3028.2236328125, 64.674514770508, -9775.4267578125);
			elseif r >= 1450 then
				Mon = "Water Fighter";
				Qdata = 2;
				Qname = "ForgottenQuest";
				NameMon = "Water Fighter";
				PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193, .990270376, 0, -0.13915664, 0, 1, 0, .13915664, 0, .990270376);
				PosM = CFrame.new(-3352.9013671875, 285.01556396484, -10534.841796875);
			end;
		elseif World3 then
			if r == 1500 or r <= 1524 then
				Mon = "Pirate Millionaire";
				Qdata = 1;
				Qname = "PiratePortQuest";
				NameMon = "Pirate Millionaire";
				PosQ = CFrame.new(-712.82727050781, 98.577049255371, 5711.9541015625);
				PosM = CFrame.new(-712.82727050781, 98.577049255371, 5711.9541015625);
			elseif r == 1525 or r <= 1574 then
				Mon = "Pistol Billionaire";
				Qdata = 2;
				Qname = "PiratePortQuest";
				NameMon = "Pistol Billionaire";
				PosQ = CFrame.new(-723.43316650391, 147.42906188965, 5931.9931640625);
				PosM = CFrame.new(-723.43316650391, 147.42906188965, 5931.9931640625);
			elseif r == 1575 or r <= 1599 then
				Mon = "Dragon Crew Warrior";
				Qdata = 1;
				Qname = "DragonCrewQuest";
				NameMon = "Dragon Crew Warrior";
				PosQ = CFrame.new(6779.0327148438, 111.16865539551, -801.21307373047);
				PosM = CFrame.new(6779.0327148438, 111.16865539551, -801.21307373047);
			elseif r == 1600 or r <= 1624 then
				Mon = "Dragon Crew Archer";
				Qname = "DragonCrewQuest";
				Qdata = 2;
				NameMon = "Dragon Crew Archer";
				PosQ = CFrame.new(6955.8974609375, 546.66589355469, 309.04013061523);
				PosM = CFrame.new(6955.8974609375, 546.66589355469, 309.04013061523);
			elseif r == 1625 or r <= 1649 then
				Mon = "Hydra Enforcer";
				Qname = "VenomCrewQuest";
				Qdata = 1;
				NameMon = "Hydra Enforcer";
				PosQ = CFrame.new(4620.6157226562, 1002.2954711914, 399.08688354492);
				PosM = CFrame.new(4620.6157226562, 1002.2954711914, 399.08688354492);
			elseif r == 1650 or r <= 1699 then
				Mon = "Venomous Assailant";
				Qname = "VenomCrewQuest";
				Qdata = 2;
				NameMon = "Venomous Assailant";
				PosQ = CFrame.new(4697.5918, 1100.65137, 946.401978, .579397917, -4.19689783e-10, .81504482, -1.49287818e-10, 1, 6.21053986e-10, -0.81504482, -4.81513662e-10, .579397917);
				PosM = CFrame.new(4697.5918, 1100.65137, 946.401978, .579397917, -4.19689783e-10, .81504482, -1.49287818e-10, 1, 6.21053986e-10, -0.81504482, -4.81513662e-10, .579397917);
			elseif r == 1700 or r <= 1724 then
				Mon = "Marine Commodore";
				Qdata = 1;
				Qname = "MarineTreeIsland";
				NameMon = "Marine Commodore";
				PosQ = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, .258804798, 0, 1, 0, -0.258804798, 0, -0.965929747);
				PosM = CFrame.new(2286.0078125, 73.133918762207, -7159.8090820312);
			elseif r == 1725 or r <= 1774 then
				Mon = "Marine Rear Admiral";
				NameMon = "Marine Rear Admiral";
				Qname = "MarineTreeIsland";
				Qdata = 2;
				PosQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813);
				PosM = CFrame.new(3656.7736816406, 160.52406311035, -7001.5986328125);
			elseif r == 1775 or r <= 1799 then
				Mon = "Fishman Raider";
				Qdata = 1;
				Qname = "DeepForestIsland3";
				NameMon = "Fishman Raider";
				PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
				PosM = CFrame.new(-10407.526367188, 331.76263427734, -8368.5166015625);
			elseif r == 1800 or r <= 1824 then
				Mon = "Fishman Captain";
				Qdata = 2;
				Qname = "DeepForestIsland3";
				NameMon = "Fishman Captain";
				PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
				PosM = CFrame.new(-10994.701171875, 352.38140869141, -9002.1103515625);
			elseif r == 1825 or r <= 1849 then
				Mon = "Forest Pirate";
				Qdata = 1;
				Qname = "DeepForestIsland";
				NameMon = "Forest Pirate";
				PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, .707134247, 0, -0.707079291, 0, 1, 0, .707079291, 0, .707134247);
				PosM = CFrame.new(-13274.478515625, 332.37814331055, -7769.5805664062);
			elseif r == 1850 or r <= 1899 then
				Mon = "Mythological Pirate";
				Qdata = 2;
				Qname = "DeepForestIsland";
				NameMon = "Mythological Pirate";
				PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, .707134247, 0, -0.707079291, 0, 1, 0, .707079291, 0, .707134247);
				PosM = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125);
			elseif r == 1900 or r <= 1924 then
				Mon = "Jungle Pirate";
				Qdata = 1;
				Qname = "DeepForestIsland2";
				NameMon = "Jungle Pirate";
				PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, .996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002);
				PosM = CFrame.new(-12256.16015625, 331.73828125, -10485.836914062);
			elseif r == 1925 or r <= 1974 then
				Mon = "Musketeer Pirate";
				Qdata = 2;
				Qname = "DeepForestIsland2";
				NameMon = "Musketeer Pirate";
				PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, .996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002);
				PosM = CFrame.new(-13457.904296875, 391.54565429688, -9859.177734375);
			elseif r == 1975 or r <= 1999 then
				Mon = "Reborn Skeleton";
				Qdata = 1;
				Qname = "HauntedQuest1";
				NameMon = "Reborn Skeleton";
				PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, 0, -1, 0, 0);
				PosM = CFrame.new(-8763.7236328125, 165.72299194336, 6159.8618164062);
			elseif r == 2000 or r <= 2024 then
				Mon = "Living Zombie";
				Qdata = 2;
				Qname = "HauntedQuest1";
				NameMon = "Living Zombie";
				PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, 0, -1, 0, 0);
				PosM = CFrame.new(-10144.131835938, 138.6266784668, 5838.0888671875);
			elseif r == 2025 or r <= 2049 then
				Mon = "Demonic Soul";
				Qdata = 1;
				Qname = "HauntedQuest2";
				NameMon = "Demonic Soul";
				PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0);
				PosM = CFrame.new(-9505.8720703125, 172.10482788086, 6158.9931640625);
			elseif r == 2050 or r <= 2074 then
				Mon = "Posessed Mummy";
				Qdata = 2;
				Qname = "HauntedQuest2";
				NameMon = "Posessed Mummy";
				PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0);
				PosM = CFrame.new(-9582.0224609375, 6.2515273094177, 6205.478515625);
			elseif r == 2075 or r <= 2099 then
				Mon = "Peanut Scout";
				Qdata = 1;
				Qname = "NutsIslandQuest";
				NameMon = "Peanut Scout";
				PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0);
				PosM = CFrame.new(-2143.2419433594, 47.721984863281, -10029.995117188);
			elseif r == 2100 or r <= 2124 then
				Mon = "Peanut President";
				Qdata = 2;
				Qname = "NutsIslandQuest";
				NameMon = "Peanut President";
				PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0);
				PosM = CFrame.new(-1859.3540039062, 38.103168487549, -10422.4296875);
			elseif r == 2125 or r <= 2149 then
				Mon = "Ice Cream Chef";
				Qdata = 1;
				Qname = "IceCreamIslandQuest";
				NameMon = "Ice Cream Chef";
				PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0);
				PosM = CFrame.new(-872.24658203125, 65.81957244873, -10919.95703125);
			elseif r == 2150 or r <= 2199 then
				Mon = "Ice Cream Commander";
				Qdata = 2;
				Qname = "IceCreamIslandQuest";
				NameMon = "Ice Cream Commander";
				PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0);
				PosM = CFrame.new(-558.06103515625, 112.04895782471, -11290.774414062);
			elseif r == 2200 or r <= 2224 then
				Mon = "Cookie Crafter";
				Qdata = 1;
				Qname = "CakeQuest1";
				NameMon = "Cookie Crafter";
				PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, .957576931, -8.80302053e-08, .288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, .957576931);
				PosM = CFrame.new(-2374.13671875, 37.798263549805, -12125.30859375);
			elseif r == 2225 or r <= 2249 then
				Mon = "Cake Guard";
				Qdata = 2;
				Qname = "CakeQuest1";
				NameMon = "Cake Guard";
				PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, .957576931, -8.80302053e-08, .288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, .957576931);
				PosM = CFrame.new(-1598.3070068359, 43.773197174072, -12244.581054688);
			elseif r == 2250 or r <= 2274 then
				Mon = "Baking Staff";
				Qdata = 1;
				Qname = "CakeQuest2";
				NameMon = "Baking Staff";
				PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, .250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446);
				PosM = CFrame.new(-1887.8099365234, 77.618507385254, -12998.350585938);
			elseif r == 2275 or r <= 2299 then
				Mon = "Head Baker";
				Qdata = 2;
				Qname = "CakeQuest2";
				NameMon = "Head Baker";
				PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, .250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446);
				PosM = CFrame.new(-2216.1882324219, 82.884521484375, -12869.293945312);
			elseif r == 2300 or r <= 2324 then
				Mon = "Cocoa Warrior";
				Qdata = 1;
				Qname = "ChocQuest1";
				NameMon = "Cocoa Warrior";
				PosQ = CFrame.new(233.22836303711, 29.876001358032, -12201.233398438);
				PosM = CFrame.new(-21.553283691406, 80.574996948242, -12352.387695312);
			elseif r == 2325 or r <= 2349 then
				Mon = "Chocolate Bar Battler";
				Qdata = 2;
				Qname = "ChocQuest1";
				NameMon = "Chocolate Bar Battler";
				PosQ = CFrame.new(233.22836303711, 29.876001358032, -12201.233398438);
				PosM = CFrame.new(582.59057617188, 77.188095092773, -12463.162109375);
			elseif r == 2350 or r <= 2374 then
				Mon = "Sweet Thief";
				Qdata = 1;
				Qname = "ChocQuest2";
				NameMon = "Sweet Thief";
				PosQ = CFrame.new(150.50663757324, 30.693693161011, -12774.502929688);
				PosM = CFrame.new(165.1884765625, 76.058853149414, -12600.836914062);
			elseif r == 2375 or r <= 2399 then
				Mon = "Candy Rebel";
				Qdata = 2;
				Qname = "ChocQuest2";
				NameMon = "Candy Rebel";
				PosQ = CFrame.new(150.50663757324, 30.693693161011, -12774.502929688);
				PosM = CFrame.new(134.86563110352, 77.247680664062, -12876.547851562);
			elseif r == 2400 or r <= 2449 then
				Mon = "Candy Pirate";
				Qdata = 1;
				Qname = "CandyQuest1";
				NameMon = "Candy Pirate";
				PosQ = CFrame.new(-1150.0400390625, 20.378934860229, -14446.334960938);
				PosM = CFrame.new(-1310.5003662109, 26.016523361206, -14562.404296875);
			elseif r == 2450 or r <= 2474 then
				Mon = "Isle Outlaw";
				Qdata = 1;
				Qname = "TikiQuest1";
				NameMon = "Isle Outlaw";
				PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, .213092566, 0, -0.977032006, 0, 1, 0, .977032006, 0, .213092566);
				PosM = CFrame.new(-16479.900390625, 226.6117401123, -300.31143188477);
			elseif r == 2475 or r <= 2499 then
				Mon = "Island Boy";
				Qdata = 2;
				Qname = "TikiQuest1";
				NameMon = "Island Boy";
				PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, .213092566, 0, -0.977032006, 0, 1, 0, .977032006, 0, .213092566);
				PosM = CFrame.new(-16849.396484375, 192.86505126953, -150.78532409668);
			elseif r == 2500 or r <= 2524 then
				Mon = "Sun-kissed Warrior";
				Qdata = 1;
				Qname = "TikiQuest2";
				NameMon = "kissed Warrior";
				PosM = CFrame.new(-16347, 64, 984);
				PosQ = CFrame.new(-16538, 55, 1049);
			elseif r == 2525 or r <= 2550 then
				Mon = "Isle Champion";
				Qdata = 2;
				Qname = "TikiQuest2";
				NameMon = "Isle Champion";
				PosQ = CFrame.new(-16541.0215, 57.3082275, 1051.46118, .0410757065, 0, -0.999156058, 0, 1, 0, .999156058, 0, .0410757065);
				PosM = CFrame.new(-16602.1015625, 130.38734436035, 1087.2456054688);
			elseif r >= 2551 and r <= 2574 then
				Mon = "Serpent Hunter";
				Qdata = 1;
				Qname = "TikiQuest3";
				NameMon = "Serpent Hunter";
				PosQ = CFrame.new(-16679.4785, 176.7473, 1474.3995);
				PosM = CFrame.new(-16679.4785, 176.7473, 1474.3995);
			elseif r >= 2575 and r <= 2599 then
				Mon = "Skull Slayer";
				Qdata = 2;
				Qname = "TikiQuest3";
				NameMon = "Skull Slayer";
				PosQ = CFrame.new(-16759.5898, 71.2837, 1595.3399);
				PosM = CFrame.new(-16759.5898, 71.2837, 1595.3399);
			elseif r >= 2600 and r <= 2624 then
				Mon = "Reef Bandit";
				Qdata = 1;
				Qname = "SubmergedQuest1";
				NameMon = "Reef Bandit";
				PosQ = CFrame.new(10882.264, -2086.322, 10034.226);
				PosM = CFrame.new(10736.6191, -2087.8439, 9338.4882);
			elseif r >= 2625 and r <= 2649 then
				Mon = "Coral Pirate";
				Qdata = 2;
				Qname = "SubmergedQuest1";
				NameMon = "Coral Pirate";
				PosQ = CFrame.new(10882.264, -2086.322, 10034.226);
				PosM = CFrame.new(10965.1025, -2158.8842, 9177.2597);
			elseif r >= 2650 and r <= 2674 then
				Mon = "Sea Chanter";
				Qdata = 1;
				Qname = "SubmergedQuest2";
				NameMon = "Sea Chanter";
				PosQ = CFrame.new(10882.264, -2086.322, 10034.226);
				PosM = CFrame.new(10621.0342, -2087.844, 10102.0332);
			elseif r >= 2675 and r <= 2699 then
				Mon = "Ocean Prophet";
				Qdata = 2;
				Qname = "SubmergedQuest2";
				NameMon = "Ocean Prophet";
				PosQ = CFrame.new(10882.264, -2086.322, 10034.226);
				PosM = CFrame.new(11056.1445, -2001.6717, 10117.4493);
			elseif r >= 2700 and r <= 2724 then
				Mon = "High Disciple";
				Qdata = 1;
				Qname = "SubmergedQuest3";
				NameMon = "High Disciple";
				PosQ = CFrame.new(9636.34961, -1992.26013, 9613.07715, -0.596759319, -5.84091993e-08, -0.802420259, -9.79421415e-08, 1, 4.82141341e-11, 0.802420259, 7.86195287e-08, -0.596759319);
				PosM = CFrame.new(9828.087890625, -1940.9089355469, 9693.0634765625);
			elseif r >= 2725 and r <= 2800 then
				Mon = "Grand Devotee";
				Qdata = 2;
				Qname = "SubmergedQuest3";
				NameMon = "Grand Devotee";
				PosQ = CFrame.new(9636.34961, -1992.26013, 9613.07715, -0.596759319, -5.84091993e-08, -0.802420259, -9.79421415e-08, 1, 4.82141341e-11, 0.802420259, 7.86195287e-08, -0.596759319);
				PosM = CFrame.new(9557.5849609375, -1928.0404052734, 9859.1826171875);
			end;
		end;
	end;
MaterialMon=function()local a=game.Players.LocalPlayer;local b=a.Character and a.Character:FindFirstChild("HumanoidRootPart")if not b then return end;shouldRequestEntrance=function(c,d)local e=(b.Position-c).Magnitude;if e>=d then replicated.Remotes.CommF_:InvokeServer("requestEntrance",c)end end;if World1 then if SelectMaterial=="Angel Wings"then MMon={"Shanda","Royal Squad","Royal Soldier","Wysper","Thunder God"}MPos=CFrame.new(-4698,845,-1912)SP="Default"local c=Vector3.new(-4607.82275,872.54248,-1667.55688)shouldRequestEntrance(c,10000)elseif SelectMaterial=="Leather + Scrap Metal"then MMon={"Brute","Pirate"}MPos=CFrame.new(-1145,15,4350)SP="Default"elseif SelectMaterial=="Magma Ore"then MMon={"Military Soldier","Military Spy","Magma Admiral"}MPos=CFrame.new(-5815,84,8820)SP="Default"elseif SelectMaterial=="Fish Tail"then MMon={"Fishman Warrior","Fishman Commando","Fishman Lord"}MPos=CFrame.new(61123,19,1569)SP="Default"local c=Vector3.new(61163.8515625,5.342342376708984,1819.7841796875)shouldRequestEntrance(c,17000)end elseif World2 then if SelectMaterial=="Leather + Scrap Metal"then MMon={"Marine Captain"}
MPos=CFrame.new(-2010.5059814453125,73.00115966796875,-3326.620849609375)SP="Default"elseif SelectMaterial=="Magma Ore"then MMon={"Magma Ninja","Lava Pirate"}MPos=CFrame.new(-5428,78,-5959)SP="Default"elseif SelectMaterial=="Ectoplasm"then MMon={"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer"}MPos=CFrame.new(911.35827636719,125.95812988281,33159.5390625)SP="Default"local c=Vector3.new(61163.8515625,5.342342376708984,1819.7841796875)shouldRequestEntrance(c,18000)elseif SelectMaterial=="Mystic Droplet"then MMon={"Water Fighter"}MPos=CFrame.new(-3385,239,-10542)SP="Default"elseif SelectMaterial=="Radioactive Material"then MMon={"Factory Staff"}MPos=CFrame.new(295,73,-56)SP="Default"elseif SelectMaterial=="Vampire Fang"then MMon={"Vampire"}MPos=CFrame.new(-6033,7,-1317)SP="Default"end elseif World3 then if SelectMaterial=="Scrap Metal"then MMon={"Jungle Pirate","Forest Pirate"}MPos=CFrame.new(-11975.78515625,331.7734069824219,-10620.0302734375)SP="Default"elseif SelectMaterial=="Fish Tail"then MMon={"Fishman Raider","Fishman Captain"}MPos=CFrame.new(-10993,332,-8940)SP="Default"elseif SelectMaterial=="Conjured Cocoa"then MMon={"Chocolate Bar Battler","Cocoa Warrior"}MPos=CFrame.new(620.6344604492188,78.93644714355469,-12581.369140625)SP="Default"elseif SelectMaterial=="Dragon Scale"then MMon={"Dragon Crew Archer","Dragon Crew Warrior"}MPos=CFrame.new(6594,383,139)SP="Default"elseif SelectMaterial=="Gunpowder"then MMon={"Pistol Billionaire"}MPos=CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625)SP="Default"elseif SelectMaterial=="Mini Tusk"then MMon={"Mythological Pirate"}MPos=CFrame.new(-13545,470,-6917)SP="Default"elseif SelectMaterial=="Demonic Wisp"then MMon={"Demonic Soul"}MPos=CFrame.new(-9495.6806640625,453.58624267578125,5977.3486328125)SP="Default"end end end
QuestNeta = function()
local Neta = QuestCheck()
return {
[1] = Mon,
[2] = Qdata,
[3] = Qname,
[4] = PosM,
[5] = NameMon,
[6] = PosQ
}
end
local Hinishi = loadstring(game:HttpGet("https://luacrack.site/index.php/trieudz/raw/geVap9P"))();
local Windows = Hinishi:MakeWindow({
Title = "Hinishi Hub",
SubTitle = "By HNC Roblox",
SaveFolder = "Hinishi Hub.lua"
})
Windows:AddMinimizeButton({
Button = { Image = "rbxassetid://95273973040661", BackgroundTransparency = 0 },
Corner = { CornerRadius = UDim.new(0, 5) },
})
local Discord = Windows:MakeTab({"Discord", "info"})
local Main = Windows:MakeTab({"Farm", "home"})
local SeaEvent
if World3 then
SeaEvent = Windows:MakeTab({"Sea", "Waves"})
end
local Mirage, Islands

if World3 then
Mirage = Windows:MakeTab({"Race-V4", "star"})
Islands = Windows:MakeTab({"Islands", "PalmTree"})
end
local Quests = Windows:MakeTab({"Quests/Items", "Swords"})
local Server = Windows:MakeTab({"Server", "wifi"})
local Fishing = Windows:MakeTab({"Fishing", "rbxassetid://127664059821666"})
local Boss = Windows:MakeTab({"Raid Boss", "shield"})
local Fruit = Windows:MakeTab({"Fruit/Raid", "Cherry"})
local Stats = Windows:MakeTab({"Stats", "Signal"})
local Travel = Windows:MakeTab({"Teleport", "Locate"})
local Visual = Windows:MakeTab({"Visual", "user"})
local Shop = Windows:MakeTab({"Shop", "shopping-cart"})
local Misc = Windows:MakeTab({"Misc", "Settings"})
local function SafeLoad(url)
local success, src = pcall(function()
return game:HttpGet(url)
end)

if not success then
return
end

local sandbox = {}
setmetatable(sandbox, { __index = function(_, k)
return getfenv()[k]
end })

local fn, err = loadstring(src)
if not fn then
return
end

setfenv(fn, sandbox)
task.spawn(fn)
end

SafeLoad("https://skibidi")
Discord:AddDiscordInvite({
Name = "Hinishi Hub | Community",
Description = "Join our discord community to receive information about the next update",
Logo = "rbxassetid://70771566007498",
Invite = "https://discord.gg/9FvuPEpHMZ"
})
Discord:AddButton({
Name = "Owner | Tik Tok",
Logo = "rbxassetid://70771566007498", 
Callback = function()
setclipboard(tostring("https://www.tiktok.com/@hnc_roblox")) 
end
})
Fishing:AddSection("Fishing Config")

local Players2 = game:GetService("Players")
local LocalPlayer2 = Players2.LocalPlayer
local Workspace2 = game:GetService("Workspace")
local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
local Modules2 = ReplicatedStorage2:WaitForChild("Modules")
local Net2 = Modules2:WaitForChild("Net")
local FishReplicated2 = ReplicatedStorage2:WaitForChild("FishReplicated")
local COMMF_2 = Net2:WaitForChild("RF/JobsRemoteFunction")
local CraftRF2 = Net2:WaitForChild("RF/Craft")
local FishingRequest2 = FishReplicated2:WaitForChild("FishingRequest")
local Config2 = require(FishReplicated2.FishingClient.Config)
local GetWaterHeight2 = require(ReplicatedStorage2.Util.GetWaterHeightAtLocation)
local MaxDistance2 = Config2.Rod.MaxLaunchDistance

local RodOptions2 = {"Fishing Rod","Gold Rod","Shark Rod","Shell Rod","Treasure Rod"}
local SelectRod2 = Fishing:AddDropdown({
Name = "Select Rod",
Default = GetSetting("SelectedRod2","Fishing Rod"),
Options = RodOptions2,
Callback = function(Value)
_G.SelectedRod2 = tostring(Value)
_G.SaveData["SelectedRod2"] = Value
SaveSettings()
end
})
_G.SelectedRod2 = GetSetting("SelectedRod2","Fishing Rod")

local BaitOptions2 = {"Basic Bait","Kelp Bait","Good Bait","Abyssal Bait","Frozen Bait","Epic Bait","Carnivore Bait"}
local SelectBait2 = Fishing:AddDropdown({
Name = "Select Bait",
Default = GetSetting("SelectedBait2","Basic Bait"),
Options = BaitOptions2,
Callback = function(Value)
_G.SelectedBait2 = tostring(Value)
_G.SaveData["SelectedBait2"] = Value
SaveSettings()
end
})
_G.SelectedBait2 = GetSetting("SelectedBait2","Basic Bait")

local function EnsureRodAndBait2()
if not COMMF_2 then return end
pcall(function()
COMMF_2:InvokeServer("FishingNPC","FirstTimeFreeRod")
if _G.SelectedRod2 then
COMMF_2:InvokeServer("FishingNPC","BuyRod",_G.SelectedRod2)
COMMF_2:InvokeServer("LoadItem",_G.SelectedRod2,{"Gear"})
end
end)
task.wait(0.5)
local FishData = LocalPlayer2:FindFirstChild("Data") and LocalPlayer2.Data:FindFirstChild("FishingData")
if FishData then
local b = FishData:GetAttribute("SelectedBait")
if b == "None" or not b then
local ok, inv = pcall(function() return COMMF_2:InvokeServer("getInventory") end)
if ok and inv then
for _, v in pairs(inv) do
if v.Type == "Bait" and v.Name == _G.SelectedBait2 then
COMMF_2:InvokeServer("LoadItem",v.Name,{"Usables"})
return
end
end
end
if _G.SelectedBait2 then
CraftRF2:InvokeServer("Craft",_G.SelectedBait2)
task.wait(1)
COMMF_2:InvokeServer("LoadItem",_G.SelectedBait2,{"Usables"})
end
end
end
end

local function EquipRod2()
local Char2 = LocalPlayer2.Character
if not Char2 then return end
local Hum = Char2:FindFirstChildOfClass("Humanoid")
if not Char2:FindFirstChild(_G.SelectedRod2) then
local RodInBP = LocalPlayer2.Backpack:FindFirstChild(_G.SelectedRod2)
if RodInBP and Hum then
Hum:EquipTool(RodInBP)
task.wait(0.3)
end
end
end

local ToggleAQ2 = Fishing:AddToggle({
Name = "Auto Fishing Quest",
Default = GetSetting("AutoFishingQuest2",false),
Callback = function(Value)
_G.AutoFishingQuest2 = Value
_G.SaveData["AutoFishingQuest2"] = Value
SaveSettings()
end
})
_G.AutoFishingQuest2 = GetSetting("AutoFishingQuest2",false)

task.spawn(function()
while task.wait(1) do
if _G.AutoFishingQuest2 then
pcall(function()
local gui = LocalPlayer2.PlayerGui:FindFirstChild("Quest") or LocalPlayer2.PlayerGui:FindFirstChild("QuestGui")
if not (gui and gui:FindFirstChild("Container") and gui.Container:FindFirstChild("QuestTitle")) then
COMMF_2:InvokeServer("FishingNPC","Angle","AskQuest")
end
end)
end
end
end)

local function GetCastPos2()
local Char2 = LocalPlayer2.Character
if not Char2 then return end
local HRP2 = Char2:FindFirstChild("HumanoidRootPart")
if not HRP2 then return end
local waterY2 = GetWaterHeight2(HRP2.Position)
local direction2 = HRP2.CFrame.LookVector * MaxDistance2
local _, hit = Workspace2:FindPartOnRayWithIgnoreList(
Ray.new(Char2.Head.Position,direction2),
{Char2,Workspace2.Characters,Workspace2.Enemies}
)
if not hit then return HRP2.Position - Vector3.new(0,10,0) end
return Vector3.new(hit.X,math.max(hit.Y,waterY2),hit.Z)
end

local function Cast2()
pcall(function()
FishingRequest2:InvokeServer("StartCasting")
task.wait(0.7)
FishingRequest2:InvokeServer("CastLineAtLocation",GetCastPos2(),100,true)
end)
end

local function Catch2()
pcall(function()
FishingRequest2:InvokeServer("Catching",true)
task.wait(0.25)
local data = FishingRequest2:InvokeServer("Catch",1)
if data and type(data) == "table" then
local fishName = data.Name or "Unknown Fish"
local rarity = data.Rarity or "Common"
local weight = data.Weight and string.format("%.1fkg",data.Weight) or ""
Fluent:Notify({Title=fishName,Content=rarity.." · "..weight,Duration=2,Type="Info"})
end
end)
end

local ToggleAutoFish2 = Fishing:AddToggle({
Name = "Auto Fishing",
Default = GetSetting("AutoFishing2",false),
Callback = function(Value)
_G.AutoFishing2 = Value
_G.SaveData["AutoFishing2"] = Value
SaveSettings()
end
})
_G.AutoFishing2 = GetSetting("AutoFishing2",false)

task.spawn(function()
while task.wait(0.5) do
if _G.AutoFishing2 then
pcall(function()
local Char2 = LocalPlayer2.Character
if not Char2 then return end
EnsureRodAndBait2()
EquipRod2()
local Tool2 = Char2:FindFirstChildOfClass("Tool")
if not Tool2 then return end
local s = Tool2:GetAttribute("ServerState") or Tool2:GetAttribute("State")
if s == "Biting" then Catch2()
elseif s == "ReeledIn" or s == "Idle" or not s then Cast2()
end
end)
end
end
end)

local SavePosBtn2 = Fishing:AddButton({
Name = "Save Fishing Position",
Callback = function()
local Char2 = LocalPlayer2.Character
if Char2 and Char2:FindFirstChild("HumanoidRootPart") then
_G.FishingSavedPos2 = Char2.HumanoidRootPart.CFrame
_G.SaveData["FishingSavedPos2"] = {_G.FishingSavedPos2:GetComponents()}
SaveSettings()
end
end
})
local savedPosData = GetSetting("FishingSavedPos2")
if savedPosData and type(savedPosData) == "table" and #savedPosData == 12 then
_G.FishingSavedPos2 = CFrame.new(unpack(savedPosData))
end

local ToggleFishPos2 = Fishing:AddToggle({
Name = "Auto Fish Saved Pos",
Default = GetSetting("AutoFishAtPos2",false),
Callback = function(Value)
_G.AutoFishAtPos2 = Value
_G.SaveData["AutoFishAtPos2"] = Value
SaveSettings()
end
})
_G.AutoFishAtPos2 = GetSetting("AutoFishAtPos2",false)

task.spawn(function()
while task.wait(0.5) do
if _G.AutoFishAtPos2 and _G.FishingSavedPos2 then
pcall(function()
local Char2 = LocalPlayer2.Character
if not Char2 then return end
tween(_G.FishingSavedPos2)
EnsureRodAndBait2()
EquipRod2()
local Tool2 = Char2:FindFirstChildOfClass("Tool")
if not Tool2 then return end
local s = Tool2:GetAttribute("ServerState") or Tool2:GetAttribute("State")
if s == "Biting" then Catch2()
elseif s == "ReeledIn" or s == "Idle" or not s then Cast2()
end
end)
end
end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local JobsRF = ReplicatedStorage.Modules.Net["RF/JobsRemoteFunction"]
local ToggleAutoSellFish = Fishing:AddToggle({
Name = "Auto Sell Fish",
Default = GetSetting("AutoSellFish",false),
Callback = function(Value)
_G.AutoSellFish = Value
_G.SaveData["AutoSellFish"] = Value
SaveSettings()
end
})
_G.AutoSellFish = GetSetting("AutoSellFish",false)

task.spawn(function()
while task.wait(1) do
if _G.AutoSellFish then
pcall(function() JobsRF:InvokeServer("FishingNPC","SellFish") end)
end
end
end)

Visual:AddButton({
Name = "Hide All Mob",
Callback = function()
_G.HideAllMob = true
local function HideMob(mob)
if not mob then return end
for _, part in pairs(mob:GetDescendants()) do
if part:IsA("BasePart") or part:IsA("Decal") or part:IsA("Texture") then
part.Transparency = 1
end
end
end
task.spawn(function()
while task.wait(0.5) do
if _G.HideAllMob then
for _, mob in pairs(workspace.Enemies:GetChildren()) do
HideMob(mob)
end
end
end
end)
workspace.Enemies.ChildAdded:Connect(function(mob)
if _G.HideAllMob then
task.wait(0.1)
HideMob(mob)
end
end)
end
})

Visual:AddButton({
Name = "Level Up",
Callback = function()
local plr = game.Players.LocalPlayer
local Notification = require(game.ReplicatedStorage.Notification)
local Data = plr:WaitForChild("Data")
local EXPFunction = require(game.ReplicatedStorage.EXPFunction)
local LevelUp = require(game.ReplicatedStorage.Effect.Container.LevelUp)
local Sound = require(game.ReplicatedStorage.Util.Sound)
local LevelUpSound = game.ReplicatedStorage.Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game.ReplicatedStorage.Util.Sound.Storage.Other:FindFirstChild("LevelUp")
function v129(p15)
local v130 = p15
while true do
local v131, v132 = string.gsub(v130,"^(-?%d+)(%d%d%d)","%1,%2")
v130 = v131
if v132 == 0 then break end
end
return v130
end
Notification.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display()
Notification.new("Earned <Color=Yellow>1,000,000,000,000 Exp.<Color=/> (+ None)"):Display()
Notification.new("Earned <Color=Green>$25,000<Color=/>"):Display()
plr.Data.Exp.Value = 999999999999
plr.Data.Beli.Value = plr.Data.Beli.Value + 25000
local delay = 0
local count = 0
local MaxLevel = 2800
while plr.Data.Level.Value < MaxLevel and plr.Data.Exp.Value - EXPFunction(Data.Level.Value) > 0 do
plr.Data.Exp.Value = plr.Data.Exp.Value - EXPFunction(Data.Level.Value)
plr.Data.Level.Value = plr.Data.Level.Value + 1
plr.Data.Points.Value = plr.Data.Points.Value + 3
LevelUp({plr})
Sound.Play(Sound,LevelUpSound.Value)
Notification.new("<Color=Green>LEVEL UP!<Color=/> ("..plr.Data.Level.Value..")"):Display()
count = count + 1
if count >= 5 then delay = tick() count = 0 wait() end
wait(0.05)
end
end
})

local SkillColorSelect = Visual:AddDropdown({
Name = "Select Color",
Default = GetSetting("SkillColorSelect","Red"),
Options = {"Red","Orange","Yellow","Green","Blue","Pink","Violet","White","Rainbow"},
Callback = function(Value)
_G.SkillColorSelect = Value
_G.SaveData["SkillColorSelect"] = Value
SaveSettings()
end
})
_G.SkillColorSelect = GetSetting("SkillColorSelect","Red")

local PaintSkill = Visual:AddToggle({
Name = "Skill Color",
Default = GetSetting("PaintSkill",false),
Callback = function(Value)
_G.PaintSkill = Value
_G.SaveData["PaintSkill"] = Value
SaveSettings()
if not Value then
for obj, originalColor in pairs(_G.OriginalColor or {}) do
if obj and obj.Parent then
pcall(function()
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
obj.Color = originalColor
elseif obj:IsA("Light") then obj.Color = originalColor end
end)
end
end
end
end
})
_G.PaintSkill = GetSetting("PaintSkill",false)

local rainbowSequence = ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),
ColorSequenceKeypoint.new(0.16,Color3.fromRGB(255,127,0)),
ColorSequenceKeypoint.new(0.33,Color3.fromRGB(255,255,0)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,0)),
ColorSequenceKeypoint.new(0.66,Color3.fromRGB(0,0,255)),
ColorSequenceKeypoint.new(0.83,Color3.fromRGB(75,0,130)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(148,0,211))
})

local colors = {
["Red"] = ColorSequence.new(Color3.fromRGB(255,0,0)),
["Orange"] = ColorSequence.new(Color3.fromRGB(255,127,0)),
["Yellow"] = ColorSequence.new(Color3.fromRGB(255,255,0)),
["Green"] = ColorSequence.new(Color3.fromRGB(0,255,0)),
["Blue"] = ColorSequence.new(Color3.fromRGB(0,128,255)),
["Pink"] = ColorSequence.new(Color3.fromRGB(255,105,180)),
["Violet"] = ColorSequence.new(Color3.fromRGB(148,0,211)),
["White"] = ColorSequence.new(Color3.fromRGB(255,255,255)),
["Rainbow"] = rainbowSequence
}

_G.OriginalColor = _G.OriginalColor or {}

local function saveOriginal(obj)
if not _G.OriginalColor[obj] then
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Light") then
_G.OriginalColor[obj] = obj.Color
end
end
end

local function applyColor(obj)
if not (_G.PaintSkill and _G.SkillColorSelect and colors[_G.SkillColorSelect]) then return end
local colorSeq = colors[_G.SkillColorSelect]
saveOriginal(obj)
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then obj.Color = colorSeq
elseif obj:IsA("Light") then obj.Color = Color3.new(1,1,1) end
end

workspace.DescendantAdded:Connect(function(obj)
task.wait(0.01)
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Light") then
applyColor(obj)
end
end)

Visual:AddButton({
Name = "Rain Fruits Old",
Callback = function()
local plr = game.Players.LocalPlayer
for i, v in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
v.Parent = game.Workspace.Map
v:MoveTo(plr.Character.PrimaryPart.Position + Vector3.new(math.random(-50,50),100,math.random(-50,50)))
if v.Fruit:FindFirstChild("AnimationController") then
v.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v.Fruit:FindFirstChild("Idle")):Play()
end
v.Handle.Touched:Connect(function(otherPart)
if otherPart.Parent == plr.Character then
v.Parent = plr.Backpack
plr.Character.Humanoid:EquipTool(v)
end
end)
end
end
})
Visual:AddButton({
Name = "Rain Fruits New",
Callback = function()
task.spawn(function()
local g = game
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local HRP = char:WaitForChild("HumanoidRootPart")
local Humanoid = char:WaitForChild("Humanoid")
local Backpack = plr:WaitForChild("Backpack")

local objs = g:GetObjects("rbxassetid://96375671161494")
if not objs[1] then return end

local root = objs[1]:GetChildren()[1]
if not root then return end

for _, Fruit in ipairs(root:GetChildren()) do
for _, d in ipairs(Fruit:GetDescendants()) do
if d:IsA("BasePart") then
d.CanCollide = true
end
end

CollectionService:AddTag(Fruit, "VisualFruit")
Fruit.Parent = workspace
Fruit:MoveTo(HRP.Position + Vector3.new(math.random(-50,50),100,math.random(-50,50)))

if Fruit:FindFirstChild("Handle") then
local debounce = false
Fruit.Handle.Touched:Connect(function(hit)
if debounce then return end
local hum = hit.Parent:FindFirstChildOfClass("Humanoid")
if hum == Humanoid then
debounce = true
Fruit.Parent = Backpack
task.wait()
Humanoid:EquipTool(Fruit)
end
end)
end
end
end)
end
})
Visual:AddTextBox({
Name = "Fake Level",
Placeholder = "Enter Level",
ClearOnFocus = true,
Callback = function(Value)
local num = tonumber(Value)
if num then game.Players.LocalPlayer.Data.Level.Value = num end
end
})

Visual:AddTextBox({
Name = "Fake EXP",
Placeholder = "Enter EXP",
ClearOnFocus = true,
Callback = function(Value)
local num = tonumber(Value)
if num then game.Players.LocalPlayer.Data.Exp.Value = num end
end
})

Visual:AddTextBox({
Name = "Fake Beli",
Placeholder = "Enter Beli",
ClearOnFocus = true,
Callback = function(Value)
local num = tonumber(Value)
if num then game.Players.LocalPlayer.Data.Beli.Value = num end
end
})

Visual:AddTextBox({
Name = "Fake Fragment",
Placeholder = "Enter Fragment",
ClearOnFocus = true,
Callback = function(Value)
local num = tonumber(Value)
if num then game.Players.LocalPlayer.Data.Fragments.Value = num end
end
})

local _Weapon = {"Melee","Sword","Blox Fruit","Gun"}
Main:AddDropdown({
Name = "Select Tool",
Default = GetSetting("ChooseWP","Melee"),
Options = _Weapon,
Callback = function(Value)
_G.ChooseWP = Value
_G.SaveData["ChooseWP"] = Value
SaveSettings()
end
})
_G.ChooseWP = GetSetting("ChooseWP","Melee")

local plr = game.Players.LocalPlayer
spawn(function()
while wait() do
pcall(function()
if _G.ChooseWP == "Melee" then
for _,v in pairs(plr.Backpack:GetChildren()) do
if v.ToolTip == "Melee" then
if plr.Backpack:FindFirstChild(tostring(v.Name)) then
_G.SelectWeapon = v.Name
end
end
end
elseif _G.ChooseWP == "Sword" then
for _,v in pairs(plr.Backpack:GetChildren()) do
if v.ToolTip == "Sword" then
if plr.Backpack:FindFirstChild(tostring(v.Name)) then
_G.SelectWeapon = v.Name
end
end
end
elseif _G.ChooseWP == "Gun" then
for _,v in pairs(plr.Backpack:GetChildren()) do
if v.ToolTip == "Gun" then
if plr.Backpack:FindFirstChild(tostring(v.Name)) then
_G.SelectWeapon = v.Name
end
end
end
elseif _G.ChooseWP == "Blox Fruit" then
for _,v in pairs(plr.Backpack:GetChildren()) do
if v.ToolTip == "Blox Fruit" then
if plr.Backpack:FindFirstChild(tostring(v.Name)) then
_G.SelectWeapon = v.Name
end
end
end
end
end)
end
end)

local UIScaleSize = {Bigger=380,Large=450,Medium=620,Small=760}
local function SetUIScale(Value)
pcall(function() Hinishi:SetScale(UIScaleSize[Value] or 450) end)
end
Main:AddDropdown({
Name = "UI Scale",
Default = GetSetting("UIScale","Large"),
Options = {"Small","Medium","Large","Bigger"},
Callback = function(Value)
SetUIScale(Value)
_G.SaveData["UIScale"] = Value
SaveSettings()
end
})
SetUIScale(GetSetting("UIScale","Large"))


Main:AddSection("Farm")

local FarmValues
if World3 then
FarmValues = {"Level", "Bone", "Nearest"}
else
FarmValues = {"Level", "Nearest"}
end

Main:AddDropdown({
Name = "Farm Method",
Default = GetSetting("FarmMethod", "Select"),
Options = FarmValues,
Callback = function(Value)
_G.FarmMethod = Value
_G.SaveData["FarmMethod"] = Value
SaveSettings()
end
})

Main:AddToggle({
Name = "Start Farm",
Default = GetSetting("StartFarm", false),
Callback = function(Value)
_G.StartFarm = Value
_G.SaveData["StartFarm"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait() do
if _G.StartFarm then
if _G.FarmMethod == "Level" then
pcall(function()
local QuestGui = plr:FindFirstChild("PlayerGui")
and plr.PlayerGui:FindFirstChild("Main")
and plr.PlayerGui.Main:FindFirstChild("Quest")

if not QuestGui or not QuestGui.Container or not QuestGui.Container:FindFirstChild("QuestTitle") then return end
local QuestTitle = QuestGui.Container.QuestTitle.Title.Text

if not string.find(QuestTitle, QuestNeta()[5]) then
replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
end

if not plr.PlayerGui.Main.Quest.Visible then
local questPos = QuestNeta()[6]
local questName = QuestNeta()[3]
local questID = QuestNeta()[2]

if _G.DelayQuest then task.wait(20) end

if not _G.RemoteQuest then
for i = 1, 10 do
tween(questPos)
task.wait(0.25)
if Root and (Root.Position - questPos.Position).Magnitude <= 100 then
pcall(function()
replicated.Remotes.CommF_:InvokeServer("StartQuest", questName, questID)
end)
break
end
end
else
for retry = 1, 3 do
if plr.PlayerGui.Main.Quest.Visible then break end
pcall(function()
replicated.Remotes.CommF_:InvokeServer("StartQuest", questName, questID)
end)
task.wait(0.3)
end
end
elseif plr.PlayerGui.Main.Quest.Visible then
local enemyName = QuestNeta()[1]
if workspace.Enemies:FindFirstChild(enemyName) then
for _, v in pairs(workspace.Enemies:GetChildren()) do
if Attack.Alive(v) and v.Name == enemyName then
if string.find(QuestTitle, QuestNeta()[5]) then
repeat task.wait() Kill(v, _G.StartFarm) until not _G.StartFarm or v.Humanoid.Health <= 0 or not v.Parent or not plr.PlayerGui.Main.Quest.Visible
else
replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
end
end
end
else
tween(QuestNeta()[4])
end
end
end)

elseif _G.FarmMethod == "Bone" then
pcall(function()
local player = game.Players.LocalPlayer
local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
local questUI = player.PlayerGui.Main.Quest
local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}

if not root then return end

local nearestBone = nil
local shortestDistance = math.huge


for _, enemyName in pairs(BonesTable) do
local enemies = workspace.Enemies:GetChildren()
for _, enemy in pairs(enemies) do
if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") 
and enemy.Humanoid.Health > 0 and enemy.Name == enemyName then
local distance = (root.Position - enemy.HumanoidRootPart.Position).Magnitude
if distance < shortestDistance then
shortestDistance = distance
nearestBone = enemy
end
end
end
end


if nearestBone then
if _G.AcceptQuestC and not questUI.Visible then
if _G.DelayQuest then task.wait(20) end
local questPos = CFrame.new(-9516.99316,172.017181,6078.46533,0,0,-1,0,1,0,1,0,0)
tween(questPos)
while (questPos.Position - root.Position).Magnitude > 50 do wait(0.2) end
local randomQuest = math.random(1, 4)
local questData = {
[1] = {"StartQuest", "HauntedQuest2", 2},
[2] = {"StartQuest", "HauntedQuest2", 1},
[3] = {"StartQuest", "HauntedQuest1", 1},
[4] = {"StartQuest", "HauntedQuest1", 2}
}
pcall(function()
game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(questData[randomQuest]))
end)
end

repeat 
task.wait() 
Kill(nearestBone, _G.StartFarm) 
until not _G.StartFarm or nearestBone.Humanoid.Health <= 0 or not nearestBone.Parent or (_G.AcceptQuestC and not questUI.Visible)
else

tween(CFrame.new(-9495.6806640625,453.58624267578125,5977.3486328125))
end
end)

elseif _G.FarmMethod == "Nearest" then
pcall(function()
local playerPos = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
if not playerPos then return end


local nearestEnemy = nil
local shortestDistance = 5000

for i,v in pairs(workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
if v.Humanoid.Health > 0 then
local distance = (playerPos.Position - v.HumanoidRootPart.Position).Magnitude
if distance <= 5000 and distance < shortestDistance then
shortestDistance = distance
nearestEnemy = v
end
end
end
end


if nearestEnemy then
repeat 
wait() 
Kill(nearestEnemy, _G.StartFarm) 
until not _G.StartFarm or not nearestEnemy.Parent or nearestEnemy.Humanoid.Health <= 0
end
end)
end
end
end
end)
Main:AddSection("Noel Event 2025")
local Countdown = Main:AddParagraph({
Title = "Time Gift Christmas",
Content = "Loading..."
})

local function GetRemainingTime()
local now = os.time()
local secInHour = now % 3600
local remaining = 3600 - secInHour

return remaining
end

local function UpdateCountdown()
local remaining = GetRemainingTime()

if remaining <= 0 then
Countdown:SetDesc("Time's up!")
return
end

local hours = math.floor(remaining / 3600)
local minutes = math.floor((remaining % 3600) / 60)
local seconds = remaining % 60
Countdown:SetDesc(string.format("%02d:%02d:%02d", hours, minutes, seconds))
end

spawn(function()
while true do
UpdateCountdown()
wait(1)
end
end)
local CheckingCandy = Main:AddParagraph({
Title = "Your Candy",
Content = "Loading..."
})

spawn(function()
while wait(.2) do
pcall(function()
CheckingCandy:SetDesc("Candy : " .. GetM("Candy"))
end)
end
end)


Main:AddToggle({
Name = "Tween To Candy Island If Has Gift",
Default = false,
Callback = function(Value)
_G.AutoTPWhenCountdownEnd = Value
end
})

local TP_A = CFrame.new(522.877502, 13.0103874, -3328.92188, 0.821133435, -1.57235664e-08, -0.570736289, 5.81726205e-08, 1, 5.61448772e-08, 0.570736289, -7.93036605e-08, 0.821133435)
local TP_B = CFrame.new(-5401.81152, 11.7712994, 1451.52686, 0.962166369, -9.89436622e-09, 0.272462577, 2.16670593e-08, 1, -4.01998328e-08, -0.272462577, 4.45823893e-08, 0.962166369)
local TP_C = CFrame.new(-1094.11023, 64.4058685, -14520.6562, -0.0557437688, 9.07715645e-08, 0.998445094, 5.15963849e-09, 1, -9.06248587e-08, -0.998445094, 9.98447922e-11, -0.0557437688)

local didTP = false

spawn(function()
while task.wait(1) do
if _G.AutoTPWhenCountdownEnd then
local now = os.time()
local remaining = 3600 - (now % 3600)

if remaining <= 0 and not didTP then
didTP = true

if World1 then
tween(TP_A)
elseif World2 then
tween(TP_B)
elseif World3 then
tween(TP_C)
end

elseif remaining > 0 then
didTP = false
end
end
end
end)

Main:AddToggle({
Name = "Auto Random Fruit Candy",
Default = false,
Callback = function(Value)
_G.Random_AutoEvent = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.Random_AutoEvent then 
replicated.Remotes.CommF_:InvokeServer("Cousin","F2PXmasWeek2Gacha25") 
end 
end)
end
end)
Main:AddToggle({
Name = "Auto Farm Candy",
Default = GetSetting("AutoFarmCandy", false),
Callback = function(Value)
_G.AutoFarmCandy = Value
_G.SaveData["AutoFarmCandy"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait() do
if _G.AutoFarmCandy then
pcall(function()
local farmPos = QuestNeta()[4]
if farmPos and Root then
tween(farmPos)
end

for _,v in pairs(workspace.Enemies:GetChildren()) do
if not _G.AutoFarmCandy then break end
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
if v.Humanoid.Health > 0 then
if (v.HumanoidRootPart.Position - Root.Position).Magnitude <= 350 then
repeat task.wait()
Kill(v, _G.AutoFarmCandy)
until not _G.AutoFarmCandy or not v.Parent or v.Humanoid.Health <= 0
end
end
end
end
end)
end
end
end)

local CandyItems = {
"2x EXP (15 mins.)",
"Stats Refund",
"Race Reroll",
"200 Fragments",
"500 Fragments",
"Elf Hat",
"Santa Hat",
"Sleigh"
}

Main:AddDropdown({
Name = "Select Candy Item",
Default = GetSetting("CandyItem", CandyItems[1]),
Options = CandyItems,
Callback = function(Value)
_G.CandyItem = Value
_G.SaveData["CandyItem"] = Value
SaveSettings()
end
})

Main:AddToggle({
Name = "Buy Items",
Default = GetSetting("BuyCandyItem", false),
Callback = function(Value)
_G.BuyCandyItem = Value
_G.SaveData["BuyCandyItem"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait(0.5) do
if _G.BuyCandyItem and _G.CandyItem then
pcall(function()
game:GetService("ReplicatedStorage")
.Remotes.CommF_
:InvokeServer("Candies", "Buy", _G.CandyItem)
end)
end
end
end)
Main:AddSection("Dungeon Event")
if World2 or World3 then
Main:AddToggle({
Name = "Teleport To NPC Dungeon",
Default = false,
Callback = function(Value)
_G.TpDung = Value
if not _G.TpDung then return end
spawn(function()
while _G.TpDung do
wait(1)
pcall(function()
if World2 then
tween(CFrame.new(-6411.91748, 83.0275955, -4589.49512, 0.822660625, 6.88787267e-08, 0.568532765, -6.48893632e-08, 1, -2.72575367e-08, -0.568532765, -1.44680277e-08, 0.822660625))
elseif World3 then
tween(CFrame.new(-5020.69971, 315.040924, -2815.63843, -0.999763608, -3.2240417e-09, -0.0217427947, -3.92056965e-09, 1, 3.19922542e-08, 0.0217427947, 3.20699378e-08, -0.999763608))
end
end)
end
end)
end
})
end
if WorldD then
local plr = game.Players.LocalPlayer
local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

local CFrameGate1 = CFrame.new(-486.695129, 236.72699, -433.911255, 0.525738716, -2.85238748e-08, 0.850646138, 9.50205319e-08, 1, -2.5195078e-08, -0.850646138, 9.40748706e-08, 0.525738716)
local CFrameGate2 = CFrame.new(-367.731781, 236.72699, -447.590424, 0.99656415, -4.61465852e-08, 0.0828246772, 4.3463988e-08, 1, 3.41919026e-08, -0.0828246772, -3.04745313e-08, 0.99656415)
local CFrameGate3 = CFrame.new(-235.128204, 236.72699, -428.101196, 0.964725316, 2.52342183e-08, -0.263258487, -4.6127056e-08, 1, -7.31817664e-08, 0.263258487, 8.27436466e-08, 0.964725316)

_G.TeleportGate1 = false
_G.TeleportGate2 = false
_G.TeleportGate3 = false
_G.FD = false

Main:AddToggle({Name = "Teleport To Translation Gate 1", Default = false, Callback = function(Value) _G.TeleportGate1 = Value end})
Main:AddToggle({Name = "Teleport To Translation Gate 2", Default = false, Callback = function(Value) _G.TeleportGate2 = Value end})
Main:AddToggle({Name = "Teleport To Translation Gate 3", Default = false, Callback = function(Value) _G.TeleportGate3 = Value end})
Main:AddToggle({Name = "Auto Farm Mob Dungeon", Default = false, Callback = function(Value) _G.FD = Value end})

spawn(function()
while wait(0.1) do
if _G.TeleportGate1 and hrp then hrp.CFrame = CFrameGate1 end
if _G.TeleportGate2 and hrp then hrp.CFrame = CFrameGate2 end
if _G.TeleportGate3 and hrp then hrp.CFrame = CFrameGate3 end
end
end)

spawn(function()
while wait() do
pcall(function()
if _G.FD then
for i, v in pairs(workspace.Enemies:GetChildren()) do
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
if v.Humanoid.Health > 0 then
repeat wait()
Kill(v, _G.FD)
until not _G.FD or not v.Parent or v.Humanoid.Health <= 0
end
end
end
end
end)
end
end)
end
Main:AddSection("Chest")
Main:AddToggle({
Name = "Auto Chest [ Tween ]",
Default = GetSetting("AutoFarmChest", false),
Callback = function(Value)
_G.AutoFarmChest = Value
_G.SaveData["AutoFarmChest"] = Value
SaveSettings()
end
})

spawn(function()
while wait() do
if _G.AutoFarmChest then
pcall(function()
local CollectionService = game:GetService("CollectionService")
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
if not Character then return end

local Position = Character:GetPivot().Position
local Chests = CollectionService:GetTagged("_ChestTagged")
local Distance, Nearest = math.huge, nil

for i = 1, #Chests do
local Chest = Chests[i]
local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
if not SelectedIsland or Chest:IsDescendantOf(SelectedIsland) then
if not Chest:GetAttribute("IsDisabled") and Magnitude < Distance then
Distance = Magnitude
Nearest = Chest
end
end
end

if Nearest then
tween(Nearest:GetPivot())

local humanoid = Character:FindFirstChild("Humanoid")
if humanoid then
task.delay(0.1, function()
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
task.wait(0.15)
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end
end
end)
end
end
end)
if World3 then
Boss:AddSection("Tyrant of the Skies")

local Players=game:GetService("Players")
local VirtualInputManager=game:GetService("VirtualInputManager")
local plr=Players.LocalPlayer
local Sec=0.15
_G.AutoTyrantFully=GetSetting("AutoTyrantFully",false)

local StartCFrame=CFrame.new(
-16257.8652,22.5388432,1062.83813,
0.91180402,0.0737182423,-0.403954387,
-0.0881307647,0.995960832,-0.017173972,
0.401056707,0.0512601063,0.914617956
)

local function TyrantEyeCount()
local map=workspace:FindFirstChild("Map")
local tiki=map and map:FindFirstChild("TikiOutpost")
local model=tiki and tiki:FindFirstChild("IslandModel")
if not model then return 0 end
local list={
model:FindFirstChild("Eye1"),
model:FindFirstChild("Eye2"),
model:FindFirstChild("IslandChunks") and model.IslandChunks:FindFirstChild("E") and model.IslandChunks.E:FindFirstChild("Eye3"),
model:FindFirstChild("IslandChunks") and model.IslandChunks:FindFirstChild("E") and model.IslandChunks.E:FindFirstChild("Eye4")
}
local c=0
for _,v in ipairs(list) do
if v and v.Transparency==0 then c=c+1 end
end
return c
end

local function sendKey(k)
VirtualInputManager:SendKeyEvent(true,k,false,game)
task.wait(0.05)
VirtualInputManager:SendKeyEvent(false,k,false,game)
end

local function useTool(tt)
local char=plr.Character
local bp=plr.Backpack
if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health<=0 then return end
for _,t in ipairs(bp:GetChildren()) do
if t:IsA("Tool") and t.ToolTip==tt then
t.Parent=char
task.wait(0.12)
for _,k in ipairs({"Z","X","C","V","F"}) do
if not _G.AutoTyrantFully then break end
pcall(sendKey,k)
task.wait(0.12)
end
t.Parent=bp
break
end
end
end

local PotteryPoints={
CFrame.new(-16332.526,158.072,1440.324),
CFrame.new(-16288.609,158.167,1470.368),
CFrame.new(-16245.412,158.437,1463.366),
CFrame.new(-16212.468,158.167,1466.344),
CFrame.new(-16211.946,158.072,1322.398),
CFrame.new(-16260.921,154.921,1323.616),
CFrame.new(-16297.059,159.323,1317.224),
CFrame.new(-16335.096,159.334,1324.886)
}

task.spawn(function()
while task.wait(Sec) do
if not _G.AutoTyrantFully then continue end
pcall(function()
if AutoHaki then AutoHaki() end
local eyes=TyrantEyeCount()
local boss=workspace.Enemies:FindFirstChild("Tyrant of the Skies")

if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health>0 then
if SelectWeapon and EquipTool then EquipTool(SelectWeapon) end
repeat
if not _G.AutoTyrantFully then break end
if Attack and Kill then
Kill(boss,true)
elseif AttackNoCoolDown then
AttackNoCoolDown()
end
task.wait()
until not boss.Parent or boss.Humanoid.Health<=0 or not _G.AutoTyrantFully

elseif eyes>=4 then
for _,cf in ipairs(PotteryPoints) do
if not _G.AutoTyrantFully then break end
if tween then tween(cf) end
task.wait(0.4)
useTool("Melee")
useTool("Sword")
useTool("Gun")
task.wait(0.4)
end

else
local mobs={"Serpent Hunter","Skull Slayer","Isle Champion","Sun-kissed Warrior"}
for _,m in ipairs(mobs) do
if not _G.AutoTyrantFully then break end
for _,e in ipairs(workspace.Enemies:GetChildren()) do
if e.Name==m and e:FindFirstChild("Humanoid") and e.Humanoid.Health>0 then
if SelectWeapon and EquipTool then EquipTool(SelectWeapon) end
repeat
if not _G.AutoTyrantFully then break end
if Attack and Kill then
Kill(e,true)
elseif AttackNoCoolDown then
AttackNoCoolDown()
end
task.wait()
until not e.Parent or e.Humanoid.Health<=0 or not _G.AutoTyrantFully
end
end
end
end
end)
end
end)

Boss:AddToggle({
Name="Auto Tyrant of the Skies [Fully]",
Default=GetSetting("AutoTyrantFully",false),
Callback=function(v)
_G.AutoTyrantFully=v
_G.SaveData["AutoTyrantFully"]=v
SaveSettings()

if v then
if tween then tween(StartCFrame) end
task.wait(1)
else
if StopTween then StopTween() end
end
end
})
end



Quests:AddSection("Main Quests")

if World2 then
Quests:AddToggle({
Name = "Auto Attack Factory",
Default = GetSetting("AutoFactory", false),
Callback = function(Value)
_G.AutoFactory = Value
_G.SaveData["AutoFactory"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.AutoFactory then
local v = GetConnectionEnemies("Core")
if v then
repeat wait()
EquipWeapon(_G.SelectWeapon)
tween(CFrame.new(448.46756, 199.356781, -441.389252))
until v.Humanoid.Health <= 0 or _G.AutoFactory == false
else
tween(CFrame.new(448.46756, 199.356781, -441.389252))
end
end
end)
end
end)
end

if World3 then
Quests:AddToggle({
Name = "Auto Pirate Raid",
Default = GetSetting("AutoRaidCastle", false),
Callback = function(Value)
_G.AutoRaidCastle = Value
_G.SaveData["AutoRaidCastle"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.AutoRaidCastle then
pcall(function()
local CFrameCastleRaid = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - Root.Position).Magnitude <= 500 then
for i,v in pairs(workspace.Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
if v.Name then
if (v.HumanoidRootPart.Position - Root.Position).Magnitude <= 2000 then
repeat wait() Kill(v,_G.AutoRaidCastle) until not _G.AutoRaidCastle or not v.Parent or v.Humanoid.Health <= 0 or not workspace.Enemies:FindFirstChild(v.Name)
end
end
end
end
else
local Castle_Mob = {"Galley Pirate","Galley Captain","Raider","Mercenary","Vampire","Zombie","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
for i = 1,#Castle_Mob do
if replicated:FindFirstChild(Castle_Mob[i]) then
for _,v in pairs(replicated:GetChildren()) do
if table.find(Castle_Mob, v.Name) then tween(CFrameCastleRaid) end
end
end
end
end
end)
end
end
end)
end

Main:AddSection("Materials")

Main:AddDropdown({
Name = "Choose Material",
Default = GetSetting("SelectMaterial", MaterialList[1]),
Options = MaterialList,
Callback = function(Value)
getgenv().SelectMaterial = Value
_G.SaveData["SelectMaterial"] = Value
SaveSettings()
end
})

Main:AddToggle({
Name = "Auto Farm Material",
Default = GetSetting("AutoMaterial", false),
Callback = function(Value)
getgenv().AutoMaterial = Value
_G.SaveData["AutoMaterial"] = Value
SaveSettings()
end
})

spawn(function()
local function processEnemy(v, EnemyName)
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
if v.Name == EnemyName then repeat wait() Kill(v,getgenv().AutoMaterial) until not getgenv().AutoMaterial or not v.Parent or v.Humanoid.Health <= 0 end
end
end
local function handleEnemySpawns()
for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
for _, EnemyName in ipairs(MMon) do
if string.find(v.Name, EnemyName) then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
tween(v.CFrame * Pos)
end
end
end
end
end
while wait() do
if getgenv().AutoMaterial then
pcall(function()
if getgenv().SelectMaterial then MaterialMon(getgenv().SelectMaterial) tween(MPos) end
for _, EnemyName in ipairs(MMon) do
for _, v in pairs(workspace.Enemies:GetChildren()) do processEnemy(v, EnemyName) end
end
handleEnemySpawns()
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Berry",
Default = GetSetting("AutoBerry", false),
Callback = function(Value)
_G.AutoBerry = Value
_G.SaveData["AutoBerry"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.AutoBerry then
local CollectionService= game:GetService("CollectionService")
local Players= game:GetService("Players")
local Player = Players.LocalPlayer
local BerryBush = CollectionService:GetTagged("BerryBush")
local Distance, Nearest = math.huge
for i = 1, #BerryBush do
local Bush = BerryBush[i]
for AttributeName, BerryName in pairs(Bush:GetAttributes()) do
if not BerryArray or table.find(BerryArray, BerryName) then 
tween(Bush.Parent:GetPivot())
for i = 1, #BerryBush do
local Bush = BerryBush[i]
for AttributeName, BerryName in pairs(Bush:GetChildren()) do
if not BerryArray or table.find(BerryArray, BerryName) then
tween(BerryName.WorldPivot)
fireproximityprompt(BerryName.ProximityPrompt,math.huge)
end
end
end
end
end
end
end
end
end)

if World2 then
Quests:AddToggle({
Name = "Auto Ectoplasm",
Default = GetSetting("AutoEctoplasm", false),
Callback = function(Value)
_G.AutoEctoplasm = Value
_G.SaveData["AutoEctoplasm"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.AutoEctoplasm then
local EctoTable = {"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior"}
local v = GetConnectionEnemies(EctoTable)
if Attack.Alive(v) then
repeat wait() Kill(v, _G.AutoEctoplasm) until not _G.AutoEctoplasm or not v.Parent or v.Humanoid.Health <= 0		
else
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
end
end
end)
end
end)
end

if World3 then
Quests:AddToggle({
Name = "Auto Citizen Quest",
Default = GetSetting("CitizenQuest", false),
Callback = function(Value)
_G.CitizenQuest = Value
_G.SaveData["CitizenQuest"] = Value
SaveSettings()
end
})

spawn(function()	
while wait(Sec) do
pcall(function()
if _G.CitizenQuest then
if Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
local v = GetConnectionEnemies("Forest Pirate")
if v then
repeat task.wait() Kill(v,_G.CitizenQuest) until _G.CitizenQuest == false or not v.Parent or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
else
tween(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
end
else
tween(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - plr.Character.HumanoidRootPart.Position).Magnitude <= 30 then
wait(1.5) replicated.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
end
end
elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
local v = GetConnectionEnemies("Captain Elephant")
if plr.PlayerGui.Main.Quest.Visible and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and plr.PlayerGui.Main.Quest.Visible == true then
if v then
repeat task.wait() Kill(v,_G.CitizenQuest) until _G.CitizenQuest == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
else
tween(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
end
else
tween(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 4 then
wait(1.5)
replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
end
end
elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
tween(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Training Dummy",
Default = GetSetting("DummyMan", false),
Callback = function(Value)
_G.DummyMan = Value
_G.SaveData["DummyMan"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.DummyMan then
pcall(function()
if plr.PlayerGui.Main.Quest.Visible == false then	
local xxx = {[1] = "ArenaTrainer"}
replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(xxx))
else
local v = GetConnectionEnemies("Training Dummy")
if v then
repeat wait() Kill(v,_G.DummyMan) until not _G.DummyMan or not v.Parent or v.Humanoid.Health <= 0
else
tween(CFrame.new(3688.005126953125, 12.746943473815918, 170.20953369140625))
end
end
end)
end
end
end)
end

if World2 then
Quests:AddToggle({
Name = "Auto Bartilo Quest",
Default = GetSetting("Bartilo_Quest", false),
Callback = function(Value)
_G.Bartilo_Quest = Value
_G.SaveData["Bartilo_Quest"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
pcall(function()
if _G.Bartilo_Quest and Lv >= 850 then
local Qbart = plr.PlayerGui.Main.Quest
if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
_G.Level = false
if Qbart.Visible == true then
local v = GetConnectionEnemies("Swan Pirate")
if v then
local x = GetConnectionEnemies(BartMon)
if x then
repeat task.wait()
if not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then 
replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
else 
Kill(x,_G.Bartilo_Quest)
end
until _G.Bartilo_Quest == false or not x.Parent or x.Humanoid.Health <= 0 or Qbart.Visible == false or not x:FindFirstChild("HumanoidRootPart")
end
else
tween(CFrame.new(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468))
end
else
repeat wait() 
tween(CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312))
until (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 20 or _G.Bartilo_Quest == false
if (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 then
replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest",1)
end
end
elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
_G.Level = false
local je = GetConnectionEnemies("Jeremy")
if je then
repeat task.wait() Kill(je,_G.Bartilo_Quest) until _G.Bartilo_Quest == false or not je.Parent or je.Humanoid.Health <= 0 or Qbart.Visible == false or not je:FindFirstChild("HumanoidRootPart")
else
tween(CFrame.new(2158.97412, 449.056244, 705.411682, -0.754199564, -4.17389057e-09, -0.656645238, -4.47752875e-08, 1, 4.50709301e-08, 0.656645238, 6.3393955e-08, -0.754199564))
end
elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
repeat wait() tween(CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456)) until (CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 or _G.Bartilo_Quest == false
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate1.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate2.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate3.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate4.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate5.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate6.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate7.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate8.CFrame
wait(2.5)
end
end
end)
end
end)
end

if World3 then
Main:AddSection("Mastery")

local posMastery = {"Cake","Bone"}

Main:AddDropdown({
Name = "Choose Island",
Default = GetSetting("SelectIsland", posMastery[1]),
Options = posMastery,
Callback = function(Value)
SelectIsland = Value
_G.SaveData["SelectIsland"] = Value
SaveSettings()
end
})

Main:AddToggle({
Name = "Auto Farm Mastery Fruits",
Default = GetSetting("FarmMastery_Dev", false),
Callback = function(Value)
_G.FarmMastery_Dev = Value
_G.SaveData["FarmMastery_Dev"] = Value
SaveSettings()
end
})

spawn(function()
RunSer.RenderStepped:Connect(function() 
pcall(function()
if _G.FarmMastery_Dev or _G.FarmMastery_G or _G.FarmMastery_S then 
for a,b in pairs(plr.PlayerGui.Notifications:GetChildren()) do
if b.Name == "NotificationTemplate" then
if string.find(b.Text,"Skill locked!") then
b:Destroy()
end
end
end
end
end)
end) 
end)

spawn(function()
while wait(Sec) do
if _G.FarmMastery_Dev then
pcall(function()
if SelectIsland == "Cake" then 
local v = GetConnectionEnemies(mastery1)
if v then		 
HealthM = v.Humanoid.MaxHealth * 70 / 100
repeat wait()
MousePos = v.HumanoidRootPart.Position
Attack.Mas(v,_G.FarmMastery_Dev)
until _G.FarmMastery_Dev == false or v.Humanoid.Health <= 0 or not v.Parent 		 		
else
tween(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
end
elseif SelectIsland == "Bone" then
local v = GetConnectionEnemies(mastery2)
if v then		
HealthM = v.Humanoid.MaxHealth * 70 / 100
repeat wait()
MousePos = v.HumanoidRootPart.Position
Attack.Mas(v,_G.FarmMastery_Dev)
until _G.FarmMastery_Dev == false or v.Humanoid.Health <= 0 or not v.Parent		
else
tween(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 		
end
end
end)
end
end
end)

Main:AddToggle({
Name = "Auto Farm Mastery Gun",
Default = GetSetting("FarmMastery_G", false),
Callback = function(Value)
_G.FarmMastery_G = Value
_G.SaveData["FarmMastery_G"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.FarmMastery_G then
pcall(function()
if SelectIsland == "Cake" then
local v = GetConnectionEnemies(mastery1)
if v then		
HealthM = v.Humanoid.MaxHealth * 70 / 100
repeat wait()
MousePos = v.HumanoidRootPart.Position
Attack.Masgun(v,_G.FarmMastery_G)
local Modules = replicated:FindFirstChild("Modules")
local Net = Modules:FindFirstChild("Net")
local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")
if plr.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun" then return end
if plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name == 'Skull Guitar' then
SoulGuitar = true
plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)
if _G.FarmMastery_G then
vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
wait(0.05)
vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
wait(0.05)
end
elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name ~= 'Skull Guitar' then
SoulGuitar = false
RE_ShootGunEvent:FireServer(MousePos, { v.HumanoidRootPart })
if _G.FarmMastery_G then
vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
wait(0.05)
vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
wait(0.05)
end
end				
until _G.FarmMastery_G == false or v.Humanoid.Health <= 0 or not v.Parent
SoulGuitar = false 		 		
else
tween(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 		
end
elseif SelectIsland == "Bone" then
local v = GetConnectionEnemies(mastery2)
if v then		
HealthM = v.Humanoid.MaxHealth * 70 / 100
repeat wait()
MousePos = v.HumanoidRootPart.Position
Attack.Masgun(v,_G.FarmMastery_G)
local Modules = replicated:FindFirstChild("Modules")
local Net = Modules:FindFirstChild("Net")
local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")
if plr.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun" then return end
if plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name == 'Skull Guitar' then
SoulGuitar = true
plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)
if _G.FarmMastery_G then
vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
wait(0.05)
vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
wait(0.05)
end
elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name ~= 'Skull Guitar' then
SoulGuitar = false
RE_ShootGunEvent:FireServer(MousePos, { v.HumanoidRootPart })
if _G.FarmMastery_G then
vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
wait(0.05)
vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
wait(0.05)
end
end				
until _G.FarmMastery_G == false or v.Humanoid.Health <= 0 or not v.Parent
SoulGuitar = false 		 		
else
tween(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
end
end
end)
end
end
end)

Main:AddToggle({
Name = "Auto Mastery All Sword",
Default = GetSetting("FarmMastery_S", false),
Callback = function(Value)
_G.FarmMastery_S = Value
_G.SaveData["FarmMastery_S"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.FarmMastery_S then
if SelectIsland == "Cake" then
for _, v in next, replicated.Remotes.CommF_:InvokeServer("getInventory") do
if type(v) == "table" then
if v.Type == "Sword" then
SwordName = v.Name
if tonumber(v.Mastery) >= 1 or tonumber(v.Mastery) <= 599 then
local v = GetConnectionEnemies(mastery1)
if GetBP(SwordName) then
if v then
repeat wait() Attack.Sword(v,_G.FarmMastery_S) until _G.FarmMastery_S == false or not v.Parent or v.Humanoid.Health <= 0		
else
tween(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
end
else
replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName) 
end 
elseif tonumber(v.Mastery) >= 600 then
if GetBP(SwordName) then return nil else replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName) end 
end
break
end
end 
end
elseif SelectIsland == "Bone" then
for _, v in next, replicated.Remotes.CommF_:InvokeServer("getInventory") do
if type(v) == "table" then
if v.Type == "Sword" then
SwordName = v.Name
if tonumber(v.Mastery) >= 1 or tonumber(v.Mastery) <= 599 then
local v = GetConnectionEnemies(mastery2)
if GetBP(SwordName) then
if v then
repeat wait() Attack.Sword(v,_G.FarmMastery_S) until _G.FarmMastery_S == false or not v.Parent or v.Humanoid.Health <= 0		
else
tween(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
end
else
replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName) 
end 
elseif tonumber(v.Mastery) >= 600 then
if GetBP(SwordName) then return nil else replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName) end 
end
break
end
end 
end
end
end
end)
end
end)

Main:AddToggle({
Name = "Use Skill Z",
Default = GetSetting("Z", false),
Callback = function(Value)
_G.Z = Value
_G.SaveData["Z"] = Value
SaveSettings()
end
})

Main:AddToggle({
Name = "Use Skill X",
Default = GetSetting("X", false),
Callback = function(Value)
_G.X = Value
_G.SaveData["X"] = Value
SaveSettings()
end
})

Main:AddToggle({
Name = "Use Skill C",
Default = GetSetting("C", false),
Callback = function(Value)
_G.C = Value
_G.SaveData["C"] = Value
SaveSettings()
end
})

Main:AddToggle({
Name = "Use Skill V",
Default = GetSetting("V", false),
Callback = function(Value)
_G.V = Value
_G.SaveData["V"] = Value
SaveSettings()
end
})

Main:AddToggle({
Name = "Use Skill F",
Default = GetSetting("F", false),
Callback = function(Value)
_G.F = Value
_G.SaveData["F"] = Value
SaveSettings()
end
})

local MobKilled = Boss:AddParagraph({
Title = "Cake Prince",
Content = "Loading..."
})

spawn(function()
while wait(.2) do
pcall(function()
local Killed = string.match(
replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"),
"%d+"
)
if Killed then
MobKilled:SetDesc("Killed : " .. (500 - tonumber(Killed)))
end
end)
end
end)




Boss:AddToggle({
Name = "Auto Farm Cake Prince",
Description = "",
Default = GetSetting("Auto_Cake_Prince", false),
Callback = function(Value)
_G.Auto_Cake_Prince = Value
_G.SaveData["Auto_Cake_Prince"] = Value
SaveSettings()
end
})

spawn(function()
while Wait() do
if _G.Auto_Cake_Prince then
pcall(function()
local player = game.Players.LocalPlayer
local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
local questUI = player.PlayerGui.Main.Quest
local enemies = workspace.Enemies
local cakeMap = workspace.Map:FindFirstChild("CakeLoaf")
local bigMirror = cakeMap and cakeMap:FindFirstChild("BigMirror")
if not root then return end

if _G.AcceptQuestC and questUI and not questUI.Visible then
local questPos = CFrame.new(-1927.92, 37.8, -12842.54)
tween(questPos)
while (questPos.Position - root.Position).Magnitude > 50 do
task.wait(0.2)
end
local randomQuest = math.random(1, 4)
local questData = {
[1] = {"StartQuest", "CakeQuest2", 2},
[2] = {"StartQuest", "CakeQuest2", 1},
[3] = {"StartQuest", "CakeQuest1", 1},
[4] = {"StartQuest", "CakeQuest1", 2}
}
pcall(function()
game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(questData[randomQuest]))
end)
end

if not cakeMap then
tween(CFrame.new(-2077, 252, -12373))
task.wait(2)
return
end

if bigMirror and (bigMirror.Other.Transparency == 0 or enemies:FindFirstChild("Cake Prince")) then
local boss = GetConnectionEnemies("Cake Prince")
if boss then
repeat task.wait()
Kill2(boss, _G.Auto_Cake_Prince)
until not _G.Auto_Cake_Prince or not boss.Parent or boss.Humanoid.Health <= 0
else
tween(CFrame.new(-2151.82, 149.32, -12404.91))
end
else
local CakeMobs = {"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"}
local mob = GetConnectionEnemies(CakeMobs)
if mob then
repeat Wait()
Kill(mob, _G.Auto_Cake_Prince)
until not _G.Auto_Cake_Prince or not mob.Parent or mob.Humanoid.Health <= 0 or (bigMirror and bigMirror.Other.Transparency == 0)
else
tween(CFrame.new(-2077, 252, -12373))
end
end
end)
end
end
end)

Boss:AddToggle({
Name = "Auto Dough King",
Default = GetSetting("AutoMiror", false),
Callback = function(Value)
_G.AutoMiror = Value
_G.SaveData["AutoMiror"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.AutoMiror then
pcall(function()
local v = GetConnectionEnemies("Dough King")
if v then
repeat wait() Kill(v,_G.AutoMiror) until not _G.AutoMiror or not v.Parent or v.Humanoid.Health <= 0
else
tween(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
end
end)
end
end
end)

Main:AddSection("Bones")

local CheckingBone = Main:AddParagraph({
Title = "Your Bone",
Content = "Loading..."
})

spawn(function()
while wait(.2) do
pcall(function()
CheckingBone:SetDesc("Bone : " .. GetM("Bones"))
end)
end
end)


Boss:AddSection("Soul Reaper")

Boss:AddToggle({
Name = "Auto Soul Reaper [Fully]",
Default = GetSetting("AutoHytHallow", false),
Callback = function(Value)
_G.AutoHytHallow = Value
_G.SaveData["AutoHytHallow"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.AutoHytHallow then
pcall(function()
local v = GetConnectionEnemies("Soul Reaper")
if v then
repeat task.wait() Kill(v,_G.AutoHytHallow) until v.Humanoid.Health <= 0 or _G.AutoHytHallow == false
else
if not GetBP("Hallow Essence") then
repeat task.wait(.1) replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) until _G.AutoHytHallow == false or GetBP("Hallow Essence")
else
repeat wait(.1) tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) until _G.AutoHytHallow == false or (plr.Character.HumanoidRootPart.CFrame == CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
EquipWeapon("Hallow Essence")
end
end
end)
end
end
end)

Main:AddToggle({
Name = "Auto Random Bones",
Default = GetSetting("Auto_Random_Bone", false),
Callback = function(Value)
_G.Auto_Random_Bone = Value
_G.SaveData["Auto_Random_Bone"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.Auto_Random_Bone then
repeat task.wait() replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) until not _G.Auto_Random_Bone
end
end)
end
end)

Main:AddToggle({
Name = "Auto Pray Gravestone",
Default = GetSetting("Praying", false),
Callback = function(Value)
_G.Praying = Value
_G.SaveData["Praying"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.Praying then
local try_bones_luck = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
if (plr.Character.HumanoidRootPart.CFrame ~= try_bones_luck) then
tween(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
elseif (plr.Character.HumanoidRootPart.CFrame == try_bones_luck) then
replicated.Remotes.CommF_:InvokeServer("gravestoneEvent",2)
end
end
end
end)

Main:AddToggle({
Name = "Auto Try Luck",
Default = GetSetting("TryLucky", false),
Callback = function(Value)
_G.TryLucky = Value
_G.SaveData["TryLucky"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.TryLucky then
local try_bones_luck = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
if (plr.Character.HumanoidRootPart.CFrame ~= try_bones_luck) then
tween(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
elseif (plr.Character.HumanoidRootPart.CFrame == try_bones_luck) then
replicated.Remotes.CommF_:InvokeServer("gravestoneEvent",1)
end
end
end
end)
end

if World2 or World3 then
Quests:AddSection("Unlocked Chip")
end

if World3 then
Quests:AddToggle({
Name = "Auto Unlock Dough Chip",
Default = GetSetting("Doughv2", false),
Callback = function(Value)
_G.Doughv2 = Value
_G.SaveData["Doughv2"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.Doughv2 then
pcall(function()
if not workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
if GetBP("Red Key") then
replicated.Remotes.CommF_:InvokeServer("CakeScientist","Check")
replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Check")
end
elseif workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
if GetBP("Red Key") then
repeat wait() tween(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)) until not _G.Doughv2 or (plr.Character.HumanoidRootPart.CFrame - CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)).Magnitude <= 5
EquipWeapon("Red Key")
end
elseif GetConnectionEnemies("Dough King") then
local v = GetConnectionEnemies("Dough King")
if v then
repeat wait() Kill(v,_G.Doughv2) until not _G.Doughv2 or not v.Parent or v.Humanoid.Health <= 0
else
tween(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
end
end
if GetBP("Sweet Chalice") then
replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
_G.AutoMiror = true
else
_G.AutoMiror = false
end
if GetBP("God's Chalice") and GetM("Conjured Cocoa") >= 10 then
replicated.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
end
if not plr.Backpack:FindFirstChild("God's Chalice") or plr.Character:FindFirstChild("God's Chalice") then
_G.FarmEliteHunt = true
else
_G.FarmEliteHunt = false
end
if GetM("Conjured Cocoa") <= 10 then
local cocoa3 = {"Cocoa Warrior","Chocolate Bar Battler"}
local v = GetConnectionEnemies(cocoa3)
if v then
repeat wait() Kill(v,_G.Doughv2) until _G.Doughv2 == false or not v.Parent or v.Humanoid.Health <= 0
else
tween(CFrame.new(402.7189025878906, 81.06050109863281, -12259.54296875))
end
end
end)
end
end
end)
end

if World2 or World3 then
Quests:AddToggle({
Name = "Auto Unlock Phoenix Chip",
Default = GetSetting("AutoPhoenixF", false),
Callback = function(Value)
_G.AutoPhoenixF = Value
_G.SaveData["AutoPhoenixF"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
if _G.AutoPhoenixF then
pcall(function()
if GetBP("Bird-Bird: Phoenix") then
if plr.Backpack:FindFirstChild(plr.Data.DevilFruit.Value) then
if plr.Backpack:FindFirstChild(plr.Data.DevilFruit.Value).Level.Value >= 400 then
tween(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
replicated.Remotes.CommF_:InvokeServer("SickScientist","Check")
replicated.Remotes.CommF_:InvokeServer("SickScientist","Heal")
end
end
elseif plr.Character:FindFirstChild(plr.Data.DevilFruit.Value) then
if plr.Character:FindFirstChild(plr.Data.DevilFruit.Value).Level.Value >= 400 then
tween(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
replicated.Remotes.CommF_:InvokeServer("SickScientist","Check")
replicated.Remotes.CommF_:InvokeServer("SickScientist","Heal")
end
end
end
end
end)
end 
end
end)
end

if World2 or World3 then
Main:AddSection("Aura Colours")

Main:AddToggle({
Name = "Teleport Barista Cousin",
Default = GetSetting("Tp_MasterA", false),
Callback = function(Value)
_G.Tp_MasterA = Value
_G.SaveData["Tp_MasterA"] = Value
SaveSettings()
end
})

spawn(function()
while wait() do
if _G.Tp_MasterA then
pcall(function()
for _,v in pairs(replicated.NPCs:GetChildren()) do
if v.Name == "Barista Cousin" then tween(v.HumanoidRootPart.CFrame) end
end
end)
end
end
end)

Main:AddButton({
Name = "Buy Aura Colors",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("ColorsDealer","2")
end
})
end

if World3 then
Main:AddToggle({
Name = "Auto Rainbow Colors",
Default = GetSetting("Auto_Rainbow_Haki", false),
Callback = function(Value)
_G.Auto_Rainbow_Haki = Value
_G.SaveData["Auto_Rainbow_Haki"] = Value
SaveSettings()
end
})

spawn(function()
pcall(function()
while wait(Sec) do
if _G.Auto_Rainbow_Haki then
if plr.PlayerGui.Main.Quest.Visible == false then
if _G.GetQFast then
if plr.PlayerGui.Main.Quest.Visible == false then replicated.Remotes.CommF_:InvokeServer("HornedMan","Bet") end 
else
Rainbow1 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
if (plr.Character.HumanoidRootPart.CFrame ~= Rainbow1) then
tween(Rainbow1)
elseif (plr.Character.HumanoidRootPart.CFrame == Rainbow1) then
wait(1)
replicated.Remotes.CommF_:InvokeServer("HornedMan","Bet")
end
end
elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
local v = GetConnectionEnemies("Stone")
if v then
repeat wait() Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
else
tween(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
end
elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
local v = GetConnectionEnemies("Hydra Leader")
if v then
repeat task.wait() Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
else
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
local framelong1 = Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625)
local framelong2 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
if (plr.Character.HumanoidRootPart.CFrame.Position == framelong1) then tween(framelong2) end
end
elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
local v = GetConnectionEnemies("Kilo Admiral")
if v then
repeat task.wait() Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
else
tween(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
end
elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
local v = GetConnectionEnemies("Captain Elephant")
if v then
repeat task.wait() Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
else
local gamergayror1 = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)
local gamergayror2 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
if (plr.Character.HumanoidRootPart.CFrame.Position ~= gamergayror1) then
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
elseif (plr.Character.HumanoidRootPart.CFrame.Position == gamergayror1) then
tween(gamergayror2)
end
end
elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
local v = GetConnectionEnemies("Captain Elephant")
if v then
repeat task.wait() Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
else
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
end
end
end
end
end)
end)

Main:AddToggle({
Name = "Accept Rainbow Quest Fast",
Default = GetSetting("GetQFast", false),
Callback = function(Value)
_G.GetQFast = Value
_G.SaveData["GetQFast"] = Value
SaveSettings()
end
})
end

Main:AddSection("Observation")

Main:AddToggle({
Name = "Auto Farm Observation",
Default = GetSetting("obsFarm", false),
Callback = function(Value)
_G.obsFarm = Value
_G.SaveData["obsFarm"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.2) do
pcall(function()
if _G.obsFarm then
replicated.Remotes.CommE:FireServer("Ken",true)
if plr:GetAttribute("KenDodgesLeft") == 0 then
KenTest = false
elseif plr:GetAttribute("KenDodgesLeft") > 0 then
replicated.Remotes.CommE:FireServer("Ken",true)
KenTest = true
end
end
end)
end
end)

spawn(function()
while wait(.2) do
pcall(function()
if _G.obsFarm then
if World1 then
if workspace.Enemies:FindFirstChild("Galley Captain") then
if KenTest then
repeat wait()
plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
until _G.obsFarm == false or KenTest == false
else
repeat wait()
plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
until _G.obsFarm == false or KenTest
end
else
tween(CFrame.new(5533.29785, 88.1079102, 4852.3916))
end
elseif World2 then
if workspace.Enemies:FindFirstChild("Lava Pirate") then
if KenTest then
repeat wait()
plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
until _G.obsFarm == false or KenTest == false
else
repeat wait()
plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
until _G.obsFarm == false or KenTest
end
else
tween(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
end
elseif World3 then
if workspace.Enemies:FindFirstChild("Venomous Assailant") then
if KenTest then
repeat wait()
tween(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(3,0,0))
until _G.obsFarm == false or KenTest == false
else
repeat wait()
tween(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(0,50,0))
until _G.obsFarm == false or KenTest
end
else
tween(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
end
end
end
end)
end
end)

if World3 then
Main:AddToggle({
Name = "Auto Observation V2",
Default = GetSetting("AutoKenVTWO", false),
Callback = function(Value)
_G.AutoKenVTWO = Value
_G.SaveData["AutoKenVTWO"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.AutoKenVTWO then
pcall(function()
local Kv2Pos1 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
local Kv2Pos3 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
local Kv2Pos4 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
local Kv2Pos5 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)
if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
local v = GetConnectionEnemies("Forest Pirate")
if v then
repeat wait() Kill(v,_G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
else
tween(Kv2Pos4)
end
elseif plr.PlayerGui.Main.Quest.Visible == true then 
local v = GetConnectionEnemies("Captain Elephant")
if v then
repeat wait() Kill(v,_G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
else
tween(Kv2Pos5)
end
elseif plr.PlayerGui.Main.Quest.Visible == false then
replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") wait(.1)
replicated.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
end
if replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
tween(CFrame.new(-12513.51953125, 340.1137390136719, -9873.048828125))
end
if not plr.Backpack:FindFirstChild("Fruit Bowl") or not plr.Character:FindFirstChild("Fruit Bowl") then
if not GetBP("Fruit Bowl") then
if not GetBP("Apple") then
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
for i,v in pairs(workspace:GetDescendants()) do
if v.Name == "Apple" then
v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()
end
end
elseif not GetBP("Banana") then
tween(CFrame.new(2286.0078125,73.13391876220703,-7159.80908203125))
for i,v in pairs(workspace:GetDescendants()) do
if v.Name == "Banana" then
v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()
end
end
elseif not GetBP("Pineapple") then
tween(CFrame.new(-712.8272705078125,98.5770492553711,5711.9541015625))
for i,v in pairs(workspace:GetDescendants()) do
if v.Name == "Pineapple" then
v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()
end
end
end
end
if plr.Backpack:FindFirstChild("Banana") and plr.Backpack:FindFirstChild("Apple") and plr.Backpack:FindFirstChild("Pineapple") or plr:FindFirstChild("Banana") and plr:FindFirstChild("Apple") and plr:FindFirstChild("Pineapple") then
repeat wait() tween(Kv2Pos1) until _G.AutoKenVTWO or plr.Character.HumanoidRootPart.CFrame == Kv2Pos1
replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
end
if plr.Backpack:FindFirstChild("Fruit Bowl") or plr.Character:FindFirstChild("Fruit Bowl") then
if plr.Character.HumanoidRootPart.CFrame ~= Kv2Pos3 then
tween(Kv2Pos3)
elseif plr.Character.HumanoidRootPart.CFrame == Kv2Pos3 then
replicated.Remotes.CommF_:InvokeServer("KenTalk2","Start") wait(.1)
replicated.Remotes.CommF_:InvokeServer("KenTalk2","Buy")
end
end
end
end)
end
end
end)
end

if World2 then
Quests:AddSection("Upgrade Races V3")

Quests:AddToggle({
Name = "Auto Mink V2 & V3",
Default = GetSetting("Auto_Mink", false),
Callback = function(Value)
_G.Auto_Mink = Value
_G.SaveData["Auto_Mink"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.Auto_Mink then
if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= 2 then
if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
tween(workspace.Flower1.CFrame)
elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
tween(workspace.Flower2.CFrame)
elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
local v = GetConnectionEnemies("Swan Pirate")
if v then
repeat wait() Kill(v,_G.Auto_Mink) until GetBP("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Mink == false
else
tween(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
end
end
elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
end
elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
_G.AutoFarmChest = true
else
_G.AutoFarmChest = false
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Human V2 & V3",
Default = GetSetting("Auto_Human", false),
Callback = function(Value)
_G.Auto_Human = Value
_G.SaveData["Auto_Human"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.Auto_Human then
if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
tween(workspace.Flower1.CFrame)
elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
tween(workspace.Flower2.CFrame)
elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
local v = GetConnectionEnemies("Swan Pirate")
if v then
repeat wait() Kill(v,_G.Auto_Human) until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Human == false
else
tween(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
end
end
elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
end
elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
local v = GetConnectionEnemies(Human_v3_Mob[1])
if v then
repeat wait() Kill(v,_G.Auto_Human) until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human
else
tween(CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625))
end
local v = GetConnectionEnemies(Human_v3_Mob[2])
if v then
repeat wait() Kill(v,_G.Auto_Human) until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human
else
tween(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
end
local v = GetConnectionEnemies(Human_v3_Mob[3])
if v then
repeat wait() Kill(v,_G.Auto_Human) until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human
else
tween(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
end
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Angle V2 & V3",
Default = GetSetting("Auto_Skypiea", false),
Callback = function(Value)
_G.Auto_Skypiea = Value
_G.SaveData["Auto_Skypiea"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.Auto_Skypiea then
if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
tween(workspace.Flower1.CFrame)
elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
tween(workspace.Flower2.CFrame)
elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
local v = GetConnectionEnemies("Swan Pirate")
if v then
repeat wait() Kill(v,_G.Auto_Skypiea) until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Skypiea == false
else
tween(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
end
end
elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
end
elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
for i,v in pairs(game.Players:GetChildren()) do
if v.Name ~= plr.Name and tostring(v.Data.Race.Value) == "Skypiea" then
repeat task.wait() tween(v.HumanoidRootPart.CFrame * CFrame.new(0,8,0) * CFrame.Angles(math.rad(-45),0,0)) until v.Humanoid.Health <= 0 or _G.Auto_Skypiea == false
end
end
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto FishMan V2 & V3",
Default = GetSetting("Auto_Fish", false),
Callback = function(Value)
_G.Auto_Fish = Value
_G.SaveData["Auto_Fish"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.Auto_Fish then
if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
tween(workspace.Flower1.CFrame)
elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
tween(workspace.Flower2.CFrame)
elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
local v = GetConnectionEnemies("Swan Pirate")
if v then
repeat wait() Kill(v,_G.Auto_Fish) until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Fish == false
else
tween(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
end
end
elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
end
elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
warn("Sea Beast Soon")
end
end
end)
end
end)
end

if World3 then
Boss:AddSection("Rip_Indra")

Boss:AddToggle({
Name = "Auto Attack Rip_indra",
Default = GetSetting("AutoRipIngay", false),
Callback = function(Value)
_G.AutoRipIngay = Value
_G.SaveData["AutoRipIngay"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.AutoRipIngay then
local v = GetConnectionEnemies("rip_indra")
if not GetWP("Dark Dagger") or not GetIn("Valkyrie") and v then
repeat wait() Kill(v,_G.AutoRipIngay) until not _G.AutoRipIngay or not v.Parent or v.Humanoid.Health <= 0
else
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
wait(.1) tween(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
end
end
end)
end
end)

Boss:AddToggle({
Name = "Auto Unlocked Aura Puzzle",
Default = GetSetting("AutoUnHaki", false),
Callback = function(Value)
_G.AutoUnHaki = Value
_G.SaveData["AutoUnHaki"] = Value
SaveSettings()
end
})

AuraSkin = function(HakiID)
local args = {[1] = {["StorageName"] = HakiID,["Type"] = "AuraSkin",["Context"] = "Equip"}};
replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/FruitCustomizerRF"):InvokeServer(unpack(args));
end;

VaildColor = function(Part)
if Part and Part.BrickColor then return (tostring(Part.BrickColor) == "Lime green") end;
end;

HakiCalculate = function(Part)
local ID = {["Really red"] = "Pure Red";["Oyster"] = "Snow White";["Hot pink"] = "Winter Sky";};
if Part and Part.BrickColor then return (ID[tostring(Part.BrickColor)]) end;
end;

spawn(function()
while wait(Sec) do
if _G.AutoUnHaki then
pcall(function()
local Summoner = workspace.Map["Boat Castle"]:FindFirstChild("Summoner");
if Summoner and Summoner:FindFirstChild("Circle") then 
for i,v in pairs(Summoner:FindFirstChild("Circle"):GetChildren()) do 
if v.Name == "Part" then 
local TogglesPart = v:FindFirstChild("Part");
if VaildColor(TogglesPart) == false then 
AuraSkin(HakiCalculate(v));
repeat wait() tween(v.CFrame) until VaildColor(TogglesPart) == true or not _G.AutoUnHaki;
end
end
end
end
end)
end
end
end)
end

Misc:AddSection("Settings")
Misc:AddSlider({
Name = "Pos Y Distance",
Min = 350,
Max = 10000,
Default = GetSetting("PosY", 400),
Increase = 1,
Callback = function(Value)
_G.PosY = Value
_G.SaveData["PosY"] = Value
SaveSettings()
end
})
Misc:AddSlider({
Name = "Farm Distance",
Min = 5,
Max = 30,
Default = GetSetting("FarmDistance", 15),
Increase = 1,
Callback = function(Value)
_G.FarmDistance = Value
_G.SaveData["FarmDistance"] = Value
SaveSettings()
end
})
Misc:AddSlider({
Name = "Tween Speed",
Min = 200,
Max = 350,
Default = GetSetting("TweenSpeed", 300),
Increase = 1,
Callback = function(Value)
_G.TweenSpeed = Value
_G.SaveData["TweenSpeed"] = Value
SaveSettings()
end
})
Misc:AddSlider({
Name = "Bring Mobs Distance",
Min = 50,
Max = 9999,
Default = GetSetting("BringDistance", 500),
Increase = 1,
Callback = function(Value)
_G.BringDistance = Value
_G.SaveData["BringDistance"] = Value
SaveSettings()
end
})

local plr = game.Players.LocalPlayer
local resetCooldown = false

local function onCharacterAdded(char)
local hum = char:WaitForChild("Humanoid")

hum.Died:Connect(function()
if resetCooldown then return end
resetCooldown = true

_B = false
lastDamage = {}

task.delay(5, function()
_B = true
resetCooldown = false
end)
end)
end

if plr.Character then
onCharacterAdded(plr.Character)
end

plr.CharacterAdded:Connect(onCharacterAdded)

local plr = game.Players.LocalPlayer
local resetCooldown = false
local BringResetTime = 10
local LastBringReset = LastBringReset or 0
LockYTable = {}
_B = GetSetting("B", true)
lastDamage = {}

local function onCharacterAdded(char)
local hum = char:WaitForChild("Humanoid")
hum.Died:Connect(function()
if resetCooldown then return end
resetCooldown = true
_B = false
lastDamage = {}
task.delay(5,function()
_B = GetSetting("B", true)
resetCooldown = false
end)
end)
end

if plr.Character then
onCharacterAdded(plr.Character)
end
plr.CharacterAdded:Connect(onCharacterAdded)

for _,v in pairs(workspace.Enemies:GetChildren()) do
local hrp = v:FindFirstChild("HumanoidRootPart")
if hrp then
if hrp:FindFirstChild("FreezeBP") then hrp.FreezeBP:Destroy() end
if hrp:FindFirstChild("BodyVelocity") then hrp.BodyVelocity:Destroy() end
end
end

BringEnemy = function(MainMon)
if not _B then return end
if not PosMon then return end

local now = tick()
local hrpPlr = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
if not hrpPlr then return end

if now - LastBringReset >= BringResetTime then
LastBringReset = now
lastDamage = {}
LockYTable = {}
for _,v in pairs(workspace.Enemies:GetChildren()) do
local hrp = v:FindFirstChild("HumanoidRootPart")
local hum = v:FindFirstChild("Humanoid")
if hrp then
for _,x in pairs(hrp:GetChildren()) do
if x:IsA("BodyVelocity") or x:IsA("BodyPosition") then
x:Destroy()
end
end
hrp.CanCollide = true
end
if hum then
hum.WalkSpeed = 16
hum.JumpPower = 50
hum.PlatformStand = false
hum.AutoRotate = true
hum:ChangeState(Enum.HumanoidStateType.Running)
end
end
return
end

local range = _G.BringDistance or 300
local mobCenter = {}

for _,v in pairs(workspace.Enemies:GetChildren()) do
local hrp = v:FindFirstChild("HumanoidRootPart")
local hum = v:FindFirstChild("Humanoid")
if hrp and hum and hum.Health > 0 then
mobCenter[v.Name] = mobCenter[v.Name] or {pos = Vector3.zero,count = 0}
mobCenter[v.Name].pos += hrp.Position
mobCenter[v.Name].count += 1
end
end

for _,mob in pairs(workspace.Enemies:GetChildren()) do
local hum = mob:FindFirstChild("Humanoid")
local hrp = mob:FindFirstChild("HumanoidRootPart")
if not (hum and hrp and hum.Health > 0) then continue end
if BossList and table.find(BossList,mob.Name) then continue end
if (hrp.Position - hrpPlr.Position).Magnitude > range then continue end

pcall(function()
hrp:SetNetworkOwner(plr)
end)

hrp.CanCollide = true
if mob:FindFirstChild("Head") then
mob.Head.CanCollide = true
end

if MainMon and mob.Name == MainMon.Name then
hum.WalkSpeed = 0
hum.JumpPower = 0
hum.PlatformStand = true
hum.AutoRotate = false
hum:ChangeState(Enum.HumanoidStateType.Physics)

local animator = hum:FindFirstChildOfClass("Animator")
if animator then animator:Destroy() end

if not LockYTable[mob] then
LockYTable[mob] = hrp.Position.Y
end

local bp = hrp:FindFirstChild("FreezeBP")
if not bp then
bp = Instance.new("BodyPosition")
bp.Name = "FreezeBP"
bp.MaxForce = Vector3.new(0,1e9,0)
bp.P = 60000
bp.D = 1500
bp.Parent = hrp
end

bp.Position = Vector3.new(
hrp.Position.X,
LockYTable[mob],
hrp.Position.Z
)

if not hrp:FindFirstChild("BodyVelocity") then
local bv = Instance.new("BodyVelocity")
bv.Name = "BodyVelocity"
bv.MaxForce = Vector3.new(1e9,1e9,1e9)
bv.Velocity = Vector3.zero
bv.Parent = hrp
end
else
local centerData = mobCenter[mob.Name]
if centerData then
hrp.CFrame = CFrame.new(centerData.pos / centerData.count)
end
end

pcall(function()
sethiddenproperty(plr,"SimulationRadius",math.huge)
end)
end
end

Misc:AddToggle({
Name = "Bring Mobs",
Default = GetSetting("B", true),
Callback = function(Value)
_B = Value
_G.SaveData["B"] = Value
SaveSettings()

if Value then
task.spawn(function()
while _B do
for _, v in pairs(workspace.Enemies:GetChildren()) do
local root = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("PrimaryPart")
if root then
root.CanCollide = false
end
end
task.wait(0.2)
end
end)
end
end
})

Misc:AddToggle({
Name = "Auto Haki",
Default = GetSetting("Boud", true),
Callback = function(Value)
Boud = Value
_G.SaveData["Boud"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if Boud then
local _HasBuso = {"HasBuso","Buso"}
if not plr.Character:FindFirstChild(_HasBuso[1]) then 
replicated.Remotes.CommF_:InvokeServer(_HasBuso[2]) 
end
end
end)
end
end)

Misc:AddToggle({
Name = "Auto Attack",
Default = GetSetting("FastAttack", true),
Callback = function(Value)
_G.FastAttack = Value
_G.SaveData["FastAttack"] = Value
SaveSettings()
end
})

Misc:AddToggle({
Name = "Auto Shoot",
Default = GetSetting("Shoot", false),
Callback = function(Value)
_G.Shoot = Value
_G.SaveData["Shoot"] = Value
SaveSettings()
end
})


Misc:AddToggle({
Name = "Bypass Quest [Risk]",
Default = GetSetting("RemoteQuest", false),
Callback = function(Value)
_G.RemoteQuest = Value
_G.SaveData["RemoteQuest"] = Value
SaveSettings()
end
})

Misc:AddToggle({
Name = "Take Quest Debounce",
Description = "Wait 20 seconds to take the next mission",
Default = GetSetting("DelayQuest", false),
Callback = function(Value)
_G.DelayQuest = Value
_G.SaveData["DelayQuest"] = Value
SaveSettings()
end
})

Misc:AddSection("Codes")
Misc:AddButton({
Name = "Redeem all Codes",
Callback = function()
local Codes = {
"LIGHTNINGABUSE",
"fudd10",
"fudd10_V2",
"Chandler",
"BIGNEWS",
"KITT_RESET",
"Sub2UncleKizaru",
"SUB2GAMERROBOT_RESET1",
"Sub2Fer999",
"Enyu_is_Pro",
"JCWK",
"StarcodeHEO",
"MagicBUS",
"KittGaming",
"Sub2CaptainMaui",
"Sub2OfficialNoobie",
"TheGreatAce",
"Sub2NoobMaster123",
"Sub2Daigrock",
"Axiore",
"StrawHatMaine",
"TantaiGaming",
"Bluxxy",
"SUB2GAMERROBOT_EXP1",
"NOMOREHACK",
"BANEXPLOIT",
"WildDares",
"BossBuild",
"GetPranked",
"EARN_FRUITS",
"FIGHT4FRUIT",
"NOEXPLOITER",
"NOOB2ADMIN",
"CODESLIDE",
"ADMINHACKED",
"ADMINDARES",
"fruitconcepts",
"krazydares",
"TRIPLEABUSE",
"SEATROLLING",
"24NOADMIN",
"REWARDFUN",
"NEWTROLL",
"SECRET_ADMIN"
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RedeemRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Redeem")
task.wait(1)
for _, code in ipairs(Codes) do
pcall(function()
RedeemRemote:InvokeServer(code)
end)
task.wait(0.2)
end
end
})

Misc:AddSection("Team")
Misc:AddButton({
Name = "Join Pirate Team",
Callback = function()
Pirates()
end
})

Misc:AddButton({
Name = "Join Marine Team",
Callback = function()
Marines()
end
})

Misc:AddSection("Race")
Misc:AddToggle({
Name = "Auto Active Race V3",
Default = GetSetting("RaceClickAutov3", false),
Callback = function(Value)
_G.RaceClickAutov3 = Value
_G.SaveData["RaceClickAutov3"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.2) do
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

Misc:AddToggle({
Name = "Auto Active Race V4",
Default = GetSetting("RaceClickAutov4", false),
Callback = function(Value)
_G.RaceClickAutov4 = Value
_G.SaveData["RaceClickAutov4"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.2) do
pcall(function()
if _G.RaceClickAutov4 then
if plr.Character:FindFirstChild("RaceEnergy") then
if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then 
Useskills("nil","Y") 
end
end
end 
end)
end
end)

Misc:AddSection("Menu")
Misc:AddButton({
Name = "Awakenings Expert",
Callback = function()
plr.PlayerGui.Main.AwakeningToggler.Visible = true
end
})

Misc:AddButton({
Name = "Devil Fruit Shop",
Callback = function()
require(plr.PlayerGui.Main.UIController.FruitShop):Open("FruitDealer")
end
})

Misc:AddButton({
Name = "Advanced Fruit Dealer",
Callback = function()
require(plr.PlayerGui.Main.UIController.FruitShop):Open("AdvancedFruitDealer")
end
})

Misc:AddButton({
Name = "Titles",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("getTitles", true)
plr.PlayerGui.Main.Titles.Visible = true
end
})

Misc:AddSection("Local-Player")

SpeedValue = GetSetting("SpeedValue", 200)
InfAbility = GetSetting("InfAbility", false)

local function ApplySpeed()
local char = game.Players.LocalPlayer.Character
if not char then return end

local hum = char:FindFirstChildOfClass("Humanoid")
if not hum then return end

if InfAbility then
hum.WalkSpeed = SpeedValue
else
hum.WalkSpeed = 16
end
end

local SpeedRun = Misc:AddToggle({
Name = "Enable Speed Hack",
Default = InfAbility,
Callback = function(Value)
InfAbility = Value
_G.SaveData["InfAbility"] = Value
SaveSettings()
ApplySpeed()
end
})

local SpeedSlider = Misc:AddSlider({
Name = "Walk Speed",
Min = 1,
Max = 300,
Default = SpeedValue,
Increase = 1,
Callback = function(Value)
SpeedValue = Value
_G.SaveData["SpeedValue"] = Value
SaveSettings()
if InfAbility then
ApplySpeed()
end
end
})

game.Players.LocalPlayer.CharacterAdded:Connect(function()
task.wait(0.3)
if InfAbility then
ApplySpeed()
end
end)

task.spawn(function()
while task.wait(0.1) do
if InfAbility then
ApplySpeed()
end
end
end)

local DashNoCD = Misc:AddToggle({
Name = "Dash No CD",
Default = GetSetting("DodgeNoCD", false),
Callback = function(Value)
getgenv().DodgeNoCD = Value
_G.SaveData["DodgeNoCD"] = Value
SaveSettings()
end
})

local function NoCooldown()
local dodgeScript = game.Players.LocalPlayer.Character:WaitForChild("Dodge")
for _, v in next, getgc() do
if typeof(v) == "function" and getfenv(v).script == dodgeScript then
for i2, v2 in next, getupvalues(v) do
if tostring(v2) == "0.4" then
setupvalue(v, i2, 0)
end
end
end
end
end

spawn(function()
while task.wait() do
if getgenv().DodgeNoCD then
pcall(NoCooldown)
end
end
end)

Misc:AddSection("Visual")
Misc:AddButton({
Name = "Remove Fog",
Callback = function()
local Lighting = game:GetService("Lighting")
if Lighting:FindFirstChild("LightingLayers") then Lighting.LightingLayers:Destroy() end
if Lighting:FindFirstChild("SeaTerrorCC") then Lighting.SeaTerrorCC:Destroy() end
if Lighting:FindFirstChild("FantasySky") then Lighting.FantasySky:Destroy() end
end
})

Misc:AddSection("More FPS")
Misc:AddButton({
Name = "Smooth Farm Mode",
Description = "Reduces calculation speed to improve FPS",
Callback = function()
for _,zx in next, workspace:GetDescendants() do
if zx:IsA("Part") or zx:IsA("MeshPart") or zx:IsA("UnionOperation") then
zx.Material = "Plastic"
end
end
end
})

Misc:AddButton({
Name = "Fix Lag",
Callback = function()
LowCpu()
end
})

Misc:AddButton({
Name = "Fix Lag More",
Callback = function()
local gay = {"Part", "MeshPart", "UnionOperation"}

for _, hnccudai in next, workspace:GetDescendants() do
if table.find(gay, hnccudai.ClassName) then
hnccudai.Material = Enum.Material.Plastic
end
end

pcall(function() LowCpu() end)

local hacnocunigga = game:GetService("Lighting")

pcall(function()
if hacnocunigga:FindFirstChild("LightingLayers") then hacnocunigga.LightingLayers:Destroy() end
if hacnocunigga:FindFirstChild("SeaTerrorCC") then hacnocunigga.SeaTerrorCC:Destroy() end
if hacnocunigga:FindFirstChild("FantasySky") then hacnocunigga.FantasySky:Destroy() end
if hacnocunigga:FindFirstChildOfClass("Sky") then hacnocunigga:FindFirstChildOfClass("Sky"):Destroy() end
end)

local function bucuanhkhong(obj)
if obj:IsA("BasePart") or obj:IsA("Decal") or obj:IsA("Texture") then
obj.Transparency = 1
if obj:IsA("BasePart") then obj.CanCollide = false end
end
end

for _, hnccudai in next, workspace:GetDescendants() do
if hnccudai:IsDescendantOf(workspace:FindFirstChild("Enemies")) then continue end
if hnccudai:IsDescendantOf(game:GetService("Players")) then continue end
bucuanhkhong(hnccudai)
end

pcall(function()
local missnmc = workspace:FindFirstChild("Map")
if missnmc then
if missnmc:FindFirstChild("WaterBase-Plane") then missnmc["WaterBase-Plane"]:Destroy() end
if missnmc:FindFirstChild("Waterfall") then missnmc["Waterfall"]:Destroy() end
if missnmc:FindFirstChild("Ocean") then missnmc["Ocean"]:Destroy() end
if missnmc:FindFirstChild("Sea") then missnmc["Sea"]:Destroy() end
end
if workspace:FindFirstChild("WaterVisual") then workspace.WaterVisual:Destroy() end
if workspace:FindFirstChild("Water") then workspace.Water:Destroy() end
end)
end
})

Misc:AddToggle({
Name = "Remove Dame Text",
Default = GetSetting("RemoveText", true),
Callback = function(Value)
RemoveText = Value
_G.SaveData["RemoveText"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if RemoveText then
game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
else
game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
end
end)
end
end)

Misc:AddToggle({
Name = "Remove Notifications",
Default = GetSetting("RemoveDamage", false),
Callback = function(Value)
RemoveDamage = Value
_G.SaveData["RemoveDamage"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
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

Misc:AddSection("Others")
Misc:AddToggle({
Name = "Walk on Water",
Default = GetSetting("WalkWater_Part", false),
Callback = function(Value)
_G.WalkWater_Part = Value
_G.SaveData["WalkWater_Part"] = Value
SaveSettings()
if _G.WalkWater_Part then
game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
else
game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
end
end
})

Misc:AddToggle({
Name = "Anti AFK",
Default = GetSetting("AntiAFK", true),
Callback = function(Value)
_G.AntiAFK = Value
_G.SaveData["AntiAFK"] = Value
SaveSettings()
end
})

plr.Idled:connect(function()
vim2:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vim2:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local DashFarToggle = Misc:AddToggle({
Name = "Auto Dash",
Default = GetSetting("DashFar", false),
Callback = function(Value)
getgenv().DashFar = Value
_G.SaveData["DashFar"] = Value
SaveSettings()
end
})

local DashDistance = GetSetting("DashDistance", 20)

local DashSlider = Misc:AddSlider({
Name = "Dash Speed",
Min = 1,
Max = 100,
Default = DashDistance,
Increase = 1,
Callback = function(Value)
DashDistance = Value
_G.SaveData["DashDistance"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait(0.1) do
if getgenv().DashFar then
local char = game.Players.LocalPlayer.Character
if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Dodge") then
local hrp = char.HumanoidRootPart
hrp.CFrame = hrp.CFrame + (hrp.CFrame.LookVector * DashDistance * 0.1)
end
end
end
end)

local InfSoru = Misc:AddToggle({
Name = "Infinite Soru",
Default = GetSetting("InfiniteSoru", false),
Callback = function(Value)
getgenv().InfiniteSoru = Value
_G.SaveData["InfiniteSoru"] = Value
SaveSettings()
end
})

local function InfiniteSoruLoop()
while getgenv().InfiniteSoru do
local char = game.Players.LocalPlayer.Character
if char and char:FindFirstChild("HumanoidRootPart") then
for _, v in next, getgc() do
if typeof(v) == "function" and getfenv(v).script == char:WaitForChild("Soru") then
for i2, v2 in next, getupvalues(v) do
if type(v2) == "table" and v2.LastUse then
repeat
setupvalue(v, i2, {LastAfter = 0, LastUse = 0})
task.wait()
until not getgenv().InfiniteSoru or char.Humanoid.Health <= 0
end
end
end
end
end
task.wait()
end
end

spawn(function()
while task.wait() do
if getgenv().InfiniteSoru then
pcall(InfiniteSoruLoop)
end
end
end)

local NoClip = Misc:AddToggle({
Name = "No Clip",
Default = GetSetting("NoClip", false),
Callback = function(Value)
getgenv().NoClip = Value
_G.SaveData["NoClip"] = Value
SaveSettings()
end
})

spawn(function()
pcall(function()
game:GetService("RunService").Stepped:Connect(function()
if getgenv().NoClip then
for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = false
end
end
end
end)
end)
end)

local Jump = Misc:AddToggle({
Name = "Auto Jump",
Default = GetSetting("AutoJump", false),
Callback = function(Value)
_G.AutoJump = Value
_G.SaveData["AutoJump"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait(0.1) do
if _G.AutoJump then
pcall(function()
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:FindFirstChildOfClass("Humanoid")
if humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end
end)
end
end
end)

local FlyToggle = Misc:AddToggle({
Name = "Auto Fly",
Default = GetSetting("Flytween", false),
Callback = function(Value)
_G.Flytween = Value
_G.SaveData["Flytween"] = Value
SaveSettings()
end
})

local FlyDistance = GetSetting("FlyDistance", 30)
local FlyRefresh = 0.05

task.spawn(function()
while task.wait(FlyRefresh) do
if _G.Flytween then
pcall(function()
local player = game.Players.LocalPlayer
local char = player.Character
if not char then return end
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hrp then return end
local cam = workspace.CurrentCamera
local look = cam.CFrame.LookVector
local newCF = CFrame.new(
hrp.Position + (look * FlyDistance)
)
tween(newCF)
end)
end
end
end)

Misc:AddToggle({
Name = "Auto Set Spawn Point",
Default = GetSetting("AutoSetSpawnPoint", false),
Callback = function(Value)
AutoSetSpawnPoint = Value
_G.SaveData["AutoSetSpawnPoint"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if AutoSetSpawnPoint then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
end
end)
end
end)

Misc:AddToggle({
Name = "Safe Mode",
Default = GetSetting("Safemode", false),
Callback = function(Value)
_G.Safemode = Value
_G.SaveData["Safemode"] = Value
SaveSettings()
end
})

local Teleported = false

spawn(function()
while task.wait(Sec) do
pcall(function()
if _G.Safemode then
local char = plr.Character
local humanoid = char and char:FindFirstChildOfClass("Humanoid")
local root = char and char:FindFirstChild("HumanoidRootPart")

if humanoid and root then
local Calc_Health = humanoid.Health / humanoid.MaxHealth * 100

if Calc_Health < Num_self and not Teleported then
root.CFrame = root.CFrame + Vector3.new(0, 500, 0)
Teleported = true
elseif Calc_Health >= Num_self then
Teleported = false
end
end
end
end)
end
end)

Misc:AddToggle({
Name = "Remove Die Effect",
Default = GetSetting("RDeath", true),
Callback = function(Value)
RDeath = Value
_G.SaveData["RDeath"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if RDeath then
if replicated.Effect.Container:FindFirstChild("Death") then 
replicated.Effect.Container.Death:Destroy() 
end
if replicated.Effect.Container:FindFirstChild("Respawn") then 
replicated.Effect.Container.Respawn:Destroy() 
end
end
end)
end
end)

Misc:AddSection("Screen")

Misc:AddToggle({
Name = "White Screen",
Default = GetSetting("WhiteScreenEnabled", false),
Callback = function(Value)
WhiteScreenEnabled = Value
_G.SaveData["WhiteScreenEnabled"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if WhiteScreenEnabled then
game:GetService("RunService"):Set3dRenderingEnabled(false)
else
game:GetService("RunService"):Set3dRenderingEnabled(true)
end
end)
end
end)

Misc:AddToggle({
Name = "Black Screen",
Default = GetSetting("StartBlackScreen", false),
Callback = function(Value)
StartBlackScreen = Value
_G.SaveData["StartBlackScreen"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
local ui = game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen

if StartBlackScreen then
ui.Size = UDim2.new(500, 0, 500, 500)
else
ui.Size = UDim2.new(1, 0, 500, 500)
end
end)
end
end)

local blur = game:GetService("Lighting"):FindFirstChild("DodgeBlur")
if not blur then
blur = Instance.new("BlurEffect")
blur.Name = "DodgeBlur"
blur.Parent = game:GetService("Lighting")
blur.Enabled = false
end

Misc:AddToggle({
Name = "Blur Screen",
Default = GetSetting("BlurEnabled", false),
Callback = function(Value)
BlurEnabled = Value
_G.SaveData["BlurEnabled"] = Value
SaveSettings()
blur.Enabled = Value
end
})

local BlurPower = GetSetting("BlurPower", 50)

Misc:AddSlider({
Name = "Blur Amount",
Min = 1,
Max = 200,
Default = BlurPower,
Increase = 1,
Callback = function(Value)
BlurPower = Value
_G.SaveData["BlurPower"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if BlurEnabled then
blur.Size = BlurPower
else
blur.Size = 0
end
end)
end
end)

Misc:AddSection("Misc")

Misc:AddSlider({
Name = "Distance",
Min = 50,
Max = 9999,
Default = GetSetting("BringDistance", 300),
Increase = 1,
Callback = function(Value)
BringDistance = Value
_G.SaveData["BringDistance"] = Value
SaveSettings()
end
})

Misc:AddToggle({
Name = "Random CFrame",
Default = GetSetting("RandomCFrame", false),
Callback = function(Value)
RandomCFrame = Value
_G.SaveData["RandomCFrame"] = Value
SaveSettings()
end
})

if World3 then
Misc:AddToggle({
Name = "Auto Accept Quests",
Default = GetSetting("AcceptQuestC", false),
Callback = function(Value)
_G.AcceptQuestC = Value
_G.SaveData["AcceptQuestC"] = Value
SaveSettings()
end
})
end

Stats:AddSection("Stats")

local StatsDelay = GetSetting("StatsDelay", 0.2)

Stats:AddSlider({
Name = "Stats Upgrade Delay",
Min = 0.05,
Max = 2,
Default = StatsDelay,
Increase = 0.1,
Callback = function(Value)
StatsDelay = Value
_G.SaveData["StatsDelay"] = Value
SaveSettings()
end
})

local pSats = GetSetting("pSats", 2)

Stats:AddSlider({
Name = "Stats Value",
Min = 1,
Max = 2000,
Default = pSats,
Increase = 1,
Callback = function(Value)
pSats = Value
_G.SaveData["pSats"] = Value
SaveSettings()
end
})

Stats:AddToggle({
Name = "Add Energy",
Default = GetSetting("Auto_Melee", false),
Callback = function(Value)
_G.Auto_Melee = Value
_G.SaveData["Auto_Melee"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait(StatsDelay) do
pcall(function()
if _G.Auto_Melee then 
statsSetings("Melee", pSats) 
end
end)
end
end)

Stats:AddToggle({
Name = "Add Defense",
Default = GetSetting("Auto_Defense", false),
Callback = function(Value)
_G.Auto_Defense = Value
_G.SaveData["Auto_Defense"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait(StatsDelay) do
pcall(function()
if _G.Auto_Defense then 
statsSetings("Defense", pSats) 
end
end)
end
end)

Stats:AddToggle({
Name = "Add Swords",
Default = GetSetting("Auto_Sword", false),
Callback = function(Value)
_G.Auto_Sword = Value
_G.SaveData["Auto_Sword"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait(StatsDelay) do
pcall(function()
if _G.Auto_Sword then 
statsSetings("Sword", pSats) 
end
end)
end
end)

Stats:AddToggle({
Name = "Add Gun",
Default = GetSetting("Auto_Gun", false),
Callback = function(Value)
_G.Auto_Gun = Value
_G.SaveData["Auto_Gun"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait(StatsDelay) do
pcall(function()
if _G.Auto_Gun then 
statsSetings("Gun", pSats) 
end
end)
end
end)

Stats:AddToggle({
Name = "Add Blox Fruit",
Default = GetSetting("Auto_DevilFruit", false),
Callback = function(Value)
_G.Auto_DevilFruit = Value
_G.SaveData["Auto_DevilFruit"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait(StatsDelay) do
pcall(function()
if _G.Auto_DevilFruit then 
statsSetings("Devil", pSats) 
end
end)
end
end)

if World2 or World3 then
Quests:AddSection("Auto Get Melee [Beta]")

Quests:AddToggle({
Name = "Auto Get Superhuman",
Default = GetSetting("Auto_SuperHuman", false),
Callback = function(Value)
_G.Auto_SuperHuman = Value
_G.SaveData["Auto_SuperHuman"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.Auto_SuperHuman then
local M_Beli = plr.Data.Beli.Value
local M_Frag = plr.Data.Fragments.Value
if plr:FindFirstChild("WeaponAssetCache") then
if not GetBP("Superhuman") then
if not GetBP("Black Leg") then
if (M_Beli >= 150000) then 
replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") 
end
elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 299 then 
_G.Level = true 
elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 300 then 
_G.Level = false 
end

if not GetBP("Electro") then
if (M_Beli >= 500000) then 
replicated.Remotes.CommF_:InvokeServer("BuyElectro") 
end
elseif GetBP("Electro") and GetBP("Electro").Level.Value < 299 then 
_G.Level = true 
elseif GetBP("Electro") and GetBP("Electro").Level.Value >= 300 then 
_G.Level = false 
end

if not GetBP("Fishman Karate") then
if (M_Beli >= 750000) then 
replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") 
end
elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 299 then 
_G.Level = true 
elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 300 then 
_G.Level = false 
end

if not GetBP("Dragon Claw") then
if (M_Frag >= 1500) then 
replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
end
elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 299 then 
_G.Level = true 
elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 300 then 
_G.Level = false 
end

replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
end
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Get DeathStep",
Default = GetSetting("AutoDeathStep", false),
Callback = function(Value)
_G.AutoDeathStep = Value
_G.SaveData["AutoDeathStep"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.AutoDeathStep then
pcall(function()
if plr:FindFirstChild("WeaponAssetCache") then
if not GetBP("Death Step") then
if not GetBP("Black Leg") then 
replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") 
end

if GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 400 then 
replicated.Remotes.CommF_:InvokeServer("BuyDeathStep") 
_G.Level = false 
elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 399 then 
_G.Level = true 
end

if GetBP("Black Leg") or GetBP("Black Leg").Level.Value >= 400 then
if workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then
if GetBP("Library Key") then 
repeat 
wait() 
tween(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) 
until not _G.AutoDeathStep or (Root.Position == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position)

if (Root.CFrame == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) then 
notween(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) 
end 
elseif not GetBP("Library Key") then
local v = GetConnectionEnemies("Awakened Ice Admiral")
if v then
repeat 
wait() 
Kill(v,_G.AutoDeathStep) 
until not _G.AutoDeathStep or not v.Parent or v.Humanoid.Health <= 0 or GetBP("Library Key") or GetBP("Death Step")
else 
tween(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
end
end
end
end
end
end
end)
end
end
end)

 
Quests:AddToggle({
Name = "Auto Get Sharkman Karate",
Default = GetSetting("Auto_SharkMan_Karate", false),
Callback = function(Value)
_G.Auto_SharkMan_Karate = Value
_G.SaveData["Auto_SharkMan_Karate"] = Value
SaveSettings()
end
})

spawn(function() 
while wait(Sec) do
if _G.Auto_SharkMan_Karate then
pcall(function()
if plr:FindFirstChild("WeaponAssetCache") then
if not GetBP("Sharkman Karate") then
if not GetBP("Fishman Karate") then 
replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") 
end

if GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 400 then 
replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate") 
_G.Level = false 
elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 399 then 
_G.Level = true 
end

if GetBP("Fishman Karate") or GetBP("Fishman Karate").Level.Value >= 400 then 
if GetBP("Water Key") then
if string.find(replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then
if GetBP("Water Key") then
repeat 
wait() 
tween(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)) 
until not _G.Auto_SharkMan_Karate or (Root.Position == CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position)

replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
end
end
elseif not GetBP("Water Key") then
local v = GetConnectionEnemies("Tide Keeper")
if v then 
repeat 
wait() 
Kill(v,_G.Auto_SharkMan_Karate)
until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_SharkMan_Karate == false or GetBP("Water Key") or GetBP("Sharkman Karate")		
else 
tween(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
end
end
end
end
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Get Electric Claw",
Default = GetSetting("Auto_Electric_Claw", false),
Callback = function(Value)
_G.Auto_Electric_Claw = Value
_G.SaveData["Auto_Electric_Claw"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.Auto_Electric_Claw then
pcall(function()
if plr:FindFirstChild("WeaponAssetCache") then 
if not GetBP("Electro") then 
replicated.Remotes.CommF_:InvokeServer("BuyElectro") 
end

if GetBP("Electro") and GetBP("Electro").Level.Value >= 400 then
if replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then 
notween(CFrame.new(-12548, 337, -7481)) 
end
replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
elseif GetBP("Electro") and GetBP("Electro").Level.Value < 400 then
repeat 
_G.AutoFarm_Bone = true 
wait() 
until not _G.Auto_Electric_Claw or GetBP("Electric Claw") 
_G.AutoFarm_Bone = false
end
end 
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Get Dragon Talon",
Default = GetSetting("AutoDragonTalon", false),
Callback = function(Value)
_G.AutoDragonTalon = Value
_G.SaveData["AutoDragonTalon"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.AutoDragonTalon then
pcall(function()
if plr:FindFirstChild("WeaponAssetCache") then 
if not GetBP("Dragon Claw") then 
replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
end

if GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 400 then 
replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) 
replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 400 then 
repeat 
_G.AutoFarm_Bone = true 
wait() 
until not _G.AutoDragonTalon or GetBP("Dragon Talon") 
_G.AutoFarm_Bone = false
end 
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Get Godhuman",
Default = GetSetting("Auto_God_Human", false),
Callback = function(Value)
_G.Auto_God_Human = Value
_G.SaveData["Auto_God_Human"] = Value
SaveSettings()
end
})

spawn(function()
while wait() do
pcall(function()
if _G.AutoGodHuman then
if replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == "" then
if GetM("Dragon Scale") == false or GetM("Dragon Scale") < 10 then
if World3 then
Lv = 1575
_G.Level = true
else
replicated.Remotes.CommF_:InvokeServer("TravelZou")
end
elseif GetM("Fish Tail") == false or GetM("Fish Tail") < 20 then
if World3 then
Lv = 1775
_G.Level = true
else
replicated.Remotes.CommF_:InvokeServer("TravelZou")
end
elseif GetM("Mystic Droplet") == false or GetM("Mystic Droplet") < 10 then
if World2 then
Lv = 1425
_G.Level = true
else
replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end
elseif GetM("Magma Ore") == false or GetM("Magma Ore") < 20 then
if World2 then
Lv = 1175
_G.Level = true
else
replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end
end
elseif replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == 3 then
return nil
else
replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Get SanguineArt",
Default = GetSetting("snaguine", false),
Callback = function(Value)
_G.snaguine = Value
_G.SaveData["snaguine"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
if _G.snaguine then
pcall(function()
if not GetBP("Sanguine Art") then 
replicated.Remotes.CommF_:InvokeServer("Sanguine Art") 
end

if not GetBP("Sanguine Art") then
if GetM("Leviathan Heart") >= 1 then 
print("Completed!!")
else
if World3 then 
_G.DangerSc = "Lv Infinite" 
_G.SailBoats = true
else 
_G.SailBoats = false
end 
end

if GetM("Vampire Fang") <= 19 then
if World2 then
local n = GetConnectionEnemies("Vampire")
if n then
repeat 
task.wait() 
Kill(n,_G.snaguine) 
until not _G.snaguine or n.Humanoid.Health <= 0 or not n.Parent
else 
tween(CFrame.new(-6041.29248046875, 6.402710914611816, -1304.63330078125))
end
else
replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end
end

if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") <= 19 then
if World3 then
local n = GetConnectionEnemies("Demonic Soul")
if n then
repeat 
task.wait() 
Kill(n,_G.snaguine) 
until not _G.snaguine or n.Humanoid.Health <= 0 or not n.Parent
else 
tween(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
end
else
replicated.Remotes.CommF_:InvokeServer("TravelZou")
end
end

if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") >= 20 and GetM("Dark Fragment") <= 1 then
if World2 then
local n = GetConnectionEnemies("Darkbeard")
if n then
repeat 
task.wait() 
Kill(black,_G.snaguine) 
until _G.snaguine or black.Humanoid.Health <= 0 or not black.Parent
else 
tween(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
end
else 
replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end
end
else 
replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
end
end)
end
end
end)
end

if World1 or World2 then
Quests:AddSection("Next World")
end

if World1 then
Quests:AddToggle({
Name = "Auto Second Sea",
Default = GetSetting("TravelDres", false),
Callback = function(Value)
_G.TravelDres = Value
_G.SaveData["TravelDres"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.TravelDres then
if plr.Data.Level.Value >= 700 then
if workspace.Map.Ice.Door.CanCollide == true and workspace.Map.Ice.Door.Transparency == 0 then
replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
EquipWeapon("Key")
repeat 
wait() 
tween(CFrame.new(1347.7124, 37.3751602, -1325.6488)) 
until not _G.TravelDres or (Root.Position == CFrame.new(1347.7124, 37.3751602, -1325.6488).Position)
elseif workspace.Map.Ice.Door.CanCollide == false and workspace.Map.Ice.Door.Transparency == 1 then
if Enemies:FindFirstChild("Ice Admiral") then
for _,xz in pairs(Enemies:GetChildren()) do
if xz.Name == "Ice Admiral" and Attack.Alive(xz) then
repeat 
task.wait() 
Kill(xz,_G.TravelDres) 
until _G.TravelDres == false or xz.Humanoid.Health <= 0
replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end
end
else
tween(CFrame.new(1347.7124, 37.3751602, -1325.6488))
end
else
replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end
end
end
end)
end 
end)
end

if World2 then
Quests:AddToggle({
Name = "Auto Third Sea",
Default = GetSetting("AutoZou", false),
Callback = function(Value)
_G.AutoZou = Value
_G.SaveData["AutoZou"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.AutoZou then
if plr.Data.Level.Value >= 1500 then
if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
if replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
local v = GetConnectionEnemies("rip_indra")
if v then
repeat 
wait() 
Kill(v,_G.AutoZou) 
until not _G.AutoZou or not v.Parent or v.Humanoid.Health <= 0
Check = 2
repeat 
wait()
replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
until Check == 1 
else
replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Check") 
wait(.1)
replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Begin")
end
elseif replicated.Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
else
local v = GetConnectionEnemies("Don Swan")
if v then
repeat 
wait() 
Kill(v,_G.AutoZou)
until not _G.AutoZou or not v.Parent or v.Humanoid.Health<=0
else
repeat 
wait() 
tween(CFrame.new(2288.802, 15.1870775, 863.034607)) 
until not _G.AutoZou or (Root.Position == CFrame.new(2288.802, 15.1870775, 863.034607).Position)

if (Root.CFrame == CFrame.new(2288.802, 15.1870775, 863.034607)) then 
notween(CFrame.new(2288.802, 15.1870775, 863.034607)) 
end
end
end
else
if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
TabelDevilFruitStore = {}
TabelDevilFruitOpen = {}

for i,v in pairs(replicated.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
for i1,v1 in pairs(v) do
if i1 == "Name" then 
table.insert(TabelDevilFruitStore,v1)
end
end
end

for i,v in next, game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
if v.Price >= 1000000 then 
table.insert(TabelDevilFruitOpen,v.Name) 
end
end

for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do
if DevilFruitOpenDoor == DevilFruitStore and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
if not plr.Backpack:FindFirstChild(DevilFruitStore) then
replicated.Remotes.CommF_:InvokeServer("F_","LoadFruit",DevilFruitStore)
else
replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")
replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")
replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")
end
end
end
end

replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")
replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")
replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")
end
end
else
if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
local v = GetConnectionEnemies("Swan Pirate")
if v then
pcall(function() 
repeat 
wait() 
Kill(v,_G.AutoZou) 
until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false or plr.PlayerGui.Main.Quest.Visible == false 
end)
else
tween(CFrame.new(1057.92761, 137.614319, 1242.08069))
end
else
tween(CFrame.new(-456.28952, 73.0200958, 299.895966))
end
elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
local v = GetConnectionEnemies("Jeremy")
if v then
repeat 
wait() 
Kill(v,_G.AutoZou) 
until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false
else
tween(CFrame.new(2099.88159, 448.931, 648.997375))
end
elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
repeat 
wait() 
tween(CFrame.new(-1836, 11, 1714)) 
until not _G.AutoZou or (Root.Position == CFrame.new(-1836, 11, 1714).Position)

if (Root.CFrame == CFrame.new(-1836, 11, 1714)) then 
notween(CFrame.new(-1836, 11, 1714))
end

notween(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
wait(.1)
notween(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
wait(.1)
notween(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
wait(.1)
notween(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
wait(.1)
notween(CFrame.new(-1869.54224, 15.987854, 1681.00659))
wait(.1)
notween(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
wait(.1)
notween(CFrame.new(-1819.26343, 14.795166, 1717.90625))
wait(.1)
notween(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
end
end
end
end
end)
end
end)
end

if World3 then
Quests:AddSection("Tushita And Yama")

local Process = Quests:AddParagraph({
Title = "Elites Process",
Content = ""
})

spawn(function()
while wait(Sec) do
pcall(function()
Process:SetDesc("Elite Procress :" ..replicated.Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
end)
end
end)

Quests:AddToggle({
Name = "Auto Elite Hunter",
Default = GetSetting("FarmEliteHunt", false),
Callback = function(Value)
_G.FarmEliteHunt = Value
_G.SaveData["FarmEliteHunt"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.FarmEliteHunt then
if plr.PlayerGui.Main.Quest.Visible == true then
if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") then
for i,v in pairs(replicated:GetChildren()) do
if string.find(v.Name,"Diablo") or string.find(v.Name,"Urban") or string.find(v.Name,"Deandre") then
tween(v.HumanoidRootPart.CFrame)				
end	
end

for i,v in pairs(Enemies:GetChildren()) do
if (string.find(v.Name,"Diablo") or string.find(v.Name,"Urban") or string.find(v.Name,"Deandre")) and Attack.Alive(v) then
repeat 
wait() 
Kill(v, _G.FarmEliteHunt) 
until not _G.FarmEliteHunt or plr.PlayerGui.Main.Quest.Visible == false or not v.Parent or v.Humanoid.Health <=0
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

Quests:AddToggle({
Name = "Stop If Have Items",
Default = GetSetting("StopWhenChalice", true),
Callback = function(Value)
_G.StopWhenChalice = Value
_G.SaveData["StopWhenChalice"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.2) do
if _G.StopWhenChalice and _G.FarmEliteHunt then
pcall(function()
if GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness") then
_G.FarmEliteHunt = false
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Tushita",
Default = GetSetting("Auto_Tushita", false),
Callback = function(Value)
_G.Auto_Tushita = Value
_G.SaveData["Auto_Tushita"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.Auto_Tushita then
if workspace.Map.Turtle:FindFirstChild("TushitaGate") then
if not GetBP("Holy Torch") then
tween(CFrame.new(5148.03613, 162.352493, 910.548218))
wait(0.7)
else
EquipWeapon("Holy Torch")
task.wait(1)
repeat 
task.wait() 
tween(CFrame.new(-10752, 417, -9366)) 
until not _G.Auto_Tushita or (CFrame.new(-10752, 417, -9366).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

wait(.7)
repeat 
task.wait() 
tween(CFrame.new(-11672, 334, -9474)) 
until not _G.Auto_Tushita or (CFrame.new(-11672, 334, -9474).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

wait(.7)
repeat 
task.wait() 
tween(CFrame.new(-12132, 521, -10655)) 
until not _G.Auto_Tushita or (CFrame.new(-12132, 521, -10655).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

wait(.7)
repeat 
task.wait() 
tween(CFrame.new(-13336, 486, -6985)) 
until not _G.Auto_Tushita or (CFrame.new(-13336, 486, -6985).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

wait(.7)
repeat 
task.wait() 
tween(CFrame.new(-13489, 332, -7925)) 
until not _G.Auto_Tushita or (CFrame.new(-13489, 332, -7925).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
end
else
local v = GetConnectionEnemies("Longma")
if v then 
repeat 
task.wait() 
Kill(v,_G.Auto_Tushita) 
until v.Humanoid.Health <= 0 or not _G.Auto_Tushita or not v.Parent
else 
if replicated:FindFirstChild("Longma") then 
tween(replicated:FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(0,40,0)) 
end
end 
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Yama",
Default = GetSetting("Auto_Yama", false),
Callback = function(Value)
_G.Auto_Yama = Value
_G.SaveData["Auto_Yama"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.Auto_Yama then
if replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then
_G.FarmEliteHunt = true
elseif replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") > 30 then
_G.FarmEliteHunt = false
if (workspace.Map.Waterfall.SealedKatana.Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 20 then
tween(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
local zx = GetConnectionEnemies("Ghost")
if zx then
repeat 
wait() 
Kill(zx,_G.Auto_Yama) 
until zx.Humanoid.Health <= 0 or not zx.Parent or not _G.Auto_Yama 
fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
end
end
end
end
end)
end
end)

Quests:AddSection("Cursed Dual Katana")

Quests:AddToggle({
Name = "Auto Cursed Dual Katana (Yama Quest)",
Default = GetSetting("CDK_YM", false),
Callback = function(Value)
_G.CDK_YM = Value
_G.SaveData["CDK_YM"] = Value
SaveSettings()
end
})

spawn(function()
while wait() do
pcall(function()
if _G.CDK_YM then
if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then
replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
else
if replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then
if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -3 then
QuestYama_1 = true 
QuestYama_2 = false 
QuestYama_3 = false
repeat 
task.wait()
if not workspace.Enemies:FindFirstChild("Forest Pirate") then
tween(CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375))
else
local v = GetConnectionEnemies("Forest Pirate")
if v then 
tween(workspace.Enemies:FindFirstChild("Forest Pirate").HumanoidRootPart.CFrame)
end
end
until tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 1 or not _G.CDK_YM
elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -4 then
QuestYama_1 = false 
QuestYama_2 = true 
QuestYama_3 = false
for ix,HitMon in pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren()) do
for NameMonHaze, CFramePos in pairs(PosMsList) do
if string.find(NameMonHaze,HitMon.Name) and HitMon.Value > 0 then
if (CFramePos.Position - Root.Position).Magnitude <= 1000 and workspace.Enemies:FindFirstChild(NameMonHaze) then
for i,v in pairs(workspace.Enemies:GetChildren()) do
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HazeESP") then
repeat 
wait() 
Kill(v, _G.CDK_YM) 
until not _G.CDK_YM or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 2 or not v:FindFirstChild("HazeESP") or v.Humanoid.Health <= 0
end
end
else 
tween(CFramePos) 
end
end
end
end
elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then
QuestYama_1 = false 
QuestYama_2 = false 
QuestYama_3 = true
if workspace.Map:FindFirstChild("HellDimension") then
if (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000 then
for gg,ez in pairs(workspace.Map.HellDimension.Exit:GetChildren()) do
if tonumber(gg) == 2 then
repeat 
task.wait() 
Root.CFrame = workspace.Map.HellDimension.Exit.CFrame 
until not _G.CDK_YM or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
end
end

EquipWeapon(_G.SelectWeapon)
if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) ~= 3 then
repeat 
task.wait()
repeat 
task.wait() 
tween(workspace.Map.HellDimension.Torch1.Particles.CFrame) 
for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do
if v:IsA("ProximityPrompt") then 
fireproximityprompt(v) 
end
end
until (workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5
wait(2) 
_G.T1Yama = true
until not _G.CDK_YM or _G.T1Yama or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3

repeat 
task.wait()
repeat 
task.wait()
tween(workspace.Map.HellDimension.Torch2.Particles.CFrame) 
for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do
if v:IsA("ProximityPrompt") then 
fireproximityprompt(v)
end
end
until (workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5
wait(2) 
_G.T2Yama = true
until _G.T2Yama or _G.CDK_YM == false or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3

repeat 
wait()
repeat 
task.wait() 
tween(workspace.Map.HellDimension.Torch3.Particles.CFrame) 
for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do
if v:IsA("ProximityPrompt") then 
fireproximityprompt(v)
end
end
until (workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5 
wait(2) 
_G.T3Yama = true
until _G.T3Yama or _G.CDK_YM == false or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
end

for i,v in pairs(workspace.Enemies:GetChildren()) do
if (v:FindFirstChild("HumanoidRootPart").Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300 then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
repeat 
task.wait() 
Kill(v,_G.CDK_YM) 
until not _G.CDK_YM or v.Humanoid.Health <= 0 or not v.Parent or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
end
end
end
end
end
end
end
end
end
end)
end
end)

spawn(function()
while wait() do
pcall(function()
if _G.CDK_YM then
if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then
if not workspace.Map:FindFirstChild("HellDimension") or (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000 then
local v = GetConnectionEnemies("Soul Reaper")
if v then 
repeat 
task.wait()
tween(v.HumanoidRootPart.CFrame) 
until v.Humanoid.Health <= 0 or not _G.CDK_YM or not v.Parent or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3 or (workspace.Map:FindFirstChild("HellDimension") and (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000)
elseif plr.Backpack:FindFirstChild("Hallow Essence") or plr.Character:FindFirstChild("Hallow Essence") then
repeat 
tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) 
task.wait() 
until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - Root.Position).Magnitude <= 8

EquipWeapon("Hallow Essence")
elseif replicated:FindFirstChild("Soul Reaper") and replicated:FindFirstChild("Soul Reaper").Humanoid.Health > 0 then
tween(replicated:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)
else
if replicated.Remotes.CommF_:InvokeServer("Bones","Check") < 50 and not workspace.Enemies:FindFirstChild("Soul Reaper") and not replicated:FindFirstChild("Soul Reaper") and not workspace.Map:FindFirstChild("HellDimension") then
if workspace.Enemies:FindFirstChild("Reborn Skeleton") or workspace.Enemies:FindFirstChild("Living Zombie") or workspace.Enemies:FindFirstChild("Domenic Soul") or workspace.Enemies:FindFirstChild("Posessed Mummy") then
for i,v in pairs(workspace.Enemies:GetChildren()) do
if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
repeat 
task.wait() 
Kill(v,_G.CDK_YM)
until not _G.CDK_YM or v.Humanoid.Health <= 0 or not v.Parent
end
end
end
else
tween(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))
end
else
replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
end
end
end
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Cursed Dual Katana (Tushita Quest)",
Default = GetSetting("CDK_TS", false),
Callback = function(Value)
_G.CDK_TS = Value
_G.SaveData["CDK_TS"] = Value
SaveSettings()
end
})

spawn(function()
while wait() do
pcall(function()
if _G.CDK_TS then
if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then
wait(.7) 
replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
wait(.3) 
replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
else
if replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then
if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -3 then
QuestTushita_1 = true
QuestTushita_2 = false
QuestTushita_3 = false

repeat 
wait() 
tween(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875)) 
until (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1

if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
wait(.7) 
replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
wait(.5) 
replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
end

wait(1) 
repeat 
wait() 
tween(CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125)) 
until (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1

if (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
wait(.7) 
replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
wait(.5) 
replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
end

wait(1) 
repeat 
wait() 
tween(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625)) 
until (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1

if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
wait(.7) 
replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
wait(.5) 
replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
end
wait(1)

elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -4 then
QuestTushita_1 = false
QuestTushita_2 = true
QuestTushita_3 = false
repeat 
wait()
_G.AutoRaidCastle = true
until not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 2 
_G.AutoRaidCastle = false 

elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -5 then
QuestTushita_1 = false
QuestTushita_2 = false
QuestTushita_3 = true
if workspace.Enemies:FindFirstChild("Cake Queen") then
for i,v in pairs(workspace.Enemies:GetChildren()) do
if v.Name == "Cake Queen" then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
repeat 
wait()
Kill(v, _G.CDK_TS)
until not _G.CDK_TS or not v.Parent or v.Humanoid.Health <= 0 or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3
end
end
end
elseif replicated:FindFirstChild("Cake Queen") and replicated:FindFirstChild("Cake Queen").Humanoid.Health > 0 then
tween(replicated:FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(0,30,0))
else
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000 then
for i,v in pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren()) do
Ex = i
end
if Ex == 2 then
repeat 
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.HeavenlyDimension.Exit.CFrame
until not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3
end

repeat 
wait()
repeat 
wait() 
tween(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625)) 
for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
if v:IsA("ProximityPrompt") then 
fireproximityprompt(v) 
end
end
until (CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
wait(2)
_G.DoneT1 = true
until not _G.CDK_TS or _G.DoneT1

repeat 
wait()
repeat 
wait()
tween(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875)) 
for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
if v:IsA("ProximityPrompt") then 
fireproximityprompt(v) 
end
end
until (CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
wait(2) 
_G.DoneT2 = true
until _G.DoneT2 or _G.CDK_TS == false

repeat 
wait()
repeat 
task.wait() 
tween(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375)) 
for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
if v:IsA("ProximityPrompt") then 
fireproximityprompt(v) 
end
end
until (CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
wait(2) 
_G.DoneT3 = true
until _G.DoneT3 or _G.CDK_TS == false

for i,v in pairs(workspace.Enemies:GetChildren()) do
if (v:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-08, 0.99301964, -8.73070718e-08, 1, -2.30819008e-08, -0.99301964, -8.3975138e-08, 0.11794927).Position).Magnitude <= 300 then
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
repeat 
wait()
Kill(v, _G.CDK_TS)
until not _G.CDK_TS or v.Humanoid.Health <= 0 or not v.Parent
end
end
end
end
end
end
end
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Cursed Dual Katana (Last quest)",
Default = GetSetting("CDK", false),
Callback = function(Value)
_G.CDK = Value
_G.SaveData["CDK"] = Value
SaveSettings()
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if _G.CDK then
replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Boss")
local v = GetConnectionEnemies("Cursed Skeleton Boss")
if v then
repeat 
wait()
if plr.Character:FindFirstChild("Yama") or plr.Backpack:FindFirstChild("Yama") then 
EquipWeapon("Yama")
elseif plr.Character:FindFirstChild("Tushita") or plr.Backpack:FindFirstChild("Tushita") then 
EquipWeapon("Tushita")
end 
tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
until not _G.CDK or not v.Parent or v.Humanoid.Health <= 0
else
tween(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375)) 
wait(.5)
tween(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
end
end
end)
end
end)
end
if World2 then
Quests:AddSection("True Triple Katana")
Quests:AddButton({
Name = "Buy Legendary Sword",
Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3")
end
})

Quests:AddButton({
Name = "Buy True Triple Katana Sword",
Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan","2")
end
})

Quests:AddToggle({
Name = "Tween to Legendary Sword Dealer",
Default = GetSetting("Tp_LgS", false),
Callback = function(Value)
_G.Tp_LgS = Value
_G.SaveData["Tp_LgS"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
if _G.Tp_LgS then
pcall(function()
for _,v in pairs(game:GetService("ReplicatedStorage").NPCs:GetChildren()) do
if v.Name == "Legendary Sword Dealer " then 
tween(v.HumanoidRootPart.CFrame) 
end
end
end)
end
end
end)
end
if World1 then
Quests:AddSection("Polo Sword")

Quests:AddToggle({
Name = "Auto Get Pole Sword",
Default = GetSetting("AutoPole", false),
Callback = function(Value)
_G.AutoPole = Value
_G.SaveData["AutoPole"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
if _G.AutoPole then
pcall(function()
local v = GetConnectionEnemies("Thunder God")
if v then
repeat task.wait() 
Kill(v, _G.AutoPole) 
until not _G.AutoPole or not v.Parent or v.Humanoid.Health <= 0
else
tween(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
end
end)
end
end
end)
end
if World2 then
Boss:AddSection("Law Raid")

Boss:AddToggle({
Name = "Auto Kill Law",
Default = GetSetting("AutoLawKak", false),
Callback = function(Value)
_G.AutoLawKak = Value
_G.SaveData["AutoLawKak"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
if _G.AutoLawKak then
pcall(function()
local v = GetConnectionEnemies("Order")
if v then 
repeat task.wait() 
Kill(v, _G.AutoLawKak) 
until _G.AutoLawKak == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
end
end)
end
end
end)

Boss:AddButton({
Name = "Buy Microchip Law",
Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
end
})

Boss:AddButton({
Name = "Start Law Raids",
Callback = function()
fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
end
})
end

if World1 then
Quests:AddSection("First Sea Items")

Quests:AddToggle({
Name = "Auto Saw Sword",
Default = GetSetting("AutoSaw", false),
Callback = function(Value)
_G.AutoSaw = Value
_G.SaveData["AutoSaw"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.2) do
pcall(function()
if _G.AutoSaw then
local v = GetConnectionEnemies("The Saw")
if v then 
repeat task.wait() 
Kill(v, _G.AutoSaw)
until _G.AutoSaw == false or v.Humanoid.Health <= 0
else 
tween(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))
end
end
end)
end
end)



Quests:AddToggle({
Name = "Auto Unlock Saber",
Default = GetSetting("AutoSaber", false),
Callback = function(Value)
_G.AutoSaber = Value
_G.SaveData["AutoSaber"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.2) do
pcall(function()
if _G.AutoSaber and plr.Data.Level.Value >= 200 and not plr.Backpack:FindFirstChild("Saber") and not plr.Character:FindFirstChild("Saber") then
if workspace.Map.Jungle.Final.Part.Transparency == 0 then
if workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 then
tween(plr.Character.HumanoidRootPart.CFrame)
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
wait(0.5)
plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
wait(0.5) 
else
tween(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
end
else
if workspace.Map.Desert.Burn.Part.Transparency == 0 then
if plr.Backpack:FindFirstChild("Torch") or plr.Character:FindFirstChild("Torch") then
EquipWeapon("Torch")
firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,0)
firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,1)
tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
else
tween(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
end
else
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
wait(0.5)
EquipWeapon("Cup")
wait(0.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",plr.Character.Cup)
wait(1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") 
else
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
if workspace.Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
tween(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
for i,v in pairs(workspace.Enemies:GetChildren()) do
if v.Name == "Mob Leader" and Attack.Alive(v) then
repeat task.wait() 
Kill(v, _G.AutoSaber)
until v.Humanoid.Health <= 0 or _G.AutoSaber == false
end
end
end
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
EquipWeapon("Relic")
tween(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
end
end
end
end
else
if workspace.Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
for _,v in pairs(workspace.Enemies:GetChildren()) do
if v.Name == "Saber Expert" and Attack.Alive(v) then
repeat task.wait() 
Kill(v, _G.AutoSaber) 
until v.Humanoid.Health <= 0 or _G.AutoSaber == false
if v.Humanoid.Health <= 0 then 
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic") 
end
end
end
else
tween(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))
end
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Cool Glasses",
Default = GetSetting("AutoColShad", false),
Callback = function(Value)
_G.AutoColShad = Value
_G.SaveData["AutoColShad"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.2) do
if _G.AutoColShad then
pcall(function()
local v = GetConnectionEnemies("Cyborg")
if v then 
repeat task.wait()
Kill(v, _G.AutoColShad)
until _G.AutoColShad == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813))
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Usoap's Hat",
Default = GetSetting("AutoGetUsoap", false),
Callback = function(Value)
_G.AutoGetUsoap = Value
_G.SaveData["AutoGetUsoap"] = Value
SaveSettings()
end
})

spawn(function()
while task.wait(1) do
pcall(function()
if _G.AutoGetUsoap then
for _, v in pairs(workspace.Characters:GetChildren()) do
if v.Name ~= plr.Name then
if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (Root.Position - v.HumanoidRootPart.Position).Magnitude <= 230 then
repeat task.wait() 
EquipWeapon(_G.SelectWeapon) 
tween(v.HumanoidRootPart.CFrame * CFrame.new(1, 1, 2)) 
until _G.AutoGetUsoap == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
end
end
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Warden Sword",
Default = GetSetting("WardenBoss", false),
Callback = function(Value)
_G.WardenBoss = Value
_G.SaveData["WardenBoss"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
if _G.WardenBoss then
pcall(function()
local v = GetConnectionEnemies("Chief Warden")
if v then 
repeat wait() 
Kill(v,_G.WardenBoss) 
until _G.WardenBoss == false or not v.Parent or v.Humanoid.Health <= 0 
else 
tween(CFrame.new(5206.92578,0.997753382,814.976746,0.342041343,-0.00062915677,0.939684749,0.00191645394,0.999998152,-2.80422337e-05,-0.939682961,0.00181045406,0.342041939))
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Marine Coat",
Default = GetSetting("MarinesCoat", false),
Callback = function(Value)
_G.MarinesCoat = Value
_G.SaveData["MarinesCoat"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
if _G.MarinesCoat then
pcall(function()
local v = GetConnectionEnemies("Vice Admiral")
if v then 
repeat wait() 
Kill(v, _G.MarinesCoat) 
until _G.MarinesCoat == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Swan Coat",
Default = GetSetting("SwanCoat", false),
Callback = function(Value)
_G.SwanCoat = Value
_G.SaveData["SwanCoat"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
if _G.SwanCoat then
pcall(function()
local v = GetConnectionEnemies("Swan")
if v then 
repeat wait()
Kill(v, _G.SwanCoat)
until _G.SwanCoat == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))
end
end)
end
end
end)
end

if World2 then
Quests:AddSection("Rengoku")

Quests:AddToggle({
Name = "Auto Rengoku Sword",
Default = GetSetting("IceBossRen", false),
Callback = function(Value)
_G.IceBossRen = Value
_G.SaveData["IceBossRen"] = Value
SaveSettings()
end
})

spawn(function()
pcall(function()
while wait(.1) do
if _G.IceBossRen then
local v = GetConnectionEnemies("Awakened Ice Admiral")
if v then 
repeat task.wait()
Kill(v,_G.IceBossRen)
until _G.IceBossRen == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
end
end
end
end)
end)

Quests:AddToggle({
Name = "Auto Key Rengoku",
Default = GetSetting("KeysRen", false),
Callback = function(Value)
_G.KeysRen = Value
_G.SaveData["KeysRen"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
pcall(function()
if _G.KeysRen then
if plr.Backpack:FindFirstChild(RenMon[3]) or plr.Character:FindFirstChild(RenMon[3]) then
EquipWeapon(RenMon[3]) 
wait(.1)
tween(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
else
local v = GetConnectionEnemies(RenMon)
if v then 
repeat task.wait() 
Kill(v,_G.KeysRen)
until plr.Backpack:FindFirstChild(RenMon[3]) or _G.KeysRen == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
end
end
end
end)
end
end)

Quests:AddSection("Second Sea Items")

Quests:AddToggle({
Name = "Auto Dragon Trident",
Default = GetSetting("AutoTridentW2", false),
Callback = function(Value)
_G.AutoTridentW2 = Value
_G.SaveData["AutoTridentW2"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
pcall(function()
if _G.AutoTridentW2 then
local v = GetConnectionEnemies("Tide Keeper")
if v then 
repeat task.wait() 
Kill(v,_G.AutoTridentW2)
until _G.AutoTridentW2 == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188))
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Long Sword",
Default = GetSetting("LongsWord", false),
Callback = function(Value)
_G.LongsWord = Value
_G.SaveData["LongsWord"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
pcall(function()
if _G.LongsWord then
local v = GetConnectionEnemies("Diamond")
if v then 
repeat task.wait() 
Kill(v,_G.LongsWord)
until _G.LongsWord == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Black Spikey",
Default = GetSetting("BlackSpikey", false),
Callback = function(Value)
_G.BlackSpikey = Value
_G.SaveData["BlackSpikey"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
if _G.BlackSpikey then
pcall(function()
local v = GetConnectionEnemies("Jeremy")
if v then 
repeat wait() 
Kill(v, _G.BlackSpikey)
until _G.BlackSpikey == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Dark Blade V3",
Default = GetSetting("DarkBladev3", false),
Callback = function(Value)
_G.DarkBladev3 = Value
_G.SaveData["DarkBladev3"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.DarkBladev3 and World2 then
if not GetBP("Dark Blade") then 
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Dark Blade") 
end
if GetBP("Fist of Darkness") > 1 then
if not workspace.Enemies:FindFirstChild("Darkbeard") then
tween(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
elseif GetConnectionEnemies("Darkbeard") and GetBP("Fist of Darkness") >= 1 then
repeat wait() 
tween(CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375)) 
until not _G.DarkBladev3 or (Root.Position == CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375).Position)
fireclickdetector(workspace.Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)
end
else
_G.AutoFarmChest = true
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Midnight Blade",
Default = GetSetting("AutoEcBoss", false),
Callback = function(Value)
_G.AutoEcBoss = Value
_G.SaveData["AutoEcBoss"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.AutoEcBoss then
if GetM("Ectoplasm") >= 99 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 3)
elseif GetM("Ectoplasm") <= 99 then
local v = GetConnectionEnemies("Cursed Captain")
if v then 
repeat wait()
Kill(v, _G.AutoEcBoss) 
until not _G.AutoEcBoss or not v.Parent or v.Humanoid.Health <= 0
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)) 
wait(.5)
tween(CFrame.new(916.928589, 181.092773, 33422))
end
end
end
end)
end
end)

Boss:AddToggle({
Name = "Auto Darkbeard",
Default = GetSetting("Auto_Def_DarkCoat", false),
Callback = function(Value)
_G.Auto_Def_DarkCoat = Value
_G.SaveData["Auto_Def_DarkCoat"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
if _G.Auto_Def_DarkCoat then
pcall(function()
if GetBP("Fist of Darkness") and not workspace.Enemies:FindFirstChild("Darkbeard") then
tween(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
elseif GetConnectionEnemies("Darkbeard") then
local v = GetConnectionEnemies("Darkbeard")
if v then 
repeat wait()
Kill(v,_G.Auto_Def_DarkCoat)
until _G.Auto_Def_DarkCoat == false or not v.Parent or v.Humanoid.Health <= 0 
end
elseif not GetBP("Fist of Darkness") and not GetConnectionEnemies("Darkbeard") then
repeat wait(.1) 
_G.AutoFarmChest = true 
until not _G.Auto_Def_DarkCoat or GetBP("Fist of Darkness") or GetConnectionEnemies("Darkbeard")
_G.AutoFarmChest = false
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Unlock Don Swan",
Default = GetSetting("Auto_DonAcces", false),
Callback = function(Value)
_G.Auto_DonAcces = Value
_G.SaveData["Auto_DonAcces"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.1) do
if _G.Auto_DonAcces then
pcall(function()
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil and plr.Data.Level.Value >= 1500 then
FruitPrice = {}
FruitStore = {}
for i,v in next,game:GetService("ReplicatedStorage"):WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
if v.Price >= 1000000 then
table.insert(FruitPrice,v.Name)
end
end
for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
for _,x in pairs(v) do
if _ == "Name" then
table.insert(FruitStore,x)
end
end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
for _,y in pairs(FruitPrice) do
for _,z in pairs(FruitStore) do
if y == z and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
_G.StoreF = false
if not plr.Backpack:FindFirstChild(FruitStore) then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",tostring(y))
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","3")
end
end
end
end
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
_G.StoreF = true
_G.Auto_DonAcces = false
end
end
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Swan Glasses",
Default = GetSetting("Auto_SwanGG", false),
Callback = function(Value)
_G.Auto_SwanGG = Value
_G.SaveData["Auto_SwanGG"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.2) do
if _G.Auto_SwanGG then
pcall(function()
local v = GetConnectionEnemies("Don Swan")
if v then 
repeat wait() 
Kill(v,_G.Auto_SwanGG)
until _G.Auto_SwanGG == false or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
end
end)
end
end
end)
end

if World1 then
Boss:AddSection("Bosses")
Boss:AddToggle({
Name = "Auto Whitebeard",
Default = GetSetting("Greybeard", false),
Callback = function(Value)
_G.Greybeard = Value
_G.SaveData["Greybeard"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
if _G.Greybeard then
pcall(function()
local v = GetConnectionEnemies("Greybeard")
if v then
repeat wait()
Kill(v, _G.Greybeard)
until _G.Greybeard == false or not v.Parent or v.Humanoid.Health <= 0
else
tween(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
end
end)
end
end
end)
end

if World3 then
Quests:AddSection("Third Sea Items")

Quests:AddToggle({
Name = "Auto Buddy",
Default = GetSetting("AutoBigmom", false),
Callback = function(Value)
_G.AutoBigmom = Value
_G.SaveData["AutoBigmom"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
if _G.AutoBigmom then
pcall(function()
local bx = GetConnectionEnemies("Cake Queen")
if bx then 
repeat task.wait() 
Kill(bx, _G.AutoBigmom) 
until not _G.AutoBigmom or not bx.Parent or bx.Humanoid.Health <= 0
else 
tween(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
end
end)
end
end
end)

Quests:AddToggle({
Name = "Auto Canvender",
Default = GetSetting("Auto_Cavender", false),
Callback = function(Value)
_G.Auto_Cavender = Value
_G.SaveData["Auto_Cavender"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.Auto_Cavender then
local v = GetConnectionEnemies("Beautiful Pirate")
if v then 
repeat wait() 
Kill(v,_G.Auto_Cavender)
until not _G.Auto_Cavender or v.Humanoid.Health <= 0
else 
tween(CFrame.new(5283.609375,22.56223487854,-110.78285217285))
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Twin Hooks",
Default = GetSetting("TwinHook", false),
Callback = function(Value)
_G.TwinHook = Value
_G.SaveData["TwinHook"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.TwinHook then
local v = GetConnectionEnemies("Captain Elephant")
if v then 
repeat wait()
Kill(v,_G.TwinHook)
until not _G.TwinHook or v.Humanoid.Health <= 0
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)) 
wait(.2)
tween(CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125))
end
end
end)
end
end)

Quests:AddToggle({
Name = "Auto Serpent Bow",
Default = GetSetting("AutoSerpentBow", false),
Callback = function(Value)
_G.AutoSerpentBow = Value
_G.SaveData["AutoSerpentBow"] = Value
SaveSettings()
end
})

spawn(function()
while wait(1) do
if _G.AutoSerpentBow then
local v = GetConnectionEnemies("Hydra Leader")
if v then
repeat wait() 
Kill(v,_G.AutoSerpentBow)
until not _G.AutoSerpentBow or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547))
end
end
end
end)

Quests:AddToggle({
Name = "Auto Lei Accessory",
Default = GetSetting("AutoKilo", false),
Callback = function(Value)
_G.AutoKilo = Value
_G.SaveData["AutoKilo"] = Value
SaveSettings()
end
})

spawn(function()
while wait(.2) do
if _G.AutoKilo then
pcall(function()
local v = GetConnectionEnemies("Kilo Admiral")
if v then 
repeat task.wait()
Kill(v,_G.AutoKilo)
until not _G.AutoKilo or not v.Parent or v.Humanoid.Health <= 0
else 
tween(CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125))
end
end)
end
end
end)
-- save config here
Mirage:AddSection("Mirage")

FullMOOn = Mirage:AddParagraph({
Title = " Full Moon ",
Content = ""
})

Ismirage = Mirage:AddParagraph({
Title = " Mirage Island ",
Content = ""
})

spawn(function()
while wait(.2) do
if workspace.Map:FindFirstChild("MysticIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
Ismirage:Set(" True")
else
Ismirage:Set(" False")
end
end
end)

spawn(function()
while wait(.2) do
pcall(function()
moon8 = "http://www.roblox.com/asset/?id=9709150401"
moon7 = "http://www.roblox.com/asset/?id=9709150086"
moon6 = "http://www.roblox.com/asset/?id=9709149680"
moon5 = "http://www.roblox.com/asset/?id=9709149431"
moon4 = "http://www.roblox.com/asset/?id=9709149052"
moon3 = "http://www.roblox.com/asset/?id=9709143733"
moon2 = "http://www.roblox.com/asset/?id=9709139597"
moon1 = "http://www.roblox.com/asset/?id=9709135895"
moon = Getmoon()
if moon == moon1 then
FullMOOn:Set(" Moon: 0 / 8")
elseif moon == moon2 then
FullMOOn:Set(" Moon: 1 / 8")
elseif moon == moon3 then
FullMOOn:Set(" Moon: 2 / 8")
elseif moon == moon4 then
FullMOOn:Set(" Next Night")
elseif moon == moon5 then
FullMOOn:Set(" Full Moon")
elseif moon == moon6 then
FullMOOn:Set(" Last Night")
elseif moon == moon7 then
FullMOOn:Set(" Moon: 6 / 8")
elseif moon == moon8 then
FullMOOn:Set(" Moon: 7 / 8")
end
end)
end
end)

Mirage:AddToggle({
Name = "Auto Find Mirage Island",
Default = false,
Callback = function(Value)
_G.FindMirage = Value
end
})

spawn(function()
while wait() do
if _G.FindMirage then
pcall(function()
if not workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island", true) then
local myBoat = CheckBoat()
if not myBoat then
local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
TeleportToTarget(buyBoatCFrame)
if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then 
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) 
end
else
if plr.Character.Humanoid.Sit == false then
local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
tween(boatSeatCFrame)
else
repeat wait()
local targetDestination = CFrame.new(-10000000, 31, 37016.25)
if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
tween(CFrame.new(-10000000, 150, 37016.25))
else
tween(CFrame.new(-10000000, 31, 37016.25))
end
until not _G.FindMirage or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island") or plr.Character.Humanoid.Sit == false
plr.Character.Humanoid.Sit = false
end
end
else
tween(workspace.Map.MysticIsland.Center.CFrame*CFrame.new(0,300,0))
end
end)
end
end
end)

Mirage:AddToggle({
Name = "Auto Tween To Highest Point",
Default = false,
Callback = function(Value)
_G.HighestMirage = Value
end
})

spawn(function()
while wait(1) do
if _G.HighestMirage then
pcall(function()
if workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island",true) then 
tween(workspace.Map.MysticIsland.Center.CFrame*CFrame.new(0,400,0))
end
end)
end
end
end)

Mirage:AddToggle({
Name = "Auto Look Moon",
Default = false,
Callback = function(Value)
LookM = Value
end
})

function MoveCamtoMoon()
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,Lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position,Lighting:GetMoonDirection() + plr.Character.HumanoidRootPart.CFrame.Position)
end

task.spawn(function()
while task.wait() do
if LookM then
MoveCamtoMoon()
wait(.1)
game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
end
end
end)

Mirage:AddToggle({
Name = "Auto Get Gear",
Default = false,
Callback = function(Value)
_G.TPGEAR = Value
end
})

spawn(function()
pcall(function()
while wait(0.1) do
if _G.TPGEAR then
for i,v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do
if v.Name == "Part" then
if v.ClassName == "MeshPart" then 
tween(v.CFrame) 
end
end
end
end
end
end)
end)

Mirage:AddToggle({
Name = "Easy See",
Default = false,
Callback = function(Value)
_G.can = Value
end
})

spawn(function()
pcall(function()
while wait(1) do
if _G.can then
for i,v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do
if v.Name == "Part" then
if v.ClassName == "MeshPart" then
v.Transparency = 0
else
v.Transparency = 1
end
end
end
end
end
end)
end)

Mirage:AddToggle({
Name = "Auto Tween Advanced Fruit Dealer",
Default = false,
Callback = function(Value)
_G.Addealer = Value
end
})

spawn(function()
while wait() do
if _G.Addealer then
pcall(function()
for _,v in pairs(game:GetService("ReplicatedStorage").NPCs:GetChildren()) do
if v.Name == "Advanced Fruit Dealer" then 
tween(v.HumanoidRootPart.CFrame) 
end
end
end)
end
end
end)

Mirage:AddToggle({
Name = "Auto Collect Mirage Chest",
Default = false,
Callback = function(Value)
_G.FarmChestM = Value
end
})

spawn(function()
while wait(.2) do
if _G.FarmChestM then
pcall(function()
if workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest") or workspace.Map.MysticIsland.Chests:FindFirstChild("FragChest") then
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
if not Character then return end
local Position = Character:GetPivot().Position
local Chests = CollectionService:GetTagged("_ChestTagged")
local Distance, Nearest = math.huge, nil
for i = 1, #Chests do
local Chest = Chests[i]
local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
if not SelectedIsland or Chest:IsDescendantOf(SelectedIsland) then
if not Chest:GetAttribute("IsDisabled") and Magnitude < Distance then
Distance = Magnitude
Nearest = Chest
end
end
end
if Nearest then 
tween(Nearest:GetPivot()) 
end
end
end)
end
end
end)

Mirage:AddSection("Skull Guitars")

CheckSoul = Mirage:AddParagraph({
Title = " Skull Guitar Quests ",
Content = ""
})

spawn(function()
while wait(.2) do
pcall(function()
if Quest1 == true then 
CheckSoul:Set(" Quest Number : Quest1")
elseif Quest2 == true then 
CheckSoul:Set(" Quest Number : Quest2")
elseif Quest3 == true then 
CheckSoul:Set(" Quest Number : Quest3")
elseif Quest4 == true then 
CheckSoul:Set(" Quest Number : Quest4")
elseif GetWP("Skull Guitar") then 
CheckSoul:Set(" Quest Number : Collect!!")
else 
CheckSoul:Set(" Quest Number : No Quest!!")
end
end)
end
end)

Mirage:AddToggle({
Name = "Auto Skull Guitar",
Default = false,
Callback = function(Value)
_G.Auto_Soul_Guitar = Value
end
})

task.spawn(function()
while wait() do
if _G.Auto_Soul_Guitar then
pcall(function()
local v = GetConnectionEnemies("Living Zombie")
if v then
v.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
v.Head.CanCollide = false
v.Humanoid.Sit = false
v.HumanoidRootPart.CanCollide = false
v.Humanoid.JumpPower = 0
v.Humanoid.WalkSpeed = 0
if v.Humanoid:FindFirstChild('Animator') then 
v.Humanoid:FindFirstChild('Animator'):Destroy() 
end
end
end)
end
end
end)

function getT(num)
local rotation
if num == 1 then
rotation = workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation
elseif num == 3 then
rotation = workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation
elseif num == 4 then
rotation = workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation
elseif num == 7 then
rotation = workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation
elseif num == 10 then
rotation = workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation
end
if rotation then
return rotation.Z
end
end

function getRT(num)
local Trophy_Q = workspace.Map["Haunted Castle"].Trophies.Quest
local Trophy_Pos
for _, v in pairs(Trophy_Q:GetChildren()) do
if num == 1 and v.Name == "Trophy1" and v:FindFirstChild("Handle") then
Trophy_Pos = v.Handle.Rotation
elseif num == 2 and v.Name == "Trophy2" and v:FindFirstChild("Handle") then
Trophy_Pos = v.Handle.Rotation
elseif num == 3 and v.Name == "Trophy3" and v:FindFirstChild("Handle") then
Trophy_Pos = v.Handle.Rotation
elseif num == 4 and v.Name == "Trophy4" and v:FindFirstChild("Handle") then
Trophy_Pos = v.Handle.Rotation
elseif num == 5 and v.Name == "Trophy5" and v:FindFirstChild("Handle") then
Trophy_Pos = v.Handle.Rotation
end
if Trophy_Pos then
return Trophy_Pos.Z
end
end
end

GetFirePlacard = function(Number,Side)
if tostring(workspace.Map["Haunted Castle"]["Placard"..Number][Side].Indicator.BrickColor) ~= "Pearl" then
fireclickdetector(workspace.Map["Haunted Castle"]["Placard"..Number][Side].ClickDetector)
end
end

spawn(function()
repeat task.wait() until _G.Auto_Soul_Guitar
while wait(1) do
pcall(function()
if _G.Auto_Soul_Guitar then
if World3 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check") == nil then
tween(CFrame.new(-8655.0166015625, 141.3166961669922, 6160.0224609375))
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Swamp == false then
Quest1 = true
Quest2 = false
Quest3 = false
Quest4 = false
local v = GetConnectionEnemies("Living Zombie")
if v then 
repeat task.wait() 
Kill(v,_G.Auto_Soul_Guitar) 
until not _G.Auto_Soul_Guitar or v.Humanoid.Health <= 0 or not v.Parent or workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)
else 
tween(CFrame.new(-10170.7275390625, 138.6524658203125, 5934.26513671875))
end
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Gravestones == false then
Quest1 = false
Quest2 = true
Quest3 = false
Quest4 = false
GetFirePlacard("7","Left")
GetFirePlacard("6","Left")
GetFirePlacard("5","Left")
GetFirePlacard("4","Right")
GetFirePlacard("3","Left")
GetFirePlacard("2","Right")
GetFirePlacard("1","Right")
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Ghost == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == false then
Quest1 = false
Quest2 = false
Quest3 = true
Quest4 = false
tween(CFrame.new(-9532.8232421875, 6.471667766571045, 6078.068359375))
repeat wait()
local z1 = getRT(1)
local _z1 = getT(1)
if z1 and _z1 then
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
end
until z1 == _z1
repeat wait()
local z2 = getRT(2)
local _z2 = getT(3)
if z2 and _z2 then
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
end
until z2 == _z2
repeat wait()
local z3 = getRT(3)
local _z3 = getT(4)
if z3 and _z3 then
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
end
until z3 == _z3
repeat wait()
local z4 = getRT(4)
local _z4 = getT(7)
if z4 and _z4 then
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
end
until z4 == _z4
repeat wait()
local z5 = getRT(5)
local _z5 = getT(10)
if z5 and _z5 then
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))
end
until z5 == _z5
repeat wait()
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))
until workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0
elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Pipes == false then
Quest1 = false
Quest2 = false
Quest3 = false
Quest4 = true
tween(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
tween(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
tween(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
tween(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
tween(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
end
end
end
end)
end
end)

Mirage:AddToggle({
Name = "Auto Material For Skull Guitar",
Default = false,
Callback = function(Value)
_G.AutoMatSoul = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.AutoMatSoul and GetWP("Skull Guitar") == false then
if GetM("Bones") >= 500 and GetM("Ectoplasm") >= 250 and GetM("Dark Fragment") >= 1 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
else
if GetM("Ectoplasm") <= 250 then
if _G.AutoMatSoul and World2 then
local EctoTable = {"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior"}
local xz = GetConnectionEnemies(EctoTable)
if xz then 
repeat task.wait() 
Kill(xz, _G.AutoMatSoul)
until not _G.AutoMatSoul or not xz.Parent or xz.Humanoid.Health <= 0
else 
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
end
else 
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end
elseif GetM("Dark Fragment") < 1 then
if _G.AutoMatSoul and World2 then
local black = GetConnectionEnemies("Darkbeard")
if black then 
repeat task.wait()
Kill(black, _G.AutoMatSoul)
until _G.AutoMatSoul or black.Humanoid.Health <= 0
else 
tween(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
end
else 
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end
if not GetConnectionEnemies("Darkbeard") then 
Hop() 
end
elseif GetM("Bones") <= 500 then
if _G.AutoMatSoul and World3 then
local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
local zx = GetConnectionEnemies(BonesTable)
if zx then 
repeat task.wait()
Kill(zx, _G.AutoMatSoul)
until not _G.AutoMatSoul or zx.Humanoid.Health <= 0 or not zx.Parent or zx.Humanoid.Health <= 0
else 
tween(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
end
else
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
end
end
end
end)
end
end)

Mirage:AddButton({
Name = "Talk With Stone",
Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Begin")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Check")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Teleport")
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Continue")
end
})

Mirage:AddSection("Race V4")

CheckTier = Mirage:AddParagraph({
Title = " Tiers V4 ",
Content = ""
})

spawn(function()
pcall(function()
while wait(.2) do
CheckTier:Set(" Tiers:" .." "..plr.Data.Race.C.Value)
end
end)
end)

Mirage:AddToggle({
Name = "Auto Pull Lever",
Default = false,
Callback = function(Value)
_G.Lver = Value
end
})

spawn(function()
while wait(1) do
if _G.Lver then
pcall(function()
for x,c in pairs(workspace.Map["Temple of Time"]:GetDescendants()) do
if c.Name == "ProximityPrompt" then 
fireproximityprompt(c,math.huge)
end
end
end)
end
end
end)

Mirage:AddToggle({
Name = "Auto Train V4",
Default = false,
Callback = function(Value)
_G.AcientOne = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.AcientOne then
local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
for i = 1, #BonesTable do
if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
vim1:SendKeyEvent(true, "Y", false, game)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace","Buy")
tween(CFrame.new(-8987.041015625, 215.862060546875, 5886.71044921875))
elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
local v = GetConnectionEnemies(BonesTable)
if v then
repeat wait()
Kill(v, _G.AcientOne)
until _G.AcientOne == false or v.Humanoid.Health <= 0 or not v.Parent
else
tween(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
end
end
end
end
end)
end
end)

Mirage:AddToggle({
Name = "Teleport to Temple of Time",
Default = false,
Callback = function(Value)
_G.TP_Temple = Value
if Value then
local targetCF = Vector3.new(3028.59, 2281.08, -7324.82)
tween(targetCF)
spawn(function()
repeat
task.wait(0.1)
until not _G.TP_Temple or (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and (plr.Character.HumanoidRootPart.Position - targetCF.Position).Magnitude < 10)
if _G.TP_Temple then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
end
end)
end
end
})

Mirage:AddToggle({
Name = "Teleport to Ancient One",
Default = false,
Callback = function(Value)
_G.TP_AncientOne = Value
if Value then
tween(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
task.wait(0.5)
_G.TP_AncientOne = false
end
end
})

Mirage:AddToggle({
Name = "Teleport to Ancient Clock",
Default = false,
Callback = function(Value)
_G.TP_Clock = Value
if Value then
tween(CFrame.new(29549, 15069, -88))
task.wait(0.5)
_G.TP_Clock = false
end
end
})

Mirage:AddToggle({
Name = "Tween to Race Doors",
Default = false,
Callback = function(Value)
_G.TPDoor = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.TPDoor then
if tostring(plr.Data.Race.Value) == "Mink" then
tween(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
elseif tostring(plr.Data.Race.Value) == "Fishman" then
tween(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
elseif tostring(plr.Data.Race.Value) == "Cyborg" then
tween(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
elseif tostring(plr.Data.Race.Value) == "Skypiea" then
tween(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
elseif tostring(plr.Data.Race.Value) == "Ghoul" then
tween(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
elseif tostring(plr.Data.Race.Value) == "Human" then
tween(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
end
end
end)
end
end)

Mirage:AddToggle({
Name = "Auto Complete Trial",
Default = false,
Callback = function(Value)
_G.Complete_Trials = Value
end
})

GetSeaBeastTrial = function()
if not workspace.Map:FindFirstChild("FishmanTrial") then 
return nil 
end
if workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then 
FishmanTrial = workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") 
end
if FishmanTrial then
for _,v in next, workspace.SeaBeasts:GetChildren() do
if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 then
if v.Health.Value > 0 then 
return v 
end
end
end
end
end

spawn(function()
while wait(1) do
pcall(function()
if _G.Complete_Trials then
if tostring(plr.Data.Race.Value) == "Mink" then
notween(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-20,0))
end
end
end)
end
end)

spawn(function()
while wait(1) do
pcall(function()
if _G.Complete_Trials then
if tostring(plr.Data.Race.Value) == "Fishman" then
if GetSeaBeastTrial() then
repeat task.wait()
spawn(function()
tween(CFrame.new(GetSeaBeastTrial().HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 300,GetSeaBeastTrial().HumanoidRootPart.Position.Z))
end)
MousePos = GetSeaBeastTrial().HumanoidRootPart.Position
Useskills("Melee","Z")
Useskills("Melee","X")
Useskills("Melee","C")
wait(.1)
Useskills("Sword","Z")
Useskills("Sword","X")
wait(.1)
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
wait(.1)
Useskills("Gun","Z")
Useskills("Gun","X")
until _G.Complete_Trials == false or not GetSeaBeastTrial()
end
end
end
end)
end
end)

spawn(function()
while wait(1) do
pcall(function()
if _G.Complete_Trials then
if tostring(plr.Data.Race.Value) == "Cyborg" then
tween(workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0,500,0))
end
end
end)
end
end)

spawn(function()
while wait(1) do
pcall(function()
if _G.Complete_Trials then
if tostring(plr.Data.Race.Value) == "Skypiea" then
notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
end
end
end)
end
end)

spawn(function()
while wait(.1) do
pcall(function()
if _G.Complete_Trials then
if tostring(plr.Data.Race.Value) == "Human" or tostring(plr.Data.Race.Value) == "Ghoul" then
local TrialsTables = {"Ancient Vampire","Ancient Zombie"}
local v = GetConnectionEnemies(TrialsTables)
if v then 
repeat wait() 
Kill(v, _G.Complete_Trials)
until _G.Complete_Trials == false or not v.Parent or v.Humanoid.Health <= 0 
end
end
end
end)
end
end)

Mirage:AddToggle({
Name = "Auto Kill Player Trial",
Default = false,
Callback = function(Value)
_G.Defeating = Value
end
})

spawn(function()
while task.wait(1) do
pcall(function()
if _G.Defeating then
for _, v in pairs(workspace.Characters:GetChildren()) do
if v.Name ~= plr.Name then
if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (Root.Position - v.HumanoidRootPart.Position).Magnitude <= 250 then
repeat task.wait() 
EquipWeapon(_G.SelectWeapon) 
tween(v.HumanoidRootPart.CFrame * CFrame.new(0,0,15)) 
sethiddenproperty(plr, "SimulationRadius", math.huge)
until _G.Defeating == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
end
end
end
end
end)
end
end)

Islands:AddSection("Dojo")

Islands:AddToggle({
Name = "Auto Dojo Trainer",
Default = false,
Callback = function(Value)
_G.Dojoo = Value
end
})

function printBeltName(data) 
if type(data) == "table" and data.Quest["BeltName"] then 
return data.Quest["BeltName"] 
end 
end

spawn(function()
while wait(1) do
if _G.Dojoo then
pcall(function()
local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "RequestQuest"}}
local progress = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
local NameBelt = printBeltName(progress)

if debug == false and not progress and not NameBelt then
tween(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
debug = true
elseif debug == true and (CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
if NameBelt == "White" then
local v = GetConnectionEnemies("Skull Slayer")
if v then 
repeat task.wait() 
Kill(v, _G.Dojoo) 
until not progress or not _G.Dojoo or not Attack.Alive(v)
else 
tween(CFrame.new(-16759.58984375, 71.28376770019531, 1595.3399658203125))
end
elseif NameBelt == "Yellow" then
repeat task.wait()
_G.SeaBeast1 = true
_G.TerrorShark = true
_G.Shark = true
_G.Piranha = true
_G.MobCrew = true
_G.FishBoat = true
_G.SailBoats = true
until not _G.Dojoo or not progress
_G.SeaBeast1 = false
_G.TerrorShark = false
_G.Shark = false
_G.Piranha = false
_G.MobCrew = false
_G.FishBoat = false
_G.SailBoats = false
elseif NameBelt == "Green" then
repeat task.wait()
_G.SailBoats = true
until not _G.Dojoo or not progress
_G.SailBoats = false
elseif NameBelt == "Purple" then
repeat task.wait()
_G.FarmEliteHunt = true
until not _G.Dojoo or not progress
_G.FarmEliteHunt = false
elseif NameBelt == "Red" then
repeat task.wait()
_G.SailBoats = true
_G.FishBoat = true
until not _G.Dojoo or not progress
_G.SailBoats = false
_G.FishBoat = false
elseif NameBelt == "Black" then
repeat task.wait()
if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
_G.Prehis_Find = true
if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt",true) then
_G.Prehis_Skills = false
_G.Prehis_Find = true
else
_G.Prehis_Skills = true
_G.Prehis_Find = false
end
else
_G.Prehis_Find = true
_G.Prehis_Skills = false
end
until not _G.Dojoo or not progress
_G.Prehis_Find = false
_G.Prehis_Skills = false
elseif NameBelt == "Orange" or NameBelt == "Blue" then
return nil
end
end

if not progress then
debug = false
local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "ClaimQuest"}}
replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
end
end)
end
end
end)

Islands:AddToggle({
Name = "Auto Dragon Hunter",
Default = false,
Callback = function(Value)
_G.FarmBlazeEM = Value
end
})

checkQuesta = function()
local a = {[1] = {["Context"] = "Check"}}
local b = nil
pcall(function()
local c = {[1] = {["Context"] = "RequestQuest"}}
game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(c))
end)
local d,e = pcall(function()
b = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(a))
end)
local f = false
local g
local h
local i
if b then
if b.Text then
f = true
local j = b.Text
if string.find(tostring(j),"Defeat") then
i = 1
g = string.sub(tostring(j),8,9)
g = tonumber(g)
local k = {"Hydra Enforcer","Venomous Assailant"}
for l,m in pairs(k) do
if string.find(j,m) then
h = m
break
end
end
elseif string.find(tostring(j),"Destroy") then
g = 10
i = 2
h = nil
end
end
end
return f,h,g,i
end

BackTODoJo = function()
for a,b in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
if b.Name == "NotificationTemplate" then
if string.find(b.Text,"Head back to the Dojo to complete more tasks") then
return true
end
end
end
return false
end

DragonMobClear = function(a,b,c)
if workspace.Enemies:FindFirstChild(b) then
for d,e in pairs(workspace.Enemies:GetChildren()) do
if e.Name == b and Attack.Alive(e) then
if a then
Kill(e,a)
end
end
end
else
tween(c)
end
end

spawn(function()
while wait() do
if _G.FarmBlazeEM then
pcall(function()
local a,v,h,x = checkQuesta()
if a == true and not BackTODoJo() then
if x == 1 then
if v == "Hydra Enforcer" or v == "Venomous Assailant" then
repeat wait()
DragonMobClear(true, v, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
until not _G.FarmBlazeEM or not a or BackTODoJo()
end
elseif x == 2 then
if workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true) then
repeat wait()
spawn(function() 
tween(workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4,0,0)) 
end)
if (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200 then
MousePos = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position
Useskills("Melee","Z")
Useskills("Melee","X")
Useskills("Melee","C")
wait(.5)
Useskills("Sword","Z")
Useskills("Sword","X")
wait(.5)
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
wait(.5)
Useskills("Gun","Z")
Useskills("Gun","X")
end
until not _G.FarmBlazeEM or not a or BackTODoJo()
end
end
else
tween(CFrame.new(5813, 1208, 884))
DragonMobClear(false, nil, nil)
end
end)
end
end
end)

spawn(function()
while wait(.1) do
if _G.FarmBlazeEM then
pcall(function()
if workspace.EmberTemplate:FindFirstChild("Part") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.EmberTemplate.Part.CFrame
end
end)
end
end
end)

Islands:AddSection("Draco Race")

GetQuestDracoLevel = function()
local v371 = {[1] = {NPC = "Dragon Wizard", Command = "Upgrade"}}
return replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371))
end

Islands:AddToggle({
Name = "Tween To Upgrade Draco Trial",
Default = false,
Callback = function(Value)
_G.UPGDrago = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.UPGDrago then
if GetQuestDracoLevel() == false then
return nil
elseif GetQuestDracoLevel() == true then
if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
tween(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
else
tween(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
local v371 = {[1] = {NPC = "Dragon Wizard", Command = "Upgrade"}}
replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371))
end
end
end
end)
end
end)

Islands:AddToggle({
Name = "Auto Draco V1",
Default = false,
Callback = function(Value)
_G.DragoV1 = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.DragoV1 then
if GetM("Dragon Egg") <= 0 then
repeat wait()
_G.Prehis_Find = true
_G.Prehis_Skills = true
_G.Prehis_DE = true
until not _G.DragoV1 or GetM("Dragon Egg") >= 1
_G.Prehis_Find = false
_G.Prehis_Skills = false
_G.Prehis_DE = false
end
end
end)
end
end)

Islands:AddToggle({
Name = "Auto Draco V2",
Default = false,
Callback = function(Value)
_G.AutoFireFlowers = Value
end
})

spawn(function()
while wait(1) do
if _G.AutoFireFlowers then
local FireFlower = workspace:FindFirstChild("FireFlowers")
local v = GetConnectionEnemies("Forest Pirate")
if v then 
repeat wait() 
Kill(v,_G.AutoFireFlowers) 
until not _G.AutoFireFlowers or not v.Parent or v.Humanoid.Health <= 0 or FireFlower
else 
tween(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
end

if FireFlower then
for i, v in pairs(FireFlower:GetChildren()) do
if (v:IsA("Model") and v.PrimaryPart) then
local FlowerPos = v.PrimaryPart.Position
local playerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
local Magnited = (FlowerPos - playerRoot).Magnitude
if (Magnited <= 100) then
vim1:SendKeyEvent(true, "E", false, game) 
wait(1.5) 
vim1:SendKeyEvent(false, "E", false, game)
else
tween(CFrame.new(FlowerPos))
end
end
end
end
end
end
end)

Islands:AddToggle({
Name = "Auto Draco V3",
Default = false,
Callback = function(Value)
_G.DragoV3 = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.DragoV3 then
repeat wait()
_G.DangerSc = "Lv Infinite"
_G.SailBoats = true
_G.TerrorShark = true
until not _G.DragoV3
_G.DangerSc = "Lv 1"
_G.SailBoats = false
_G.TerrorShark = false
end
end)
end
end)

Islands:AddToggle({
Name = "Auto Trial Draco",
Default = false,
Callback = function(Value)
_G.Relic123 = Value
end
})

spawn(function()
while wait(1) do
if _G.Relic123 then
pcall(function()
if workspace.Map:FindFirstChild("DracoTrial") then
replicated.Remotes.DracoTrial:InvokeServer()
wait(.5)
repeat wait() 
tween(CFrame.new(-39934.9765625, 10685.359375, 22999.34375)) 
until not _G.Relic123 or (Root.Position == CFrame.new(-39934.9765625, 10685.359375, 22999.34375).Position)
repeat wait() 
tween(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625)) 
until not _G.Relic123 or (Root.Position == CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625).Position)
wait(2.5)
repeat wait() 
tween(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375)) 
until not _G.Relic123 or (Root.Position == CFrame.new(-39914.65625, 10685.384765625, 23000.177734375).Position)
repeat wait() 
tween(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375)) 
until not _G.Relic123 or (Root.Position == CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375).Position)
wait(2.5)
repeat wait() 
tween(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875)) 
until not _G.Relic123 or (Root.Position == CFrame.new(-39908.5, 10685.4052734375, 22990.04296875).Position)
repeat wait() 
tween(CFrame.new(-39609.5, 9376.400390625, 23472.94335975)) 
until not _G.Relic123 or (Root.Position == CFrame.new(-39609.5, 9376.400390625, 23472.94335975).Position)
else
local drago = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
if drago and drago:IsA("Part") then 
tween(CFrame.new(drago.Position)) 
end
end
end)
end
end
end)

Islands:AddToggle({
Name = "Auto Train Draco",
Default = false,
Callback = function(Value)
_G.TrainDrago = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.TrainDrago then
local DragoM = {"Venomous Assailant","Hydra Enforcer"}
for i=1,#DragoM do
if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
vim1:SendKeyEvent(true, "Y", false, game)
replicated.Remotes.CommF_:InvokeServer("UpgradeRace","Buy",2)
tween(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
local v = GetConnectionEnemies(DragoM)
if v then 
repeat wait() 
Kill(v, _G.TrainDrago) 
until _G.TrainDrago == false or v.Humanoid.Health <= 0 or not v.Parent
else 
tween(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
end
end
end
end
end)
end
end)

Islands:AddToggle({
Name = "Tween to Draco Trial",
Default = false,
Callback = function(Value)
_G.TpDrago_Prehis = Value
end
})

spawn(function()
while wait(1) do
if _G.TpDrago_Prehis then
local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
if (v748 and v748:IsA("Part")) then 
tween(CFrame.new(v748.Position)) 
end
end
end
end)

Islands:AddToggle({
Name = "Change To Draco Race",
Default = false,
Callback = function(Value)
_G.BuyDrago = Value
end
})

spawn(function()
while wait(1) do
if _G.BuyDrago then
pcall(function()
if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
tween(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
else
tween(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
local v371 = {[1] = {NPC = "Dragon Wizard", Command = "DragonRace"}}
replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371))
end
end)
end
end
end)

Islands:AddToggle({
Name = "Upgrade Dragon Talon",
Default = false,
Callback = function(Value)
_G.DT_Uzoth = Value
end
})

spawn(function()
while wait(1) do
if _G.DT_Uzoth then
local Uz_POS = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-08, -0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, -6.23161966e-08, 0.811413169)
tween(Uz_POS)
if (Uz_POS.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 25 then
local ohTable1 = {["NPC"] = "Uzoth",["Command"] = "Upgrade"}
replicated.Modules.Net["RF/InteractDragonQuest"]:InvokeServer(ohTable1)
end
end
end
end)

Islands:AddSection("Prehistoric Island")

Islands:AddToggle({
Name = "Craft Volcanic Magnet",
Default = false,
Callback = function(Value)
_G.CraftVM = Value
end
})

Islands:AddButton({
Name = "Craft Volcanic Magnet",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Volcanic Magnet")
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.CraftVM then
if GetM("Volcanic Magnet") < 1 then
if GetM("Scrap Metal") >= 10 and GetM("Blaze Ember") >= 15 then
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Volcanic Magnet")
elseif GetM("Scrap Metal") < 10 then
local v = GetConnectionEnemies("Forest Pirate")
if v then 
repeat wait() 
Kill(v,_G.CraftVM) 
until not _G.CraftVM or not v.Parent or v.Humanoid.Health <= 0 or GetM("Scrap Metal") >= 10
else 
tween(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
end
elseif GetM("Blaze Ember") < 15 then
repeat wait() 
_G.FarmBlazeEM = true 
until not _G.CraftVM or GetM("Blaze Ember") >= 15
_G.FarmBlazeEM = false
end
end
end
end)
end
end)

Check_Volcano = Islands:AddParagraph({
Title = " Prehistoric ",
Content = ""
})

spawn(function()
while wait(.2) do
if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
Check_Volcano:Set(" True")
else
Check_Volcano:Set(" False")
end
end
end)

Islands:AddToggle({
Name = "Find Prehistoric",
Default = false,
Callback = function(Value)
_G.Prehis_Find = Value
end
})

spawn(function()
while wait() do
if _G.Prehis_Find then
pcall(function()
if not workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then
local myBoat = CheckBoat()
if not myBoat then
local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
TeleportToTarget(buyBoatCFrame)
if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then 
replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) 
end
else
if plr.Character.Humanoid.Sit == false then
local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
tween(boatSeatCFrame)
else
repeat wait()
local targetDestination = CFrame.new(-10000000, 31, 37016.25)
if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
tween(CFrame.new(-10000000, 150, 37016.25))
else
tween(CFrame.new(-10000000, 31, 37016.25))
end
until not _G.Prehis_Find or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island") or plr.Character.Humanoid.Sit == false
plr.Character.Humanoid.Sit = false
end
end
else
if (workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then 
tween(workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame)
end
if workspace.Map:FindFirstChild("PrehistoricIsland", true) or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then
if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
if plr:DistanceFromCharacter(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame.Position) <= 150 then
fireproximityprompt(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt, math.huge)
vim1:SendKeyEvent(true, "E", false, game) 
wait(1.5) 
vim1:SendKeyEvent(false, "E", false, game)
end
tween(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame)
end
end
end
end)
end
end
end)

Islands:AddToggle({
Name = "Attack Lava",
Default = false,
Callback = function(Value)
_G.Prehis_Skills = Value
end
})

spawn(function()
while wait() do
if _G.Prehis_Skills then
local prehistoricIsland = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
if prehistoricIsland then
for _, obj in pairs(prehistoricIsland:GetDescendants()) do
if obj:IsA("Part") and obj.Name:lower():find("lava") then 
obj:Destroy() 
end
if obj:IsA("MeshPart") and obj.Name:lower():find("lava") then 
obj:Destroy() 
end
end
local lavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
if lavaModel and lavaModel:IsA("Model") then 
lavaModel:Destroy() 
end
local Island = workspace.Map:FindFirstChild("PrehistoricIsland")
if Island then
local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
for _, v in pairs(Island:GetDescendants()) do
if v.Name == "TouchInterest" then
if not (trialTeleport and v:IsDescendantOf(trialTeleport)) then
v.Parent:Destroy()
end
end
end
end
end
end
end
end)

spawn(function()
while wait() do
pcall(function()
if _G.Prehis_Skills then
if workspace.Enemies:FindFirstChild("Lava Golem") then
local v = GetConnectionEnemies("Lava Golem")
if v then 
repeat wait()
Kill(v,_G.Prehis_Skills) 
v.Humanoid:ChangeState(15)
until not _G.Prehis_Skills or not v.Parent or v.Humanoid.Health <= 0 
end
end
for i,v in pairs(game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks:GetChildren()) do
if v:FindFirstChild("VFXLayer") then
if v:FindFirstChild("VFXLayer").At0.Glow.Enabled == true or v.VFXLayer.At0.Glow.Enabled == true then
repeat wait()
tween(v.VFXLayer.CFrame)
if v.VFXLayer.At0.Glow.Enabled == true and plr:DistanceFromCharacter(v.VFXLayer.CFrame.Position) <= 150 then
MousePos = v.VFXLayer.CFrame.Position
Useskills("Melee","Z") wait(.5)
Useskills("Melee","X") wait(.5)
Useskills("Melee","C") wait(.5)
Useskills("Blox Fruit","Z") wait(.5)
Useskills("Blox Fruit","X") wait(.5)
Useskills("Blox Fruit","C")
end
until not _G.Prehis_Skills or v:FindFirstChild("VFXLayer").At0.Glow.Enabled == false or v.VFXLayer.At0.Glow.Enabled == false
end
end
end
end
end)
end
end)

Islands:AddToggle({
Name = "Collect Dragon Eggs",
Default = false,
Callback = function(Value)
_G.Prehis_DE = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.Prehis_DE then
if workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg") then 
tween(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg").Molten.CFrame) 
fireproximityprompt(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30) 
end
end
end)
end
end)

Islands:AddToggle({
Name = "Collect Dino Bones",
Default = false,
Callback = function(Value)
_G.Prehis_DB = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.Prehis_DB then
if workspace:FindFirstChild("DinoBone") then
for i,v in pairs(workspace:GetChildren()) do
if v.Name == "DinoBone" then 
tween(v.CFrame) 
end
end
end
end
end)
end
end)

Islands:AddToggle({
Name = "Auto Reset When Complete Volcano",
Default = false,
Callback = function(Value)
_G.ResetPH = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.ResetPH then
local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
if (v748 and v748:FindFirstChild("TouchInterest")) then
plr.Character.Humanoid.Health = 0
else
if workspace:FindFirstChild("DinoBone") then
for i,v in pairs(workspace:GetChildren()) do
if v.Name == "DinoBone" then 
tween(v.CFrame) 
end
end
end
end
end
end)
end
end)

SeaEvent:AddSection("Sea Event")

local ListSeaBoat = {"Guardian","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade","PirateSloop","MarineSloop","Beast Hunter"}
local ListSeaZone = {"Lv 1","Lv 2","Lv 3","Lv 4","Lv 5","Lv 6","Lv Infinite"}

SPYING = SeaEvent:AddParagraph({
Title = " Spy",
Content = ""
})

spawn(function()
while wait(.2) do
pcall(function()
local spycheck = string.match(replicated.Remotes.CommF_:InvokeServer("InfoLeviathan","1"),"%d+")
if spycheck then 
SPYING:Set(" Spy: "..tostring(spycheck))
if tostring(spycheck) == 5 then
SPYING:Set(" Suitable Leviathan [Spy <5]")
end
end
end)
end
end)

SeaEvent:AddButton({
Name = "Buy Levi Spy",
Callback = function()
replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("InfoLeviathan","2")
end
})

FloD = SeaEvent:AddParagraph({
Title = " Flozen Dimension ",
Content = ""
})

spawn(function()
pcall(function()
while wait(.2) do
if workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
FloD:Set(' True')
else
FloD:Set(' False')
end
end
end)
end)

SeaEvent:AddToggle({
Name = "Tween To Frozen Dimension",
Default = false,
Callback = function(Value)
_G.FrozenTP = Value
end
})

spawn(function()
while wait(.1) do
if _G.FrozenTP then
pcall(function()
if workspace.Map:FindFirstChild("LeviathanGate") then 
tween(workspace.Map.LeviathanGate.CFrame) 
replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("OpenLeviathanGate") 
end
end)
end
end
end)

SeaEvent:AddToggle({
Name = "Drive To Hydra",
Default = false,
Callback = function(Value)
_G.SailBoat_Hydra = Value
end
})

spawn(function()
while wait() do
if _G.SailBoat_Hydra then
pcall(function()
local myBoat = CheckBoat()
if not myBoat then
local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
TeleportToTarget(buyBoatCFrame)
if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then 
replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) 
end
elseif myBoat then
if plr.Character.Humanoid.Sit == false then
local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
tween(boatSeatCFrame)
else
repeat wait()
if CheckEnemiesBoat() or CheckPirateGrandBrigade() or CheckTerrorShark() then
tween(CFrame.new(5433, 150, 290))
else
tween(CFrame.new(5433, 35, 290))
end
until _G.SailBoat_Hydra == false or plr.Character:WaitForChild("Humanoid").Sit == false
plr.Character.Humanoid.Sit = false
end
end
end)
end
end
end)
SeaEvent:AddDropdown({
Name = "Choose Boats",
Options = ListSeaBoat,
Multi = false,
Default = Select,
Callback = function(Value)
_G.SelectedBoat = Value
end
})

SeaEvent:AddButton({
Name = "Buy Boats Select",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyBoat",_G.SelectedBoat)
end
})

SeaEvent:AddDropdown({
Name = "Choose Sea Level",
Options = ListSeaZone,
Multi = false,
Default = Select,
Callback = function(Value)
_G.DangerSc = Value
end
})

SeaEvent:AddToggle({
Name = "Auto Sail Boat",
Default = false,
Callback = function(Value)
_G.SailBoats = Value
end
})

spawn(function()
while wait() do
if _G.SailBoats then 
pcall(function()
local myBoat = CheckBoat()
if not myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
TeleportToTarget(buyBoatCFrame)
if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then 
replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) 
end
elseif myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
if plr.Character.Humanoid.Sit == false then
local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
tween(boatSeatCFrame)
else 
if _G.DangerSc == "Lv 1" then 
CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
elseif _G.DangerSc == "Lv 2" then 
CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
elseif _G.DangerSc == "Lv 3" then 
CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
elseif _G.DangerSc == "Lv 4" then 
CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
elseif _G.DangerSc == "Lv 5" then 
CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
elseif _G.DangerSc == "Lv 6" then 
CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
elseif _G.DangerSc == "Lv Infinite" then 
CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
end 
repeat wait() 
if (not _G.FishBoat and CheckEnemiesBoat()) or (not _G.PGB and CheckPirateGrandBrigade()) or (not _G.TerrorShark and CheckTerrorShark()) then
tween(CFrameSelectedZone * CFrame.new(0,150,0))
else
tween(CFrameSelectedZone)
end 
until _G.SailBoats==false or(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)or CheckSeaBeast()and _G.SeaBeast1 or CheckEnemiesBoat()and _G.FishBoat or _G.Leviathan1 and CheckLeviathan() or _G.HCM and CheckHauntedCrew() or _G.PGB and CheckPirateGrandBrigade() or plr.Character:WaitForChild("Humanoid").Sit==false
plr.Character.Humanoid.Sit = false
end
end
end)
end
end
end)

spawn(function()
while wait(1) do 
pcall(function()
for a,b in pairs(workspace.Boats:GetChildren()) do
for c,d in pairs(workspace.Boats[b.Name]:GetDescendants()) do
if d:IsA("BasePart") then
if _G.SailBoats or _G.Prehis_Find or _G.FindMirage or _G.SailBoat_Hydra or _G.AutofindKitIs then 
d.CanCollide = false 
else 
d.CanCollide = true 
end
end
end
end
end)
end
end)

SeaEvent:AddSection("Setup Sea Event")

SeaEvent:AddToggle({
Name = "Auto Attack Sea Beast",
Default = false,
Callback = function(Value)
_G.SeaBeast1 = Value
end
})

SeaEvent:AddToggle({
Name = "Auto Shark",
Default = false,
Callback = function(Value)
_G.Shark = Value
end
})

SeaEvent:AddToggle({
Name = "Auto Piranha",
Default = false,
Callback = function(Value)
_G.Piranha = Value
end
})

SeaEvent:AddToggle({
Name = "Auto Terror Shark",
Default = false,
Callback = function(Value)
_G.TerrorShark = Value
end
})

SeaEvent:AddToggle({
Name = "Auto Fish Crew Member",
Default = false,
Callback = function(Value)
_G.MobCrew = Value
end
})

SeaEvent:AddToggle({
Name = "Auto Haunted Crew Member",
Default = false,
Callback = function(Value)
_G.HCM = Value
end
})

SeaEvent:AddToggle({
Name = "Auto Attack PirateGrandBrigade",
Default = false,
Callback = function(Value)
_G.PGB = Value
end
})

SeaEvent:AddToggle({
Name = "Auto Attack Fish Boat",
Default = false,
Callback = function(Value)
_G.FishBoat = Value
end
})

SeaEvent:AddToggle({
Name = "Auto Attack Leviathan",
Default = false,
Callback = function(Value)
_G.Leviathan1 = Value
end
})

spawn(function()
while wait() do
pcall(function()	
if _G.Shark then 
local a = {"Shark"}
if CheckShark() then
for b,c in pairs(workspace.Enemies:GetChildren()) do
if table.find(a,c.Name) then
if Attack.Alive(c) then
repeat task.wait()
Kill(c,_G.Shark)
until _G.Shark == false or not c.Parent or c.Humanoid.Health <= 0
end
end
end
end
end

if _G.TerrorShark then 
local a = {"Terrorshark"}
if CheckTerrorShark() then
for b,c in pairs(workspace.Enemies:GetChildren()) do
if table.find(a,c.Name) then
if Attack.Alive(c) then
repeat task.wait()
KillSea(c,_G.TerrorShark)
until _G.TerrorShark == false or not c.Parent or c.Humanoid.Health <= 0
end
end
end
end
end

if _G.Piranha then 
local a = {"Piranha"}
if CheckPiranha() then
for b,c in pairs(workspace.Enemies:GetChildren()) do
if table.find(a,c.Name) then
if Attack.Alive(c) then
repeat task.wait()
Kill(c,_G.Piranha)
until _G.Piranha == false or not c.Parent or c.Humanoid.Health <= 0
end
end
end
end
end
 
if _G.MobCrew then 
local a = {"Fish Crew Member"}
if CheckFishCrew() then
for b,c in pairs(workspace.Enemies:GetChildren()) do
if table.find(a,c.Name) then
if Attack.Alive(c) then
repeat task.wait()
Kill(c,_G.MobCrew)
until _G.MobCrew == false or not c.Parent or c.Humanoid.Health <= 0
end
end
end
end
end 

if _G.HCM then 
local a = {"Haunted Crew Member"}
if CheckHauntedCrew() then
for b,c in pairs(workspace.Enemies:GetChildren()) do
if table.find(a,c.Name) then
if Attack.Alive(c) then
repeat task.wait()
Kill(c,_G.HCM)
until _G.HCM == false or not c.Parent or c.Humanoid.Health <= 0
end
end
end
end
end

if _G.SeaBeast1 then 
if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
for a,b in pairs(workspace.SeaBeasts:GetChildren()) do
if b:FindFirstChild("HumanoidRootPart") and b:FindFirstChild("Health") and b.Health.Value > 0 then
repeat task.wait()
spawn(function()
tween(CFrame.new(b.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,b.HumanoidRootPart.Position.Z))
end)
if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position) <= 500 then
AitSeaSkill_Custom = b.HumanoidRootPart.CFrame
MousePos = AitSeaSkill_Custom.Position
if CheckF() then
weaponSc("Blox Fruit")
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
else
Useskills("Melee","Z")
Useskills("Melee","X")
Useskills("Melee","C")
wait(.1)
Useskills("Sword","Z")
Useskills("Sword","X")
wait(.1)
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
wait(.1)
Useskills("Gun","Z")
Useskills("Gun","X")
end
end
until _G.SeaBeast1 == false or not b:FindFirstChild("HumanoidRootPart") or not b.Parent or b.Health.Value <= 0
end
end
end
end

if _G.Leviathan1 then 
if workspace.SeaBeasts:FindFirstChild("Leviathan") then
for a,b in pairs(workspace.SeaBeasts:GetChildren()) do
if b:FindFirstChild("HumanoidRootPart") and b:FindFirstChild("Leviathan Segment") and b:FindFirstChild("Health") and b.Health.Value > 0 then
repeat task.wait()
spawn(function()
tween(CFrame.new(b.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,b.HumanoidRootPart.Position.Z))
end)
if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position) <= 500 then
MousePos = b:FindFirstChild("Leviathan Segment").Position
if CheckF() then
weaponSc("Blox Fruit")
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
else
Useskills("Melee","Z")
Useskills("Melee","X")
Useskills("Melee","C")
wait(.1)
Useskills("Sword","Z")
Useskills("Sword","X")
wait(.1)
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
wait(.1)
Useskills("Gun","Z")
Useskills("Gun","X")
end
end
until _G.Leviathan1 == false or not b:FindFirstChild("HumanoidRootPart") or not b.Parent or b.Health.Value <= 0
end
end
end
end

if _G.FishBoat then 
if CheckEnemiesBoat() then
for a,b in pairs(workspace.Enemies:GetChildren()) do
if b:FindFirstChild("Health") and b.Health.Value > 0 and b:FindFirstChild("VehicleSeat") then
repeat task.wait()
spawn(function()
if b.Name == "FishBoat" then
tween(b.Engine.CFrame*CFrame.new(0,-50,-25))
end
end)
if plr:DistanceFromCharacter(b.Engine.CFrame.Position) <= 150 then
AitSeaSkill_Custom = b.Engine.CFrame
MousePos = AitSeaSkill_Custom.Position
if CheckF() then
weaponSc("Blox Fruit")
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
else
Useskills("Melee","Z")
Useskills("Melee","X")
Useskills("Melee","C")
wait(.1)
Useskills("Sword","Z")
Useskills("Sword","X")
wait(.1)
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
wait(.1)
Useskills("Gun","Z")
Useskills("Gun","X")
end
end
until _G.FishBoat == false or not b:FindFirstChild("VehicleSeat") or b.Health.Value <= 0
end
end
end
end

if _G.PGB then 
if CheckPirateGrandBrigade() then
for a,b in pairs(workspace.Enemies:GetChildren()) do
if b:FindFirstChild("Health") and b.Health.Value > 0 and b:FindFirstChild("VehicleSeat") then
repeat task.wait()
spawn(function()
if b.Name == "PirateBrigade" then
tween(b.Engine.CFrame*CFrame.new(0,-30,-10))
elseif b.Name == "PirateGrandBrigade" then
tween(b.Engine.CFrame*CFrame.new(0,-50,-50))
end
end)
if plr:DistanceFromCharacter(b.Engine.CFrame.Position) <= 150 then
AitSeaSkill_Custom = b.Engine.CFrame
MousePos = AitSeaSkill_Custom.Position
if CheckF() then
weaponSc("Blox Fruit")
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
else
Useskills("Melee","Z")
Useskills("Melee","X")
Useskills("Melee","C")
wait(.1)
Useskills("Sword","Z")
Useskills("Sword","X")
wait(.1)
Useskills("Blox Fruit","Z")
Useskills("Blox Fruit","X")
Useskills("Blox Fruit","C")
wait(.1)
Useskills("Gun","Z")
Useskills("Gun","X")
end
end
until _G.PGB == false or not b:FindFirstChild("VehicleSeat") or b.Health.Value <= 0
end
end
end
end
end)
end
end)

Islands:AddSection("Kitsune Event")

Check_Kitsu = Islands:AddParagraph({
Title = " Kitsune Island ",
Content = ""
})

spawn(function()
while wait(.2) do
if workspace.Map:FindFirstChild("KitsuneIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
Check_Kitsu:Set(" True")
else
Check_Kitsu:Set(" False")
end
end
end)

Islands:AddToggle({
Name = "Auto Find Kitsune Island",
Default = false,
Callback = function(Value)
_G.AutofindKitIs = Value
end
})

spawn(function()
while wait() do
if _G.AutofindKitIs then 
pcall(function()
if not workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island", true) then
local myBoat = CheckBoat()
if not myBoat then
local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
TeleportToTarget(buyBoatCFrame)
if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then 
replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) 
end
else
if plr.Character.Humanoid.Sit == false then
local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
tween(boatSeatCFrame)
else
local targetDestination = CFrame.new(-10000000, 31, 37016.25)
repeat wait() 
if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
tween(CFrame.new(-10000000, 150, 37016.25))
else
tween(CFrame.new(-10000000, 31, 37016.25))
end
until not _G.AutofindKitIs or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island") or plr.Character.Humanoid.Sit == false
plr.Character.Humanoid.Sit = false
end
end
else
tween(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame*CFrame.new(0,500,0))
end
end)
end
end
end)

Islands:AddToggle({
Name = "Auto Teleport to Shrine Actived",
Default = false,
Callback = function(Value)
_G.tweenShrine = Value
end
})

spawn(function()
while wait(.1) do
if _G.tweenShrine then
pcall(function()
local kit_is = workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
local shrineActive = kit_is:FindFirstChild("ShrineActive")
if shrineActive then
for _, v in next, shrineActive:GetDescendants() do
if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
repeat wait() 
tween(v.CFrame * CFrame.new(0,2,0)) 
until _G.tweenShrine == false or not kit_is
end
end
else
tween(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0,500,0))
end
end)
end
end
end)

Islands:AddToggle({
Name = "Auto Trade Azure Ember",
Default = false,
Callback = function(Value)
_G.Trade_Ember = Value
end
})

spawn(function()
while wait(.1) do
if _G.Trade_Ember then
pcall(function()
if workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island",true) then
replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
end
end)
end
end
end)

Islands:AddToggle({
Name = "Auto Collect Azure Ember",
Default = false,
Callback = function(Value)
_G.Collect_Ember = Value
end
})

spawn(function()
while wait(.1) do
if _G.Collect_Ember then
pcall(function()
if workspace:WaitForChild("AttachedAzureEmber") or workspace:WaitForChild("EmberTemplate") then
notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
else
tween(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0,500,0))
replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
end
end)
end
end
end)

Islands:AddButton({
Name = "Trade Items Azure",
Callback = function()
replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
end
})

Islands:AddButton({
Name = "Talk with Kitsune statue",
Callback = function()
replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
end
})
end

if World2 or World3 then
Fruit:AddSection("Raiding")

DungeonTables = {"Flame","Ice","Quake","Light","Dark","String","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}

Fruit:AddDropdown({
Name = "Select Chip",
Options = DungeonTables,
Multi = false,
Default = Select,
Callback = function(Value)
_G.SelectChip = Value
end
})

_G.SelectChip = DungeonTables[1]

Fruit:AddButton({
Name = "Buy Chips Beli",
Callback = function()
if not GetBP("Special Microchip") then 
replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip) 
end
end
})

Fruit:AddButton({
Name = "Buy Chips Blox Fruit",
Callback = function()
if GetBP("Special Microchip") then return end
local FruitPrice = {}
for i,v in next,replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
if v.Price <= 490000 then 
table.insert(FruitPrice,v.Name) 
end 
end
for _,y in pairs(FruitPrice) do
if not GetBP("Special Microchip") then 
replicated.Remotes.CommF_:InvokeServer("LoadFruit",tostring(y))	
replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)	
end
end
end
})

Fruit:AddToggle({
Name = "Get Fruit In Inventory Low Beli",
Default = false,
Callback = function(Value)
_G.AutoGetFruit = Value
end
})

local LowBeliFruits = {
"Rocket-Rocket", "Spin-Spin", "Chop-Chop", "Spring-Spring", "Bomb-Bomb",
"Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Falcon-Falcon", "Ice-Ice",
"Sand-Sand", "Dark-Dark", "Ghost-Ghost", "Diamond-Diamond", "Light-Light",
"Rubber-Rubber", "Barrier-Barrier"
}

spawn(function()
while task.wait(1) do
pcall(function()
if _G.AutoGetFruit then
for _, fruit in ipairs(LowBeliFruits) do
replicated.Remotes.CommF_:InvokeServer("LoadFruit", fruit)
end
end
end)
end
end)

Fruit:AddToggle({
Name = "Auto Start Raid",
Default = false,
Callback = function(Value)
_G.Auto_StartRaid = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.Auto_StartRaid and plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
if GetBP("Special Microchip") then
if World2 then
local npcPos = CFrame.new(-6528.33252, 305.598297, -4752.26953, 0.989115953, 2.37764954e-08, -0.14713794, -2.2435195e-08, 1, 1.07755049e-08, 0.14713794, -7.35715577e-09, 0.989115953)
repeat wait() 
tween(npcPos) 
until not _G.Auto_StartRaid or (plr.Character.HumanoidRootPart.Position - npcPos.Position).Magnitude < 10
wait(.5)
if _G.Auto_StartRaid and plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
end
elseif World3 then
replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602))
wait(1)
local npcPos = CFrame.new(-5017.40869, 314.844055, -2823.0127)
repeat wait() 
tween(npcPos) 
until not _G.Auto_StartRaid or (plr.Character.HumanoidRootPart.Position - npcPos.Position).Magnitude < 10
wait(.5)
if _G.Auto_StartRaid and plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
end
end
end
end
end)
end
end)

Fruit:AddToggle({
Name = "Teleport To Lab",
Default = false,
Callback = function(Value)
_G.TpLab = Value
if not _G.TpLab then return end
spawn(function()
while _G.TpLab do
wait(1)
pcall(function()
if World2 then
tween(CFrame.new(-6528.33252, 305.598297, -4752.26953, 0.989115953, 2.37764954e-08, -0.14713794, -2.2435195e-08, 1, 1.07755049e-08, 0.14713794, -7.35715577e-09, 0.989115953))
elseif World3 then
tween(CFrame.new(-5017.40869, 314.844055, -2823.0127))
end
end)
end
end)
end
})

Fruit:AddToggle({
Name = "Auto Farm Raid",
Default = false,
Callback = function(Value)
_G.Raiding = Value
end
})

local function IsIslandRaid(num)
local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
local nearest, minDist = nil, math.huge

for _, v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do
if v.Name == "Island " .. num then
local dist = (v.Position - hrp.Position).Magnitude
if dist < minDist then
minDist = dist
nearest = v
end
end
end

return nearest
end

local function getNextIsland()
local islandOrder = {5, 4, 3, 2, 1}
local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return end

for _, num in ipairs(islandOrder) do
local island = IsIslandRaid(num)
if island and (island.Position - hrp.Position).Magnitude <= 4500 then
return island
end
end
end

local function attackNearbyEnemies()
local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return end

for _, enemy in pairs(workspace.Enemies:GetChildren()) do
if enemy:FindFirstChild("HumanoidRootPart")
and enemy:FindFirstChild("Humanoid")
and enemy.Humanoid.Health > 0 then

local dist = (enemy.HumanoidRootPart.Position - hrp.Position).Magnitude
if dist <= 1000 then
while _G.Raiding
and enemy
and enemy.Parent
and enemy:FindFirstChild("Humanoid")
and enemy.Humanoid.Health > 0 do

pcall(function()
Kill(enemy, true)
end)

task.wait(.1)
end
end
end
end
end

spawn(function()
while task.wait(1) do
pcall(function()
if _G.Raiding then
local RaidTimer = plr.PlayerGui.Main.TopHUDList.RaidTimer

if RaidTimer and RaidTimer.Visible then
attackNearbyEnemies()

local nextIsland = getNextIsland()
if nextIsland then
tween(nextIsland.CFrame * CFrame.new(0, 60, 0))
end
end
end
end)
end
end)

Fruit:AddToggle({
Name = "Auto Awakening",
Default = false,
Callback = function(Value)
_G.Auto_Awakener = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.Auto_Awakener then
replicated.Remotes.CommF_:InvokeServer("Awakener","Check")
replicated.Remotes.CommF_:InvokeServer("Awakener","Awaken")
end
end)
end
end)
end



Visual:AddToggle({
Name = "Teleport to player",
Default = false,
Callback = function(Value)
_G.TpPly = Value
if _G.TpPly then
pcall(function()
repeat task.wait()
tween(game.Players[_G.PlayersList].Character.HumanoidRootPart.CFrame)
until not _G.TpPly
end)
end
end
})

Visual:AddSection("Esp Items")

function isnil(thing)
return (thing == nil)
end

local function round(n)
return math.floor(tonumber(n) + 0.5)
end

Number = math.random(1, 1000000)

local ESPConfig = {
Size = 200,
Font = Enum.Font.GothamBold,
FontSize = 12,
TextStrokeTransparency = 0.7,
TextStrokeColor = Color3.new(0, 0, 0),
Colors = {
PlayerAlly = Color3.fromRGB(0, 170, 255),
PlayerEnemy = Color3.fromRGB(255, 50, 50),
Island = Color3.fromRGB(50, 255, 200),
Fruit = Color3.fromRGB(255, 215, 0),
FlowerBlue = Color3.fromRGB(100, 200, 255),
FlowerRed = Color3.fromRGB(255, 100, 150),
EventIsland = Color3.fromRGB(255, 150, 0),
Gear = Color3.fromRGB(0, 255, 150),
NPC = Color3.fromRGB(200, 100, 255),
Chest = Color3.fromRGB(255, 200, 50),
Berry = Color3.fromRGB(150, 255, 100)
}
}

local function createEspGui(parent, name, color, text)
local bill = Instance.new('BillboardGui', parent)
bill.Name = name
bill.ExtentsOffset = Vector3.new(0, 1.5, 0)
bill.Size = UDim2.new(0, ESPConfig.Size, 0, 40)
bill.Adornee = parent
bill.AlwaysOnTop = true
bill.MaxDistance = 5000
bill.StudsOffset = Vector3.new(0, 3, 0)

local nameLabel = Instance.new('TextLabel', bill)
nameLabel.Name = 'TextLabel'
nameLabel.Font = ESPConfig.Font
nameLabel.TextSize = ESPConfig.FontSize
nameLabel.TextWrapped = true
nameLabel.Size = UDim2.new(1, 0, 1, 0)
nameLabel.TextYAlignment = 'Top'
nameLabel.BackgroundTransparency = 1
nameLabel.TextColor3 = color
nameLabel.TextStrokeTransparency = ESPConfig.TextStrokeTransparency
nameLabel.TextStrokeColor3 = ESPConfig.TextStrokeColor
nameLabel.Text = text

return bill
end

local function updateEspSize()
for _, esp in pairs(workspace:GetDescendants()) do
if esp:IsA("BillboardGui") and esp.Name:find("NameEsp") then
esp.Size = UDim2.new(0, ESPConfig.Size, 0, 40)
end
end
end

EspPly = function()
for _,v in next, game.Players:GetChildren() do
pcall(function()
if not isnil(v.Character) and v.Character:FindFirstChild("Head") then
if PlayerEsp then
local head = v.Character.Head
local espName = 'NameEsp'..Number
local distance = round((game.Players.LocalPlayer.Character.Head.Position - head.Position).Magnitude/3)
local text = v.Name ..' \n'.. distance ..' M'

if v:FindFirstChild("Data") and v.Data:FindFirstChild("Level") then
text = v.Data.Level.Value ..' | '.. text
end
if v.Character:FindFirstChild("Humanoid") then
local healthPercent = round((v.Character.Humanoid.Health/v.Character.Humanoid.MaxHealth)*100)
text = text .. '\nHP: ' .. healthPercent .. '%'
end

if not head:FindFirstChild(espName) then
local color = ESPConfig.Colors.PlayerEnemy
if v.Team == game.Players.LocalPlayer.Team then
color = ESPConfig.Colors.PlayerAlly
end
createEspGui(head, espName, color, text)
else
head[espName].TextLabel.Text = text
end
else
local esp = v.Character.Head:FindFirstChild('NameEsp'..Number)
if esp then
esp:Destroy()
end
end
end
end)
end
end

LocationEsp = function()
for _,v in next, workspace["_WorldOrigin"].Locations:GetChildren() do
pcall(function()
if IslandESP then
if v.Name ~= "Sea" then
local distance = round((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude/3)
local text = v.Name ..' \n'.. distance ..' M'

if not v:FindFirstChild('NameEsp') then
createEspGui(v, 'NameEsp', ESPConfig.Colors.Island, text)
else
v['NameEsp'].TextLabel.Text = text
end
end
else
local esp = v:FindFirstChild('NameEsp')
if esp then
esp:Destroy()
end
end
end)
end
end

DevEsp = function()
for i,v in next, workspace:GetChildren() do
pcall(function()
if DevilFruitESP then
if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
local distance = round((game.Players.LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3)
local text = v.Name ..' \n'.. distance ..' M'

if not v.Handle:FindFirstChild('NameEsp'..Number) then
createEspGui(v.Handle, 'NameEsp'..Number, ESPConfig.Colors.Fruit, text)
else
v.Handle['NameEsp'..Number].TextLabel.Text = text
end
end
else
local esp = v.Handle and v.Handle:FindFirstChild('NameEsp'..Number)
if esp then
esp:Destroy()
end
end
end)
end
end

flowerEsp = function()
for i,v in pairs(workspace:GetChildren()) do
pcall(function()
if v.Name == "Flower2" or v.Name == "Flower1" then
if FlowerESP then
local distance = round((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude/3)
local flowerName = v.Name == "Flower1" and "Blue Flower" or "Red Flower"
local text = flowerName ..' \n'.. distance ..' M'
local color = v.Name == "Flower1" and ESPConfig.Colors.FlowerBlue or ESPConfig.Colors.FlowerRed

if not v:FindFirstChild('NameEsp'..Number) then
createEspGui(v, 'NameEsp'..Number, color, text)
else
v['NameEsp'..Number].TextLabel.Text = text
end
else
local esp = v:FindFirstChild('NameEsp'..Number)
if esp then
esp:Destroy()
end
end
end
end)
end
end

EventIslandEsp = function()
for i, v in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
pcall(function()
if EspEventIsland then
if v.Name == "Mirage Island" or v.Name == "Prehistoric Island" or v.Name == "Kitsune Island" then
local distance = round((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude/3)
local text = v.Name ..' \n'.. distance ..' M'

if not v:FindFirstChild("NameEsp") then
createEspGui(v, "NameEsp", ESPConfig.Colors.EventIsland, text)
else
v.NameEsp.TextLabel.Text = text
end
end
else
local esp = v:FindFirstChild("NameEsp")
if esp then
esp:Destroy()
end
end
end)
end
end

gearEsp = function()
for _,v in pairs(workspace.Map.MysticIsland:GetDescendants()) do
pcall(function()
if ESPGear then
if v.Name == "Part" and v.Material == Enum.Material.Neon then
local distance = round((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude/3)
local text = "Gear" ..' \n'.. distance ..' M'

if not v:FindFirstChild("NameEsp") then
createEspGui(v, "NameEsp", ESPConfig.Colors.Gear, text)
else
v["NameEsp"].TextLabel.Text = text
end
end
else
local esp = v:FindFirstChild("NameEsp")
if esp then
esp:Destroy()
end
end
end)
end
end

AdvanFruitEsp = function()
if advanEsp then
for _,v in pairs(game:GetService("ReplicatedStorage").NPCs:GetChildren()) do
if v.Name == "Advanced Fruit Dealer" then
if not workspace:FindFirstChild("Adv") then
Adv = Instance.new("Part")
Adv.Name = "Adv"
Adv.Transparency = 1
Adv.Size = Vector3.new(1,1,1)
Adv.Anchored = true
Adv.CanCollide = false
Adv.Parent = workspace
Adv.CFrame = v.HumanoidRootPart.CFrame
end

if workspace:FindFirstChild("Adv") then
local distance = round((game.Players.LocalPlayer.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude/3)
local text = v.Name ..' \n'.. distance ..' M'

if not Adv:FindFirstChild("NameEsp") then
createEspGui(Adv, "NameEsp", ESPConfig.Colors.NPC, text)
else
Adv["NameEsp"].TextLabel.Text = text
end
end
end
end
else
if workspace:FindFirstChild("Adv") then
workspace.Adv:Destroy()
end
end
end

HakiClorEsp = function()
if ColorEsp then
for _,v in pairs(game:GetService("ReplicatedStorage").NPCs:GetChildren()) do
if v.Name == "Barista Cousin" then
if not workspace:FindFirstChild("Gay") then
Gay = Instance.new("Part")
Gay.Name = "Gay"
Gay.Transparency = 1
Gay.Size = Vector3.new(1,1,1)
Gay.Anchored = true
Gay.CanCollide = false
Gay.Parent = workspace
Gay.CFrame = v.HumanoidRootPart.CFrame
end

if workspace:FindFirstChild("Gay") then
local distance = round((game.Players.LocalPlayer.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude/3)
local text = v.Name ..' \n'.. distance ..' M'

if not Gay:FindFirstChild("NameEsp") then
createEspGui(Gay, "NameEsp", ESPConfig.Colors.NPC, text)
else
Gay["NameEsp"].TextLabel.Text = text
end
end
end
end
else
if workspace:FindFirstChild("Gay") then
workspace.Gay:Destroy()
end
end
end

LegenSword = function()
if LegenS then
for _,v in pairs(game:GetService("ReplicatedStorage").NPCs:GetChildren()) do
if v.Name == "Legendary Sword Dealer " then
if not workspace:FindFirstChild("Lgd") then
Lgd = Instance.new("Part")
Lgd.Name = "Lgd"
Lgd.Transparency = 1
Lgd.Size = Vector3.new(1,1,1)
Lgd.Anchored = true
Lgd.CanCollide = false
Lgd.Parent = workspace
Lgd.CFrame = v.HumanoidRootPart.CFrame
end

if workspace:FindFirstChild("Lgd") then
local distance = round((game.Players.LocalPlayer.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude/3)
local text = v.Name ..' \n'.. distance ..' M'

if not Lgd:FindFirstChild("NameEsp") then
createEspGui(Lgd, "NameEsp", ESPConfig.Colors.NPC, text)
else
Lgd["NameEsp"].TextLabel.Text = text
end
end
end
end
else
if workspace:FindFirstChild("Lgd") then
workspace.Lgd:Destroy()
end
end
end

ChestEsp = function()
if ChestESP then
local CollectionService = game:GetService("CollectionService")
local Player = game.Players.LocalPlayer
local Character = Player.Character
if not Character then return end

local playerPos = Character:GetPivot().Position
local Chests = CollectionService:GetTagged("_ChestTagged")

for _, Chest in ipairs(Chests) do
pcall(function()
local chestPos = Chest:GetPivot().Position
local distance = round((playerPos - chestPos).Magnitude/3)
local chestName = Chest.Name:gsub("Label", "")
local text = '['..chestName..']\n'..distance..' M'

local existingEsp = Chest:FindFirstChild("ChestEspAttachment")
if not existingEsp then
local attachment = Instance.new("Attachment")
attachment.Name = "ChestEspAttachment"
attachment.Parent = Chest
attachment.Position = Vector3.new(0, 3, 0)

createEspGui(attachment, "NameEsp", ESPConfig.Colors.Chest, text)
else
local nameEsp = existingEsp:FindFirstChild("NameEsp")
if nameEsp then
nameEsp.TextLabel.Text = text
end
end
end)
end
else
for _, Chest in ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
local espAttachment = Chest:FindFirstChild("ChestEspAttachment")
if espAttachment then
espAttachment:Destroy()
end
end
end
end

berriesEsp = function()
if BerryEsp then
local CollectionService = game:GetService("CollectionService")
local Player = game.Players.LocalPlayer
local Character = Player.Character
if not Character then return end

local BerryBushes = CollectionService:GetTagged("BerryBush")

for _, Bush in ipairs(BerryBushes) do
pcall(function()
local bushPosition = Bush.Parent:GetPivot().Position

for _, BerryName in pairs(Bush:GetAttributes()) do
if BerryName then
local distance = round((Character.Head.Position - bushPosition).Magnitude/3)
local text = '['..BerryName..']\n'..distance..' M'

local espPartName = "BerryEspPart_"..BerryName
local existingEsp = workspace:FindFirstChild(espPartName)

if not existingEsp then
existingEsp = Instance.new("Part")
existingEsp.Name = espPartName
existingEsp.Transparency = 1
existingEsp.Size = Vector3.new(1, 1, 1)
existingEsp.Anchored = true
existingEsp.CanCollide = false
existingEsp.Parent = workspace
existingEsp.CFrame = CFrame.new(bushPosition)

createEspGui(existingEsp, "NameEsp", ESPConfig.Colors.Berry, text)
else
local nameEsp = existingEsp:FindFirstChild("NameEsp")
if nameEsp then
nameEsp.TextLabel.Text = text
end
end
end
end
end)
end
else
for _, v in ipairs(workspace:GetChildren()) do
if v:IsA("Part") and v.Name:match("BerryEspPart_") then
v:Destroy()
end
end
end
end

Visual:AddSlider({
Name = "ESP Box Size",
Default = 200,
Min = 100,
Max = 500,
Increase = 1,
Callback = function(Value)
ESPConfig.Size = Value
updateEspSize()
end
})

Visual:AddDropdown({
Name = "ESP Font",
Options = {"GothamBold", "GothamBlack", "Code", "SourceSansBold"},
Default = "GothamBold",
Callback = function(Value)
ESPConfig.Font = Enum.Font[Value]
end
})

Visual:AddSlider({
Name = "ESP Font Size",
Default = 12,
Min = 8,
Max = 20,
Increase = 1,
Callback = function(Value)
ESPConfig.FontSize = Value
end
})

Visual:AddToggle({
Name = "Esp Fruits",
Default = false,
Callback = function(Value)
DevilFruitESP = Value
while DevilFruitESP do wait()
DevEsp()
end
end
})

Visual:AddToggle({
Name = "Esp Players",
Default = false,
Callback = function(Value)
PlayerEsp = Value
while PlayerEsp do wait()
EspPly()
end
end
})

Visual:AddToggle({
Name = "Esp Island",
Default = false,
Callback = function(Value)
IslandESP = Value
while IslandESP do wait()
LocationEsp()
end
end
})

Visual:AddToggle({
Name = "Esp Chests",
Default = false,
Callback = function(Value)
ChestESP = Value
while ChestESP do wait()
ChestEsp()
end
end
})

Visual:AddToggle({
Name = "Esp Berries",
Default = false,
Callback = function(Value)
BerryEsp = Value
while BerryEsp do wait()
berriesEsp()
end
end
})

if World2 then
Visual:AddToggle({
Name = "Esp Flower",
Default = false,
Callback = function(Value)
FlowerESP = Value
while FlowerESP do wait()
flowerEsp()
end
end
})

Visual:AddToggle({
Name = "Esp Legendary Sword Dealers",
Default = false,
Callback = function(Value)
LegenS = Value
while LegenS do wait()
LegenSword()
end
end
})
end

if World2 or World3 then
Visual:AddToggle({
Name = "Esp Aura Colour Dealers",
Default = false,
Callback = function(Value)
ColorEsp = Value
while ColorEsp do wait()
HakiClorEsp()
end
end
})
end

if World3 then
Visual:AddToggle({
Name = "Esp Gear",
Default = false,
Callback = function(Value)
ESPGear = Value
while ESPGear do wait()
gearEsp()
end
end
})

Visual:AddToggle({
Name = "Esp Event Island",
Default = false,
Callback = function(Value)
EspEventIsland = Value
while EspEventIsland do wait()
EventIslandEsp()
end
end
})

Visual:AddToggle({
Name = "Esp Advanced Fruits Dealer",
Default = false,
Callback = function(Value)
advanEsp = Value
while advanEsp do wait()
AdvanFruitEsp()
end
end
})
end

Travel:AddSection("World")

if World2 or World3 then
Travel:AddButton({
Name = "Travel First Sea",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("TravelMain")
end
})
end

if World1 or World3 then
Travel:AddButton({
Name = "Travel Second Sea",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end
})
end

if World1 or World2 then
Travel:AddButton({
Name = "Travel Third Sea",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("TravelZou")
end
})
end

Travel:AddSection("Island")

local Islands = {}

if World1 then
Islands = {
"WindMill","Marine","Middle Town","Jungle","Pirate Village",
"Desert","Snow Island","MarineFord","Colosseum","Sky Island 1",
"Sky Island 2","Sky Island 3","Prison","Magma Village",
"Under Water Island","Fountain City","Shank Room","Mob Island"
}
elseif World2 then
Islands = {
"The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room",
"Green Zone","Factory","Colossuim","Zombie Island","Two Snow Mountain",
"Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island",
"Ussop Island","Mini Sky Island"
}
elseif World3 then
Islands = {
"Mansion","Port Town","Great Tree","Castle On The Sea","MiniSky",
"Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island",
"Peanut Island","Cake Island","Cocoa Island","Candy Island",
"Tiki Outpost","Submerged Island"
}
end

local IslandCFrame = {
["WindMill"] = CFrame.new(979.79, 16.51, 1429.04),
["Marine"] = CFrame.new(-2566.42, 6.85, 2045.25),
["Middle Town"] = CFrame.new(-690.33, 15.09, 1582.23),
["Jungle"] = CFrame.new(-1612.79, 36.85, 149.12),
["Pirate Village"] = CFrame.new(-1181.30, 4.75, 3803.54),
["Desert"] = CFrame.new(944.15, 20.91, 4373.30),
["Snow Island"] = CFrame.new(1347.80, 104.66, -1319.73),
["MarineFord"] = CFrame.new(-4914.82, 50.96, 4281.02),
["Colosseum"] = CFrame.new(-1427.62, 7.28, -2792.77),
["Sky Island 1"] = CFrame.new(-4869.10, 733.46, -2667.01),

["Sky Island 2"] = "ENTRANCE1",
["Sky Island 3"] = "ENTRANCE2",
["Under Water Island"] = "UNDERWATER",

["Prison"] = CFrame.new(4875.33, 5.65, 734.85),
["Magma Village"] = CFrame.new(-5247.71, 12.88, 8504.96),
["Fountain City"] = CFrame.new(5127.12, 59.50, 4105.44),
["Shank Room"] = CFrame.new(-1442.16, 29.87, -28.35),
["Mob Island"] = CFrame.new(-2850.20, 7.39, 5354.99),

["The Cafe"] = CFrame.new(-380.47, 77.22, 255.82),
["Frist Spot"] = CFrame.new(-11.31, 29.27, 2771.52),
["Dark Area"] = CFrame.new(3780.03, 22.65, -3498.58),
["Flamingo Mansion"] = CFrame.new(-483.73, 332.03, 595.32),
["Flamingo Room"] = CFrame.new(2284.41, 15.15, 875.72),
["Green Zone"] = CFrame.new(-2448.53, 73.01, -3210.63),
["Factory"] = CFrame.new(424.12, 211.16, -427.54),
["Colossuim"] = CFrame.new(-1503.62, 219.79, 1369.31),
["Zombie Island"] = CFrame.new(-5622.03, 492.19, -781.78),
["Two Snow Mountain"] = CFrame.new(753.14, 408.23, -5274.61),
["Punk Hazard"] = CFrame.new(-6127.65, 15.95, -5040.28),
["Cursed Ship"] = CFrame.new(923.40, 125.05, 32885.87),
["Ice Castle"] = CFrame.new(6148.41, 294.38, -6741.11),
["Forgotten Island"] = CFrame.new(-3032.76, 317.89, -10075.37),
["Ussop Island"] = CFrame.new(4816.86, 8.45, 2863.81),
["Mini Sky Island"] = CFrame.new(-288.74, 49326.31, -35248.59),

["Mansion"] = CFrame.new(-12551, 337, -7476),
["Port Town"] = CFrame.new(-95, 11, 5455),
["Great Tree"] = CFrame.new(2681.27, 1682.80, -7190.98),
["Castle On The Sea"] = CFrame.new(-5074.45, 314.51, -2991.05),
["MiniSky"] = CFrame.new(-260.65, 49325.80, -35253.57),
["Hydra Island"] = CFrame.new(5433, 1062, 290),
["Floating Turtle"] = CFrame.new(-13274.52, 531.82, -7579.22),
["Haunted Castle"] = CFrame.new(-9516, 142, 5537),
["Ice Cream Island"] = CFrame.new(-874, 66, -10915),
["Peanut Island"] = CFrame.new(-2062, 50, -10232),
["Cake Island"] = CFrame.new(-1884, 19, -11666),
["Cocoa Island"] = CFrame.new(87, 73, -12319),
["Candy Island"] = CFrame.new(-1014, 149, -14555),
["Tiki Outpost"] = CFrame.new(-16101, 12, 380),
["Submerged Island"] = CFrame.new(-16267.8, 25.4, 1373.2),
}

Travel:AddDropdown({
Name = "Select Island",
Options = Islands,
Multi = false,
Default = "",
Callback = function(Value)
getgenv().SelectIsland = Value
end
})

Travel:AddToggle({
Name = "Auto Travel",
Default = false,
Callback = function(v)
getgenv().TeleportIsland = v
_G.Travelis = v

if v then
spawn(function()
repeat task.wait()
local name = getgenv().SelectIsland
local pos = IslandCFrame[name]
if not pos then continue end

if name == "Sky Island 2" then
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82, 872.54, -1667.55))
elseif name == "Sky Island 3" then
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.61, 5547.14, -380.29))
elseif name == "Under Water Island" then
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.85, 11.67, 1819.78))
elseif name == "Submerged Island" then
tween(pos)
task.wait(2)
game.ReplicatedStorage.Modules.Net["RF/SubmarineWorkerSpeak"]:InvokeServer("TravelToSubmergedIsland")
_G.Travelis = false
getgenv().TeleportIsland = false
break
else
tween(pos)
end
until not getgenv().TeleportIsland
_G.Travelis = false
end)
else
_G.Travelis = false
end
end
})

Travel:AddButton({
Name = "Bypass Travel",
Callback = function()
local name = getgenv().SelectIsland
local pos = IslandCFrame[name]

if not pos then
return
end

local Player = game.Players.LocalPlayer
local Char = Player.Character
if not Char then return end

local LockTime = 15
local ResetTime = 7
local Running = true
task.spawn(function()
local start = tick()
while Running and (tick() - start) < LockTime do
pcall(function()
if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
Player.Character.HumanoidRootPart.CFrame = pos
end
end)
task.wait()
end
end)
task.spawn(function()
task.wait(ResetTime)
pcall(function()
if Player.Character then
Player.Character:BreakJoints()
end
end)
end)
task.spawn(function()
task.wait(LockTime)
Running = false
end)
end
})

local NPCList = {}
for _, v in pairs(replicated.NPCs:GetChildren()) do 
table.insert(NPCList, v.Name)
end

Travel:AddDropdown({
Name = "Select NPC",
Options = NPCList,
Multi = false,
Default = "",
Callback = function(Value)
NPClist = Value
end
})

Travel:AddToggle({
Name = "Auto Tween To NPC",
Default = false,
Callback = function(Value)
_G.TPNpc = Value
end
})

spawn(function()
while wait(1) do
if _G.TPNpc then
pcall(function()
for __, v in pairs(replicated.NPCs:GetChildren()) do
if v.Name == NPClist then 
tween(v.HumanoidRootPart.CFrame) 
end
end
end)
end
end
end)

Fruit:AddSection("Blox Fruits")

local fruitsOnSale = {}
local function addCommas(number)
local formatted = tostring(number)
while true do
formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", '%1,%2')
if k == 0 then break end
end
return formatted
end

for _, fruitData in pairs(replicated.Remotes.CommF_:InvokeServer("GetFruits",true)) do
if fruitData["OnSale"] == true then
local priceWithCommas = addCommas(fruitData["Price"])
local fruitInfo = fruitData["Name"]
table.insert(fruitsOnSale, fruitInfo)
end
end

local Nms = {}
for _, fruitData in pairs(replicated.Remotes.CommF_:InvokeServer("GetFruits",false)) do
if fruitData["OnSale"] == true then
local price = addCommas(fruitData["Price"])
local NormalInFO = fruitData["Name"]
table.insert(Nms, NormalInFO)
end
end

Fruit:AddDropdown({
Name = "Select Fruit",
Options = Nms,
Multi = false,
Default = "",
Callback = function(Value)
_G.SelectFruit = Value
end
})

Fruit:AddButton({
Name = "Buy Fruit",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("PurchaseRawFruit",_G.SelectFruit)
end
})

Fruit:AddSection("Mirage Stock")

Fruit:AddDropdown({
Name = "Select Fruit",
Options = fruitsOnSale,
Multi = false,
Default = "",
Callback = function(Value)
SelectF_Adv = Value
end
})

Fruit:AddButton({
Name = "Buy Mirage Stock",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("PurchaseRawFruit",SelectF_Adv)
end
})

Fruit:AddSection("Misc")

Fruit:AddToggle({
Name = "Auto Random Fruit",
Default = false,
Callback = function(Value)
_G.Random_Auto = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.Random_Auto then 
replicated.Remotes.CommF_:InvokeServer("Cousin","Buy") 
end 
end)
end
end)

Fruit:AddToggle({
Name = "Auto Store Fruit",
Default = false,
Callback = function(Value)
_G.StoreF = Value
end
})

spawn(function()
while wait(1) do
if _G.StoreF then
pcall(function() 
UpdStFruit() 
end)
end
end
end)

Fruit:AddToggle({
Name = "Auto Tween to Fruit",
Default = false,
Callback = function(Value)
_G.TwFruits = Value
end
})

spawn(function()
while wait(1) do
if _G.TwFruits then
pcall(function()
for _,x1 in pairs(workspace:GetChildren()) do
if string.find(x1.Name, "Fruit") then 
tween(x1.Handle.CFrame) 
end
end
end)
end
end
end)

Fruit:AddToggle({
Name = "Auto Teleport Fruit",
Default = false,
Callback = function(Value)
_G.InstanceF = Value
end
})

spawn(function()
while wait(1) do
if _G.InstanceF then
pcall(function() 
collectFruits(_G.InstanceF) 
end)
end
end
end)

Fruit:AddToggle({
Name = "Auto Drop Fruit",
Default = false,
Callback = function(Value)
_G.DropFruit = Value
end
})

spawn(function()
while wait(1) do
if _G.DropFruit then
pcall(function() 
DropFruits() 
end)
end
end
end)

Shop:AddSection("Ability")

Shop:AddButton({
Name = "Buy Buso",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyHaki","Buso")
end
})

Shop:AddButton({
Name = "Buy Geppo",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
end
})

Shop:AddButton({
Name = "Buy Soru",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyHaki","Soru")
end
})

Shop:AddButton({
Name = "Buy Ken",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("KenTalk","Buy")
end
})
Shop:AddSection("Fighting Style")
Shop:AddButton({
Name = "Buy Black Leg",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
end
})

Shop:AddButton({
Name = "Buy Electro",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyElectro")
end
})

Shop:AddButton({
Name = "Buy Fishman Karate",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
end
})

Shop:AddButton({
Name = "Buy Dragon Claw",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
end
})

Shop:AddButton({
Name = "Buy Superhuman",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
end
})

Shop:AddButton({
Name = "Buy Death Step",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
end
})

Shop:AddButton({
Name = "Buy Sharkman Karate",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
end
})

Shop:AddButton({
Name = "Buy Electric Claw",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
end
})

Shop:AddButton({
Name = "Buy Dragon Talon",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
end
})

Shop:AddButton({
Name = "Buy Godhuman",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
end
})

Shop:AddButton({
Name = "Buy Sanguine Art",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
end
})
Shop:AddSection("Sword")
Shop:AddButton({
Name = "Buy Cutlass",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
end
})

Shop:AddButton({
Name = "Buy Katana",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Katana")
end
})

Shop:AddButton({
Name = "Buy Iron Mace",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
end
})

Shop:AddButton({
Name = "Buy Duel Katana",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
end
})

Shop:AddButton({
Name = "Buy Triple Katana",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
end
})

Shop:AddButton({
Name = "Buy Pipe",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Pipe")
end
})

Shop:AddButton({
Name = "Buy Dual-Headed Blade",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
end
})

Shop:AddButton({
Name = "Buy Bisento",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Bisento")
end
})

Shop:AddButton({
Name = "Buy Soul Cane",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
end
})
Shop:AddSection("Gun")
Shop:AddButton({
Name = "Buy Slingshot",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
end
})

Shop:AddButton({
Name = "Buy Musket",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Musket")
end
})

Shop:AddButton({
Name = "Buy Dual Flintlock",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Dual Flintlock")
end
})

Shop:AddButton({
Name = "Buy Flintlock",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
end
})

Shop:AddButton({
Name = "Buy Refined Flintlock",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
end
})

Shop:AddButton({
Name = "Buy Cannon",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Cannon")
end
})

Shop:AddButton({
Name = "Buy Kabucha",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
end
})
Shop:AddSection("Accessory")
Shop:AddButton({
Name = "Buy Tomoe Ring",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Tomoe Ring")
end
})

Shop:AddButton({
Name = "Buy Black Cape",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Black Cape")
end
})

Shop:AddButton({
Name = "Buy Swordsman Hat",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BuyItem","Swordsman Hat")
end
})
Shop:AddSection("Ectoplasm")
Shop:AddButton({
Name = "Buy Bizarre Rifle",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 1)
end
})

Shop:AddButton({
Name = "Buy Ghoul Mask",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 2)
end
})
Shop:AddSection("Fragments")
Shop:AddButton({
Name = "Buy Refund Stats",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end
})

Shop:AddButton({
Name = "Buy Reroll Race",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
end
})
Shop:AddSection("Race")
Shop:AddButton({
Name = "Change Ghoul Race",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("Ectoplasm"," Change", 4)
end
})

Shop:AddButton({
Name = "Buy Cyborg Race",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CyborgTrainer"," Buy")
end
})

Shop:AddSection("Craft Items")

Shop:AddButton({
Name = "Craft Dragon Heart",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Dragonheart")
end
})

Shop:AddButton({
Name = "Craft Dragon Storm",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Dragonstorm")
end
})

Shop:AddButton({
Name = "Craft Dino Hood",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","DinoHood")
end
})

Shop:AddButton({
Name = "Craft Shark Tooth",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","SharkTooth")
end
})

Shop:AddButton({
Name = "Craft Terror Jaw",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","TerrorJaw")
end
})

Shop:AddButton({
Name = "Craft Shark Anchor",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","SharkAnchor")
end
})

Shop:AddButton({
Name = "Craft Leviathan Crown",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LeviathanCrown")
end
})

Shop:AddButton({
Name = "Craft Leviathan Shield",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LeviathanShield")
end
})

Shop:AddButton({
Name = "Craft Leviathan Boat",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LeviathanBoat")
end
})

Shop:AddButton({
Name = "Craft Legendary Scroll",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LegendaryScroll")
end
})

Shop:AddButton({
Name = "Craft Mythical Scroll",
Callback = function()
replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","MythicalScroll")
end
})

Server:AddSection("Server")

local TweenService = game:GetService("TweenService")

getgenv().ShowHopUI = function()
if game.CoreGui:FindFirstChild("Hinishi_Hub_HopUI") then
game.CoreGui.Hinishi_Hub_HopUI:Destroy()
end
local parentUI
if syn and syn.protect_gui then
parentUI = Instance.new("ScreenGui")
syn.protect_gui(parentUI)
parentUI.Parent = game.CoreGui
elseif gethui then
parentUI = Instance.new("ScreenGui")
parentUI.Parent = gethui()
else
parentUI = Instance.new("ScreenGui")
parentUI.Parent = game:GetService("CoreGui")
end

parentUI.Name = "Hinishi_Hub_HopUI"
parentUI.IgnoreGuiInset = true
parentUI.ResetOnSpawn = false
parentUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://87449687671365"
bgImage.ImageTransparency = 1
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.Parent = parentUI

TweenService:Create(bgImage, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {
ImageTransparency = 0
}):Play()
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.BorderSizePixel = 0
overlay.Parent = parentUI

TweenService:Create(overlay, TweenInfo.new(0.8), {
BackgroundTransparency = 0.35
}):Play()
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0.27, 0)
title.BackgroundTransparency = 1
title.Text = "Hinishi Hub"
title.TextColor3 = Color3.fromRGB(255, 230, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = overlay
local hopText = Instance.new("TextLabel")
hopText.Size = UDim2.new(1, 0, 0, 40)
hopText.Position = UDim2.new(0, 0, 0.45, 0)
hopText.BackgroundTransparency = 1
hopText.Text = "Hopping..."
hopText.TextColor3 = Color3.fromRGB(255, 200, 255)
hopText.Font = Enum.Font.GothamBold
hopText.TextScaled = true
hopText.Parent = overlay
task.spawn(function()
while hopText.Parent do
for i = 0, 20 do
hopText.TextTransparency = i/20
task.wait(0.04)
end
for i = 20, 0, -1 do
hopText.TextTransparency = i/20
task.wait(0.04)
end
end
end)
task.delay(6, function()
if parentUI then parentUI:Destroy() end
end)
end

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local plr = Players.LocalPlayer

getgenv().Job = ""
getgenv().Join = false

Server:AddTextBox({
Name = "Input Job ID",
Placeholder = "Job ID",
ClearOnFocus = true,
Text = "",
Callback = function(Value)
getgenv().Job = Value
end
})

Server:AddToggle({
Name = "Spam Join",
Default = false,
Callback = function(Value)
getgenv().Join = Value
end
})

spawn(function()
while task.wait(1) do
if getgenv().Join and getgenv().Job ~= "" then
pcall(function()
if getgenv().ShowHopUI then
getgenv().ShowHopUI()
end
TeleportService:TeleportToPlaceInstance(
game.PlaceId,
getgenv().Job,
plr
)
end)
end
end
end)

Server:AddButton({
Name = "Join Server",
Callback = function()
if getgenv().Job == "" then return end
pcall(function()
if getgenv().ShowHopUI then
getgenv().ShowHopUI()
end
TeleportService:TeleportToPlaceInstance(
game.PlaceId,
getgenv().Job,
plr
)
end)
end
})

Server:AddButton({
Name = "Copy Job ID",
Callback = function()
setclipboard(tostring(game.JobId))
end
})

Server:AddButton({
Name = "Rejoin Server",
Callback = function()
getgenv().ShowHopUI()
game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end
})

Server:AddButton({
Name = "Hop Server",
Callback = function()
repeat task.wait(2) until game:IsLoaded()
getgenv().ShowHopUI()

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game.Players.LocalPlayer
local PlaceID = game.PlaceId

local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour

pcall(function()
AllIDs = HttpService:JSONDecode(readfile("NotSameServers.json"))
end)

if not AllIDs or type(AllIDs) ~= "table" then
AllIDs = { actualHour }
writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
end

function TPReturner()
local Site
if foundAnything == "" then
Site = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100"))
else
Site = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100&cursor="..foundAnything))
end

if Site.nextPageCursor then
foundAnything = Site.nextPageCursor
end

for _, v in pairs(Site.data) do
if v.playing < v.maxPlayers then
local ID = tostring(v.id)
if not table.find(AllIDs, ID) then
table.insert(AllIDs, ID)
writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))

TeleportService:TeleportToPlaceInstance(PlaceID, ID, LocalPlayer)
task.wait(3)
end
end
end
end

task.spawn(function()
while task.wait() do
TPReturner()
if foundAnything ~= "" then
TPReturner()
end
end
end)
end
})

Server:AddButton({
Name = "Hop Server Low Players",
Callback = function()
getgenv().ShowHopUI()

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game.Players.LocalPlayer
local PlaceId = game.PlaceId

local function ListServers(cursor)
local URL = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
if cursor then URL = URL .. "&cursor=" .. cursor end
local ok, res = pcall(function()
return game:HttpGet(URL)
end)
if ok then return HttpService:JSONDecode(res) end
return { data = {} }
end

local function FindBestServer()
local cursor = nil
local best = nil
repeat
local data = ListServers(cursor)
for _, srv in pairs(data.data) do
if srv.playing < srv.maxPlayers then
if srv.playing == 1 then return srv end
if not best or srv.playing < best.playing then best = srv end
end
end
cursor = data.nextPageCursor
until not cursor
return best
end

task.spawn(function()
while true do
local target = FindBestServer()
if target then
TeleportService:TeleportToPlaceInstance(PlaceId, target.id, LocalPlayer)
break
end
task.wait(5)
end
end)
end
})

Misc:AddToggle({
Name = "Hide Chat",
Default = false,
Callback = function(Value)
_G.Rechat = Value
if _G.Rechat == true then
local StarterGui = game:GetService('StarterGui')
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
elseif _G.chat == false then
local StarterGui = game:GetService('StarterGui')
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
end
end
})

Misc:AddToggle({
Name = "Hide Leader Board",
Default = false,
Callback = function(Value)
ReLeader = Value
if ReLeader == true then
local StarterGui = game:GetService('StarterGui')
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false) 
elseif ReLeader == false then
local StarterGui = game:GetService('StarterGui')
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true) 
end
end
})

Misc:AddToggle({
Name = "Unlock All Portals",
Default = false,
Callback = function(Value)
_G.PortalUnLock = Value
end
})

spawn(function()
while wait(1) do
pcall(function()
if _G.PortalUnLock then
if Attack.Pos(CstlePos_Miti,8) then
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
elseif Attack.Pos(Man3Pos_Miti,8) then
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
elseif Attack.Pos(HydraPos_Miti,8) then
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
elseif Attack.Pos(HydratoCastle,8) then 
replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
end
end
end)
end
end)
Misc:AddSection("Anti Ban")

Misc:AddToggle({
Name = "Hop if admin join",
Default = true,
Callback = function(Value)
_G.AntiBand = Value
end
})

local StaffIds = {
17884881,
120173604,
912348
}

spawn(function()
while task.wait(1) do
if _G.AntiBand then
for _, player in pairs(game:GetService("Players"):GetPlayers()) do
if table.find(StaffIds, player.UserId) then
repeat task.wait(2) until game:IsLoaded()

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlaceID = game.PlaceId

local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour

local success = pcall(function()
AllIDs = HttpService:JSONDecode(readfile("NotSameServers.json"))
end)

if not success then
table.insert(AllIDs, actualHour)
writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
end

local function ShowBlackScreen()
local gui = Instance.new("ScreenGui")
gui.Name = "HNC_Hub_HopUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui")

local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://95273973040661"
bgImage.ImageColor3 = Color3.fromRGB(160, 100, 255)
bgImage.ImageTransparency = 0.3
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.Parent = gui

local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
overlay.BackgroundTransparency = 0.25
overlay.BorderSizePixel = 0
overlay.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0.35, 0)
title.BackgroundTransparency = 1
title.Text = "Hinishi Hub - Hop Server"
title.TextColor3 = Color3.fromRGB(200, 150, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = overlay

local hopText = Instance.new("TextLabel")
hopText.Size = UDim2.new(1, 0, 0.2, 0)
hopText.Position = UDim2.new(0, 0, 0.5, 0)
hopText.BackgroundTransparency = 1
hopText.Text = "Admin Join - Hopping..."
hopText.TextColor3 = Color3.fromRGB(255, 200, 255)
hopText.Font = Enum.Font.GothamBold
hopText.TextScaled = true
hopText.Parent = overlay

task.spawn(function()
while gui.Parent do
for i = 1, 20 do
hopText.TextTransparency = i / 20
task.wait(0.05)
end
for i = 20, 0, -1 do
hopText.TextTransparency = i / 20
task.wait(0.05)
end
end
end)
end

function TPReturner()
local Site
if foundAnything == "" then
Site = HttpService:JSONDecode(game:HttpGet(
'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'
))
else
Site = HttpService:JSONDecode(game:HttpGet(
'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything
))
end

if Site.nextPageCursor and Site.nextPageCursor ~= "null" then
foundAnything = Site.nextPageCursor
end

local num = 0
for _, v in pairs(Site.data) do
local ID = tostring(v.id)
local Possible = true
if tonumber(v.playing) < tonumber(v.maxPlayers) then
for _, Existing in pairs(AllIDs) do
if num ~= 0 then
if ID == tostring(Existing) then
Possible = false
end
else
if tonumber(actualHour) ~= tonumber(Existing) then
local delFile = pcall(function()
delfile("NotSameServers.json")
AllIDs = {}
table.insert(AllIDs, actualHour)
end)
end
end
num = num + 1
end
if Possible then
table.insert(AllIDs, ID)
pcall(function()
writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
ShowBlackScreen()
task.wait(3)
TeleportService:TeleportToPlaceInstance(PlaceID, ID, LocalPlayer)
end)
task.wait(4)
end
end
end
end

function TeleportLoop()
while task.wait() do
pcall(function()
TPReturner()
if foundAnything ~= "" then
TPReturner()
end
end)
end
end

task.delay(1, function()
TeleportLoop()
end) 
end
end
end
end
end)

Misc:AddToggle({
Name = "Auto Hop (30 min)",
Default = false,
Callback = function(Value)
_G.AutoHop30 = Value
end
})

spawn(function()
while task.wait(1800) do 
if _G.AutoHop30 then
repeat task.wait(2) until game:IsLoaded()

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlaceID = game.PlaceId

local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour

local success = pcall(function()
AllIDs = HttpService:JSONDecode(readfile("NotSameServers.json"))
end)

if not success then
table.insert(AllIDs, actualHour)
writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
end

local function ShowBlackScreen()
local gui = Instance.new("ScreenGui")
gui.Name = "HNC_Hub_HopUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui")

local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://95273973040661"
bgImage.ImageColor3 = Color3.fromRGB(160, 100, 255)
bgImage.ImageTransparency = 0.3
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.Parent = gui

local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
overlay.BackgroundTransparency = 0.25
overlay.BorderSizePixel = 0
overlay.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0.35, 0)
title.BackgroundTransparency = 1
title.Text = "Hinishi Hub - Hop Server"
title.TextColor3 = Color3.fromRGB(200, 150, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = overlay

local hopText = Instance.new("TextLabel")
hopText.Size = UDim2.new(1, 0, 0.2, 0)
hopText.Position = UDim2.new(0, 0, 0.5, 0)
hopText.BackgroundTransparency = 1
hopText.Text = "30 min - Hopping..."
hopText.TextColor3 = Color3.fromRGB(255, 200, 255)
hopText.Font = Enum.Font.GothamBold
hopText.TextScaled = true
hopText.Parent = overlay

task.spawn(function()
while gui.Parent do
for i = 1, 20 do
hopText.TextTransparency = i / 20
task.wait(0.05)
end
for i = 20, 0, -1 do
hopText.TextTransparency = i / 20
task.wait(0.05)
end
end
end)
end

function TPReturner()
local Site
if foundAnything == "" then
Site = HttpService:JSONDecode(game:HttpGet(
'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'
))
else
Site = HttpService:JSONDecode(game:HttpGet(
'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything
))
end

if Site.nextPageCursor and Site.nextPageCursor ~= "null" then
foundAnything = Site.nextPageCursor
end

local num = 0
for _, v in pairs(Site.data) do
local ID = tostring(v.id)
local Possible = true
if tonumber(v.playing) < tonumber(v.maxPlayers) then
for _, Existing in pairs(AllIDs) do
if num ~= 0 then
if ID == tostring(Existing) then
Possible = false
end
else
if tonumber(actualHour) ~= tonumber(Existing) then
local delFile = pcall(function()
delfile("NotSameServers.json")
AllIDs = {}
table.insert(AllIDs, actualHour)
end)
end
end
num = num + 1
end
if Possible then
table.insert(AllIDs, ID)
pcall(function()
writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
ShowBlackScreen()
task.wait(3)
TeleportService:TeleportToPlaceInstance(PlaceID, ID, LocalPlayer)
end)
task.wait(4)
end
end
end
end

function TeleportLoop()
while task.wait() do
pcall(function()
TPReturner()
if foundAnything ~= "" then
TPReturner()
end
end)
end
end

task.delay(1, function()
TeleportLoop()
end)
end
end
end)
Misc:AddToggle({
Name = "Auto Rejoin If Kick",
Default = true,
Callback = function(Value)
AutoRejoinKick = Value
end
})

spawn(function()
while wait(Sec) do
pcall(function()
if AutoRejoinKick then
if not rejoinConnection then
rejoinConnection = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
game:GetService("TeleportService"):Teleport(game.PlaceId)
end
end)
end
else
if rejoinConnection then
rejoinConnection:Disconnect()
rejoinConnection = nil
end
end
end)
end
end)
Misc:AddSection("Font")

Misc:AddButton({
Name = "Change Font Text",
Callback = function()
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "concac"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.Parent = game:GetService("CoreGui")

local Background = Instance.new("ImageLabel")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Position = UDim2.new(0, 0, 0, 0)
Background.Image = "rbxassetid://71596881694027"
Background.ScaleType = Enum.ScaleType.Crop
Background.BackgroundTransparency = 1
Background.Parent = ScreenGui

local UISizeConstraint = Instance.new("UISizeConstraint")
UISizeConstraint.MinSize = Vector2.new(0, 0)
UISizeConstraint.MaxSize = Vector2.new(math.huge, math.huge)
UISizeConstraint.Parent = Background

local Title = Instance.new("TextLabel")
Title.Text = "SELECT FONT"
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(180, 0, 255)
Title.TextScaled = true
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 20)
Title.Parent = Background

local SubTitle = Instance.new("TextLabel")
SubTitle.Text = "Hinishi Hub"
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextColor3 = Color3.fromRGB(150, 0, 255)
SubTitle.TextSize = 22
SubTitle.Size = UDim2.new(1, 0, 0, 30)
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 0, 0, 80)
SubTitle.Parent = Background

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -40, 1, -150)
ScrollingFrame.Position = UDim2.new(0, 20, 0, 130)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.Parent = Background

local GridLayout = Instance.new("UIGridLayout")
GridLayout.CellSize = UDim2.new(0, 200, 0, 50)
GridLayout.CellPadding = UDim2.new(0, 12, 0, 12)
GridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
GridLayout.Parent = ScrollingFrame

local FontList = {
"AmaticSC","Antique","Arcade","Arial","ArialBold","Bangers","Bodoni",
"Cartoon","Code","Creepster","DenkOne","Fondamento","FredokaOne",
"Garamond","Gotham","GothamBlack","GothamBold","GothamMedium",
"GothamSemibold","Grenze","GrenzeGotisch","Highway","IndieFlower",
"Inconsolata","JosefinSans","Jura","Kalam","Legacy","Lobster",
"LuckiestGuy","Merriweather","Michroma","Nunito","Oswald","PatrickHand",
"PermanentMarker","PressStart2P","Roboto","RobotoCondensed","RobotoMono",
"Sarpanch","SciFi","SourceSans","SourceSansBold","SourceSansItalic",
"SourceSansLight","SourceSansSemibold","SpecialElite","TitilliumWeb",
"Ubuntu","UbuntuBold","UbuntuMono","Zekton"
}

for _, fontName in ipairs(FontList) do
if Enum.Font[fontName] then
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 200, 0, 50)
Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Button.BorderColor3 = Color3.fromRGB(180, 0, 255)
Button.BorderSizePixel = 2
Button.Text = fontName
Button.TextColor3 = Color3.fromRGB(180, 0, 255)
Button.Font = Enum.Font[fontName]
Button.TextScaled = true
Button.Parent = ScrollingFrame

Button.MouseEnter:Connect(function()
Button.BackgroundColor3 = Color3.fromRGB(70, 0, 120)
end)

Button.MouseLeave:Connect(function()
Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
end)

Button.MouseButton1Click:Connect(function()
for _, obj in ipairs(game:GetDescendants()) do
if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
obj.Font = Enum.Font[fontName]
end
end
ScreenGui:Destroy()
end)
end
end

GridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, GridLayout.AbsoluteContentSize.Y + 20)
end) 
end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local VirtualInputManager = game:GetService("VirtualInputManager")

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
local Enemies = workspace:WaitForChild("Enemies")
local Characters = workspace:WaitForChild("Characters")

local remote, idremote
for _, v in next, ({ReplicatedStorage.Util, ReplicatedStorage.Common, Remotes, ReplicatedStorage.Assets, ReplicatedStorage.FX}) do
for _, n in next, v:GetChildren() do
if n:IsA("RemoteEvent") and n:GetAttribute("Id") then
remote, idremote = n, n:GetAttribute("Id")
end
end
v.ChildAdded:Connect(function(n)
if n:IsA("RemoteEvent") and n:GetAttribute("Id") then
remote, idremote = n, n:GetAttribute("Id")
end
end)
end
local function IsAlive(character)
return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
end
local function ProcessEnemies(OthersEnemies, Folder)
for _, Enemy in Folder:GetChildren() do
local Head = Enemy:FindFirstChild("Head")
if Head and IsAlive(Enemy) and Player:DistanceFromCharacter(Head.Position) < 500 then
if Enemy ~= Player.Character then
table.insert(OthersEnemies, { Enemy, Head })
end
end
end
end
local function GetGunTarget()
	local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
	if not root then return end
	local nearest, dist = nil, math.huge
	if workspace:FindFirstChild("Enemies") then
		for _, mob in ipairs(workspace.Enemies:GetChildren()) do
			local hrp = mob:FindFirstChild("HumanoidRootPart")
			if hrp and IsAlive(mob) then
				local d = (root.Position - hrp.Position).Magnitude
				if d < dist then
					dist = d
					nearest = hrp
				end
			end
		end
	end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= Player and p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp and IsAlive(p.Character) then
				local d = (root.Position - hrp.Position).Magnitude
				if d < dist then
					dist = d
					nearest = hrp
				end
			end
		end
	end
	return nearest
end
local function UltraShootGun(targetHRP)
	if not targetHRP then return end
	local tool = Player.Character and Player.Character:FindFirstChildOfClass("Tool")
	if not tool or tool:GetAttribute("WeaponType") ~= "Gun" then return end
	local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")
	if RE_ShootGunEvent then
		RE_ShootGunEvent:FireServer(targetHRP.Position, {targetHRP})
		VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,1)
		VirtualInputManager:SendMouseButtonEvent(0,0,0,false,game,1)
	end
end
task.spawn(function()
while task.wait(_G.FastAttackDelay or 0) do
if not _G.FastAttack then continue end
local char = Player.Character
local root = char and char:FindFirstChild("HumanoidRootPart")
if not root then continue end
local tool = char:FindFirstChildOfClass("Tool")
if not tool then continue end
local WType = tool:GetAttribute("WeaponType")
if WType == "Gun" then
if _G.Shoot then
local targetHRP = GetGunTarget()
if targetHRP then
UltraShootGun(targetHRP)
end
end
continue
end
local OthersEnemies = {}
ProcessEnemies(OthersEnemies, Enemies)
ProcessEnemies(OthersEnemies, Characters)
if WType == "Melee" or WType == "Sword" then
local parts = {}
for _, enemyData in ipairs(OthersEnemies) do
local enemy = enemyData[1]
for _, bp in ipairs(enemy:GetChildren()) do
if bp:IsA("BasePart") and (enemy.HumanoidRootPart.Position - root.Position).Magnitude <= 60 then
table.insert(parts, {enemy, bp})
end
end
end
if #parts > 0 then
pcall(function()
require(Modules.Net):RemoteEvent("RegisterHit", true)
Net["RE/RegisterAttack"]:FireServer()
local head = parts[1][1]:FindFirstChild("Head")
if not head then return end
Net["RE/RegisterHit"]:FireServer(head, parts, {}, tostring(Player.UserId):sub(2,4)..tostring(coroutine.running()):sub(11,15))
cloneref(remote):FireServer(
string.gsub("RE/RegisterHit", ".", function(c)
return string.char(bit32.bxor(string.byte(c), math.floor(workspace:GetServerTimeNow() / 10 % 10) + 1))
end),
bit32.bxor(idremote + 909090, Net.seed:InvokeServer() * 2),
head,
parts
)
end)
end
end
end
end)
local player = game.Players.LocalPlayer
local function IsEntityAlive(entity)
if not entity then return false end
local humanoid = entity:FindFirstChild("Humanoid")
return humanoid and humanoid.Health > 0
end
local function GetEnemiesInRange(character, range)
local enemies = game:GetService("Workspace").Enemies:GetChildren()
local players = game:GetService("Players"):GetPlayers()
local targets = {}
local playerPos = character:GetPivot().Position
for _, enemy in ipairs(enemies) do
local rootPart = enemy:FindFirstChild("HumanoidRootPart")
if rootPart and IsEntityAlive(enemy) then
local distance = (rootPart.Position - playerPos).Magnitude
if distance <= range then
table.insert(targets, enemy)
end
end
end
for _, otherPlayer in ipairs(players) do
if otherPlayer ~= player and otherPlayer.Character then
local rootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart and IsEntityAlive(otherPlayer.Character) then
local distance = (rootPart.Position - playerPos).Magnitude
if distance <= range then
table.insert(targets, otherPlayer.Character)
end
end
end
end
return targets
end
function AttackNoCoolDown()
local player = game:GetService("Players").LocalPlayer
local character = player.Character
if not character then return end
local equippedWeapon = nil
for _, item in ipairs(character:GetChildren()) do
if item:IsA("Tool") then
equippedWeapon = item
break
end
end
if not equippedWeapon then return end
local enemiesInRange = GetEnemiesInRange(character, 60)
if #enemiesInRange == 0 then return end
local storage = game:GetService("ReplicatedStorage")
local modules = storage:FindFirstChild("Modules")
if not modules then return end
local attackEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
local hitEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
if not attackEvent or not hitEvent then return end
local targets, mainTarget = {}, nil
for _, enemy in ipairs(enemiesInRange) do
if not enemy:GetAttribute("IsBoat") then
local HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand"}
local head = enemy:FindFirstChild(HitboxLimbs[math.random(#HitboxLimbs)]) or enemy.PrimaryPart
if head then
table.insert(targets, { enemy, head })
mainTarget = head
end
end
end
if not mainTarget then return end
attackEvent:FireServer(0)
local playerScripts = player:FindFirstChild("PlayerScripts")
if not playerScripts then return end
local localScript = playerScripts:FindFirstChildOfClass("LocalScript")
while not localScript do
playerScripts.ChildAdded:Wait()
localScript = playerScripts:FindFirstChildOfClass("LocalScript")
end
local hitFunction
if getsenv then
local success, scriptEnv = pcall(getsenv, localScript)
if success and scriptEnv then
hitFunction = scriptEnv._G.SendHitsToServer
end
end
local successFlags, combatRemoteThread = pcall(function()
return require(modules.Flags).COMBAT_REMOTE_THREAD or false
end)
if successFlags and combatRemoteThread and hitFunction then
hitFunction(mainTarget, targets)
elseif successFlags and not combatRemoteThread then
hitEvent:FireServer(mainTarget, targets)
end
end
CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
get_Monster=function()for a,b in pairs(workspace.Enemies:GetChildren())do local c=b:FindFirstChild("UpperTorso")or b:FindFirstChild("Head")if b:FindFirstChild("HumanoidRootPart",true)and c then if(b.Head.Position-plr.Character.HumanoidRootPart.Position).Magnitude<=50 then return true,c.Position end end end;for a,d in pairs(workspace.SeaBeasts:GetChildren())do if d:FindFirstChild("HumanoidRootPart")and d:FindFirstChild("Health")and d.Health.Value>0 then return true,d.HumanoidRootPart.Position end end;for a,d in pairs(workspace.Enemies:GetChildren())do if d:FindFirstChild("Health")and d.Health.Value>0 and d:FindFirstChild("VehicleSeat")then return true,d.Engine.Position end end end
Actived=function()local a=game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")for b,c in next,getconnections(a.Activated)do if typeof(c.Function)=='function'then getupvalues(c.Function)end end end
task.spawn(function()
RunSer.Heartbeat:Connect(function()
pcall(function()
if not _G.FastAttack then return end
AttackNoCoolDown() 
local Pretool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
local ToolTip = Pretool.ToolTip
local MobAura, Mon = get_Monster()
if ToolTip == "Blox Fruit" then
if MobAura then 
local LeftClickRemote = Pretool:FindFirstChild('LeftClickRemote');
if LeftClickRemote then Actived() LeftClickRemote:FireServer(Vector3.new(0.01,-500,0.01),1,true);LeftClickRemote:FireServer(false)end
end 		 
end
end)
end)
end)
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local plr = Players.LocalPlayer
local Enabled = true
local MobHeight = {}

local function GetPlayerY()
local char = plr.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
return hrp and hrp.Position.Y
end

local function LockMob(mob)
if not mob or not mob.Parent then return end
local hrp = mob:FindFirstChild("HumanoidRootPart")
local hum = mob:FindFirstChildOfClass("Humanoid")
if not hrp or not hum or hum.Health <= 0 then return end

local playerY = GetPlayerY()
if not playerY then return end
if hrp.Position.Y >= playerY then
if hrp:FindFirstChild("NoWaterBP") then
hrp.NoWaterBP:Destroy()
end
MobHeight[mob] = nil
return
end

if not MobHeight[mob] then
MobHeight[mob] = hrp.Position.Y
end

if not hrp:FindFirstChild("NoWaterBP") then
local bp = Instance.new("BodyPosition")
bp.Name = "dulon"
bp.MaxForce = Vector3.new(0, 1e9, 0)
bp.Position = Vector3.new(hrp.Position.X, MobHeight[mob], hrp.Position.Z)
bp.D = 1000
bp.P = 50000
bp.Parent = hrp
end
end

local function UpdateMob(mob)
local hrp = mob:FindFirstChild("HumanoidRootPart")
local bp = hrp and hrp:FindFirstChild("NoWaterBP")
if hrp and bp and MobHeight[mob] then
bp.Position = Vector3.new(hrp.Position.X, MobHeight[mob], hrp.Position.Z)
end
end

if Workspace:FindFirstChild("Enemies") then
Workspace.Enemies.ChildAdded:Connect(function(mob)
task.wait()
if Enabled then
LockMob(mob)
end
end)
end

RunService.Heartbeat:Connect(function()
if Enabled and Workspace:FindFirstChild("Enemies") then
for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
LockMob(mob)
UpdateMob(mob)
end
end
end)

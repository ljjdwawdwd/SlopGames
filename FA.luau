local MarketplaceService = game:GetService("MarketplaceService")

local Ophyn = loadstring(game:HttpGet("https://ophyn.space/interface"))()
local api = loadstring(game:HttpGet("https://auth.hungquan99.lol/sdk/library.lua"))()
api.script_id = "throwfoodforanimals"

local gameName = game.Name
local ok, info = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)
if ok and info and info.Name then
    gameName = info.Name
end

Ophyn.new({
    Title = gameName,
    Description = "Key System",
    Theme = "Dark",
    Folder = "ThrowFoodForAnimals",
    getkey = true,
    discord_link = "https://discord.gg/JpeU4ANdU4",
    Discord = "true",
    Website = "false",
    KeySystem = {
        URL = "https://auth.hungquan99.lol/key/jkt4pi0x0cax5r",
        SaveKey = true,
        Key = function(key)
            local result = api.check_key(key)
            if result.code == "KEY_VALID" or result.code == "KEYLESS" then
                return true
            end
            return false, result.message
        end,
    },
    Callback = function(key)
        getgenv().script_key = key
        loadstring(game:HttpGet("https://auth.hungquan99.lol/v1/loaders/throwfoodforanimals.lua"))()
    end,
})

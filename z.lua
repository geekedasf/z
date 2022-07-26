local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local name = game:GetService("Players").LocalPlayer.Name
local playerID = game:GetService("Players").LocalPlayer.UserId
local TIME_ZONE = -4
local date = os.date("!*t")
local hour = (date.hour + TIME_ZONE) % 24
local ampm = hour < 12 and "AM" or "PM"
local timestamp = string.format("%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, ampm)
local function getexploit()
  local exploit =
      (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or
      (secure_load and "Sentinel") or
      (is_sirhurt_closure and "Sirhurt") or
      (pebc_execute and "ProtoSmasher") or
      (KRNL_LOADED and "Krnl") or
      (WrapGlobal and "WeAreDevs") or
      (isvm and "Proxo") or
      (shadow_env and "Shadow") or
      (jit and "EasyExploits") or
      (getscriptenvs and "Calamari") or
      (unit and not syn and "Unit") or
      (OXYGEN_LOADED and "Oxygen U") or
      (IsElectron and "Electron") or
      ("Unsupported")
  return exploit
end
local data = {
    content = "",
    embeds = {
      {
        title = "New Execution Detected",
        description = "Roblox Profile: **https://www.roblox.com/users/".. playerID.. "/profile**",
        color = nil,
        fields = {
          {
            name = "`🧍` Executor's Username & ID",
            value = "```Username: ".. name.."\nID: ".. playerID.. "```",
            inline = true
          },
          {
            name = "`🕐` Executed At",
            value = "```".. timestamp.. " EST```",
            inline = true
          },
          {
            name = "`💻` Executed With",
            value = "```".. getexploit().. "```",
            inline = true
          },
          {
            name = "`🗳` Executors HWID",
            value = "```".. hwid.. "```",
            inline = false
          }
      }
    }
}
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
    ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local webhook_data = {Url = "https://discord.com/api/webhooks/1001290172299751515/2yTZckDLUqqhCj7YH00tkNbIXlnueSA-4nIwEavji4wjc8ULv-eg4Vh1G5v3OZu3RYOh", Body = newdata, Method = "POST", Headers = headers}
request(webhook_data)

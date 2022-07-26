local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local name = game:GetService("Players").LocalPlayer.Name
local playerID = game:GetService("Players").LocalPlayer.UserId
local TIME_ZONE = -4
local date = os.date("!*t")
local hour = (date.hour + TIME_ZONE) % 24
local ampm = hour < 12 and "AM" or "PM"
local timestamp = string.format("%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, ampm)
local data = {
    content = "",
    embeds = {
      {
        title = "New Execution Detected",
        color = nil,
        fields = {
          {
            name = "`🧍` Executor's Username",
            value = "```".. name.. "```",
            inline = true
          },
          {
            name = "`🧍` Executor's ID",
            value = "```".. playerID.. "```",
            inline = true
          },
          {
            name = "`🕐` Players Local Time",
            value = "```".. timestamp.. " EST```",
            inline = true
          },
          {
            name = "`🧍` Executors HWID",
            value = "```".. hwid.. "```"
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

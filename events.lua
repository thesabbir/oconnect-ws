local json = require "cjson"

-- Event Listeners

local events = {}

events["error"] = function(client)
  client.send(client.data)
end

events["status"] = function(client)
  client.send(client.data)
end

events["getinfo"] = function(client)
  client.send(client.data)
end

-- dispatcher
local function eventListeners(client)
  print(client.data.event)
  events[client.data.event](client)
end

return {
  listen = eventListeners
}

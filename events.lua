local json = require 'cjson'

-- Event Listeners
-- Currently on Echo

local events = {}

-- Error Event
events['error'] = function(client)
  client.send(client.data)
end

-- Status Event
events['status'] = function(client)
  client.send(client.data)
end

-- Get Info Event
events['getinfo'] = function(client)
  client.send(client.data)
end

-- Event Dispatcher
local function eventListeners(client)
  print(client.data.event)
  events[client.data.event](client)
end

return {
  listen = eventListeners
}

local json = require "cjson"

local events = {}

events["error"] = function(app)
  print("Error Event")
  local res = json.encode(app.data)
  app.ws:send(res)
end

events["status"] = function(app)
  print("Status Event")
  local res = json.encode(app.data)
  app.ws:send(res)
end

events["getinfo"] = function(app)
  print("GetInfo Event")
  local res = json.encode(app.data)
  app.ws:send(res)
end



local function eventListeners(app)
  print(app.data.event)
  events[app.data.event](app)
end

return {
  listen = eventListeners
}

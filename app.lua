local events = require 'events'
local parser = require 'parser'
local server = require 'server'
local json   = require 'cjson'


local App = function(ws) -- main handler
  -- Create a client
  local client = {}
  client.send = function(data) ws:send(json.encode(data)) end -- send function
  while true do -- loop
    local body, code = ws:receive()
    if body then
      client.data = parser.parse(body) -- parse incoming message
      events.listen(client) -- event Listeners
    else
      ws:close() -- Close connection
      return
    end
  end
end

server.start(App) -- Start the server with App handler

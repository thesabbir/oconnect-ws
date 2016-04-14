local events = require 'events'
local parser = require 'parser'
local server = require 'server'


local App = function(ws)
  local app = {}
  app.ws = ws
  while true do
    local body, code = ws:receive()
    if body then
      app.data = parser.parse(body)
      events.listen(app)
    else
      ws:close()
      return
    end
  end
end

server.start(App)

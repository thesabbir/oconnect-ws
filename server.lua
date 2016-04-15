local websocket = require 'websocket'
local copas = require 'copas'

local function server(handler)
  websocket.server.copas.listen
  {
    port = 5000,
    protocols = {
      oconnect = handler
    },
    default = handler
  }
  -- Start copas loop
  copas.loop()
end

return {
  start = server
}

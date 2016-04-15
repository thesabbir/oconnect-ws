local json = require "cjson"


local function dataError()
  return {
        event = "error",
        message = "Invalid Data Type. Please send a vaild json data."
      }
end


local function bodyParser(body)
  if type(body) == "string" then -- Check if body is strig
    local bodyTable = json.decode(body) -- decode json
    if bodyTable.event == nil or bodyTable.message == nil then -- check format
      return dataError() -- return data error event
    end
    return bodyTable -- Return body
  else
    return dataError() -- if not string: data error
  end
end

return {
  parse = bodyParser
}

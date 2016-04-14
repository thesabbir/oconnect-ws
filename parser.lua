local json = require "cjson"


local function dataError()
  return {
        event = "error",
        message = "Invalid Data Type. Please send a vaild json data."
      }
end


local function bodyParser(body)
  if type(body) == "string" then
    print("ITS STRING")
    local bodyTable = json.decode(body)
    if bodyTable.event == nil or bodyTable.message == nil then
      print("ITS DOES NOT HAVE VALID FORMAT")
      return dataError()
    end
    print("ITS DOES HAVE VALID FORMAT")
    return bodyTable
  else
    print("ITS NOT STRING")
    return dataError()
  end
end

return {
  parse = bodyParser
}

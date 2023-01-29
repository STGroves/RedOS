if not pcall(function() require ("./object") end) then
  os.loadAPI("./object")
end

return function()
  local function CreateStruct(dec, name)
    local self = object.New("ColourStruct")
    function self.GetDecimal() return dec end
    function self.GetHex() return string.format("%02x", dec*256) end
    function self.GetPaint() return string.format("%x", (math.log (dec) / math.log (2))) end
    function self.GetName() return name end

    return self
  end

  local self = {
    white = CreateStruct(1, "White"),
    orange = CreateStruct(2, "Orange"),
    magenta = CreateStruct(4, "Magenta"),
    lightBlue = CreateStruct(8, "LightBlue"),
    yellow = CreateStruct(16, "Yellow"),
    lime = CreateStruct(32, "Lime"),
    pink = CreateStruct(64, "Pink"),
    grey = CreateStruct(128, "Grey"),
    lightGrey = CreateStruct(256, "LightGrey"),
    cyan = CreateStruct(512, "Cyan"),
    purple = CreateStruct(1024, "Purple"),
    blue = CreateStruct(2048, "Blue"),
    brown = CreateStruct(4096, "Brown"),
    green = CreateStruct(8192, "Green"),
    red = CreateStruct(16384, "Red"),
    black = CreateStruct(32768, "Black")
  }

  function self.FindColourStructByDecimal(dec)
    return self[(math.log (dec) / math.log (2)) + 1]
  end

  function self.FindColourStructByHex(hex)
    return tonumber(self.FindColourStructByDecimal(hex))
  end

  function self.FindColourStructByPaintID(id)
    return self[tonumber(id, 16)]
  end

  return self
end
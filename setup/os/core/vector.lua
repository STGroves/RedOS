if not pcall(function() require ("./object") end) then
  os.loadAPI("./object")
end

function New(x, y)
  local self = object.New("Vector")
  self.X = x
  self.Y = y

  function Inverse()
    return New(-self.X, -self.Y)
  end

  return self
end
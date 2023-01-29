require("./object")

function Vector(x, y)
  local self = Object("Vector")
  self.X = x
  self.Y = y

  function Inverse()
    return Vector(-self.X, -self.Y)
  end

  return self
end
if not pcall(function() require ("./object") end) then
  os.loadAPI("./object")
end

local self = {}

function self.New(x, y)
  local self = object.New("Vector")
  self.X = x
  self.Y = y

  function Inverse()
    return New(-self.X, -self.Y)
  end

  return self
end

function self.One() return object.Clone(self.New(1,1)) end
function self.Zero() return object.Clone(self.New(0,0)) end
function self.Left() return object.Clone(self.New(-1, 0)) end
function self.Up() return object.Clone(self.New(0, -1)) end
function self.Right() return object.Clone(self.New(1, 0)) end
function self.Down() return object.Clone(self.New(0, 1)) end

return self
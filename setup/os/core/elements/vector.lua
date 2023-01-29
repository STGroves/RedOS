if not pcall(function() require ("./object") end) then
  os.loadAPI("./elements/object")
end

function New(x, y)
  local self = object.New("Vector")
  self.X = x
  self.Y = y

  function self.Inverse()
    return New(-self.X, -self.Y)
  end

  return self
end

function One() return object.Clone(New(1,1)) end
function Zero() return object.Clone(New(0,0)) end
function Left() return object.Clone(New(-1, 0)) end
function Up() return object.Clone(New(0, -1)) end
function Right() return object.Clone(New(1, 0)) end
function Down() return object.Clone(New(0, 1)) end
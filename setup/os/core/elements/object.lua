local self = {}
function self.New(type)
  local self = {}

  function self.GetType() return type end

  return self
end

function self.Clone(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            for orig_key, orig_value in next, orig, nil do
                copy[self.Clone(orig_key, copies)] = self.Clone(orig_value, copies)
            end
            setmetatable(copy, self.Clone(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

return self
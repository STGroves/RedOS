if not pcall(function() require ("./drawable/rectangle") end) then
  os.loadAPI("./elements/drawable/rectangle")
  os.loadAPI("./colours")
  os.loadAPI("./elements/rect")
  os.loadAPI("./elements/object")
end

function New(barRect, targetValue, showPercentage, backColour, barColour)
  if not barRect.GetType() == "Rect" then
    error("barRect must be of type Rect!")
  end

  if not type(targetValue) == "number" or targetValue < 1 then
    error("targetValue must be a positive number!")
  end

  if not type(showPercentage) == "boolean" then
    error("showPercentage must be a boolean!")
  end

  if not backColour.GetType() == "ColourStruct" and not type(backColour) == "number" then
    error("backColour is not a valid colour!")
  end

  if not barColour.GetType() == "ColourStruct" and not type(barColour) == "number" then
    error("barColour is not a valid colour!")
  end

  local value = 0
  local backRectangle = rectangle.New(barRect, backColour)
  local barRectangle = rectangle.New(object.Clone(barRect))

  local self = object.New("ProgressBar")

  function self.GetValue() return value end
  function self.GetTarget() return targetValue end
  function self.GetCompletion() return value / targetValue end

  function self.Draw()
    local lastPosX, lastPosY = term.getCursorPos()
    backRectangle.Draw()

    local barSize = barRectangle.GetBounds().GetSize()
    barSize.X = math.floor(barRect.GetSize().X * self.GetCompletion())
    
    barRectangle.GetBounds().SetSize(barSize)
    barRectangle.Draw()
  end

  function self.SetValue(newVal)
    if not type(newVal) == "number" or newVal < 0 then
      error("newVal must be either 0 or a positive number!")
    end

    value = newVal
  end

  function self.UpdateProgress()
    value = math.min(value + 1, targetValue)
  end
end
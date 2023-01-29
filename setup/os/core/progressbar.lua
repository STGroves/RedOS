if not pcall(function() require ("./rect") end) then
  os.loadAPI("./rect")
end

function ProgressBar(x, y, width, showPercentage, backColour, barColour)

end

local rect = Rect(1,1,5,5)

term.clear()
term.write(rect.GetLeft())
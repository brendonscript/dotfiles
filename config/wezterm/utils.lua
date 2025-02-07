local module = {}
local function mergeArrays(t1, t2)
  local result = {}
  for i = 1, #t1 do
    table.insert(result, t1[i])
  end
  for i = 1, #t2 do
    table.insert(result, t2[i])
  end
  return result
end
module.mergeArrays = mergeArrays
return module

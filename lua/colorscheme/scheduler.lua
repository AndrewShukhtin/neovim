local M = {}

M.is_night = function()
  local now = tonumber(os.date("%H"))
  print(now)
  if now > 19 or now < 9 then
    return true
  end
  return false
end

return M

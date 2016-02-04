
-- Test macro to show current windows of Far Manager

local F = far.Flags

local function WindowsCount() return far.AdvControl (F.ACTL_GETWINDOWCOUNT) end

local function makeuid(Area,id,pos,name) return Area.." Id="..id.."; Pos="..pos..": `"..name.."`" end

local En = {
  [F.WTYPE_PANELS]="Panels",[F.WTYPE_VIEWER]="View",[F.WTYPE_EDITOR]="Edit",
  [F.WTYPE_DESKTOP]="Desktop",
}
local function getWindow(n) -- n = window's Pos [optional]
  local w = assert(far.AdvControl (F.ACTL_GETWINDOWINFO,n))
  w.uid = makeuid(w.TypeName,tostring(w.Id),tostring(w.Pos),w.Name)
  return w
end

Macro
{
  area="Common";
  key="CtrlAlt`";
  description="Test macro to show current windows of Far Manager";
action=function()
  local title = "Windows list: "..tostring(WindowsCount())
  local s = ""
  local Pos
  for i=1,WindowsCount() do --get window Pos by uid
    local w = getWindow(i)
    s = s..w.uid.."\n"
  end
  msgbox(title,s)
end;
}

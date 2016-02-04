
Macro
{
  area="Shell Info QView Tree";
  key="Esc";
  flags="EmptyCommandLine";
  description="Use Esc to toggle panels on/off";
action = function()
  -- Yes, we can switch to 'Desktop' screen, but it does not have command line
  -- Keys("F12 0")

  -- Hide keybar
  if   not (APanel.Visible  or  PPanel.Visible) then  Far.KeyBar_Show(1) end
  -- Toggle panels
  Keys("CtrlO")
  -- Show keybar
  if   not (APanel.Visible  or  PPanel.Visible) then
    Far.KeyBar_Show(2)
  else
    -- Force ConEmu to update BG image
    Plugin.Call("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b", 99)
  end
end;
}

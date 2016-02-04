
Macro {
  area="Editor";
  key="F2 F9";
  description="Save and reload lua macros";
condition = function() return mf.ucase(mf.fsplit(Editor.FileName, 8)) == ".LUA" end;
action = function()
  -- Save file, if it was modified
  if band(Editor.State,8) then
    Keys("F2")
  end
  --
  far.MacroLoadAll()
end;
}

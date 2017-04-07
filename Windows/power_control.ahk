/*
*---------------------------------------
*--  #region: Power control hotkeys   --
*---------------------------------------
*/

#notrayicon                     
StringCaseSense, On             ;case sensitive string comparison

#+q::                           ;Windows(#) + Shift(+) + q for shutdown menu followed by:
Input, Key, L1 M C
if Key = S                      ;S for shutdown
    Shutdown, 1                 
else if key = R                 ;R for restart
    Shutdown, 2
else if key = L                 ;L for logoff
    Shutdown, 0
else if key = l                 ;l for lock
    DllCall("LockWorkStation")
else if key = s                 ;s for sleep
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
else
    return
return 

/*
*------------------------------------------
*--  #endregion: Volume control hotkeys  --
*------------------------------------------
*/
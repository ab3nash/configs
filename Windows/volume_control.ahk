/*
*---------------------------------------
*--  #region: Volume control hotkeys  --
*---------------------------------------
*/
#notrayicon

#Up:: 
SoundSet +3 
SoundSet, +3, wave 
gosub, vupdt 
return 

#Down:: 
SoundSet -3 
SoundSet, -3, wave 
gosub, vupdt 
return 

#Left:: 
SoundSet, -0, Microphone, mute 
IfWinExist, volume 
{ 
SoundGet, m_m, Microphone, mute 
if m_m = On 
GuiControl,, R, 0 
else 
GuiControl,, R, 1 
SetTimer,label, 2000 
return 
} 
Gosub, show 
Return 

#Right:: 
SoundSet, -0, MASTER, mute 
IfWinExist, volume 
{ 
SoundGet, v_m, master, mute 
if v_m = On 
GuiControl,, Pic1,*icon40 C:\WINDOWS\system32\mmsys.cpl 
else 
GuiControl,, Pic1, *icon1 C:\WINDOWS\system32\mmsys.cpl 
SetTimer,label, 2000 
return 
} 
Gosub, show 
Return 
;This routine is isolated to avoid icon flashing 
vupdt: 
IfWinExist, volume 
{ 
SoundGet, master_volume 
GuiControl,, MP, %master_volume% 
SetTimer,label, 2000 
return 
} 
Gosub, show 
Return 

show: 
SoundGet, master_volume 
SoundGet, m_m, Microphone, mute 
SoundGet, v_m, master, mute 

IfWinNotExist, volume 
{ 
Gui, +ToolWindow -Caption +0x400000 +alwaysontop 
Gui, Add, GroupBox, x3 y2 w40 h45 cblack,
Gui, Add, text, x97 y2 ,Volume: 
Gui, Add, Progress,horizontal vMP x48 y18 w160 h20 c333cc,%master_volume%  
if v_m = On 
Gui, Add, pic, x7 y13 vPic1 icon40, C:\WINDOWS\system32\mmsys.cpl 
else 
Gui, Add, pic, x7 y13 vPic1 icon1, C:\WINDOWS\system32\mmsys.cpl 
if m_m = On 
GuiControl,, R, 0 
else 
GuiControl,, R, 1 
Gui, Show, NoActivate x720 y460 h48 w213, volume 
} 
SetTimer,label, 2000 
return 

label: 
SetTimer,label, off 
Gui, destroy
/*
*------------------------------------------
*--  #endregion: Volume control hotkeys  --
*------------------------------------------
*/
function movex_text(h,x)
%MOVEX_TEXT moves text horizontally.

% Copyright 2004-2010 The MathWorks, Inc.

FmtSpec=getappdata(get(get(h,'parent'),'parent'),'FmtSpec');
msg=sprintf(FmtSpec,x);
pos=get(h,'position');
pos(1)=x;
set(h,'Position',pos,'String',msg)

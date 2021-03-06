return Def.ActorFrame {
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong(); 
		if song then
-- 			self:setaux(0);
			self:finishtweening();
			self:decelerate(0.3):zoomx(1):diffusealpha(1)
		elseif not song and self:GetZoomX() == 1 then
-- 			self:setaux(1);
			self:finishtweening();
			self:decelerate(0.3):zoomx(0):diffusealpha(0)
		end;
	end;
	Def.StepsDisplayList {
		Name="StepsDisplayListRow";
		OnCommand=function(self)
		self:diffusealpha(0):zoomx(0):decelerate(0.4):zoomx(1):diffusealpha(1)
		end;
		OffCommand=function(self)
		self:decelerate(0.3):zoomx(0):diffusealpha(0)
		end;
		CursorP1 = Def.ActorFrame {
			InitCommand=cmd(x,-194+16;player,PLAYER_1);
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_1 then
					self:visible(true);
					(cmd(zoom,0;bounceend,1;zoom,1))(self);
				end;
			end;
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_1 then
					self:visible(true);
					(cmd(bouncebegin,1;zoom,0))(self);
				end;
			end;
			LoadActor(THEME:GetPathG("_StepsDisplayListRow","Cursor")) .. {
				InitCommand=cmd(diffuse,PlayerColor(PLAYER_1);x,8;zoom,0.75);
			};
			LoadActor(THEME:GetPathG("_StepsDisplayListRow","arrow")) .. {
				InitCommand=cmd(x,29;diffuse,color("#FFFFFF"););
				OnCommand=cmd(thump,1;effectmagnitude,1,1.25,1;effectclock,'beat';);
			};
			LoadFont("_overpass 36px") .. {
				Text="P1";
				InitCommand=cmd(x,4;diffuse,ColorLightTone(PlayerColor(PLAYER_1)););
				OnCommand=cmd(zoom,0.75);
			};
		};
		CursorP2 = Def.ActorFrame {
			InitCommand=cmd(x,194-16;player,PLAYER_2);
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_2 then
					self:visible(true);
					(cmd(zoom,0;bounceend,1;zoom,1))(self);
				end;
			end;
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_2 then
					self:visible(true);
					(cmd(bouncebegin,1;zoom,0))(self);
				end;
			end;
			LoadActor(THEME:GetPathG("_StepsDisplayListRow","Cursor")) .. {
				InitCommand=cmd(diffuse,PlayerColor(PLAYER_2);x,-8;zoom,0.75;zoomx,-0.75;);
			};
			LoadActor(THEME:GetPathG("_StepsDisplayListRow","arrow")) .. {
				InitCommand=cmd(x,-29;diffuse,color("#FFFFFF");zoomx,-1);
				OnCommand=cmd(thump,1;effectmagnitude,1,1.25,1;effectclock,'beat';);
			};
			LoadFont("_overpass 36px") .. {
				Text="P2";
				InitCommand=cmd(x,-4;diffuse,ColorLightTone(PlayerColor(PLAYER_2)););
				OnCommand=cmd(zoom,0.75);
			};
		};
		CursorP1Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening;decelerate,0.05);
		};
		CursorP2Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening;decelerate,0.05);
		};
	};
};
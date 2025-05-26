
//
//	Player.qc - Various stuff done for the player, including per-frame functions like PlayerPreThink and PlayerPostThink, also client specific stuff like PutClientInServer etc.
//


//
// running
//


void() player_run = [ self.frame, player_run ] {
    if (self.frame >= 112)
    {
            self.frame = 102;
    }
    self.frame = self.frame + 1;

	if (!self.velocity_x && !self.velocity_y)
    {
        self.frame = 172;
    }

};

void() PlayerHurt =
{
	print("Ouch! Now I only have ");
	print(ftos(self.health));
	print(" health!\n");
}

void() PlayerJump =
{
	if (!(self.flags & FL_ONGROUND))
		return;

	if ( !(self.flags & FL_JUMPRELEASED) )
		return;
	
	self.flags = self.flags - (self.flags & FL_JUMPRELEASED);
	self.button2 = 0;
};


void() PlayerUse =
{
	vector source;
	vector end;
	makevectors(self.v_angle);

	source = self.origin + '0 0 48';
	end = source + v_forward * 48;

	traceline(source, end, 0, self);

	if (trace_fraction < 1.0)
	{
		
		local entity hit = trace_ent;
		if(hit.use != __NULL__)
		{
			doAsSelf(hit, hit.use);
		}
	}
}


entity() getSpawnPoint =
{
	entity spawnpoint = world;
	spawnpoint = find(spawnpoint, classname, "info_player_start");

	return spawnpoint;
};

void() PlayerPreThink =
{	

	if(self.button0)
	{
		
	}
	if(self.button2)
	{
		PlayerJump();
	}
	if(self.button4)
	{
		PlayerUse();
	}
	else
	{
		self.flags = self.flags | FL_JUMPRELEASED;
	}

};

void() PlayerPostThink =
{
};

void() ClientKill =
{
};

//called when a client connects to the server
void() ClientConnect =
{
	// print("Client connect\n");
};

void() PlayerSpawn =
{
	self.classname = "player";
	self.solid = SOLID_SLIDEBOX;
	setmodel(self, "models/lower.md3");
	self.movetype = MOVETYPE_WALK;
	self.health = 100;
	self.takedamage = DAMAGE_YES;
	self.hurt = PlayerHurt;
	self.maxspeed = 150;
	
	local entity spot = getSpawnPoint();
	setorigin(self, spot.origin);
	self.angles = spot.angles;
	self.fixangle = TRUE;
	setsize(self, [-16, -16, -24], [16, 16, 32]);
	self.view_ofs = [0, 0, 28];

	player_run();
};

void() PutClientInServer =
{
	PlayerSpawn();
};

void() ClientDisconnect =
{
	
};


void() SetNewParms =
{
};

void() SetChangeParms =
{
};

void() info_player_start =
{
};

void(float elapsedtime) SV_PausedTic =
{
	// if (elapsedtime > 2) setpause(0);
};

void() SV_RunClientCommand =
{
	runstandardplayerphysics(self);
};




void() cinteract1 = [341, cinteract2]{};
void() cinteract2 = [342, cinteract3]{};
void() cinteract3 = [343, cinteract4]{};
void() cinteract4 = [344, cinteract5]{};
void() cinteract5 = [345, cinteract6]{};
void() cinteract6 = [346, cinteract7]{};
void() cinteract7 = [347, cinteract8]{};
void() cinteract8 = [348, cinteract9]{};
void() cinteract9 = [349, cinteract10]{};
void() cinteract10 = [350, player_run]{};


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


void() PlayerUse =
{
	entity hit;
	makevectors(self.v_angle);

	
	//Body trace
	traceline(self.origin, self.origin + v_forward*48, 0, self);
	if (trace_fraction < 1.0)
	{
		hit = trace_ent;
		if(hit.use != __NULL__)
		{
			doAsSelf(hit, hit.use);
			return;
		}
	}
	//Ground trace
	traceline(self.origin - '0 0 20', self.origin + v_forward*48 - '0 0 20', 0, self);
	if (trace_fraction < 1.0)
	{
		hit = trace_ent;
		if(hit.use != __NULL__)
		{
			cinteract1();
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
		PlayerUse();
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



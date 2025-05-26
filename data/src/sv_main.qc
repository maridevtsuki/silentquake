//
//	Main.qc - mostly functions that will be called from the engine and are expected to exist
//

//unused
void() main =
{};


//called for each frame that QC runs
void() StartFrame =
{
	
};
void() precacheEverything =
{
	// models
	//precache_model("models/v_knife.mdl");
	precache_model("models/player.mdl");
	precache_model("models/lower.md3");
	// sound
	precache_sound("player/footstep.wav");
	//particles
	particleeffectnum("particles.bullet_hole");
	particleeffectnum("particles.blood_stain");
};

void() worldspawn =
{	
	precacheEverything();
	
};

void() SpectatorConnect =
{	
};


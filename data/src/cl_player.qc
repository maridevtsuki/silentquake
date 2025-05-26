float(float new) playerListen =
{
	if (new == 1)
	{
		precache_model("models/upper.md3");
		self.torsoent = spawn();
		setmodel(self.torsoent, "models/upper.md3");
		self.torsoent.drawmask = MASK_ENGINE;

		precache_model("models/head.md3");
		self.headent = spawn();
		setmodel(self.headent, "models/head.md3");
		self.headent.drawmask = MASK_ENGINE;
	}

	
	self.torsoent.origin = gettaginfo(self, gettagindex(self, "tag_torso"));
	self.torsoent.angles = vectoangles(v_forward, v_up);
	self.torsoent.frame = self.frame;

	self.headent.origin = gettaginfo(self.torsoent, gettagindex(self.torsoent, "tag_head"));
	self.headent.angles = vectoangles(v_forward, v_up);
	
	return TRUE;	
}


float() playerPredraw;

float(float new) playerListen =
{
	if(new == 1)
	{
		precache_model("models/upper.md3");
		precache_model("models/head.md3");
		self.predraw = playerPredraw;
	}
	
	return TRUE;	
}

float() playerPredraw =
{
	
	if(!self.torsoent)
	{
		self.torsoent = spawn();
		setmodel(self.torsoent, "models/upper.md3");
		self.torsoent.drawmask = MASK_ENGINE;
	}else
	{
		self.torsoent.origin = gettaginfo(self, 1);
		self.torsoent.frame = 1;
		self.torsoent.angles = vectoangles(v_forward, v_up);
	}
	if(!self.headent)
	{
		self.headent = spawn();
		setmodel(self.headent, "models/head.md3");
		self.headent.drawmask = MASK_ENGINE;
	}else
	{
		self.headent.origin = gettaginfo(self.torsoent, 1);
		self.headent.frame = 1;
		self.headent.angles = vectoangles(v_forward, v_up);
	}
	return PREDRAW_AUTOADD;
}
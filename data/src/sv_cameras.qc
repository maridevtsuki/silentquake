void() triggerCamTouch =
{
	if (other.classname != "player")
	{
		return;
	}
	msg_entity = other;//Send it to the player colliding
	local entity t = find(world, targetname, self.target);
	WriteByte(MSG_MULTICAST, SVC_CGAMEPACKET);
	WriteByte(MSG_MULTICAST, TRIGGERCAM);
	WriteString(MSG_MULTICAST, t.classname);

	WriteCoord(MSG_MULTICAST, t.origin_x);
	WriteCoord(MSG_MULTICAST, t.origin_y);
	WriteCoord(MSG_MULTICAST, t.origin_z);

	WriteCoord(MSG_MULTICAST, t.angles_x);
	WriteCoord(MSG_MULTICAST, t.angles_y);
	WriteCoord(MSG_MULTICAST, t.angles_z);
	
	multicast('0 0 0', MULTICAST_ONE);
};

void() trigger_camera =
{
	setmodel(self, self.model);
	self.modelindex = 0;
	self.solid = SOLID_TRIGGER;
	self.touch = triggerCamTouch;
};


void() cam_track =
{
		
};


void() cam_static =
{

}

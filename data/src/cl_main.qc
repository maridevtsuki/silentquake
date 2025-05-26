void(float apiver, string enginename, float enginever) CSQC_Init =
{
    deltalisten("models/lower.md3",playerListen, 0);
}

void(float width, float height, float menushow) CSQC_UpdateView =
{
    clearscene();
    
    
    //setviewprop(VF_ORIGIN, self.origin);
    //setviewprop(VF_ANGLES, self.angles);
    
    CameraFrame();
    cam_type = 0;

    setviewprop(VF_DRAWENGINESBAR, 0);//FUCK the hud
    setviewprop(VF_DRAWCROSSHAIR, 0);
    addentities(MASK_VIEWMODEL);
    addentities(MASK_ENGINE);
    setviewprop(VF_VIEWENTITY, 0);
    renderscene();

    
}

void() CSQC_Parse_Event =
{
  local float event = readbyte();
  if (event == TRIGGERCAM)
  {
    cam_type = readstring();
    cam_origin.x = readcoord();
    cam_origin.y = readcoord();
    cam_origin.z = readcoord();

    cam_angles.x = readcoord();
    cam_angles.y = readcoord();
    cam_angles.z = readcoord();
  }
}


void() CSQC_Ent_Remove =
{
	remove(self);
};


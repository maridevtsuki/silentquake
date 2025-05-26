vector cam_origin;
vector cam_angles;
string cam_type;

//const float CAM_ORG_LERPD = 5;
//const float CAM_ANG_LERPD = 20;

void() CameraFrame =
{
	switch(cam_type)
	{

		case "cam_static":
			setviewprop(VF_ORIGIN, cam_origin);
			setviewprop(VF_ANGLES, cam_angles);
			break;
		case "cam_track":
			setviewprop(VF_ORIGIN, cam_origin);
			
			setviewprop(VF_ANGLES, vectoangles(pmove_org + '0 0 16' - cam_origin));
			break;
		default:
			local vector flat_offset = pmove_org - cam_origin;
			flat_offset.z = 0;
			flat_offset = normalize(flat_offset);

			cam_origin = pmove_org + -100*flat_offset + '0 0 85';
			setviewprop(VF_ORIGIN, cam_origin);

			makevectors(view_angles);
			
                        
			local float f = v_right * flat_offset;//dot product
			local vector side_offset = normalize([-flat_offset.y, flat_offset.x, 0]);//look more to the side when the player does
		
			local vector cam_focus = pmove_org + '0 0 16' + side_offset * f * 24;
			setviewprop(VF_ANGLES,vectoangles(cam_focus - cam_origin));

			traceline(pmove_org + '0 0 85', cam_origin, 1, self);//camera collision
			if (trace_fraction < 1.0)
			{
				setviewprop(VF_ORIGIN, trace_endpos);
			}
			
			break;
		
	}
}


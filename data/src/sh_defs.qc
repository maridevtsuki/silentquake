//NETWORK BYTES
const float TRIGGERCAM = 32;

//METHODS
vector(vector a, vector b, float delta) vlerp = //lerp a vector
{
	return a * (1-delta) + b * delta;
}



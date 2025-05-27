void() test_use;

void() interactable_test =
{
	self.classname = "interactable_test";
	self.solid = SOLID_BBOX;
	self.use = test_use;
	setsize(self, [-16, -16, -16], [16, 16, 16]);
}

void() test_use =
{
	print("used :)\n");
}
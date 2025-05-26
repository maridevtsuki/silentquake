// put custom server-only globals and fields here

.void() hurt; //called when entity is damaged
.vector offset; // used for cameras but also anything

//used to keep track of self correctly during targeting
void doAsSelf(entity target, void() func)
{
    entity oldself = self;
    self = target;
    func();
    self = oldself;
}


//player fields

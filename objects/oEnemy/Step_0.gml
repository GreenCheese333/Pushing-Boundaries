//Horizontal Movement
if (place_meeting(x+hsp, y, oWall))
{
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x += sign(hsp);
	}
	movedir *= -1;
}
if ((x <= minX) || (x >= maxX)) movedir *= -1;
hsp = walksp * movedir;
x += hsp;

//Vertical Movement
vsp += grv;
if (place_meeting(x, y+vsp, oWall))
{
	while (!place_meeting(x, y+sign(vsp), oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

//Animation
image_xscale = movedir;
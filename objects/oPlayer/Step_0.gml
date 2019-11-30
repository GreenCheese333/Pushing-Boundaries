//Input
key_dash = keyboard_check_pressed(vk_shift);
dashcooldown -= 1;
if (dashcooldown <= 0) && (key_dash)
{
	dashing = true;
	dashcooldown = dashcooltime;
	audio_play_sound(snDash, 50, false);
}

key_jump = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W")));
movedir = keyboard_check(ord("D")) - keyboard_check(ord("A"));

//Movement
if (movedir == 0) 
{
	if (abs(hsp) >= deccelerate) hsp -= deccelerate * sign(hsp);
	else hsp = 0;
}
else if (sign(hsp) == movedir) hsp += accelerate * movedir;
else hsp += reverse * movedir;
if (abs(hsp) > walksp) hsp = sign(hsp) * walksp;

//Gravity
vsp += grv;

//Jumping
canjump -= 1;
if (canjump > 0) && (key_jump) && (!dashing)
{
	vsp = -jump;
	canjump = 0;
	audio_play_sound(snJump, 40, false);
}

//Dashing
if (dashing) 
{
	if (dashcooldown >= dashcooltime  - dashdur)
	{
		hsp = dashsp * image_xscale;
	}
	else 
	{
		dashing = false;
		hsp = walksp * image_xscale;
	}
}

//Prevent Border Input Cancellation
if (window_frame_get_width() != previousBorder)
{
	hsp = 0;
	previousBorder = window_frame_get_width();
}

//Horizontal Collisions
if (place_meeting(x+hsp, y, oWall))
{
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x += sign(hsp);
	}
}
else x += hsp;

//Cross Screen Borders
if (x > room_width - crossMargin) 
{
	if (!place_meeting(crossMargin, y, oWall)) x = crossMargin;
	else x = room_width - crossMargin;
}

if (x < crossMargin)
{
	if (!place_meeting(room_width - crossMargin, y, oWall)) x = room_width - crossMargin;
	else x = crossMargin;
}

//Vertical Collisions
if (place_meeting(x, y+vsp, oWall))
{
	while (!place_meeting(x, y+sign(vsp), oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

//Falling Off Stage
if (y > room_height)
{
	movedir = 1;
	x = startX;
	y = startY;
}

//Animations/Sounds
if (dashing)
{
	sprite_index = sPlayerD;
	image_speed = 0;
}
else if (!place_meeting(x, y+1, oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; 
	else image_index = 0;
}
else
{
		canjump = 10
	if (sprite_index == sPlayerA) 
	{
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2));
		audio_play_sound(snLanding, 10, false);
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Effects", oDust))
			{
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayerN;
	}
	else
	{
		sprite_index = sPlayerR;
	}
}
if (movedir != 0) image_xscale = movedir;
if (sprite_index == sPlayerR)
{
	if (step <= 0) 
	{
		audio_play_sound(choose(snFoot1, snFoot2, snFoot3, snFoot4), 5, false);
		step = maxStep;
	}
	else step -= abs(hsp / walksp);
}
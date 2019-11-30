walksp = 6;
movedir = 1;
hsp = walksp * movedir;
accelerate = 0.2;
reverse = accelerate * 2.5;
deccelerate = 0.8;

vsp = 0;
grv = 0.65;
jump = 13;
canjump = 0;

dashsp = walksp * 4;
dashdur = room_speed / 6;
dashcooltime = room_speed + dashdur;
dashcooldown = dashcooltime;
dashing = false;

maxStep = 9;
step = maxStep;

startX = x;
startY = y;

crossMargin = 9;
previousBorder = window_frame_get_width();

// Autosave
if (room != rInitialize) && (room != rMenu) && (room != rCredits) {

	//Overwrite old save
	if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

	//Create new save
	var file;
	file = file_text_open_write(SAVEFILE);
	file_text_write_real(file, room);
	file_text_close(file);
}
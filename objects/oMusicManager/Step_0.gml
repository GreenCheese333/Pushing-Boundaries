if (room == rMenu) || (room == rControls)
{
	if !audio_is_playing(snMenu) audio_play_sound(snMenu, 5, true);	
}
else audio_stop_sound(snMenu);

if (room == rCredits)
{
	if !audio_is_playing(snCredits) audio_play_sound(snCredits, 5, true);
}
else audio_stop_sound(snCredits);

if (room != rInitialize) && (room != rMenu) && (room != rControls) && (room != rCredits)
{
	if !audio_is_playing(snMusic) audio_play_sound(snMusic, 5, true);
}
else audio_stop_sound(snMusic);
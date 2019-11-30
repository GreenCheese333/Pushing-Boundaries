text[0] = "Programming/Design:\nJacob Sharp\n   \nArt:\nLuke Sharp";
text[1] = "Music Produced By\nJuhani Junkala\n   \nSome Assets Borrowed From\nShaun Spalding"
text[2]	= "Game Produced With\nGameMaker Studio 2\n     \nSounds Effects Created With\nBfxr";
text[3] = "This game was made for\nGame Off 2019\n     \nThe theme of the jam was\n\"Leaps and Bounds\"";
text[4] = "Thank you for playing!\n          \nWe hope you enjoyed it!";

spd = 0.35;
letters = 0;
currentline = 0;
length = string_length(text[currentline]);
mytext = "";

finished = false;
wait_time = room_speed * 5;
wait = true;

RES_W = 1024;
RES_H = 768;
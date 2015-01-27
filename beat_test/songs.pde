ArrayList<MenuSong> songs = new ArrayList<MenuSong>();



void songSetup()
{
    songs.add(new MenuSong(minim.loadFile("Crypt of the NecroDancer Alpha OST - Zone 3 Level 1 Cold(New).mp3"),0, "Cold", "cpu"));
    songs.add(new MenuSong(minim.loadFile("nc ft. Dreamscanner - TOMORROW (HQ).mp3"),0, "nc ft Dreamscanner - Tomorrow", "cpu"));
    songs.add(new MenuSong(minim.loadFile("NAOKI - 1998 (HQ).mp3"),0, "NAOKI - 1998", "cpu"));
    songs.add(new MenuSong(minim.loadFile("Mecha - Pokemon Theme Chipstep (Chiptune Dubstep).mp3"),0, "Mecha - Pokemon Theme", "cpu"));
    songs.add(new MenuSong(minim.loadFile("Kingdom Hearts Simple and Clean [Birth By Sleep] by Utada Hikaru 720p HD Audio Boost Remix w-Lyrics.mp3"),0, "Utada Hikaru - Simple and Clean", "cpu"));
}

class MenuSong
{
   AudioPlayer song;
   int highScore;
   String name; 
   String player;
   
   MenuSong()
   {
     
   }
   
   MenuSong(AudioPlayer song, int highScore, String name, String player)
   {
       this.highScore = highScore;
       this.song = song;
       this.name = name;
       this.player = player;
   }
}

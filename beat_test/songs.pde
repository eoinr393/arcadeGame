ArrayList<AudioPlayer> songs = new ArrayList<AudioPlayer>();
StringList songNames;

void songSetup()
{
    songNames = new StringList();
    songNames.append("Cold");
    songs.add(minim.loadFile("Crypt of the NecroDancer Alpha OST - Zone 3 Level 1 Cold(New).mp3"));
    songNames.append("nc ft Dreamscanner - Tomorrow");
    songs.add(minim.loadFile("nc ft. Dreamscanner - TOMORROW (HQ).mp3"));
    songNames.append("NAOKI - 1998");
    songs.add(minim.loadFile("NAOKI - 1998 (HQ).mp3"));
    songNames.append("Mecha - Pokemon Theme");
    songs.add(minim.loadFile("Mecha - Pokemon Theme Chipstep (Chiptune Dubstep).mp3"));
    songNames.append("Utada Hikaru - Simple and Clean");
    songs.add(minim.loadFile("Kingdom Hearts Simple and Clean [Birth By Sleep] by Utada Hikaru 720p HD Audio Boost Remix w-Lyrics.mp3"));
}

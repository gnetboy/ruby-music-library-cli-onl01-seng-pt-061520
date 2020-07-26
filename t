
[1mFrom:[0m /home/gustavo/dev/flatiron/labs/ /ruby-music-library-cli-onl01-seng-pt-061520/lib/MusicLibrayController.rb @ line 66 MusicLibraryController#list_songs_by_artist:

    [1;34m62[0m: [32mdef[0m [1;34mlist_songs_by_artist[0m
    [1;34m63[0m:    puts [31m[1;31m"[0m[31mPlease enter the name of an artist:[1;31m"[0m[31m[0m
    [1;34m64[0m:    input= gets.strip 
    [1;34m65[0m:     [32mif[0m artist= [1;34;4mArtist[0m.find_by_name(input)
 => [1;34m66[0m:       binding.pry
    [1;34m67[0m:     artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index [32mdo[0m |song,index|
    [1;34m68[0m:     puts [31m[1;31m"[0m[31m#{index+1}[0m[31m. #{a.name}[0m[31m - #{song.genre.name}[0m[31m[1;31m"[0m[31m[0m
    [1;34m69[0m: 
    [1;34m70[0m:     [32mend[0m
    [1;34m71[0m:   [32mend[0m
    [1;34m72[0m: [32mend[0m


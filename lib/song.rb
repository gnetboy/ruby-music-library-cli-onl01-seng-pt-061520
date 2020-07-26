class Song
    attr_accessor :name,:artist,:genre,:musiclibrarycontroller
    extend Concerns::Findable
    
    @@all=[]
    def initialize(name,artist=nil,genre=nil)
        @name=name
        self.artist=(artist) if artist !=nil
        self.genre=(genre)  if genre   !=nil
        save
    end

    def self.all
        @@all
    end
    def self.destroy_all
        self.all.clear
    end
    def save
        @@all << self unless @@all.include?(self)
    end
    def self.create(name)
        song=self.new(name)
        song.save
        song
    end
    def artist=(artist)
        @artist=artist
        artist.add_song(self)
    end

    def genre
        @genre
    end
    def genre=(genre)
        @genre=genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)     #class method detects instances from @@all class variable
        self.all.detect { |song|song.name == name }
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end
    def self.new_from_filename(file)
        new_song= file.split(" - ")
        song_name =new_song[1]
        artist_name = new_song[0]
        genre_name = new_song[2].split(".mp3").join
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        
        self.new(song_name, artist, genre)
    end

    def self.create_from_filename(file)
        self.new_from_filename(file).save
    end
end 
require  'pry'
class Artist
    attr_accessor :name,:song,:musiclibrarycontroller,:musicimporter

    extend Concerns::Findable
    
    @@all =[]
    def initialize(name)
        @name=name
        @songs=[]
        save
    end
    def self.all
        @@all
    end
    def self.destroy_all
        @@all.clear
    end
    def save
        @@all << self unless @@all.include?(self)
    end
    def self.create(name)
        artist=self.new(name)
        artist.save
        artist 
    end
    
    def songs
        @songs
    end
    def add_song(song)
        @songs << song unless @songs.include?(song)
        song.artist=self unless song.artist
    end
    def genres
        gens=[]
        Song.all.detect do |song|
        if gens.include?(song.genre)
          nil
        else
        gens << song.genre==self
        end 
      end
        gens
    end
      



end
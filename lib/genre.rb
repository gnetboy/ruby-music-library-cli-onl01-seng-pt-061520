require 'pry'
class Genre
    attr_accessor :name,:musiclibrarycontroller,:musicimporter
    
    extend Concerns::Findable

      @@all=[]
    def initialize(name)
        @name=name
        @songs=[]
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
        genre=self.new(name)
        genre.save
        genre
    end
    def songs
        @songs
    end
    def artists
        arts=[]
      @songs.each do |song|
      if arts.include?(song.artist)
        nil
      else
      arts<< song.artist
      end 
    end
      arts 
    end
end

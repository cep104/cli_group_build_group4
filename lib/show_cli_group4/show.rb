class Show 
    attr_accessor :name, :genres, :rating 
    @@all = []
    def initialize(name, genres, rating)
        @name = name 
        @genres = genres 
        @rating = rating 
        save
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end
end
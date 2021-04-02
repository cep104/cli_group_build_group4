class Show 
    attr_accessor :name, :genres, :rating 
    @@all = []
    def initialize(show_attr)
        show_attr.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        save
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_show(input)
        self.all.detect do |show| 
            show.name == input
        end
    end
end
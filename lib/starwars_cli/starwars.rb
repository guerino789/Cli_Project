class Starwars
    attr_reader :name, :id
    attr_accessor :height, :mass, :gender
    @@all = []
    def initialize(name, id, height, mass, gender)
        @name = name
        @id = id
        @@all << self
    end

    def self.find_by_id(id)
        index = id.to_i - 1
        all[index]
    end

    def self.all
        @@all
    end

    def update(height, mass, gender)
        self.height = height
        self.mass = mass
        self.gender = gender
    end
end
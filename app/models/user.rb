class User < ActiveRecord::Base
    validates :name, :presence => true
    validates :username, :presence => true, 
                       :uniqueness => true 
    validates :email,  :presence => true,
                       :uniqueness => true
    validates :password, :presence => true

    has_many :races
    has_secure_password

    def slug
        username.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end

    def races_by_distance(race_distance)
        self.races.select{|race|race.distance == race_distance}
    end

    def sort_by_finish_time(race_distance)
        self.races_by_distance(race_distance).sort_by{|race|race.finish_time}
    end

    def fivek
        self.races.select{|race|race.distance == "5k"}
    end

    def tenk
        self.races.select{|race|race.distance == "10k"}
    end

    def half_marathon
        self.races.select{|race|race.distance == "Half-Marathon"}
    end

    def marathon
        self.races.select{|race|race.distance == "Marathon"}
    end

    def fastest_marathon
        self.marathon.sort_by{|race|race.finish_time}.first
    end

    def fastest_half_marathon
        self.half_marathon.sort_by{|race|race.finish_time}.first
    end

    def fastest_tenk
        self.tenk.sort_by{|race|race.finish_time}.first
    end

    def fastest_fivek
        self.fivek.sort_by{|race|race.finish_time}.first
    end
end
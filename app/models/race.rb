class Race < ActiveRecord::Base
    belongs_to :user
    validates :name, :presence => true 

    def slug_distance
        self.distance.downcase.gsub("-", "_")
    end

    def slug
        name.downcase.gsub(" ", "_")
    end
    
    def self.find_by_slug(slug)
        Race.all.find{|race| race.slug == slug}
    end
end
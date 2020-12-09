class Race < ActiveRecord::Base
    belongs_to :user
    validates :name, :presence => true 

    def slug_distance
        self.distance.gsub("-", "_")
    end

    def slug
        name.downcase.gsub(" ", "_")
    end
    
    def self.find_by_slug(slug)
        Race.all.find{|race| race.slug == slug}
    end

    def format_date
        year = self.date.split("-")[0]
        month = self.date.split("-")[1]
        day = self.date.split("-")[2]
        "#{month}/#{day}/#{year}"
    end
end
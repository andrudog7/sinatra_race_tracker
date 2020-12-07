class User < ActiveRecord::Base
    validates :username, :presence => true, 
                       :uniqueness => true 
    validates :email,  :presence => true,
                       :uniqueness => true,
                       :format => {:with => /\w+@\w+\.\w+/}
    validates :password, :presence => true

    has_many :races
    has_secure_password

    def slug
        username.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end
end
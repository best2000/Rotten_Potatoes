class User < ApplicationRecord
    has_many :reviews, dependent: :destroy

    def self.create_with_omniauth(auth)
        create! do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.name = auth["info"]["nickname"]
            #user.email = auth["info"]["email"]
        end
    end
    
end

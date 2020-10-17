class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    validates :name, presence: true
    def same_check()
        if Movie.find_by_name_and_re(self.name, self.re)
            return true
        else
            return false
        end
    end

    def avg_score_cal()
        sum = 0.0
        self.reviews.each_with_index do |re, i|
            sum += re.score 
        end
        self.avg_score = (sum/self.reviews.length).round(2)
        self.save
    end
end

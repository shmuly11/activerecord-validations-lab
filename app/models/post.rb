class Post < ActiveRecord::Base
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validates :title, presence: true
    validate :click_bait

    def click_bait
        if !title.include?("Won't Believe" || "Secret" || "Top #{Integer}" || "Guess")
            errors.add(:title, "not clickbait")
        end
    end
     
end

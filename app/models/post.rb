
class Post < ActiveRecord::Base
    validate :title_is_clickbaity
    validates :title, presence: true
    validates :content, length: { minimum: 250 } 
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    def title_is_clickbaity
        clickbait_phrases = [/Won't Believe/, /Secret/, /Top \d+/, /Guess/]
        unless clickbait_phrases.any? { |phrase| self.title =~ phrase }
            errors.add(:title, "must be sufficently cickbait-y")
        end
    end

end

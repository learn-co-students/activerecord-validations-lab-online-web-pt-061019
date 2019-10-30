class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Non-Fiction Fiction)}
  validate :clickbait?





  def clickbait?
    if self.title && !self.title.match(/Won't Believe|Secret|Top [\d*]|Guess/)
    errors.add(:clickbait, "is not enticing enough")
    end
  end
end

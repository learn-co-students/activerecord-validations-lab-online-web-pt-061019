class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickbait

  def clickbait
    if title
      unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess")
        errors.add(:title, "must be clickbait")
      end
    end
  end

  #"Won't Believe", "Secret", "Top [number]", or "Guess"

  # def expiration_date_cannot_be_in_the_past
  #   if expiration_date.present? && expiration_date < Date.today
  #     errors.add(:expiration_date, "can't be in the past")
  #   end
  # end
end

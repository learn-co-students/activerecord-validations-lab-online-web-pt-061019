class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
                                    message: "%{value} is not a valid category" }
  validate :is_clickbait?

  PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i,
  ]

  def is_clickbait?
    if PATTERNS.none? { |pattern| pattern.match title } #array method from ruby
      errors.add(:title, "must be clickbait")
    end
  end
end

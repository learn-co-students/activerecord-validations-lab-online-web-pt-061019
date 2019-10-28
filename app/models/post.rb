class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  # ARRAY = ["Won't Believe", "Secret", "Top ", "Guess"]

  ARRAY = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]



  def is_clickbait?

    if ARRAY.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
    end


    # array.each do |word|
    #   if !title.include?(word)
    #     errors.add(:title, "must be clickbait")
    #   # binding.pry
    #   end
    # end
  end

end

# rspec ./spec/models/post_spec.rb:26 # Post is invalid without a title
# rspec ./spec/models/post_spec.rb:30 # Post is invalid with too short content
# rspec ./spec/models/post_spec.rb:34 # Post is invalid with a long summary
# rspec ./spec/models/post_spec.rb:38 # Post is invalid with a category outside the choices
# rspec ./spec/models/post_spec.rb:42 # Post is invalid if not clickbait

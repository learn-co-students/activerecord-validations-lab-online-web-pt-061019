class TitleValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        clickbait_phrase = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]
      unless clickbait_phrase.any? {|p| value =~ p}
        record.errors[attribute] << (options[:message] || "Title must be sufficiently clickbait-y!")
      end
    end
  end


class Post < ActiveRecord::Base
    validates :title, presence: true, title: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

end
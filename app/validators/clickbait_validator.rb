require 'pry'

class ClickbaitValidator < ActiveModel::Validator

    def validate(record) 
        # binding.pry
        if record.title != nil && record.title != "" 
            unless record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("/Top [0-9]*/") || record.title.include?("Guess") 
                record.errors.add(:title, "must contain clickbait")
            end 
        end 
    end 

end 
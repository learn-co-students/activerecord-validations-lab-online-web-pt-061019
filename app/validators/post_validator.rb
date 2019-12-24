PostValidator < ActiveModel::Validator
    def non_clickbait 
        if !title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess")
            errors.add(:error, "Not Clickbait")
        end 

        if title==nil 
            errors.add(:error, "Not Clickbait")
        end 
    end 

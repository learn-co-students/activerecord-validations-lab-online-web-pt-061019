class PostValidator < ActiveModel::Validator

    def validate(record)
        if record.title
            unless record.title.include?("Won't Believe")
                record.errors[:name] << "Not clickbait-y" 
            end
        end
    end
end
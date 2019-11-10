class ClickbaitValidator < ActiveModel::Validator

    def validate(record)
        unless record.title =~ /\b(Won't Believe|Secret|Top \d|Guess)\b/
          record.errors[:title] << "Title is not clickbaity enough"
        end
    end

end 

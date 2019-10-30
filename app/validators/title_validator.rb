class TitleValidator < ActiveMoel::Validator

  def validate(record)
    unless record.title.match?("Won't Believe", "Secret", "Top[0-9]", "Guess")
      record.errors[:title] << "Must be clickbait"
    end
  end
end
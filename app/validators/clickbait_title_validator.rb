class ClickBaitTitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\b(Wont't Believe|Secret|Top \d|Guess)\b/
      record.errors[:attribute] << "Title is not clickbaity enought"
    end  
  end
end
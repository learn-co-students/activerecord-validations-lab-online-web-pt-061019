class Title
  include ActiveModel::Validations
  validates_with TitleValidator
end

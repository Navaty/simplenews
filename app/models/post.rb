class Post < ApplicationRecord
  belongs_to :user


  CATEGORY_OPTIONS = ["Авто","Здоровье","Финансы","Происшествия"]
  AGE_RATE_OPTIONS = ["0+","6+","12+","16+","18+"]

  validates :category, presence: true, inclusion: { in: CATEGORY_OPTIONS }
  validates :age_rating, inclusion: { in: AGE_RATE_OPTIONS }
end
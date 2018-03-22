class Category < ApplicationRecord
  validates_presence_of :name
  has_many :restaurants
  validates_uniqueness_of :name #確定新增的餐廳分類名稱不會與現有的餐廳分類重複

end

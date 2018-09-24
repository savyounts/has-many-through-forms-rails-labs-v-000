class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def category_attributes=(category)
    c = Category.find_or_create_by(name: category.name)
    self.categories << c
  end


  def commenters
    self.users.collect {|u| u.username}.uniq
  end
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :reject_user


  def reject_user
    attributes[:username].blank?
  end

  def user_name
    self.user.username
  end

  def user_attributes(user)
    self.user = User.find_by(username: user.username, email: user.email)
    self.user.update(user)
  end

end

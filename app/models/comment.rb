class Comment < ActiveRecord::Base

  validates :description, :user_name, presence: { message: "не може бути пустим" }
  validates :description, length: { minimum: 5, message: " занадто короткий" }

end

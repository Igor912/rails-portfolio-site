class Order < ActiveRecord::Base

  validates :name, :phone_number, :trip_from, :trip_to, :date_of_departure, presence: { message: "не може бути пустим" }

end

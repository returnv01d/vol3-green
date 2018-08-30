class Catering < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meals
  has_many :daily_meals
  has_and_belongs_to_many :users,
                          class_name: 'User' ,
                          foreign_key: 'catering_id',
                          join_table: :subscriptions
  after_create do |catering|
    now = DateTime.now
    close_minute = get_food_order_close_time[:min]
    close_hour = get_food_order_close_time[:hour]

    if now.hour > close_hour && now.min > close_minute
      job_date = DateTime.now.tommorow
      job_date.min = close_minute
      job_date.hour = close_hour
    else
      job_date = DateTime.now.change({hour: close_hour, min: close_minute, sec: 0 })
    end

    OrderMealForUsersJob.set(wait_until: job_date).perform_later(catering.id)
  end

  def get_food_order_close_time
    time = self.food_order_close_time.split(':')
    {hour: time[0].to_i, min: time[1].to_i}
  end
end

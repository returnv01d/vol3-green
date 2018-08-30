class OrderMealForUsersJob < ApplicationJob
  queue_as :order_meal
  attr_accessor :catering, :autorequested_orders
  after_perform do |job|
    puts "Job finished for #{job.catering.name}.Autorequested orders: #{job.autorequested_orders}."

    if Catering.exists?(id: job.catering.id)
      close_hour = job.catering.get_food_order_close_time[:hour]
      close_minute = job.catering.get_food_order_close_time[:min]
      job_date = DateTime.now.tomorrow.change({hour: close_hour, min: close_minute})
      p job_date
      OrderMealForUsersJob.set(wait_until: job_date).perform_later(job.catering.id)
    end
  end

  def perform(catering_id)
    unless Catering.exists?(id: catering_id)
      puts "Catering with id #{catering_id} does not exist! quiting job..."
      return false
    end

    @catering = Catering.find_by(id: catering_id)
    @autorequested_orders = 0
    users_without_order.each do |user|
      non_allergic_meals = today_daily_meals.reject{ |dm| dm.is_allergic?(user.allergies) }
      preferred_meals = non_allergic_meals.select { |meal| meal.diet == user.diets.first}
      if preferred_meals.nil?
        preferred_meals = @catering.daily_meals
      end
      FoodRequest.create(is_autorequested: true, user: user, daily_meal: preferred_meals.sample)
      @autorequested_orders += 1
    end
  end

  def today_daily_meals
    @catering.daily_meals.where('serving_day = ?', Date.today)
  end

  def users_without_order
    result = @catering.users.reject(&:has_ordered_food_today?)
    result
  end
end

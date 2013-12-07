class Check < ActiveRecord::Base
  belongs_to :user
  has_many :check_datum

  def Check.get_checks_to_run_this_minute(minute)
  	if minute == 0
  		minute = 60
  	end
  	where('(start_date<CURRENT_DATE or start_date is null) and '+
						'MOD(01,minute) = 0 and '+
						'(hour is null) and '+
						'(day_of_month is null) and '+
						'(month is null) and '+
						'(day_of_week is null)')
  end

end

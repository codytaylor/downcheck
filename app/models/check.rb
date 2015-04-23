class Check < ActiveRecord::Base
    belongs_to :user
    has_many :check_datum

    def Check.get_checks_to_run_every_minute_interval(minute_interval)
        self.where("minute <= ?", minute_interval)
    end
end

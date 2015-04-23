class CheckSchedulerController < ApplicationController
    # Needed to do basic checks on website
    require 'net/http'
    
    def CheckSchedulerController.run_tasks

        # Get all tasks based on a minute integer
        
        # Base minute interval to run checks
        minute_interval = "1"
        # Current minute from 0-60
        current_minute = DateTime.now.strftime("%M")

        # Check if the current minute is multiple of 5, 15 or 60 (these are the current check interval options) 
        # and set the minute interval to run checks accordingly
        if current_minute.to_i % 60 == 0 # TODO: may have to be  0?
            minute_interval = "60"
        elsif current_minute.to_i % 15 == 0
            minute_interval = "15"
        elsif current_minute.to_i % 5 == 0
            minute_interval = "5"
        end

        # Get all checks based on minute_interval. Checks set to 1 will always be run even if
        # minute interval is set to 5, 15 or 60
        checks_to_run = Check.get_checks_to_run_every_minute_interval(minute_interval)
        # Save the checks and complete the HTTP request
        CheckSchedulerController.save_checks(checks_to_run)
	end

    private
        def CheckSchedulerController.save_checks(checks_to_run)
            checks_to_run.each do |check|
                # Get the HTTP response
                response = CheckSchedulerController.check_response_codes(check)
                check_datum = CheckDatum.new
                check_datum.check_id = check.id
                check_datum.date_checked = Time.now.to_s
                check_datum.status = response.code
                check_datum.save
		    end
        end

        def CheckSchedulerController.check_response_codes(check)
            # Make the HTTP request and return the HTTP response from the site
            response = Net::HTTP.get_response(URI.parse(check.url))
            # Send email to user if sites not loading
            if response.code != '200'
                CheckMailer.site_down(check)
            end
            return response
        end
end

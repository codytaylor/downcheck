class CheckSchedulerController < ApplicationController
	def CheckSchedulerController.run_tasks
		
		#Get all tasks that have a minute integer that corresponds to the current time,
		#a start date that is less than the current date
		#and nothing in the hour, day_of_month, month, and day of week
		checks_to_run = Check.get_checks_to_run_this_minute(DateTime.now.strftime("%M"));
	
		checks_to_run.each do |check|
			puts check.url+"\n"
		end
		
	end
end

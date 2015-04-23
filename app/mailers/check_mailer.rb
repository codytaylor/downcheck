class CheckMailer < ActionMailer::Base
    default from: "from@example.com"
    
    def site_down(check)
        @check = check
        @user = @check.user
        mail(to: @user.email, subject: 'DownCheck Notification')
    end
end

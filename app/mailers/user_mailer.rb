class UserMailer < ApplicationMailer

    def run
      @user = User.first(:email)
      @url = 'http://www.gmail.com'
      mail(to: @user, subject: 'Test Send')
      end
end
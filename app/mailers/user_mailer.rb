class UserMailer < ApplicationMailer

    def run
      @user = User.pluck(:email).first
      @url = 'http://www.gmail.com'
      mail(to: @user, subject: 'Test Send')
      end
end
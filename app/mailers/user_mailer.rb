class UserMailer < ApplicationMailer

    def run
      @user = User.pluck(:email).first
      @url = 'http://www.gmail.com'
      @notes = Note.all
      mail(to: "karthis1015@gmail.com", subject: 'Test Send')
      end
end
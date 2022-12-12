class UserMailer <ApplicationMailer

    def run
        mail(to: [ User.pluck(:email) ], subject: 'Test Send')
      end
end
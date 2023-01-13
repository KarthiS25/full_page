class ApplicationController < ActionController::Base
    respond_to :html, :json
    before_action :permissions_policy_header


    protected


    def permissions_policy_header
        response.headers['Permissions-Policy'] = 'camera=(), gyroscope=(), microphone=(), usb=(), payment=(), geolocation=()'
    
    end
end

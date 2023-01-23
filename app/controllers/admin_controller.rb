class AdminController < ApplicationController
    
    def index
        if current_user.admin?
           redirect_to notes_path || articles_path
        end
    end

    def show
    end
end

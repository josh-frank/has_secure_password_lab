class SessionsController < ApplicationController

    def new
    end

    def create
        log_in_user = User.find_by( name: params[ :user ][ :name ] )
        if !log_in_user.authenticate( params[ :user ][ :password ] )
            flash[ :messages ] = log_in_user.errors.full_messages
            redirect_to login_path
        else
            session[ :user_id ] = log_in_user.id
            redirect_to user_path( log_in_user )
        end
    end

    def destroy
        session.delete( :user_id )
        redirect_to login_path
    end
end

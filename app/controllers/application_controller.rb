class ApplicationController < ActionController::Base
require 'rubygems'
require 'google/api_client'
require 'trollop'
include SessionsHelper

DEVELOPER_KEY = 'AIzaSyBH-lRlkTYBG-s2FuiZ2gRdT1gw2lKOcPc'
YOUTUBE_API_SERVICE_NAME = 'youtube'
YOUTUBE_API_VERSION = 'v3'

def get_service
  client = Google::APIClient.new(
    :key => DEVELOPER_KEY,
    :authorization => nil,
    :application_name => $PROGRAM_NAME,
    :application_version => '1.0.0'
  )
  youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

  return client, youtube
end

  private
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end
end

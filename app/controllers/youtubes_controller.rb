class YoutubesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  
  def index
   #get_data("world+of+dance")
    get_data("world+of+dance")
   #require 'youtube.rb'#先ほど上で準備したファイルを呼ぶ
   opts = Trollop::options do
     opt :q, 'Search term', :type => String, :default => keyword
     opt :max_results, 'Max results', :type => :int, :default => 50
     opt :order, 'order', :type => String, :default => 'date'
     opt :regionCode, 'region', :type => String, :default => 'JP'
    
  end

  client,youtube=get_service

  begin

    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => {
        :part => 'snippet',
        :q => opts[:q],
        :maxResults => opts[:max_results],
        :order => opts[:order],
        :regionCode => opts[:regionCode]
      }
    )

  @videos= search_response.data.items  #Jsonの中身が多かったので必要な情報のみ受けれるようにしています。
  #セーブを書き込む
  
  rescue Google::APIClient::TransmissionError => e
    puts e.result.body
  end
  end
  
  def show
    if logged_in?
      @video_id=params[:video]
      @microposts = current_user.microposts.paginate(page: params[:page])
    end
  end 


def
end


  private
    def correct_user
      @user = User.find(params[:id])
       redirect_to(root_url) unless current_user?(@user)
    end
    
   
    
    
    
    
end

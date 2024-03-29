class RoomsController < ApplicationController
  def index
    @rooms = Room.order("created_at DESC")
    @room = Room.new
  end

  def create
    config_opentok
    session = @opentok.create_session request.remote_addr
    params[:room][:session_id] = session.session_id

    @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room }
      else
        format.html { render :controller => 'rooms', :action => "index" }
      end
    end
  end

  def show
    @room = Room.find(params[:id])

    config_opentok

    @tok_token = @opentok.generate_token :session_id => @room.session_id
  end

private
  def config_opentok
    if @opentok.nil?
      @opentok = OpenTok::OpenTokSDK.new 22210282, "a0d3b70709c38f5f33bb9e4588c5eb2836e22ab7"
    end
  end
end

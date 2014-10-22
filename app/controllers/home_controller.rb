class HomeController < ApplicationController
  protect_from_forgery

  def index
    @url = request.original_url
  end

  def post
    ruby = JSON.parse(request.raw_post)
    string = JSON.pretty_generate(ruby)
    ESHQ.send(
      channel: 'notifications',
      data: url_encode(string),
      type: 'address'
    )
    render nothing: true, status: 200
  end

  def eshq
    socket = ESHQ.open(channel: params[:channel])
    render json: { socket: socket }
  end

end

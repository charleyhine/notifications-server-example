class HomeController < ApplicationController
  protect_from_forgery

  def index
    @url = request.original_url
  end

  def post
    body = request.raw_post.to_json
    ESHQ.send(
      channel: 'notifications',
      data: body,
      type: 'address-transaction'
    )
    render nothing: true, status: 200
  end

  def eshq
    socket = ESHQ.open(channel: params[:channel])
    render json: { socket: socket }
  end

end
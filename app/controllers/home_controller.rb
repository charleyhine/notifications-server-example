class HomeController < ApplicationController
  protect_from_forgery

  def index
    @url = request.original_url
  end

  def event
    payload = JSON.parse(request.body.read)
    ESHQ.send(
      channel: 'webhooks',
      data: payload,
      type: 'message'
    )

      render nothing: true, status: 200
  end

  def eshq
    socket = ESHQ.open(:channel => params[:channel])
    render json: { socket: socket }
  end

end

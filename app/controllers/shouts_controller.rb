class ShoutsController < ApplicationController
  def show
    @shout = Shout.find(params[:id])
  end
  def create
    shout = current_user.shouts.create(shout_params)
    redirect_to root_path, redirect_options(shout)
  end

  private

  def shout_params
    {content: content_from_params}
  end

  def content_from_params
    TextShout.new(content_params)
  end

  def content_params
    params.require(:shout).require(:content).permit(:body)
  end

  def redirect_options(shout)
    if shout.persisted?
      { notice: "Successfully shouted"}
    else
      { alert: "Could not shout" }
    end
  end
end

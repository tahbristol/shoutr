class DashboardsController < ApplicationController
  def show
    @shout = Shout.new
    @shouts = Shout.all
  end
end

class PagesController < ApplicationController
  layout 'application'

  def welcome
    @services = Service.limit(3)
  end
end

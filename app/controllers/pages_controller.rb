class PagesController < ApplicationController
  layout 'application'

  def welcome
    @services = Service.all
  end
end

class CountriesController < ApplicationController

  def default_url_options(options={})
     if params[:locale]
      { locale: params[:locale] }
     else
       {}
     end
      # this method must return {} in else clause, otherwise error occurs
   end

  def index
  end
end

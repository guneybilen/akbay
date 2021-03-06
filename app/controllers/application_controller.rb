class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_cache_headers

  protect_from_forgery with: :exception

  layout :detect_browser


  def brwsr
    if detect_browser == "mobile_application"
      @brwsr = "mobile"
      @brwsr
    end
  end

  helper_method :brwsr

  private
    MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

  def detect_browser
     if request.headers["HTTP_USER_AGENT"].nil?
       return 'application'
     end
     layout = selected_layout
     return layout if layout
     agent = request.headers["HTTP_USER_AGENT"].downcase
     MOBILE_BROWSERS.each do |m|
       return "mobile_application" if agent.match(m)
     end
     return "application"
   end

   def selected_layout
     session.inspect # force session load
     if session.has_key? "layout"
       return (session["layout"] == "mobile") ?
         "mobile_application" : "application"
     end
     return nil
   end

  # for page refresh after browser back button press. I found it in Internet.
  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
  end

end

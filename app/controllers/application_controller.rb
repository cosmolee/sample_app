class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper # listing 8.14 - helpers are automatically included in Views, but not Controllers - thus, this is a manual include

end

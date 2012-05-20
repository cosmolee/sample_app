#require 'spec_helper'
include ApplicationHelper

# See note in spec/helpers/application_helper_spec.rb re: Ex 5.6.3.

# listing 5.26 parallels full_title helper from listing 4.2.  
#def full_title(page_title)  
#  base_title = "Ruby on Rails Tutorial Sample App"
#  if page_title.empty?
#    base_title
#  else
#    "#{base_title} | #{page_title}"
#  end
#end


# listing 8.34 - Rspec helper method and custom matcher

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

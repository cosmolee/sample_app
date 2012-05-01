require 'spec_helper'

describe "Static pages" do
  subject { page }           # Using the (Capybara) `subject` block allows condensed `it` blocks w/o the `page.*` naming.  See "Help" tests for UN-condensed version of tests.

  describe "Home page" do      # Sec 5.3.4: Condensed version of tests.
    before { visit root_path } # The `before` block runs before each `it` block.  Synonym: `before(:each)`

    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '| Home') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1', text: 'About Us') }
    it { should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | About Us") }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', text: 'Contact') }
    it { should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Contact") }
  end


  describe "Help page" do     # Non-condensed version of tests.

    it "should have the content 'Help'" do
      visit help_path
      #visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help')
      #page.should have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      #visit '/static_pages/help'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Help")
    end
  end


end

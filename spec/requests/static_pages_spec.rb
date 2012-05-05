require 'spec_helper'

describe "Static pages" do
  subject { page }           
  # Using the (Capybara) `subject` block allows condensed `it` blocks w/o the `page.*` reference.  See "Help page" tests for UN-condensed version of tests for comparison.
  # Sect 5.3.4: Because of subject { page }, the call to should automatically uses the page variable supplied by Capybara .

 shared_examples_for "all static pages" do  # This is for the blocks to use the "shared examples" facility of RSpec.
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }  # See spec utilities directory for `full_title()` helper.
  end


  describe "Home page" do      # Sec 5.3.4: Condensed version of tests.
    before { visit root_path } # The `before` block runs before each `it` block.  Synonym: `before(:each)`

    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '| Home') }
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


  describe "About page" do  # Ex 5.6.1, using "shared examples" facility, further condensing tests...
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'About Us' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end


# These test make sure that the proper links exist by actually clicking on them, rather than telling the tests the path with `visit`.  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    page.should_not have_selector 'title', text: full_title('Home')
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
  end





#  describe "should have the right links on the layout" do  
#    before { visit root_path }
#    click_link "About"
#    it { should have_selector('title', text: '| About') }
#    page.should have_selector 'title', text: full_title('About Us')
#    click_link "Help"
#    it { should have_selector('title', text: '| Help') }
#    page.should # fill in
#    click_link "Contact"
#    it { should have_selector('title', text: '| Contact') }
#    page.should # fill in
#    click_link "Home"
#    it { should_not have_selector('title', text: '| Home') }
#    page.should # fill in
#    click_link "Sign up now!"
#    it { should have_selector('title', text: '| Sign up') }
#    page.should # fill in
#  end

end

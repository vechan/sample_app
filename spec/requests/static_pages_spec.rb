require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
    it "should have the content 'SampleApp'" do
      visit '/static_pages/home'
      page.should have_content('SampleApp')
    end
  end
  
    describe "Help page" do
    it "should have the content 'help'" do
      visit '/static_pages/help'
      page.should have_content('help') # note the content text is case-sensitive
    end
  end

end


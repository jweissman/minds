require 'spec_helper'

describe WelcomeController do

  describe "GET 'hero'" do
    it "returns http success" do
      get 'hero'
      response.should be_success
    end
  end

end
